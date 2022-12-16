package com.nonage.dto;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String zipNuem;
	private String address;
	private String phone;
	private String useyn;
	private Timestamp indate;
	
	
}
