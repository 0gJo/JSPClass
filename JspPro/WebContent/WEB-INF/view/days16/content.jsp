<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 5. 16.-오후 5:16:46)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<style>
a {
	text-decoration: none;
	color: black;
}

table {
	border-spacing: 1px;
	border-collapse: separate;
}

table, tr, td {
	border-radius: 3px;
	padding: 3px;
}
</style>

<script>
$(document).ready(function (){
	  $("#btnModalDelete").click(function (){ 
		  $("#myModal").modal("show");
	  });
	  
	  // Delete.jsp 복사 붙이기 ㅋㅋ
	  $("#btnDelete").click(function (){
		  // alert("test");
		  if( confirm("정말 삭제합니까? ")){
			  // delete.do?num=1&cp&sc&sw
			  $("#form1").submit();
		  }
	  });
});
</script>
</head>
<body>
<table width="600" style="margin: 50px auto" border="1">
		<tr>
			<td colspan="2" align="right">글보기</td>
		</tr>
		<tr>
			<td width="70" align="center">글번호</td>
			<td width="330">${ dto.num }</td>
		</tr>
		<tr>
			<td width="70" align="center">조회수</td>
			<td width="330">${ dto.readcount }</td>
		</tr>
		<tr>
			<td width="70" align="center">작성자</td>
			<td width="330">${ dto.writer }</td>
		</tr>
		<tr>
			<td width="70" align="center">글제목</td>
			<td width="330">${ dto.subject }</td>
		</tr>
		<tr>
			<td width="70" align="center">글내용</td>
			<td width="330">
				<div style="width: 100%; height: 200px; overflo: scroll;">${ dto.content }
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="button" value="글수정"
				onclick="location.href='edit.do?num=${ dto.num }&page=${ param.page}&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }'">
				
		   <a href="delete.do?num=${ dto.num }">글삭제</a>
				<%-- 
       <input type="button" value="글삭제" 
       onclick="location.href='Delete.do?num=${ vo.num }&currentPage=${currentPage}'">
        --%> <input type="button" value="답글"
				onclick="location.href='write.do?num=${ dto.num }&ref=${dto.ref }&step=${ dto.step }&depth=${ dto.depth }'">
				<input type="button" value="글목록"
				onclick="location.href='list.do?page=${ param.page}&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }'">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<!-- days03/Ex01.jsp --> 
		<input type="button" id="btnModalDelete"
				value="모달창으로 글 삭제">
			</td>
		</tr>
	</table>







	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog" style="width: 350px">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">게시물 삭제</h4>
				</div>
				<div class="modal-body">
					<!-- Delete.jsp 복사 붙이기.  -->
					<div style="text-align: center">
						<form id="form1" action="delete.do" method="post">
							<table width="300px" border="1" align="center">
								<tr>
									<td>비밀 번호 입력하세요?</td>
								</tr>
								<tr>
									<td><input type="password" name="pass">
									<input	type="hidden" name="num" value="${ param.num }"></td>
								</tr>
								<tr>
									<td><input type="button" id="btnDelete" value="글삭제">
										<a href="list.do?page=${param.page }">글목록</a></td>
								</tr>
							</table>
						</form>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
</body>
</html>










