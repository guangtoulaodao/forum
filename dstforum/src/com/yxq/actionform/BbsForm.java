package com.yxq.actionform;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.ValidatorForm;

public class BbsForm extends ValidatorForm {
	private String bbsId;
	private String bbsBoardID;	
	private String bbsTitle;
	private String bbsContent;
	private String bbsSender;
	private String bbsFace="face0.gif";
	private String bbsSendTime;
	private String bbsAnswerNum;
	private String bbsLastUpdateUser;
	private String bbsLastUpdateTime;
	private String bbsOpTime;
	private String bbsIsTop;
	private String bbsToTopTime;
	private String bbsIsGood;
	private String bbsToGoodTime;	

	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		String validate=request.getParameter("validate");
		if(validate==null||validate.equals("")||!validate.equals("yes"))
			return null;
		else
			return super.validate(mapping, request);
	}
	public String getBbsAnswerNum() {
		return bbsAnswerNum;
	}
	public void setBbsAnswerNum(String bbsAnswerNum) {
		this.bbsAnswerNum = bbsAnswerNum;
	}
	public String getBbsBoardID() {
		return bbsBoardID;
	}
	public void setBbsBoardID(String bbsBoardID) {
		this.bbsBoardID = bbsBoardID;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}	
	public String getBbsFace() {
		return bbsFace;
	}
	public void setBbsFace(String bbsFace) {
		this.bbsFace = bbsFace;
	}
	public String getBbsId() {
		return bbsId;
	}
	public void setBbsId(String bbsId) {
		this.bbsId = bbsId;
	}
	public String getBbsIsGood() {
		return bbsIsGood;
	}
	public void setBbsIsGood(String bbsIsGood) {
		this.bbsIsGood = bbsIsGood;
	}
	public String getBbsIsTop() {
		return bbsIsTop;
	}
	public void setBbsIsTop(String bbsIsTop) {
		this.bbsIsTop = bbsIsTop;
	}
	public String getBbsLastUpdateTime() {
		return bbsLastUpdateTime;
	}
	public void setBbsLastUpdateTime(String bbsLastUpdateTime) {
		this.bbsLastUpdateTime = bbsLastUpdateTime;
	}
	public String getBbsLastUpdateUser() {
		return bbsLastUpdateUser;
	}
	public void setBbsLastUpdateUser(String bbsLastUpdateUser) {
		this.bbsLastUpdateUser = bbsLastUpdateUser;
	}	
	public String getBbsOpTime() {
		return bbsOpTime;
	}
	public void setBbsOpTime(String bbsOpTime) {
		this.bbsOpTime = bbsOpTime;
	}
	public String getBbsSender() {
		return bbsSender;
	}
	public void setBbsSender(String bbsSender) {
		this.bbsSender = bbsSender;
	}
	public String getBbsSendTime() {
		return bbsSendTime;
	}
	public void setBbsSendTime(String bbsSendTime) {
		this.bbsSendTime = bbsSendTime;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	public String getBbsToGoodTime() {
		return bbsToGoodTime;
	}
	public void setBbsToGoodTime(String bbsToGoodTime) {
		this.bbsToGoodTime = bbsToGoodTime;
	}
	public String getBbsToTopTime() {
		return bbsToTopTime;
	}
	public void setBbsToTopTime(String bbsToTopTime) {
		this.bbsToTopTime = bbsToTopTime;
	}
	public String getSubBbsTitle(int len){
		if(len<=0||len>this.bbsTitle.length())
			len=this.bbsTitle.length();
		return this.bbsTitle.substring(0,len)+"..";		
	}	
	public void clear(){
		bbsId="";
		bbsBoardID="";
		bbsTitle="";
		bbsContent="";
		bbsSender="";
		bbsFace="";
		bbsSendTime="";
		bbsAnswerNum="";
		bbsLastUpdateUser="";
		bbsLastUpdateTime="";
		bbsOpTime="";
		bbsIsTop="";
		bbsToTopTime="";
		bbsIsGood="";
		bbsToGoodTime="";
	}
}
