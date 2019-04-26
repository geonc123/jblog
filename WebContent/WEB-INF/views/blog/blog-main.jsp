<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/jblog.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<title>JBlog</title>
</head>
<style>
.btn {
	cursor: pointer;
}
</style>
<body>

	<div id="container">

		<div id="header">
			<!-- header -->
			<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

		</div>

		<div id="wrapper">
			<div id="content">
				<div class="blog-content">
					<p id="blogTitle">
					<p>
				</div>
				<div >
					<table id="commentsInput" class="blog-list">
						
					</table>
					<ul id="commentsList" class="blog-list">
						
					</ul>
				</div>	

				<div>
					<ul id="blogList" class="blog-list">

					</ul>
				</div>	
					<div class="pager">

					</div>
			</div>
		</div>



		<div id="extra">
			<div class="blog-logo">
				<c:choose>
					<c:when test="${blogvo.logoFile eq null }">
						<!-- 기본 로고 -->
						<img src="../assets/images/spring-logo.jpg">
					</c:when>
					<c:otherwise>
						<!-- 등록한 경우 자신의 로고 -->
						<img
							src="${pageContext.request.contextPath }/upload/${blogvo.logoFile }">
					</c:otherwise>
				</c:choose>
			</div>
			<div id="navigation">
				<h2>카테고리</h2>
				<ul>

				</ul>
			</div>
		</div>



		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

	</div>
