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
		<br>
		<c:if test="${empty user}">
			<h1>비 밀 번 호 찾 기</h1>
			<hr width="40%">
			<br>
			<h3>찾으시는 회원 정보가 없습니다</h3>
		</c:if>
		<c:if test="${not empty user}">
			<h1>비 밀 번 호 변 경</h1>
			<hr width="40%">
			<br>
			<form id="f" action="${path}/pwChangeOK.do" method="post" onsubmit="return pwCheck();">
				<table>
					<tr>
						<th>
							<input type="hidden" name="userId" value="${user.getUserId()}">
							변경할 비밀번호
						</th>
						<td>&emsp;<input type="password" name="userPassword" id="pw"></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th><td>&emsp;<input type="password" id="cPw"></td>
					</tr>
				</table>
				<br>
				<input type="submit" value="비밀번호 변경">
			</form>
		</c:if>
	</div>
	<br>
	<script type="text/javascirpt" src="${path}/include/js/pwCheck.js"></script>
</section>


<%@ include file="/include/bottom.jsp" %>