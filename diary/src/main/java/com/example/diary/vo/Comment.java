package com.example.diary.vo;

import lombok.Data;

@Data
public class Comment {
	private int commentNo;
	private int noticeNo;
	private String memberId;
	private boolean isSecret; // true이면 비밀글(본인, 관리자)
	private String comment;
	private String createdate;
	private String updatedate;
}
