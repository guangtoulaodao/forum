package com.yxq.actionform;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.ValidatorForm;

public class ClassForm extends ValidatorForm{
	private String classId;
	private String className;
	private String classIntro="ª∂”≠∑√Œ £°";	

	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		String validate=request.getParameter("validate");
		if(validate==null||validate.equals("")||!validate.equals("yes"))
			return null;
		else
			return super.validate(mapping, request);	
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getClassIntro() {
		return classIntro;
	}
	public void setClassIntro(String classIntro) {
		this.classIntro = classIntro;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public void clear(){
		className="";
		classIntro="ª∂”≠∑√Œ £°";					
	}
}
