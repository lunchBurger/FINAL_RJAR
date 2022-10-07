from flask import Flask
from flask import request
import pandas as pd
from flask_cors import CORS
import cx_Oracle
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.neighbors import KNeighborsClassifier

app = Flask(__name__)
app.debug=True

CORS(app)
@app.route("/mytier", methods=["POST","GET"])
def connect():
    # POST 형식으로 전송된 값을 value에 저장
    value = dict(request.form)
    print(value)
    df = pd.DataFrame(value, index=[0])
    print(df)
    search_Lane=df['LANE'].iloc[0]
    print(search_Lane)

    TierTotal=db_load('TIERTOTAL')
    print(TierTotal)

    want_tier_df=TierTotal[TierTotal[1] == search_Lane].reset_index(drop=True)
    print(want_tier_df)

    # K-NN 모델 머신러닝
    features = want_tier_df[[2,3,4,5,6]]
    tier = want_tier_df[[0]]
    want = df[['PERMINUTE_CS','PER_GOLDEARN','PER_VISIONWARD','PER_WARDPLACED','PER_WARDSKILLED']]
    champ_input = features.to_numpy()
    tier_input = tier.to_numpy()

    # 학습, 테스트 데이터로 나누기
    train_input, test_input, train_target, test_target = train_test_split(champ_input, tier_input)

    # 표준점수로 정규화(z-score)
    ss = StandardScaler()
    ss.fit(train_input)
    train_scaled = ss.transform(train_input)
    test_scaled = ss.transform(test_input)
    want_scaled = ss.transform(want)

    # 모델 선언 및 학습
    kn = KNeighborsClassifier(n_neighbors=11)
    kn.fit(train_scaled, train_target)
    kn.score(train_scaled, train_target)

    # target, test 평가점수
    print(kn.score(train_scaled, train_target))
    print(kn.score(test_scaled, test_target))

    # 선택한 값 티어 예측
    my_tier=kn.predict(want_scaled)
    print('tier='+my_tier)
    my_tier_dict = {'TIER' : my_tier[0]}
    print(my_tier_dict)

    return my_tier_dict

def db_load(table_name):
    try :
        cx_Oracle.init_oracle_client(lib_dir=r"/Users/seongho/Downloads/instantclient_19_8")
        db = cx_Oracle.connect(user='ADMIN', password='!Wa494949555', dsn='testoracle_high')
        cursor = db.cursor()
    except :
        db = cx_Oracle.connect(user='ADMIN', password='!Wa494949555', dsn='testoracle_high')
        cursor = db.cursor()
    sql = "SELECT * FROM "+table_name
    cursor.execute(sql)
    result = cursor.fetchall()
    db.close()
    df = pd.DataFrame(result)
    return df


if __name__ == "__main__":
    app.run()