<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/include/top.jsp" %>

<style>
	table { width: 80%; }
	tr { height: 40px; }
	th { width: 120px; }
</style>
<section>
	<br>
	<div align="center">
		<h1>배송지 확인</h1>
		<hr width="80%">
		<br>
		<form id="f" action="${path}/orderOK.do" method="post">
			<input type="hidden" value="${login.getId()}" name="userId" id="userId">
			<input type="hidden" value="${recipient.getRecipientId()}" id="recipientId" name="recipientId">
			<table>
				<tr>
					<th>배송지 이름</th><td colspan=3>&emsp;${recipient.getRecipientNickname()}</td>
				</tr>
				<tr>
					<th>수령자</th><td>&emsp;${recipient.getRecipientName()}</td>
					<th>연락처</th><td>&emsp;${recipient.getRecipientPhone()}</td>
				</tr>
				<tr>
					<th rowspan=2>주소</th><td align="left" colspan=3>&emsp;${recipient.getRecipientPostcode()}</td>
				</tr>
				<tr>
					<td align="left" colspan=3 style="border-top: hidden;">
						&emsp;${recipient.getRecipientAddr1()},${recipient.getRecipientAddr2()}
						<c:if test="${recipient.getRecipientAddr3() != 'null'}">
							${recipient.getRecipientAddr3()}
						</c:if>
					</td>
				</tr>
			</table>
			&emsp;&emsp;&emsp;※ 도서,산간지역은 운임비가 추가 될 수 있습니다.
			<br>
			<input type="hidden" value="${deliveryCharge}" id="deliveryCharge">
			<c:set var="plus" value="0" />
			<c:if test="${fn:contains(recipient.getRecipientAddr1(),'제주')}">
				<c:set var="plus" value="3000" />
			</c:if>
			<input type="hidden" value="${deliveryCharge+plus}" name="deliveryCharge">
			<br>
			<input type="button" value="이 전" onclick="location.href='${path}/order.do?userId=${login.getId()}'">
			&emsp;<input type="button" value="현재 배송지 수정" onclick="location.href='${path}/recipientEdit.do?page=order&recipientId=${recipient.getRecipientId()}'">
			&emsp;<input type="button" value="배송지 목록" onclick="openList()">
			&emsp;<input type="submit" value="결제하기">
		</form>
	</div>
	<br>
</section>

<script src="${path}/include/js/openList.js"></script>

<%@ include file="/include/bottom.jsp" %>