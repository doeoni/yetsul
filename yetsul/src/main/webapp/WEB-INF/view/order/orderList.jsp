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
	th,td { width: auto; }
</style>
<section>
	<br>
	<div align="center">
		<h1>주 문 조 회</h1>
		<br>
		<hr width="80%">
		<br>
		<table>
			<tr>
				<th>주문번호</th>
				<th>주문내용</th>
				<th>결제금액</th>
				<th>상세보기</th>
			</tr>
			<c:if test="${empty oList}">
				<tr>
					<td colspan=4 align="center">주문 내역이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty oList}">
				<c:forEach items="${oList}" var="o">
					<tr>
						<td>${o.getOrderId()}</td>
						<c:if test="${o.getOrderTotalNum() > 1}">
							<td>[${o.getMainProductId()}] ${o.getMainProductName()} 외 ${o.getOrderTotalNum()-1} 건</td>
						</c:if>
						<c:if test="${o.getOrderTotalNum() == 1}">
							<td>[${o.getMainProductId()}] ${o.getMainProductName()}</td>
						</c:if>
						<fmt:formatNumber var="price" value="${o.getOrderTotalPrice()}" pattern="#,###원" />
						<td>${price}</td>
						<td><input type="button" value="상세보기" onclick="location.href='${path}/getDetail.do?orderId=${o.getOrderId()}'"></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	<br>
</section>

<%@ include file="/include/bottom.jsp" %>