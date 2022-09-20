package com.rjar.www.bean;

import org.springframework.stereotype.Repository;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
@Repository
public class Member {

	private int m_num;
	private String m_id;
	private String m_nick;
	private String m_phone;
	private String m_pw;
	private String m_name;
	private String m_tel;
	private int m_que;
	private String m_ans;
	private String m_MNick;

}
