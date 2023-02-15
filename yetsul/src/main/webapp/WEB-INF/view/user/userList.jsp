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
	tr { height: 30px; }
	#t { 
		border: 1px hidden;
	}
</style>
<section>
	<br>
	<div align="center">
		<h1>회 원 목 록</h1>
		<hr width="80%">
		<br>
		<table id="t">
			<tr id="t">
				<td id="t" align="left">
					<select id="orderBy" onchange="orderBy()">
						<option value="">-정렬-</option>
						<option value="user_name.asc" <c:if test="${page.getOrderBy()=='user_name.asc'}">selected</c:if>>회원명↑</option>
						<option value="user_name.desc" <c:if test="${page.getOrderBy()=='user_name.desc'}">selected</c:if>>회원명↓</option>
						<option value="user_grade.asc" <c:if test="${page.getOrderBy()=='user_grade.asc'}">selected</c:if>>등급↑</option>
						<option value="user_grade.desc" <c:if test="${page.getOrderBy()=='uuser_grade.desc'}">selected</c:if>>등급↓</option>
						<option value="created_at.asc" <c:if test="${page.getOrderBy()=='created_at.asc'}">selected</c:if>>가입일↑</option>
						<option value="created_at.desc" <c:if test="${page.getOrderBy()=='created_at.desc'}">selected</c:if>>가입일↓</option>
						<option value="order_count.asc" <c:if test="${page.getOrderBy()=='order_count.asc'}">selected</c:if>>구매횟수↑</option>
						<option value="order_count.desc" <c:if test="${page.getOrderBy()=='order_count.desc'}">selected</c:if>>구매횟수↓</option>
					</select>
				</td>
				<td id="t" colspan=4 align="right">
					<form>
						<div style="display:flex; width:50%; margin:5px;">
							<div style="flex:1; margin:0px 1%">
								<select id="searchCondition" onchange="selectChange()">
									<option value="">-선택-</option>
									<option value="userId">ID</option>
									<option value="userName">이름</option>
									<option value="userGrade">등급</option>
									<option value="userJoinDate">가입일</option>
								</select>
							</div>
							<div id="selectGrade" style="display:none; flex:1; margin:0px 1%">
								<select id="keywordGrade" style="width:85px">
									<option value="">-선택-</option>
									<option value="ADMIN">관리자</option>
									<option value="VVIP">VVIP</option>
									<option value="VIP">VIP</option>
									<option value="BASIC">일반</option>
								</select>
							</div>
							<div id="inputKeyword" style="flex:1; margin:0px 1%">
								<input type="text" id="keywordText" size=8>
							</div>
							<div id="inputDate" style="display:none; flex:1; margin:0px 1%">
								<input type="date" id="keywordDate" size=8>
							</div>
							<div style="flex:1;">
								<input type="button" onclick="searchValue();" value="검색">
							</div>
						</div>
					</form>
				</td>
			</tr>
		</table>
		<form id=f action="${path}/updateGrade.do">
			<input type="hidden" value="${login.getId()}" name="updatedBy">
			<table>
				<tr>
					<th>회원등급</th>
					<th>회원ID</th>
					<th>회원명</th>
					<th colspan=2>가입일</th>
					<th>구매횟수</th>
					<th>배송지</th>
				</tr>
				<c:if test="${empty uList}">
					<tr>
						<td colspan=7 align="center">해당 회원이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty uList}">
					<c:forEach items="${uList}" var="u">
						<tr>
							<td>
								<select name="userGrade">
									<option value="ADMIN" <c:if test="${u.getUserGrade()=='ADMIN'}">selected</c:if>>관리자</option>
									<option value="VVIP" <c:if test="${u.getUserGrade()=='VVIP'}">selected</c:if>>VVIP</option>
									<option value="VIP" <c:if test="${u.getUserGrade()=='VIP'}">selected</c:if>>VIP</option>
									<option value="BASIC" <c:if test="${u.getUserGrade()=='BASIC'}">selected</c:if>>일반</option>
								</select>
							</td>
							<td>
								${u.getUserId()}
								<input type="hidden" value="${u.getUserId()}" name="userId" id="userId">
							</td>
							<td><a href="${path}/userInfo.do?userId=${u.getUserId()}">${u.getUserName()}</a></td>
							<fmt:formatDate value="${u.getCreatedAt()}" var="joinDate" pattern="yyyy-MM-dd HH:mm:ss"/>
							<td colspan=2>${joinDate}</td>
							<td>${u.getUserOrderCount()} 회</td>
							<td><input type="button" value="배송지 목록" onclick="openList()"></td>
						</tr>
					</c:forEach>
				</c:if>
				<tr style="border-bottom:hidden; border-left:hidden; border-right:hidden;">
					<td style="border-right:hidden;"><input type="submit" value="일괄변경"></td>
					<td colspan=6></td>
				</tr>
			</table>
		</form>
		<c:forEach var="i" begin="${page.getPageStart()}" end="${page.getPageEnd()}">
			<c:set var="nowRecode" value="${(i-1)*page.getDisplayRecode()+1}"/>
			<c:if test="${page.getNowRecode() == nowRecode}">
				<b>[${i}]</b>
			</c:if>
			<c:if test="${page.getNowRecode() != nowRecode}">
				<a href="${path}/userList.do?nowRecode=${nowRecode}&searchCondition=${page.getSearchCondition()}&searchKeyword=${page.getSearchKeyword()}&orderBy=${page.getOrderBy()}">[${i}]</a>
			</c:if>
		</c:forEach>
		<br>
	</div>
	<br>
</section>

<script src="${path}/include/js/selectChange.js"></script>
<script src="${path}/include/js/openList.js"></script>
<script src="${path}/include/js/searchValue.js"></script>

<%@ include file="/include/bottom.jsp" %>