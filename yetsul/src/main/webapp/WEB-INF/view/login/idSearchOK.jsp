<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/include/top.jsp" %>

<style>
	table { 
		width: 30%;
		text-align: center;
	}
	tr { height: 40px; }
	th { width: 120px; }
</style>
<section>
	<br>
	<div align="center">
		<h1>아 이 디 찾 기</h1>
		<hr width="40%">
		<br>
		<c:if test="${empty user}">
			<h3>찾으시는 회원 정보가 없습니다</h3>
		</c:if>
		<c:if test="${not empty user}">
			<form action="${path}/pwChange.do" method="post">
				<table>
					<tr>
						<td>
							<h3>찾으시는 ID는 <b>${user.getUserId()}</b> 입니다.</h3>
							<input type="hidden" name="userId" value="${user.getUserId()}">
						</td>
					</tr>
				</table>
				<br>
				<input type="button" value="Login" onclick="location.href='${path}/login.do'">
				&emsp;<input type="submit" value="비밀번호 변경">
			</form>
		</c:if>
	</div>
	<br>
</section>

<%@ include file="/include/bottom.jsp" %>