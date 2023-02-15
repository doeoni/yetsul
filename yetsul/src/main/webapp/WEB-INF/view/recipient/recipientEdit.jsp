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
		<h1>배송지 수정</h1>
		<hr width="80%">
		<br>
		<form name="f" action="${path}/recipientEditOK.do" method="post">
			<input type="hidden" value="${login.getId()}" name="updatedBy">
			<input type="hidden" value="${recipient.getRecipientId()}" name="recipientId">
			<input type="hidden" value="${deliveryCharge}" name="deliveryCharge">
			<input type="hidden" value="${page}" name="page">
			<table>
				<tr>
					<th>배송지명</th>
					<td colspan=3>&emsp;<input type="text" value="${recipient.getRecipientNickname()}" name="recipientNickname"></td>
				</tr>
				<tr>
					<th>수령인</th>
					<td>&emsp;<input type="text" value="${recipient.getRecipientName()}" name="recipientName"></td>
					<th>연락처</th>
					<td>&emsp;<input type="text" value="${recipient.getRecipientPhone()}" name="recipientPhone"></td>
				</tr>
				<tr>
					<th rowspan=3>주소</th>
					<td align="left" colspan=3>
						&emsp;<input type="text" id="postcode" value="${recipient.getRecipientPostcode()}" name="recipientPostcode">
						<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
					</td>
				</tr>
				<tr>
					<td align="left" colspan=3 style="border-top: hidden; border-bottom: hidden;">
						&emsp;<input type="text" id="address" size=60 value="${recipient.getRecipientAddr1()}" name="recipientAddr1">
					</td>
				</tr>
				<tr>
					<td colspan=3>
						&emsp;<input type="text" id="detailAddress" size=35 value="${recipient.getRecipientAddr2()}" name="recipientAddr2">
						<input type="text" id="extraAddress" size=20 value="${recipient.getRecipientAddr3()}" name="recipientAddr3">
					</td>
				</tr>
			</table>
			<c:if test="${recipient.getRecipientStatus() == 'N'}">
				<span><b>기본 배송지로 등록하시겠습니까?</b>&emsp;<input type="radio" value="Y" name="recipientStatus">기본 배송지로 지정</span>
				<br><br>
			</c:if>
			<br>
			<input type="button" value="이 전" onclick="location.href='${path}/orderRecipient.do'">
			&emsp;<input type="reset" value="다시 작성">
			&emsp;<input type="submit" value="수정하기">
		</form>
	</div>
	<br>
</section>

<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/include/js/postcode.js"></script>

<%@ include file="/include/bottom.jsp" %>