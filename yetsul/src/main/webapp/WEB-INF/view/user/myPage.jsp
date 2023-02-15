<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/include/top.jsp" %>

<style>
	table { width: 80%; }
	tr { height: 40px; }
</style>
<section>
	<br>
	<div align="center">
		<h1>회 원 정 보</h1>
		<hr width="80%">
		<br>
		<form action="${path}/userCheck.do">
			<table>
				<tr>
					<th>ID</th><td colspan=3>&emsp;${info.getUserId()}</td>				
				</tr>
				<tr>
					<th>이름</th><td colspan=3>&emsp;${info.getUserName()}</td>
				</tr>
				<tr>
					<th>연락처</th><td>&emsp;${info.getUserPhone()}</td>
					<th>Email</th><td>&emsp;${info.getUserEmail()}</td>
				</tr>
				<tr>
					<th rowspan=3>주소</th><td align="left" colspan=3>&emsp;${info.getUserPostcode()}</td>
				</tr>
				<tr>
					<td align="left" colspan=3 style="border-top: hidden;">
						&emsp;${info.getUserAddr1()}, ${info.getUserAddr2()}
						<c:if test="${info.getUserAddr3() != null}">
							${info.getUserAddr3()}
						</c:if>
					</td>
				</tr>
			</table>
			<br>
			<input type="button" value="배송지 관리" onclick="location.href='${path}/recipientList.do'">
			&emsp;<input type="submit" value="수정하기">
		</form>
	</div>
	<br>
</section>

<%@ include file="/include/bottom.jsp" %>