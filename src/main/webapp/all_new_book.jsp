<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All New Book</title>
<%@include file="all_component/allCss.jsp"%>

<style type="text/css">
.crd-ho {
	transition: 0.3s ease;
	min-height: 500px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}
.crd-ho:hover {
	background-color: #fcf7f7;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}
.card-body {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	height: 100%;
}
.btn-style {
	padding: 6px 16px;
	font-size: 14px;
	border-radius: 50px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.08);
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 5px;
}
.btn-group-line {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
}
.card-body p {
	margin-bottom: 5px;
}
.card-body .text-center {
	margin-bottom: 10px;
}
/* toast */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}
#toast.display {
	visibility: visible;
	animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
}
@keyframes fadeIn {
	from { bottom: 0; opacity: 0; }
	to { bottom: 30px; opacity: 1; }
}
@keyframes fadeOut {
	from { bottom: 30px; opacity: 1; }
	to { bottom: 0; opacity: 0; }
}
/* toast */
</style>
</head>
<body>

<%
   User u = (User) session.getAttribute("userobj"); 
%>

<c:if test="${not empty addCart}">
	<div id="toast">${addCart}</div>
	<script type="text/javascript">
		showToast();
		function showToast(content) {
			$('#toast').addClass("display");
			$('#toast').html(content);
			setTimeout(() => {
				$("#toast").removeClass("display");
			}, 2000)
		}
	</script>
	<c:remove var="addCart" scope="session"/>
</c:if>

<%@include file="all_component/navbar.jsp"%>

<div class="container-fluid">
	<div class="row">
		<%
		BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
		List<BookDtls> list = dao.getAllNewBook();
		for (BookDtls b : list) {
		%>
		<div class="col-md-3 mb-4">
			<div class="card crd-ho mt-5">
				<div class="card-body text-center">
					<div class="text-center">
						<img alt="" src="Book/<%=b.getPhotoName()%>"
							style="width: 120px; height: 170px"
							class="img-thumbnail mb-2 mx-auto d-block">
					</div>
					<p><strong><%=b.getBookName()%></strong></p>
					<p><%=b.getAuthor()%></p>
					<p>Categories: <%=b.getBookCategory()%></p>
					
					<div class="btn-group-line">
						<%
						if (u == null) {
						%>
							<a href="login.jsp" class="btn btn-outline-success btn-style">
								<i class="fas fa-cart-plus me-2"></i> Add Cart
							</a>
						<%
						} else {
						%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-outline-success btn-style">
								<i class="fas fa-cart-plus me-2"></i> Add to Cart
							</a>
						<%
						}
						%>
						<a href="view_books.jsp?bid=<%=b.getBookId()%>"
							class="btn btn-outline-primary btn-style">
							<i class="fas fa-info-circle me-2"></i> View Details
						</a>
						<a href="#" class="btn btn-outline-danger btn-style">
							<i class="fas fa-rupee-sign me-2"></i> <%=b.getPrice()%>
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
