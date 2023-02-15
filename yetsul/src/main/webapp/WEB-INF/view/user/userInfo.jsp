<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/include/top.jsp" %>

<style>
	table { width: 90%; }
	tr { height: 40px; }
</style>
<section>
	<br>
	<div align="center">
		<h1>회원정보 수정</h1>
		<hr width="90%">
		<br>
		<form name="f" action="${path}/userEditOK.do" method="post">
			<input type="hidden" value="${info.getUserId()}" name="userId" id="id">
			<table>
				<tr>
					<th>ID</th><td>&emsp;${info.getUserId()}</td>
					<th>등 급</th>
					<td>
						&emsp;<select name="userGrade" style="width:85px">
							<option value="ADMIN" <c:if test="${info.getUserGrade()=='ADMIN'}">selected</c:if>>관리자</option>
							<option value="VVIP" <c:if test="${info.getUserGrade()=='VVIP'}">selected</c:if>>VVIP</option>
							<option value="VIP" <c:if test="${info.getUserGrade()=='VIP'}">selected</c:if>>VIP</option>
							<option value="BASIC" <c:if test="${info.getUserGrade()=='BASIC'}">selected</c:if>>일반</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>패스워드</th><td colspan=3>&emsp;<input type="password" id="pw" name="userPassword"></td>
				</tr>
				<tr>
					<th>이 름</th><td colspan=3>&emsp;<input type="text" value="${info.getUserName()}" name="userName" id="name"></td>
				</tr>
				<tr>
					<th>연락처</th><td>&emsp;<input type="text" value="${info.getUserPhone()}" name="userPhone" id="phone"></td>
					<th>Email</th><td>&emsp;<input type="email" value="${info.getUserEmail()}" name="userEmail" id="email"></td>
				</tr>
				<tr>
					<th rowspan=3>주 소</th>
					<td align="left" colspan=3>
						&emsp;<input type="text" id="postcode" value="${info.getUserPostcode()}" name="userPostcode" id="postcode">
						<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
					</td>
				</tr>
				<tr>
					<td align="left" colspan=3 style="border-top: hidden; border-bottom: hidden;">
						&emsp;<input type="text" id="address" value="${info.getUserAddr1()}" size=70 name="userAddr1">
					</td>
				</tr>
				<tr>
					<td colspan=3>
						&emsp;<input type="text" id="detailAddress" size=35 value="${info.getUserAddr2()}" name="userAddr2" id="addr">
						<input type="text" id="extraAddress" size=20 value="${info.getUserAddr3()}" name="userAddr3">
					</td>
				</tr>
			</table>
			<br>
			<input type="button" value="취소" onclick="location.href='${path}/userInfo.do'">
			&emsp;<input type="reset" value="다시 작성">
			&emsp;<input type="submit" value="수정하기">
		</form>
	</div>
	<br>
</section>

<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/include/js/postcode.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js" ></script>
<script src="${path}/include/js/pwCheck.js"></script>
<script src="${path}/include/js/logoutOK.js"></script>

<%@ include file="/include/bottom.jsp" %>