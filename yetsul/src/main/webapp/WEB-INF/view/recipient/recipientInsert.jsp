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
		<h1>배송지 추가</h1>
		<hr width="80%">
		<br>
		<form name="f" action="${path}/recipientInsertOK.do" method="post" onsubmit="return recipientCheck();">
			<input type="hidden" value="${login.getId()}" name="userId">
			<table>
				<tr>
					<th>배송지명</th>
					<td colspan=3>&emsp;<input type="text" name="recipientNickname" id="nickname"></td>
				</tr>
				<tr>
					<th>수령인</th>
					<td>&emsp;<input type="text" name="recipientName" id="name"></td>
					<th>연락처</th>
					<td>&emsp;<input type="text" name="recipientPhone" id="phone"></td>
				</tr>
				<tr>
					<th rowspan=3>주소</th>
					<td align="left" colspan=3>
						&emsp;<input type="text" id="postcode" name="recipientPostcode">
						<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
					</td>
				</tr>
				<tr>
					<td align="left" colspan=3 style="border-top: hidden; border-bottom: hidden;">
						&emsp;<input type="text" id="address" size=60 name="recipientAddr1">
					</td>
				</tr>
				<tr>
					<td colspan=3>
						&emsp;<input type="text" id="detailAddress" size=35 name="recipientAddr2">
						<input type="text" id="extraAddress" size=20 name="recipientAddr3">
					</td>
				</tr>
			</table>
			<span><b>기본 배송지로 등록하시겠습니까?</b>&emsp;<input type="radio" value="Y" name="recipientStatus">기본 배송지로 지정</span>
			<br><br>
			<input type="button" value="이 전" onclick="location.href='${path}/recipientList.do'">
			&emsp;<input type="reset" value="다시 작성">
			&emsp;<input type="submit" value="등록하기">
		</form>
	</div>
	<br>
</section>

<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/include/js/postcode.js"></script>
<script src="${path}/include/js/valueCheck.js"></script>


<%@ include file="/include/bottom.jsp" %>