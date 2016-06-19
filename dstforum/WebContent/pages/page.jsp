<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-bean" prefix="bean" %>

<html>
<head><title>分页导航栏</title></head>
<body>
    <table border="0" width="100%" cellspacing="0">
        <tr>
            <td width="37%" align="center"><bean:write name="page" property="pageInfo" filter="false"/></td>
            <td align="center" width="37%"><bean:write name="page" property="pageLink" filter="false"/></td>
            <form action="${param['gowhich']}" method="post">
            <td width="26%">
                转到：
                <input type="text" name="showpage" size="7">
                <input type="submit" value="跳转页面">
            </td>
            </form>
        </tr>
    </table>
</body>
</html>