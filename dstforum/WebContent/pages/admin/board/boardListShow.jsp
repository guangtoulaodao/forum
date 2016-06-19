<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>

<html>
  <head>
    <title>列表查看版面</title>
  </head>
  <body>
    <center>
      <br>
      <html:form action="needLogin/admin/getBoardList.do">
      <input type="hidden" name="method" value="getBoardList">
	  <input type="hidden" name="type" value="show">
      <table border="0" width="580" cellspacing="0" cellpadding="0">
          <tr>
              <td align="right">
			          选择论坛类别：
			          <html:select property="classId">
			              <html:option value="-1">--请选择论坛类别--</html:option>
					      <html:optionsCollection name="backClassList" value="classId" label="className"/>
					  </html:select>
					  <html:submit value="显示"/>		          
			  </td>
	      </tr>
	  </table>
      </html:form>

      <table border="1" width="580" cellspacing="0" cellpadding="0" bordercolor="#E3E3E3" bordercolorlight="#E3E3E3" bordercolordark="white" rules="rows">
          <tr height="29"><td background="images/admin/backLT.jpg" colspan="5" style="text-indent:5"><b><font color="white">■ 查看版面</font></b></td></tr>	      
	      <tr height="30" bgcolor="#F0F0F0">
	          <td width="15%" align="center">版面ID</td>
	          <td width="40%" align="center">版面名称</td>
	          <td width="25%" align="center">斑竹</td>	          
	          <td width="20%" align="center" colspan="2">操作</td>
	      </tr>
          <logic:notPresent name="backBoardList">
              <tr height="80" align="center" bgcolor="#FBFBFB"><td colspan="5"><li>没有版面可显示！</li></td></tr> 
          </logic:notPresent>
          <logic:present name="backBoardList">
              <logic:notEmpty name="backBoardList">
              <tr>
                  <td colspan="5">
                  <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#F0F0F0" bordercolorlight="#F0F0F0" bordercolordark="white" rules="rows">              
                  <logic:iterate id="backBoardSingle" name="backBoardList">
                      <tr height="35" bgcolor="#FBFBFB">
                            <td width="15%" align="center">${backBoardSingle.boardId}</td>
                            <td width="40%" style="text-indent:5"><a href="needLogin/admin/modifyBoard.do?method=modifyBoard&boardId=${backBoardSingle.boardId}"><bean:write name="backBoardSingle" property="boardName" filter="false"/></a></td>
                            <td width="25%" align="center"><a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${backBoardSingle.boardMaster}"><bean:write name="backBoardSingle" property="boardMaster"/></a></td>
                            <td align="center"><a href="needLogin/admin/modifyBoard.do?method=modifyBoard&boardId=${backBoardSingle.boardId}">√修改</a></td>
                            <td align="center"><a href="needLogin/admin/deleteBoard.do?method=deleteBoard&boardId=${backBoardSingle.boardId}" onclick="javaScript:return confirm('确认要删除该信息?')">×删除</a></td>
                      </tr>
                  </logic:iterate>
                  </table>
                  </td>
              </tr>
              </logic:notEmpty>
              <logic:empty name="backBoardList">
                  <tr height="80" align="center"><td colspan="5"><li>没有版面可显示！</li></td></tr> 
              </logic:empty>
          </logic:present>
	      <tr height="19" style="background-image:url('images/admin/backLE.jpg')"><td colspan="5"></td></tr>	                
      </table>
    </center>
  </body>
</html>