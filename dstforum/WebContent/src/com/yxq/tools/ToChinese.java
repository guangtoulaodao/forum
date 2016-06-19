package com.yxq.tools;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.RequestProcessor;

public class ToChinese extends RequestProcessor {
	protected boolean processPreprocess(HttpServletRequest request, HttpServletResponse response) {		
		try {
			request.setCharacterEncoding("gb2312");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return true;			
	}
}
