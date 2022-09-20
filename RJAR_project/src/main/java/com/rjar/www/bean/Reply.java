package com.rjar.www.bean;

import java.sql.Timestamp;

import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
@Repository
public class Reply {
	
	private int championId; //해당 챔피언 번호 --> 번호로 검색해서 해당 챔피언에 대한 댓글 불러옴 
	private String r_contents; //댓글 내용
	
	private String r_nick; //닉네임
	private int r_num; //댓글 번호
	@JsonFormat(pattern="yyyy-MM-dd hh:mm")
	private Timestamp r_date;
}
