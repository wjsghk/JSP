package com.nonage.dto;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nonage.controller.action.Action;

import lombok.Data;

@Data
public class AddressVO {
	private String zipNum;
	private String sido;
	private String gugun;
	private String dong;
	private String zipCode;
	private String bunji;
}