</body>
<script type="text/javascript">

	$(document).ready(function() {
						var no = 1;
						
						$.ajax({
									url : "${pageContext.request.contextPath }/blog/categoryList",
									type : "post",
									dataType : "json",
									success : function(list) {
										console.log(list);
										console.log(list[0].cateNo);
										var no = list[0].cateNo;

										for (var i = 0; i < list.length; i++) {
											console.log(list.length);
											render(list[i]);
											// list 찾기 !! 
										}
									},
									error : function(XHR, status, error) {
										console.error(status + " : " + error);
									}
						});
						var cateNo = no;
						var pageNo = 1;
						pagingAjax(1,cateNo);
						str = "";

						$.ajax({
									url : "${pageContext.request.contextPath }/blog/postbycateno",
									type : "post",
									dataType : "json",
									data : {
										cateNo : cateNo
									},
									success : function(list) {
										console.log(list);
										if (list.length == 0) {
											$("#blogList").html("등록된 게시글이 없습니다.");
										} else {
											for (var i = 0; i < list.length; i++) {
												console.log(list.length);

												str += "<li id=listno"+list[i].postNo+"  data-cateno="+list[i].cateNo+" data-postno="+list[i].postNo+" class='btn'>"
												str += "<strong>"+list[i].postTitle+"</strong> "
												str += "<span>"+list[i].regDate+"</span>"
												str += "</li>"
											}
											$("#blogList").html(str);
											str = "";
										}
									},
									error : function(XHR, status, error) {
										console.error(status + " : " + error);
									}
						});
						as = "";

						$.ajax({
									url : "${pageContext.request.contextPath }/blog/posttitle",
									type : "post",
									dataType : "json",
									data : {
										cateNo : cateNo
									},
									success : function(list) {
										console.log(list);
										if (list.length == 0) {
											console.log("nothing postContent")
											$("#blogTitle")
													.html("등록된 글이 없습니다.")
										} else {
											console.log(list.length);
											for (var i = 0; i < list.length; i++) {

												as += "<br>"+ list[i].postTitle+ "<br>";
												as += "<br>"+ list[i].postContent+ "<br>";

											}
											$("#blogTitle").html(as);
											as = "";
										}
									},
									error : function(XHR, status, error) {
										console.error(status + " : " + error);
									}
						});
						
						
					
						
						
						$("#commentsInput").hide();
						$("#commentsList").hide();

					});
	
	//category list
	$("#navigation").on("click","li",function() {
						$("#commentsInput").hide();
						$("#commentsList").hide();

						var $this = $(this);
						console.log($this);
						var cateNo = $this.data("cateno");
						console.log(cateNo);
						
						pagingAjax(1,cateNo);
	});
	
	

	// blog title list 
	$("#navigation").on("click", "li", function() {
		var $this = $(this);
		console.log($this);
		var cateNo = $this.data("cateno");
		console.log(cateNo);
		as = "";
		$.ajax({
			url : "${pageContext.request.contextPath }/blog/posttitle",
			type : "post",
			dataType : "json",
			data : {
				cateNo : cateNo
			},
			success : function(list) {
				console.log(list);
				if (list.length == 0) {
					console.log("nothing postContent")
					$("#blogTitle").html("등록된 글이 없습니다.")
				} else {
					console.log(list.length);
					for (var i = 0; i < list.length; i++) {
						as += "<br>" + list[i].postTitle + "<br>";
						as += "<br>" + list[i].postContent + "<br>";
					}
					$("#blogTitle").html(as);
					as = "";
					
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});

	//post content
	$("#blogList").on("click", "li", function() {
		console.log("list click!");
		$this = $(this);
		console.log($this);
		var cateNo = $this.data("cateno");
		console.log(cateNo);
		var postNo = $this.data("postno");
		console.log(postNo);
		as = "";
		$.ajax({
			url : "${pageContext.request.contextPath }/blog/postcontent",
			type : "post",
			dataType : "json",
			data : {
				cateNo : cateNo,
				postNo : postNo
			},
			success : function(list) {
				console.log(list);
				if (list.length == 0) {
					console.log("nothing postContent")
					$("#blogTitle").html("등록된 글이 없습니다.")
				} else {
					console.log(list.length);
					for (var i = 0; i < list.length; i++) {
						as += "<br>" + list[i].postTitle + "<br>";
						as += "<br>" + list[i].postContent + "<br>";
						
					}
					$("#blogTitle").html(as);
					as = "";
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		var user = '${sessionScope.authUser}';
		console.log(user);
		var userName =  '${sessionScope.authUser.userName}';
		var userNo = '${sessionScope.authUser.userNo}';
			aa="";
		if(user != '' ){
			console.log("write comments");
			
			aa += "<tr>";
			aa += "	<td>댓글달기</td>";
			aa += "	<td>"+userName+"</td>";
			aa += "	<td><input type='text' name='commentscontext'></td>";
			aa += "	<td><span><input type='submit' value='저장' id = 'btn_insert'></span></td>";
			aa += "</tr>";
			
			$("#commentsInput").html(aa);

			aa="";
			$("#btn_insert").on("click",function(){
				console.log("click me !!");
			});
			
		}
		vr="";
		$.ajax({
			url : "${pageContext.request.contextPath }/blog/commentslist",
			type : "post",
			dataType : "json",
			data : {
				postNo : postNo
			},
			success : function(list) {
				console.log(list);
				console.log();
					console.log(list.length);
					for (var i = 0; i < list.length; i++) {
						vr += "<li>";
						vr += "	<td>댓글</td>";
						vr += "	<td>"+list[i].userName+"</td>";
						vr += "	<td>"+list[i].cmtContent+"</td>";
						vr += "	<td><span>"+list[i].regDate+"</span></td>";
						vr += "</li>";
					}
					$("#commentsList").html(vr);
					vr="";
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		

	})
		
	
	
	function render(cateVo) {
		rd = "<li id=no"+cateVo.cateNo+" data-cateno="+cateVo.cateNo+" class='btn'>"
				+ cateVo.cateName + "</li>";
		$("#navigation").append(rd);
	}
	
	function pagingAjax(pageNo,cateNo){
			$.ajax({
				url : "${pageContext.request.contextPath }/blog/getlistpaging",
				type : "post",
				dataType : "json",	
				data : {
					pageNo : pageNo,
					cateNo : cateNo
				},
				success : function(map) {
					console.log(map);
					console.log(map.maxPage);
					console.log(map.list);
					console.log(pageNo);
					paging(pageNo,map.maxPage);
					
					if (map.list.length == 0) {
						$("#blogList").html(
								"등록된 게시글이 없습니다.");
					} else {
						str = "";
						for (var i = 0; i < map.list.length; i++) {
						
							str += "<li id=listno"+map.list[i].postNo+" data-cateno="+map.list[i].cateNo+" data-postno="+map.list[i].postNo+" class='btn'>"
							str += "<strong>"+ map.list[i].postTitle+"</strong> "
							str += "<span>"+ map.list[i].regDate+ "</span>"
							str += "</li>"
						}
						$("#blogList").html(str);
						str = "";
					}
					
					paging(pageNo, map.maxPage);
					
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
		});
		
		
	}
	
	function paging(pageno,maxPage){
		pg = ""
			pg +="<ul>";
		if(pageno>1){
			pg +="<li data-pageno="+(pageno-1)+" class='btn'>";
			pg +="	◀";
			pg +="</li>";
		}else{
			pg +="<li>";
			pg +="</li>";
		}
		if(pageno>3)	
		{
			pg +="<li data-pageno="+(pageno-3)+" class='btn'>";
			pg +=	pageno-3  ;
			pg +="</li>";
		}else{
			pg +="<li>";
			pg +="</li>";
		}
		if(pageno>2){
			pg +="<li data-pageno="+(pageno-2)+" class='btn'>";
			pg +=	pageno-2 ;
			pg +="</li>";	
		}else{
			pg +="<li>";
			pg +="</li>";
		}
		if(pageno>1){
			pg +="<li data-pageno="+(pageno-1)+" class='btn'>";
			pg +=	pageno-1 ;
			pg +="</li>";
		}else{
			pg +="<li>";
			pg +="</li>";
		}
	
		pg +="<li data-pageno="+pageno+" class='selected'>"+pageno +" </li>";
		
		if(pageno+1<=maxPage){
			pg +="<li data-pageno="+(pageno+1)+" class='btn'>";
			pg += 	pageno+1  ;
			pg +="</li>";
		}else{
			pg +="<li>";
			pg +="</li>";
		}
		if(pageno+2<=maxPage){
			pg +="<li data-pageno="+(pageno+2)+" class='btn'>";
			pg +=	 pageno+2  ;
			pg +="</li>";
		}else{
			pg +="<li>";
			pg +="</li>";
		}
		if(pageno+3<=maxPage){
			pg +="<li data-pageno="+(pageno+3)+" class='btn'>";
			pg +=	pageno+3 ;
			pg +="</li>";
		}else{
			pg +="<li>";
			pg +="</li>";
		}
		if(pageno+1<=maxPage){
			pg +="<li data-pageno="+(pageno+1)+" class='btn'>";
			pg +="	 ▶" ;
			pg +="</li>";
		}else{
			pg +="<li>";
			pg +="</li>";
		}

		pg +="</ul>";

						
				
		$(".pager").html(pg);
		
		$(".pager").on("click","li",function(){
			$this = $(this);
			console.log($this);
			var pageNo = $this.data("pageno");
			console.log(pageNo);
			pagingAjax(pageNo,1);
		});
	}
	
</script>

					



	
</html>