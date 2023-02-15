<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="com.yetsul.model.*" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
	<head>
		<link href="${path}/include/css/basic.css" rel="stylesheet" type="text/css">
		<meta charset="UTF-8">
		<title>Portfolio - 쇼핑몰</title>
	</head>
	<body>
		<nav>
			&emsp;&emsp;&emsp;<a href="${path}/main.do">Home</a>
			<c:if test="${not empty login}">
				&emsp;&emsp;&emsp;<a href="${path}/productList.do">상품목록</a>
				<c:if test="${login.getGrade() == 'ADMIN'}">
					&emsp;&emsp;&emsp;<a href="${path}/userList.do">회원목록</a>
					&emsp;&emsp;&emsp;<a href="javascript:openMenu();" id="salse">매출현황</a>
				</c:if>
				<c:if test="${login.getGrade() != 'ADMIN'}">
					&emsp;&emsp;&emsp;<a href="${path}/cart.do">장바구니</a>
					&emsp;&emsp;<a href="${path}/orderList.do">주문조회</a>
				</c:if>
				&emsp;&emsp;&emsp;&emsp;&emsp;<b>${login.getName()}</b> 님 환영합니다.
				&emsp;<a href="${path}/myPage.do">회원정보</a>
				&emsp;<input type="button" value="Logout" onclick="location.href='${path}/logout.do'">
			</c:if>
			<c:if test="${empty login}">
				&emsp;&emsp;&emsp;<input type="button" value="Join" onclick="location.href='${path}/join.do'">
				&emsp;<input type="button" value="Login" onclick="location.href='${path}/login.do'">
			</c:if>
		</nav>
		<div id="salseMenu" align="center" style="display:none; background:#ff9966; height:25px; font-size:13px;">
			<a href="${path}/todaySalse.do">일일 매출</a>
			&emsp;|&emsp;
			<a href="${path}/todayInventory.do">일일 재고/판매 현황</a>
		</div>
		
		<script>
			function openMenu(){
				var menu= document.getElementById('salseMenu');
				if(menu.style.display=='none'){
					menu.style.display='block';
				}else{
					menu.style.display='none';
				}
			}
		</script>