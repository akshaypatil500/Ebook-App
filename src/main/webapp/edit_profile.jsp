<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<%@include file="all_component/allCss.jsp"%>

<style>
	.card {
		border-radius: 15px;
		box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
		border: 1px solid #e0e0e0;
		background: linear-gradient(135deg, #ffffff, #f9f9f9); /* Gradient background */
		transition: all 0.3s ease-in-out;
	}
	.card:hover {
		transform: translateY(-5px);
		box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
	}
	.card-body {
		padding: 30px;
	}
	h4.text-center {
		font-weight: 600;
		color: #2c3e50;
		margin-bottom: 25px;
	}

	/* Form and button styles */
	.form-group label {
		font-weight: 500;
		color: #333;
	}
	.form-control {
		border-radius: 8px;
		padding: 10px;
		font-size: 0.95rem;
		border: 1px solid #ccc;
	}
	.btn-primary {
		background: #3498db;
		border: none;
		padding: 10px 24px;
		border-radius: 25px;
		font-weight: 600;
		font-size: 1rem;
		transition: all 0.3s ease;
		display: block;
		width: 100%;
	}
	.btn-primary:hover {
		background: #2980b9;
		transform: scale(1.02);
	}
</style>

</head>
<body style="background-color: #f0f1f2;">

	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-body">
						<h4 class="text-center text-primary">Edit Profile</h4>
						
						<c:if test="${not empty failedMsg}">
							<script>
								Swal.fire({
									icon : 'error',
									title : 'Oops!',
									text : '${failedMsg}',
									confirmButtonColor : '#dc3545',
									timer : 3500,
									showConfirmButton : false
								});
							</script>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty succMsg}">
							<script>
								Swal.fire({
									icon : 'success',
									title : 'Success!',
									text : '${succMsg}',
									confirmButtonColor : '#28a745',
									timer : 3500,
									showConfirmButton : false
								});
							</script>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form action="update_profile" method="post">
							<input type="hidden" value="${userobj.id}" name="id">

							<div class="form-group">
								<label for="fname">Enter Full Name</label>
								<input type="text" class="form-control" required name="fname" value="${userobj.name}">
							</div>

							<div class="form-group">
								<label for="email">Email address</label>
								<input type="email" class="form-control" required name="email" value="${userobj.email}">
							</div>

							<div class="form-group">
								<label for="phno">Phone No</label>
								<input type="number" class="form-control" required name="phno" value="${userobj.phno}">
							</div>

							<div class="form-group">
								<label for="password">Password</label>
								<input type="password" class="form-control" required name="password">
							</div>

							<button type="submit" class="btn btn-primary">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
