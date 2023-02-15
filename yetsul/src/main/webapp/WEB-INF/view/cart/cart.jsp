<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/include/top.jsp" %>

<style>
	table {
		width: 80%;
		text-align: center;
	}
	tr { height: 35px; }
</style>
<section>
	<br>
	<div align="center">
		<h1>장 바 구 니</h1>
		<br>
		<hr width="80%">
		<br>
		<form action="${path}/cartEdit.do">
			<table>
				<tr>
					<th>No</th>
					<th>상품명</th>
					<th>가 격</th>
					<th>수 량</th>
					<th>소 계</th>
					<th>취 소</th>
				</tr>
				<c:if test="${empty cart}">
					<tr>
						<td colspan=6 align="center">장바구니가 비었습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty cart}">
					<c:set var="cnt" value="0"/>
					<c:set var="i" value="0"/>
					<c:set var="total" value="0"/>
					<c:forEach items="${cart}" var="c" varStatus="status">
						<tr>
							<c:set var="i" value="${status.count}"/>
							<td>${i}</td>
							<td>${c.getProductName()}</td>
							<fmt:formatNumber var="price" value="${c.getProductPrice()}" pattern="#,###원" />
							<td>${price}</td>
							<td>
								<input type="hidden" value="${c.getCartId()}" name="cartId">
								<input type="text" size=3 value="${c.getOrderAmount()}" name="orderAmount">개
							</td>
							<c:set var="cnt" value="${cnt+c.getOrderAmount()}"/>
							<fmt:formatNumber var="totalPrice" value="${c.getTotalPrice()}" pattern="#,###원" />
							<td>${totalPrice}</td>
							<c:set var="total" value="${total+c.getTotalPrice()}"/>
							<td><input type="button" value="취소하기" onclick="location.href='${path}/cartCancel.do?cartId=${c.getCartId()}'"></td>
						</tr>
					</c:forEach>
					<tr>
						<th>총 건수</th><td colspan=2>${i} 건</td><th>총 수량</th><td colspan=2>${cnt} 개</td>
					</tr>
					<tr>
						<th colspan=2>합 계</th>
						<td colspan=4>
							<fmt:formatNumber var="tp" value="${total}" pattern="#,###원"/>
							${tp}
						</td>
					</tr>
				</c:if>
			</table>
			<br>
			<c:if test="${not empty cart}">
				<input type="button" value="장바구니 비우기" onclick="location.href='${path}/cartCancel.do?userId=${login.getId()}'">
				&emsp;<input type="submit" value="수정하기">
				&emsp;<input type="button" value="결제하기" onclick="location.href='${path}/order.do?userId=${login.getId()}'">
			</c:if>
		</form>
	</div>
	<br>
</section>

<%@ include file="/include/bottom.jsp" %>