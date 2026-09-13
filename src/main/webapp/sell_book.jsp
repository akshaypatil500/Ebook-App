<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Boook</title>
<%@include file="all_component/allCss.jsp"%>

<style>
	.card {
		border-radius: 15px;
		box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
		border: 1px solid #e0e0e0;
		background: linear-gradient(135deg, #ffffff, #f9f9f9);
		transition: all 0.3s ease-in-out;
	}
	.card:hover {
		transform: translateY(-5px);
		box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
	}
	.card-body {
		padding: 30px;
	}
	h5.text-center {
		font-weight: 600;
		color: #2c3e50;
		margin-bottom: 25px;
	}
</style>

</head>
<body style="background-color: #f0f1f2;">

	<c:if test="${ empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row ">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-body">

						<h5 class="text-center text-primary p-1">Sell Old Book</h5>

						<c:if test="${not empty sessionScope.succMsg}">
							<script>
								Swal.fire({
									icon : 'success',
									title : 'Success!',
									text : '${sessionScope.succMsg}',
									confirmButtonColor : '#28a745',
									timer : 3500,
									showConfirmButton : false
								});
							</script>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty sessionScope.failedMsg}">
							<script>
								Swal.fire({
									icon : 'error',
									title : 'Oops!',
									text : '${sessionScope.failedMsg}',
									confirmButtonColor : '#dc3545',
									timer : 3500,
									showConfirmButton : false
								});
							</script>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form class action="add_old_book" method="post"
							enctype="multipart/form-data">

							<input type="hidden" value="${userobj.email }" name="user">

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> 
								<input type="text" class="form-control" required="required" name="bname">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> 
								<input type="text" class="form-control" required="required" name="author">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> 
								<input type="number" class="form-control" required="required" name="price">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Upload photo</label> 
								<input name="bimg" type="file" class="form-control-file">
							</div>

<button type="submit" class="btn btn-primary btn-block py-1" style="font-size: 1.2rem;">Sell</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
