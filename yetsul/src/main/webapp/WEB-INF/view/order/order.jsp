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
	th { width: 120px; }
	#t { border-bottom: 2px solid; }
</style>
<section>
	<br>
	<div align="center">
		<h1>주 문 하 기</h1>
		<br>
		<hr width="80%">
		<br>
		<form action="${path}/orderRecipient.do">
			<table>
				<tr>
					<th>총 건수</th><td colspan=2>${order.getOrderTotalNum()} 건</td>
					<th>총 수량</th><td colspan=2>${order.getOrderTotalAmount()} 개</td>
				</tr>
				<tr>
					<th colspan=2>상품 합계</th>
					<td colspan=4>
						<fmt:formatNumber var="price" value="${order.getOrderTotalPrice()}" pattern="#,###원"/>
						${price}
					</td>
				</tr>
				<tr id="t">
					<th colspan=2 id="t">배송비</th>
					<td colspan=4 id="t">
						<input type="hidden" value="${order.getDeliveryCharge()}" name="deliveryCharge">
						<fmt:formatNumber var="delivery" value="${order.getDeliveryCharge()}" pattern="#,###원"/>
						${delivery}
					</td>
				</tr>
				<tr>
					<th colspan=2>총 합계</th>
					<td colspan=4>
						<fmt:formatNumber var="total" value="${order.getDeliveryCharge()+order.getOrderTotalPrice()}" pattern="#,###원"/>
						${total}
					</td>
				</tr>
			</table>
			<br>
			<h4> 주문하시겠습니까? </h4>
			<input type="button" value="이 전" onclick="location.href='${path}/cart.do'">
			&emsp;<input type="submit" value="결제하기">
		</form>
	</div>
	<br>
</section>

<%@ include file="/include/bottom.jsp" %>