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
		<h1>회 원 로 그 인</h1>
		<hr width="40%">
		<br>
		<form action="${path}/loginOK.do" method="post">
			<table>
				<tr>
					<th>ID</th><td>&emsp;<input type="text" name="userId"></td>
				</tr>
				<tr>
					<th>패스워드</th><td>&emsp;<input type="password" name="userPassword"></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="LOGIN">
			&emsp;<input type="button" value="아이디/비밀번호 찾기" onclick="location.href='${path}/search.do'">
		</form>
	</div>
	<br>
</section>

<%@ include file="/include/bottom.jsp" %>