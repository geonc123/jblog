<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/jblog.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<title>JBlog</title>
</head>
<body>

	<div id="container">

		<div id="header">
			<!-- header -->
			<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

		</div>


		<div id="wrapper">
			<div id="content" class="full-screen">
				<c:import url="/WEB-INF/views/includes/admin_menu.jsp"></c:import>

				<table class="admin-cat">
					<thead>
						<tr>
							<th>번호</th>
							<th>카테고리명</th>
							<th>포스트 수</th>
							<th>설명</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody id="cateList">

					</tbody>
				</table>

				<h4 class="n-c">새로운 카테고리 추가</h4>
				<table id="admin-cat-add">
					<tr>
						<td class="t">카테고리명</td>
						<td><input type="text" name="id" value="${blogvo.id }"></td>
						<td><input type="text" name="cateName" value=""></td>
					</tr>
					<tr>
						<td class="t">설명</td>
						<td><input type="text" name="description" value=""></td>
					</tr>
					<tr>
						<td class="s">&nbsp;</td>
						<td><input id="btnAddCate" type="submit" value="카테고리 추가"></td>
					</tr>
				</table>

			</div>
		</div>

		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

	</div>
</body>

<script type="text/javascript">
 //시작하면서 리스트를 불러
	$(document).ready(function() {
		var id="${blogvo.id }"
		$.ajax({
			url : "${pageContext.request.contextPath }/cate/list",
			type : "post",
			data : {
				id : id
			},
			dataType : "json",
			success : function(list) {
				console.log(list);
				for (var i = 0; i < list.length; i++) {
					console.log(list.length);
					render(list[i], "down");
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});

	});

 	// 카테고리 추
	$("#btnAddCate").on("click", function() {
		console.log("click!!")
		var cateName = $("[name=cateName]").val();
		console.log(cateName);
		var description = $("[name=description]").val();
		console.log(description);
		var id = $("[name=id]").val();
		console.log(id);

		$.ajax({

			url : "${pageContext.request.contextPath}/cate/insert",
			type : "post",
			data : {
				cateName : cateName,
				description : description,
				id : id
			},
			dataType : "json",
			success : function(categoryVo2) {
				console.log(categoryVo2)
				if (categoryVo2 != null) {
					render(categoryVo2, "up");
					
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});

		$("[name=cateName]").val("");
		$("[name=description]").val("");
	});
	// 버튼 누르고 삭제 할 때 
	$("#cateList").on("click", ".btn_cateDel", function() {
		var $this = $(this);
		console.log($this);
		var cateNo = $this.data("no");
		console.log(cateNo);
		var postNo = $this.data("postno");
		console.log(postNo);
		console.log("delete!!");
		
		if(postNo = 0){
			$.ajax({

				url : "${pageContext.request.contextPath}/cate/delete",
				type : "post",
				data : {cateNo:cateNo},
				dataType : "json",
				success : function(count) {
					console.log("delete in ajax")
					if(count = 1){
						console.log("delete complete");
						$("#no"+cateNo).remove();
					}else console.log("delete Fail")
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		}else alert("삭제할 수 없습니다.")
		

	});

	function render(categoryVo, updown) {
		console.log("render");
		var str = "";
		str += "<tr id=no"+categoryVo.cateNo+">"
		str += "<td>" + categoryVo.cateNo + "</td>"
		str += "<td>" + categoryVo.cateName + "</td>"
		str += "<td>" + categoryVo.count + "</td>"
		str += "<td>" + categoryVo.description + "</td>"
		str += "<td><img class='btn_cateDel' src='../../assets/images/delete.jpg' data-postno="+categoryVo.count+" data-no="+categoryVo.cateNo+"></td>"
		str += "</tr>"
		if (updown == "up") {
			$("#cateList").prepend(str);
		} else if (updown == "down") {
			$("#cateList").append(str);
			console.log("down")
		} else {
			console.log("updown 오류 ");
		}
	}
	
	
</script>

</html>