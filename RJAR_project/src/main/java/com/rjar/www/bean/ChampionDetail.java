package com.rjar.www.bean;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class ChampionDetail {
	
	private String tier;
	private String lane;
   
	private String championName;
	private String champion_kr_name;
	private int championId;
	
	//스킬 이미지
	private String passive;
	private String q;
	private String w;
	private String e;
	private String r;
	
	//스펠
	private String spell1;
	private String spell2;
	private String spell_winrate;
	private String spell_pick;
	private int spell_cnt;
	private int spell_win;
	private int spell_total; // 해당 라인 판수
	
	//시작 아이템
	private String start1;
	private String start2;
	private int start_cnt;
	private int start_win;
	private double start_winrate;
	private double start_pick;
	
	// 신발
	private String boots;
	private String boots_cnt;
	private int boots_win;
	private double boots_winrate;
	private double boots_pick;
	
	//아이템 빌드
	private int item1;
	private int item2;
	private int item3;
	private int item_cnt;
	private int item_win;
	private int item_total;
	private double item_winrate;
	private double item_pick;
	
	//스킬
	private String lv1;
	private String lv2;
	private String lv3;
	private String lv4;
	private String lv5;
	private String lv6;
	private String lv7;
	private String lv8;
	private String lv9;
	private String lv10;
	private String lv11;
	private String lv12;
	private String lv13;
	private String lv14;
	private String lv15;
	private int skill_cnt;
	private double skill_winrate;
	private double skill_pick;
	
	private int main_rune;
	private int main_under1;
	private int main_under2;
	private int main_under3;
	private int main_under4;
	private int sub_rune;
	private int sub_under1;
	private int sub_under2;
	private String statperks; //처음에 검색한 결과값
	private double rune_winRate;
	private int rune_pick;
	
	private int runes_id;
	private String runes_icon;
	
	@Override // spell, lane 비교
	public boolean equals(Object obj) {
		ChampionDetail cmp=(ChampionDetail)obj;
		if(spell1==cmp.spell2 || spell2==cmp.spell1 || lane==cmp.lane || lv1==cmp.lv1)
			return true;
		return false;
	}

}
