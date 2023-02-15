<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<link href="${path}/include/css/basic.css" rel="stylesheet" type="text/css">
<style>
	table {
		width: 80%;
		text-align: center;
	}
	tr { height: 35px; }
	#t { width: 550px; }
	#thead { 
		background-color: #ff9966;
		border: 1px black;
		text-align: left;
		font-weight: 500 bold;
		color: #ffffff;
	}
</style>
<section>
	<br>
	<div align="center">
		<h1>주 문 확 인 서</h1>
		<br>
		<hr width="80%">
		<br>
		<table id=t>
			<tr>
				<th>주문번호</th>
				<th>주문자</th>
				<th>주문일자</th>
			</tr>
			<tr>
				<td>${order.getOrderId()}</td>
				<td>${login.getUserName()}</td>
				<fmt:formatDate var="orderDate" value="${order.getOrderDate()}" pattern="yyyy-MM-dd HH:mm:ss" />
				<td>${orderDate}</td>
			</tr>
		</table>
		<br>
		<table>
			<tr>
				<td id="thead" colspan=5>&emsp;&emsp;<b>상세목록</b></td>
			</tr>
			<tr>
				<th>No</th>
				<th>상품명</th>
				<th>가 격</th>
				<th>수 량</th>
				<th>소 계</th>
			</tr>
			<c:set var="i" value="0"/>
			<c:forEach items="${detail}" var="d" varStatus="status">
				<c:if test="${d.getDetailOrderId() != 999999}">
					<tr>
						<c:set var="i" value="${status.count}"/>
						<td>${i}</td>
						<td>${d.getProductName()}</td>
						<fmt:formatNumber var="price" value="${d.getProductPrice()}" pattern="#,###원" />
						<td>${price}</td>
						<td>${d.getOrderAmount()}</td>
						<fmt:formatNumber var="totalPrice" value="${d.getProductPrice()*d.getOrderAmount()}" pattern="#,###원" />
						<td>${totalPrice}</td>
					</tr>
				</c:if>
				<c:if test="${d.getDetailOrderId() == 999999}">
					<tr>
						<td colspan=3>배송비</td>
						<fmt:formatNumber var="delivery" value="${d.getProductPrice()*d.getOrderAmount()}" pattern="#,###원" />
						<td colspan=2>${delivery}</td>
					</tr>
				</c:if>
			</c:forEach>
			<tr style="border-top: 2px solid">
				<th>총 건수</th><td colspan=2>${order.getOrderTotalNum()} 건</td>
				<th>총 수량</th><td colspan=2>${order.getOrderTotalAmount()} 개</td>
			</tr>
			<tr>
				<th colspan=2>합 계</th>
				<td colspan=4>
					<fmt:formatNumber var="tp" value="${order.getOrderTotalPrice()}" pattern="#,###원"/>
					${tp}
				</td>
			</tr>
		</table>
		<br>
		<table>
			<tr>
				<td id="thead" colspan=4>&emsp;&emsp;<b>배송지 정보</b></td>
			</tr>
			<tr>
				<th>수령인</th><td>${recipient.getRecipientName()}</td>
				<th>연락처</th><td>${recipient.getRecipientPhone()}</td>
			</tr>
			<tr>
				<th rowspan=2>주 소</th><td colspan=3 align="left">&emsp;${recipient.getRecipientPostcode()}</td>
			</tr>
			<tr>
				<td colspan=3 style="border-top:hidden;"  align="left">
					&emsp;${recipient.getRecipientAddr1()}, ${recipient.getRecipientAddr2()}
					<c:if test="${recipient.getRecipientAddr3() != null}">
						${recipient.getRecipientAddr3()}
					</c:if>
				</td>
			</tr>
		</table>
		<br>
		<input type="button" value="확인" onclick="window.close()">
	</div>
	<br>
</section>