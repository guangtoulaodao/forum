<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.util.Date" %>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>

<%
    String[] weekdays={"","日","一","二","三","四","五","六"};
    String[] days=new String[42];
    for(int i=0;i<42;i++)
    	days[i]="";

    Date currentDay = new Date();
    int year=1900+currentDay.getYear();
    int month=currentDay.getMonth();
    int today=currentDay.getDate();
    int weekday=currentDay.getDay()+1;
    
    String now=year+"年"+(month+1)+"月"+today+"日"+" 星期"+weekdays[weekday];
%>

<html>
  <head>
  	<title>页眉</title>
  	<script type="text/javascript">
        function showTime(showWhere){
            var now=new Date();
	        var hour=now.getHours();
	        var minu=now.getMinutes();
	        var sec=now.getSeconds();
         
            if(hour<10) hour="0"+hour;
         	if(minu<10) minu="0"+minu;
         	if(sec<10) sec="0"+sec;
         	
         	showWhere.value=hour+":"+minu+":"+sec;
            setTimeout("showTime(time)",1000)
        }
      </script>
  </head>
  <body onload="showTime(time)" bgcolor="#F0F0F0">
    <center>
      <table border="0" width="100%" cellspacing="0" cellpadding="0" style="margin-top:1">
        <tr height="38">
            <td colspan="2" background="images/index/menu.jpg">
              <table border="0" width="100%" height="100%" cellspacing="0" cellpadding="0">
                <tr height="50%" style="font-size:10pt">
                    <td align="center">
                        <%=now %>
                        <input type="text" style="border:0;background-color:#F7F7F7" disable="true" id="time" size="9">
                    </td>
                    <td align="center" width="6%"><a href="goIndex.do">首 页</a></td>
                    <td align="center" width="6%"><a href="user/isUserLogin.do?method=isUserLogin">登 录</a></td>
                    <td align="center" width="8%"><a href="needLogin/my/listShow.do?method=lookMyBbs&showpage=1">我的帖子</a></td>
                    <td align="center" width="8%"><a href="needLogin/addBbs.do?method=addBbs">发表帖子</a></td>
                    <td align="center" width="8%"><a href="user/goodListShow.do?method=goodListShow&showpage=1">精华帖子</a></td>
                    <td align="center" width="8%"><a href="user/isAdminLogin.do?method=isAdminLogin">进入后台</a></td>
                    <td align="center" width="6%"><a href="user/reg.do?method=userReg">注 册</a></td>
                    <td align="center" width="6%"><a href="user/logout.do?method=logout">注 销</a></td>
                </tr>                
              </table>
            </td>
        </tr>
        <tr height="40">
            <td width="529" align="center" background="images/index/indexP.jpg">                
                <marquee 
			      onmouseover=this.stop()
				  onmouseout=this.start()				  
                  scrollamount="1"
				  scrolldelay="10"
				  direction="left"
				  width="470">
				  <img src="images/index/pcard.gif"> Tsoft服务热线：(0431)8491*** E-mail：tsoft***@tsoft.com
		        </marquee>
            </td>
            <td align="center" width="271" background="images/index/messages.jpg">
	            <html:errors property="userOpR"/>
	            <html:errors property="sqlvalue"/>
            </td>
        </tr>
        <html:form action="/user/search.do" method="post">
        <input type="hidden" name="validate" value="yes">
        <tr height="38">
            <td colspan="2" background="images/index/indexS.jpg" align="center">
                <table border="0" width="98%">
                    <tr>
                        <td width="25%">
                        	欢迎登录：
                        	<logic:notPresent name="logoner">
                        		游客，您还没有登录！
                        	</logic:notPresent>
                        	<logic:present name="logoner">
	                        	${sessionScope.logoner.userName}
                        	</logic:present>
                        </td>
                        <td align="right">                                        
			                条件：
            			    <html:select property="subsql">
			                    <html:options collection="searchSQL" property="value" labelProperty="label"/>
            			    </html:select>
			                关键字：
            			    <html:text property="sqlvalue" size="30"/>
			                <html:radio property="searchType" value="like">模糊</html:radio>
			                <html:radio property="searchType" value="all">精确</html:radio>
               				<html:submit value=" " style="background-image:url('images/index/bs.jpg');width:49;height:21;border:0"/>
                        </td>
                    </tr>                    
                </table>
            </td>
        </tr>
        </html:form>
      </table>
    </center>
  </body>
</html>