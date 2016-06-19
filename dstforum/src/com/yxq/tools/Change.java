package com.yxq.tools;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Change {
	public static String HTMLChange(String source){
		String changeStr="";
		changeStr=source.replace("&","&amp;");
		changeStr=changeStr.replace(" ","&nbsp;");
		changeStr=changeStr.replace("<","&lt;");
		changeStr=changeStr.replace(">","&gt;");		
		changeStr=changeStr.replace("\r\n","<br>");
		
		changeStr=changeStr.replace("[F","<font ");
		changeStr=changeStr.replace("[","<");
		changeStr=changeStr.replace("]",">");
		return changeStr;
	}
	public static String dateTimeChange(Date date){
		String strDate="";
		if(date!=null){
			SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			strDate=format.format(date);		
		}
		return strDate;
	}	
}
