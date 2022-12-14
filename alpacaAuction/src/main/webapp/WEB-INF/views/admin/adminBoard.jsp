<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h2 class="text-primary">리뷰게시판 목록</h2>
	<table class="table table-bordered">
		<tr><th>상품명</th><th>제목</th><th>사진</th><th>별점</th><th>작성자</th><th>작성일</th><th>삭제여부</th></tr>
		<c:if test="${empty list }">
			<tr><td colspan="7">리뷰가 없습니다</td></tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="review_board" items="${list}">
				<tr><td>${auction_item.item_name }</td>
					<td><a href="rv_view.do?review_no=${review_board.review_no }&pageNum=${pageNum }" class="btn btn-primary">${review_board.title }</a></td>
					<td><img alt="" src="${path}/resources/upload/${review_board.review_img }" width="100" id="a1"></td>
					<td>${review_board.rating }</td>
					<td>${review_board.id }</td> 
					<td>${review_board.reg_date }</td>
					<c:if test="${review_board.del == 'n' }">
									<td class="col-md-1 text-center">
										<a href="adminBdDelete.do?review_no=${review_board.review_no}&pageNum=${pageNum }">
											<span class="btn btn-danger">삭제</span></a>
									</td>
							</c:if>
							<c:if test="${review_board.del == 'y' }">
								<td class="text-center">
									<a href="adminBdRollback.do?review_no=${review_board.review_no}&pageNum=${pageNum }">
										<span class="btn btn-success">복구</span></a>
								</td>
							</c:if>
				</tr>
			</c:forEach>
		</c:if>
	</table>
<div align="center">
	<ul class="pagination">
		<!-- 시작페이지가 pagePerBlock보다 크면 앞에 보여줄것이 없다 -->
		<c:if test="${pb.startPage > pb.pagePerBlock }">
			<li><a href="adminBoard.do?pageNum=1&search=${review_board.search }&keyword=${review_board.keyword }"><span class="glyphicon glyphicon-fast-backward"></span></a></li>
			<li><a href="adminBoard.do?pageNum=${pd.startPage-1 }&search=${review_board.search }&keyword=${review_board.keyword }"><span class="glyphicon glyphicon-triangle-left"></span></a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
		<c:if test="${pb.currentPage == i }">
			<li class="active"><a href="adminBoard.do?pageNum=${i }&search=${review_board.search}&keyword=${review_board.keyword}">${i }</a></li>
		</c:if>
		<c:if test="${pb.currentPage != i }">
			<li><a href="adminBoard.do?pageNum=${i }&search=${review_board.search}&keyword=${review_board.keyword}">${i }</a></li>
		</c:if>
		</c:forEach>
		<!-- engPage보다 totalPage가 크면 뒤에 보여줄것이 있다 -->
		<c:if test="${pb.endPage < pb.totalPage }">
			<li><a href="adminBoard.do?pageNum=${pb.endPage+1 }&search=${review_board.search}&keyword=${review_board.keyword}"><span class="glyphicon glyphicon-triangle-right"></span></a></li>
			<li><a href="adminBoard.do?pageNum=${pb.totalPage }&search=${review_board.search}&keyword=${review_board.keyword}"><span class="glyphicon glyphicon-fast-forward"></span></a></li>
		</c:if>
	</ul>
</div>
<form action="adminBoard.do">
	<input type="hidden" name="pageNum" value="1">
	<select name="search">
		<c:forTokens var="sh" items="id,title,contents,subcon" delims="," varStatus="i">
			<c:if test="${sh == review_board.search }">
				<option value="${sh }" selected="selected">${title[i.index] }</option>
			</c:if>
			<c:if test="${sh != review_board.search }">
				<option value="${sh }" >${title[i.index] }</option>
			</c:if>
		</c:forTokens>
	</select>
<input type="text" name="keyword" value="${review_board.keyword }">
<input type="submit" value="검색" class="btn btn-info">
</form>
</div>
</body>
</html>