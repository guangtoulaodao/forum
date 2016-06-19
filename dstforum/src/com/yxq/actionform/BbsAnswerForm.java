package com.yxq.actionform;

import org.apache.struts.validator.ValidatorActionForm;

public class BbsAnswerForm extends ValidatorActionForm {
	private String bbsAnswerId;
	private String bbsAnswerRootID;
	private String bbsAnswerTitle;
	private String bbsAnswerContent;
	private String bbsAnswerSender;
	private String bbsFace="face0.gif";
	private String bbsAnswerSendTime;	
	
	public String getBbsAnswerContent() {
		return bbsAnswerContent;
	}
	public void setBbsAnswerContent(String bbsAnswerContent) {
		this.bbsAnswerContent = bbsAnswerContent;
	}
	public String getBbsFace() {
		return bbsFace;
	}
	public void setBbsFace(String bbsFace) {
		this.bbsFace = bbsFace;
	}
	public String getBbsAnswerId() {
		return bbsAnswerId;
	}
	public void setBbsAnswerId(String bbsAnswerId) {
		this.bbsAnswerId = bbsAnswerId;
	}
	public String getBbsAnswerRootID() {
		return bbsAnswerRootID;
	}
	public void setBbsAnswerRootID(String bbsAnswerRootID) {
		this.bbsAnswerRootID = bbsAnswerRootID;
	}
	public String getBbsAnswerSender() {
		return bbsAnswerSender;
	}
	public void setBbsAnswerSender(String bbsAnswerSender) {
		this.bbsAnswerSender = bbsAnswerSender;
	}
	public String getBbsAnswerSendTime() {
		return bbsAnswerSendTime;
	}
	public void setBbsAnswerSendTime(String bbsAnswerSendTime) {
		this.bbsAnswerSendTime = bbsAnswerSendTime;
	}
	public String getBbsAnswerTitle() {
		return bbsAnswerTitle;
	}
	public void setBbsAnswerTitle(String bbsAnswerTitle) {
		this.bbsAnswerTitle = bbsAnswerTitle;
	}	
	public void clear(){
		bbsAnswerId="";
		bbsAnswerRootID="";
		bbsAnswerTitle="";
		bbsAnswerContent="";
		bbsAnswerSender="";
		bbsFace="face0.gif";
		bbsAnswerSendTime="";		
	}
}
