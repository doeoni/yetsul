<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/include/top.jsp" %>

<style>
	table { width: 340px; }
	tr { height: 40px; }
	th { width: 120px; }
</style>
<section>
	<br>
	<div align="center">
		<h1>회 원 확 인</h1>
		<hr width="40%">
		<br>
		개인정보보호를 위해 비밀번호를 확인해 주시기 바랍니다.
		<br><br>
		<form action="${path}/userCheckOK.do" method="post">
			<table>
				<tr>
					<th>패스워드</th><td>&emsp;<input type="password" name="userPassword"></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="확 인">
		</form>
	</div>
	<br>
</section>

<%@ include file="/include/bottom.jsp" %>