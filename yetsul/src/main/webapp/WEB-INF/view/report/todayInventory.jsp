<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
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
		<h1>일일 재고/판매 현황</h1>
		<br>
		<hr width="80%">
		<br>
		<table>
			<tr>
				<th rowspan=2>상품번호</th>
				<th rowspan=2>상품명</th>
				<th rowspan=2>현재 보유량</th>
				<th>전일 판매량</th>
				<th>금일 판매량</th>
				<th rowspan=2>최근 입고일</th>
			</tr>
			<tr style="height:24px;">
				<c:set var="now" value="<%=new java.util.Date()%>"/>
				<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd" />
				<c:set var="now" value="<%=new Date(new Date().getTime()-60*60*24*1000*1)%>"/>
				<fmt:formatDate var="daybefore" value="${now}" pattern="yyyy-MM-dd" />
				<td>${daybefore}</td><td>${today}</td>
			</tr>
			<c:forEach items="${iList}" var="i">
				<tr>
					<td>${i.getProductId()}</td>
					<td><a href="${path}/getProduct.do?productId=${i.getProductId()}">${i.getProductName()}</a></td>
					<td>${i.getProductAmount()}개</td>
					<td>${i.getDayBeforeOrderAmount()}개</td>
					<td>${i.getTodayOrderAmount()}개</td>
					<fmt:formatDate value="${i.getLastInStockDate()}" var="inStockDate" pattern="yyyy-MM-dd"/>
					<td>${inStockDate}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<br>
</section>

<%@ include file="/include/bottom.jsp" %>