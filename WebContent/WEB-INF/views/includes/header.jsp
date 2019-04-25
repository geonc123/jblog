<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<h1>
	<a href="${pageContext.request.contextPath }/blog/${blogvo.id}">${blogvo.blogTitle }</a>
</h1>


<ul>
	<c:choose>
		<c:when test="${sessionScope.authUser eq null }">
			<!-- 로그인 전 메뉴 -->
			<li><a href="${pageContext.request.contextPath }/users/loginform">로그인</a></li>
		</c:when>
		<c:otherwise>
			<!-- 로그인 후 메뉴 -->
			<li><a href="${pageContext.request.contextPath }/users/logout">로그아웃</a></li>
			<c:if test="${sessionScope.authUser.id eq blogvo.id }"> <!-- id 가 같을 때 보이도록 하자! -->
		<li><a href="${pageContext.request.contextPath }/blog/${sessionScope.authUser.id }/basic">내블로그 관리</a></li>
			</c:if>
		</c:otherwise>
	</c:choose>
</ul>