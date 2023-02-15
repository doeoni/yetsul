<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<link href="${path}/include/css/basic.css" rel="stylesheet" type="text/css">
<style>
	table {
		width: 95%;
		text-align: center;
	}
	tr { height: 35px; }
</style>
<section>
	<br>
	<div align="center">
		<h1>회원 배송지 목록</h1>
		<br>
		<hr width="95%">
		<br>
		<table style="font-size: small">
			<tr>
				<th>구 분</th>
				<th>배송지명</th>
				<th>수령인</th>
				<th>연락처</th>
				<th>주 소</th>
				<th>최근배송일</th>
			</tr>
			<c:if test="${empty rList}">
				<tr>
					<td colspan=7 align="center">등록된 배송지가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty rList}">
				<c:forEach items="${rList}" var="r">
					<tr>
						<c:choose>
							<c:when test="${r.getRecipientStatus() == 'Y'}">
								<td>기본</td>
							</c:when>
							<c:otherwise>
								<td>&emsp;</td>
							</c:otherwise>
						</c:choose>
						<td>${r.getRecipientNickname()}</td>
						<td>${r.getRecipientName()}</td>
						<td>${r.getRecipientPhone()}</td>
						<td>
							[${r.getRecipientPostcode()}] ${r.getRecipientAddr1()},<br>
							${r.getRecipientAddr2()}
							<c:if test="${r.getRecipientAddr3()!= null}">
								${r.getRecipientAddr3()}
							</c:if>
						</td>
						<fmt:formatDate value="${r.getLastOrderDate()}" var="lastOrderDate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<td>${lastOrderDate}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<br>
		<input type="button" value="닫기" onclick="closePopup()">
	</div>
	<br>
</section>

<script src="http://code.jquery.com/jquery-1.10.2.js" ></script>
<script src="${path}/include/js/recipientList.js"></script>
<script type="text/javascript">
	function closePopup(){
		window.close();
	}
</script>