<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<ul class="admin-menu">
	<li class="selected"><a href="${pageContext.request.contextPath }/blog/${sessionScope.authUser.id }/basic">기본설정</a></li>
	<li><a href="${pageContext.request.contextPath }/blog/${sessionScope.authUser.id }/cate">카테고리</a></li>
	<li><a href="${pageContext.request.contextPath }/blog/${sessionScope.authUser.id }/write">글작성</a></li>
</ul>