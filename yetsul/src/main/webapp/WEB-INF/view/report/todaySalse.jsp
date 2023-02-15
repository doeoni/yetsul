<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/include/top.jsp" %>

<style>
	table {
		width: 80%;
		text-align: center;
		margin: auto;
	}
	tr { height: 35px; }
	th,td { width: auto; }
</style>
<section>
	<br>
	<div align="center">
		<h1>일 일 매 출</h1>
		<hr width="80%">
		<br>
		<table style="width:60%;" >
			<tr>
				<th>구분</th>
				<th>총 주문</th>
				<th>총 판매량</th>
				<th>총 매출</th>
			</tr>
			<tr>
				<th>전일</th>
				<td>
					<fmt:formatNumber var="dayBeforeTotalCount" value="${dayBeforeSalse.getTodayTotalOrderCount()}" pattern="#,###" />
					 ${dayBeforeTotalCount}건
				</td>
				<td>
					<fmt:formatNumber var="dayBeforeTotalAmount" value="${dayBeforeSalse.getTodayTotalOrderAmount()}" pattern="#,###" />
					 ${dayBeforeTotalAmount}개
				</td>
				<td>
					<fmt:formatNumber var="dayBeforeTotalPrice" value="${dayBeforeSalse.getTodayTotalOrderSalse()}" pattern="#,###" />
					 ${dayBeforeTotalPrice}원
				</td>
			</tr>
			<tr>
				<th>금일</th>
				<td>
					<fmt:formatNumber var="todayTotalCount" value="${todaySalse.getTodayTotalOrderCount()}" pattern="#,###" />
					 ${todayTotalCount}건(
					 <c:set var="v" value="${todayTotalCount-dayBeforeTotalCount}" />
					 <c:if test="${v > 0}">
					 	<font color="blue">▲</font>
					 </c:if>
					 <c:if test="${v == 0}">
					 	-
					 </c:if>
					 <c:if test="${v < 0}">
					 	<font color="red">▼</font>
					 </c:if>
					 )
				</td>
				<td>
					<fmt:formatNumber var="todayTotalAmount" value="${todaySalse.getTodayTotalOrderAmount()}" pattern="#,###" />
					 ${todayTotalAmount}개(
					 <c:set var="v" value="${todayTotalAmount-dayBeforeTotalAmount}" />
					 <c:if test="${v > 0}">
					 	<font color="blue">▲</font>
					 </c:if>
					 <c:if test="${v == 0}">
					 	-
					 </c:if>
					 <c:if test="${v < 0}">
					 	<font color="red">▼</font>
					 </c:if>
					 )
				</td>
				<td>
					<fmt:formatNumber var="todayTotalPrice" value="${todaySalse.getTodayTotalOrderSalse()}" pattern="#,###" />
					 ${todayTotalPrice}원(
					 <c:set var="v" value="${todaySalse.getTodayTotalOrderSalse()-dayBeforeSalse.getTodayTotalOrderSalse()}" />
					 <c:if test="${v > 0}">
					 	<font color="blue">▲</font>
					 </c:if>
					 <c:if test="${v == 0}">
					 	-
					 </c:if>
					 <c:if test="${v < 0}">
					 	<font color="red">▼</font>
					 </c:if>
					 )
				</td>
			</tr>
		</table>
		<br>
		<hr width="80%">
		<br>
		<table>
			<tr>
				<th>주문번호</th>
				<th>주문자ID</th>
				<th>주문내용</th>
				<th>결제금액</th>
				<th>상세보기</th>
			</tr>
			<c:if test="${empty oList}">
				<tr>
					<td colspan=5 align="center">아직 일일 주문내역이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty oList}">
				<c:forEach items="${oList}" var="o">
					<tr>
						<td>
							<input type="hidden" value="${o.getOrderId()}" id="orderId">
							${o.getOrderId()}
						</td>
						<td>${o.getUserId()}</td>
						<td>
							<c:if test="${o.getOrderTotalNum() > 1}">
								[${o.getMainProductId()}] ${o.getMainProductName()} 외 ${o.getOrderTotalNum()-1} 건
							</c:if>
							<c:if test="${o.getOrderTotalNum() == 1}">
								[${o.getMainProductId()}] ${o.getMainProductName()}
							</c:if>
						</td>
						<fmt:formatNumber var="price" value="${o.getOrderTotalPrice()}" pattern="#,###원" />
						<td>${price}</td>
						<td><input type="button" value="상세보기" onclick="openDetailOrder()"></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	<br>
</section>

<script type="text/javascript">
	function getContextPath() {
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};
	
	var openPopup;
	
	function openDetailOrder(){
		var orderId=document.getElementById("orderId").value;
		var path=getContextPath();
		window.name="orderForm";
		openPopup=window.open(path+'/popup/getDetailOrder.do?orderId='+orderId,'주문확인서','width=750,height=700');
	}
 </script>

<%@ include file="/include/bottom.jsp" %>