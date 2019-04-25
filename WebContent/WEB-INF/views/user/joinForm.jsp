<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/jblog.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
	<title>JBlog</title>
</head>
<body>
	<div class="center-content">
				<!-- header -->
		<c:import url="/WEB-INF/views/includes/menu.jsp"></c:import>
		
		<form class="join-form" id="join-form" method="post" action="${pageContext.request.contextPath }/users/join">
			<label class="block-label" for="name">이름</label>
			<input type="text" name="userName"  value="" />
			
			<label class="block-label" for="id">아이디</label>
			<input id= "checkId" type="text" name="id"  value="" />
			
			<input id="btn-checkid" type="button" value="id 중복체크">
			<p id="checkid-msg" class="form-error">
			&nbsp;
			</p>
			
			<label class="block-label" for="password">패스워드</label>
			<input type="password" name="password"  value="" />

			<fieldset>
				<legend>약관동의</legend>
				<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
				<label class="l-float">서비스 약관에 동의합니다.</label>
			</fieldset>

			<input type="submit" value="가입하기">

		</form>
	</div>

</body>
<script type="text/javascript">


$("#btn-checkid").on("click",function(){
	console.log("click button");
	var id = $("#checkId").val();
	console.log(id);
	

	$.ajax({
		
		url : "${pageContext.request.contextPath }/users/idCheck",		
		type : "post",
		
		
		data : {id: id},

		
		
		dataType : "json",
		success : function(result){
			console.log(result)
			if(result == true){
				$("#checkid-msg").text(" 사용할 수 있는 이메일 입니다. ");
				$("#checkid-msg").css("color", "blue");
			}else {
				$("#checkid-msg").text(" 이미 사용중인 이메일 입니다. ");
				$("#checkid-msg").css("color", "red");
			}
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
		
});



</script>

</html>