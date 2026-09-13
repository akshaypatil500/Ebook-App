<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Old Book</title>
<%@include file="all_component/allCss.jsp"%>

<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}
.card {
	height: 100%;
}
.card-body {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}
</style>

</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row">

			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getAllOldBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3 mb-4">
				<div class="card crd-ho mt-5">
					<div class="card-body text-center d-flex flex-column">
						<div class="text-center mb-2">
							<img alt="" src="Book/<%=b.getPhotoName()%>"
								style="width: 130px; height: 180px"
								class="img-thumbnail mx-auto d-block">
						</div>
						<p class="mt-2 mb-3"><strong><%=b.getBookName()%></strong></p>
						<p class="mb-3"><%=b.getAuthor()%></p>
						<p class="mb-3">Categories: <%=b.getBookCategory()%></p>

						<div class="mt-1 d-flex justify-content-center flex-wrap">
							<!-- View Details Button -->
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline-primary btn-sm px-3 py-2 shadow-sm m-1 d-flex align-items-center">
								<i class="fas fa-info-circle" style="margin-right: 5px;"></i> View Details
							</a>
							
							<!-- Price Button -->
							<a href="#"
								class="btn btn-outline-danger btn-sm px-3 py-2 shadow-sm m-1 d-flex align-items-center">
								<i class="fas fa-rupee-sign" style="margin-right: 5px;"></i> <%=b.getPrice()%>
							</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
	</div>
</body>
</html>
