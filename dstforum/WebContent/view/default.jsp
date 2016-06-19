<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>

<html>
  <head>
    <title>首页中内容显示区中的内容</title>
  </head>
  <body>
    <center>
      <table border="0" width="100%" cellspacing="0" cellpadding="0" style="margin-top:8">        
        <logic:iterate id="classSingle" name="classType" scope="session">
        <tr>
            <td>                
                <table rules="none" border="1" width="100%"  cellspacing="0" cellpadding="3" bordercolor="lightgrey" bordercolorlight="lightgrey" bordercolordark="white">
                    <tr height="30"><td style="text-indent:5" background="images/index/classT.jpg"><b><font color="white">■ <bean:write name="classSingle" property="className"/></font></b></td></tr>
                    <tr bgcolor="#F9F9F9">
                        <td height="60" align="center">
                            <logic:notPresent name="class${classSingle.classId}">
		                            <li>该论坛类别暂无版面显示！</li>
		                   	</logic:notPresent>
                            <logic:present name="class${classSingle.classId}">
        		                    <logic:notEmpty name="class${classSingle.classId}">
                		          		<logic:iterate id="boardSingle" name="class${classSingle.classId}" scope="session">
		    	        	                <table border="1" width="100%" cellspacing="0" cellpadding="4" bgcolor="#F9F9F9" bordercolor="#EEEEEE" bordercolorlight="#EEEEEE" bordercolordark="white" rules="cols">
        	    	       				        <tr height="35">
					       		                    <td align="center" width="60" rowspan="2"><img src="images/index/boardPic.jpg"></td>
                    	        		            <td><img src="images/index/btitle.jpg"> <a href="user/listShow.do?method=rootListShow&showpage=1&classId=${classSingle.classId}&boardId=${boardSingle.boardId}" style="underline" alt="进入版面！"><bean:write name="boardSingle" property="boardName" filter="false"/></a></td>
                        						    <td rowspan="2" width="20%" align="center">
						                           		<table border="0" width="90%" cellspacing="3" cellpadding="0">
		                	                                <tr><td>帖子总数：<b><font color="blue"><bean:write name="boardSingle" property="boardBbsnum"/></font></b></td></tr>
        			        	                            <tr><td>精华帖子：<b><font color="green"><bean:write name="boardSingle" property="boardBbsgoodnum"/></font></b></td></tr>
                    		    	                        <tr><td>未 回 复：<b><font color="red"><bean:write name="boardSingle" property="boardBbsundonum"/></font></b></td></tr>
                            			                </table>
                                    			    </td>
		                                    	</tr>
	        		                            <tr height="25" background="images/index/masterB.jpg">
    	            		                        <td style="text-indent:60">
    	            		                            <img src="images/index/master.jpg">
        	            		                        <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${boardSingle.boardMaster}">
           	            		                            斑竹：<bean:write name="boardSingle" property="boardMaster"/></td>
    	            		                            </a>
        	                		            </tr>
            	                    		</table>
		        	                    </logic:iterate>                                
	                	            </logic:notEmpty>
                            		<logic:empty name="class${classSingle.classId}">
	                                	<li>该论坛类别暂无版面显示！</li>
		                            </logic:empty>
                            </logic:present>
                        </td>
                    </tr>
                    <tr height="25"><td style="text-indent:10" background="images/index/boardE.jpg"><font color="#F9F9F9)">论坛介绍：<bean:write name="classSingle" property="classIntro" filter="false"/></font></td></tr>
                </table>
            </td>
        </tr>
        <tr height="3"><td></td></tr>
        </logic:iterate>
      </table>
    </center>
  </body>
</html>