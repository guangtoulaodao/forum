<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>

<html>
  <head>
    <title>��Ӱ���</title>
  </head>
  <body>
    <center>
      <br>
      <table border="0" height="250" cellspacing="0" cellpadding="0" bordercolor="lightgrey" bordercolorlight="lightgrey" bordercolordark="white" rules="all">
      <html:form action="needLogin/admin/addBoard.do" focus="boardName">
          <input type="hidden" name="method" value="addBoard">
          <input type="hidden" name="validate" value="yes">
          <tr>
              <td align="center" width="30%">�������</td>
              <td>
			      <html:select property="boardClassID">
				      <html:optionsCollection name="backClassList" value="classId" label="className"/>
			      </html:select>
			  </td>
	      </tr>
          <tr>
                 <td align="center">�������ƣ�</td>
                 <td><html:text property="boardName" size="45"></html:text>
          </tr>
   	      <tr>
          		<td></td>
          		<td><html:errors property="boardName"/></td>
          </tr>          
          <tr>
                 <td align="center">��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
                 <td><html:text property="boardMaster" size="45"></html:text>
          </tr>
   	      <tr>
          		<td></td>
          		<td><html:errors property="boardMaster"/></td>
          </tr>          
          <tr>
                 <td align="center">���湫�棺</td>
                 <td><html:text property="boardPcard" size="45"></html:text>
          </tr>          
   	      <tr>
          		<td></td>
          		<td><html:errors property="boardPcard"/></td>
          </tr>
          <tr>
                 <td></td>
                 <td>
                     <html:submit value="���"/>
                     <html:reset value="����"/>
                 </td>  
          </tr>
      </html:form>
      </table>
    </center>
  </body>
</html>