<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

	<div class="container mt-5">
	<h1>Añadir/Actualizar producto</h1>
		<form action="ProductServlet?type=register&role=trabajador" method="post">
			<!-- Text input -->
			<div class="mb-3">
				<label for="productId" class="form-label">Id</label> 
				<input
					type="hidden" class="form-control" id="productId"
					name="productId"
					value="${product.productId}">
			</div>

			<!-- Text input -->
			<div class="mb-3">
				<label for="name" class="form-label">Nombre</label> 
				<input
					type="text" class="form-control" id="name"
					placeholder="Ingresa el nombre"
					name="name"
					value="${product.name}">
			</div>

			<!-- Text input -->
			<div class="mb-3">
				<label for="descripcion" class="form-label">Descripcion</label> 
				<input
					type="text" class="form-control" id="descripcion"
					placeholder="Ingresa descripcion"
					name="descripcion"
					value="${product.description}">
			</div>
			
			<!-- Number input -->
			<div class="mb-3">
				<label for="price" class="form-label">Precio</label> <input
					type="number" class="form-control" id="price"
					placeholder="3 000"
					name="price"
					value="${product.price}">
			</div>

			<!-- Number input -->
			<div class="mb-3">
				<label for="stock" class="form-label">Stock</label> <input
					type="number" class="form-control" id="stock"
					placeholder="30"
					name="stock"
					value="${product.stock}">
			</div>

			<!-- Submit button -->
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
	

<!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>