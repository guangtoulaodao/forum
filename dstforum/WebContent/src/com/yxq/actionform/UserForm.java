package com.yxq.actionform;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.ValidatorForm;

public class UserForm extends ValidatorForm {
	private String id;
	private String userName;
	private String oldPassword;
	private String userPassword;
	private String aginPassword;
	private String userFace="user0.gif";
	private String userSex="ÄÐ";
	private String userPhone;
	private String userOICQ;
	private String userEmail;
	private String userFrom;
	private String userAble;	

	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		String validate=request.getParameter("validate");
		if(validate==null||validate.equals("")||!validate.equals("yes"))
			return null;
		else
			return super.validate(mapping, request);			
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserFrom() {
		return userFrom;
	}
	public void setUserFrom(String userFrom) {
		this.userFrom = userFrom;
	}
	public String getUserOICQ() {
		return userOICQ;
	}
	public void setUserOICQ(String userOICQ) {
		this.userOICQ = userOICQ;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}	
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}	
	public String getAginPassword() {
		return aginPassword;
	}
	public void setAginPassword(String aginPassword) {
		this.aginPassword = aginPassword;
	}
	public void setUserAble(String userAble) {
		this.userAble = userAble;
	}
	public String getUserAble() {
		return userAble;
	}	
	public String getUserFace() {
		return userFace;
	}
	public void setUserFace(String userFace) {
		this.userFace = userFace;
	}
	public String getSubUserFrom(int len){
		if(len<=0||len>this.userFrom.length())
			len=this.userFrom.length();
		return this.userFrom.substring(0,len)+"..";
	}
	public void clear(){
		id="";
		userName="";
		oldPassword="";
		userPassword="";
		aginPassword="";
		userFace="user0.gif";
		userSex="ÄÐ";
		userPhone="";
		userOICQ="";
		userEmail="";
		userFrom="";
		userAble="";
	}
}
