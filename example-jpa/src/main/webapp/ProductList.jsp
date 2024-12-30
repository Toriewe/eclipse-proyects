<%@page import="org.hibernate.dialect.H2Dialect"%>
<%@ page import="java.util.List" %>
<%@page import="example_jpa.model.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	String role;
	if(request.getAttribute("role") != null){
		role = (String) request.getAttribute("role");
	} else {
		role = request.getParameter("role");
	}
    
%>
<html>
<head>
    <title>Product List</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
    <% if("cliente".equals(role)) { %>
        <h1 class="mb-4">Product List</h1>
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>Product ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <%String rol = role; %>
                    <%
                    List<Product> listProducts = (List<Product>) request.getAttribute("products");
                    if (listProducts != null) {
                        for (Product product : listProducts) {
                    %>
                    <tr>
                        <td><%= product.getProductId() %></td>
                        <td><%= product.getName() %></td>
                        <td><%= product.getDescription() %></td>
                        <td><%= product.getPrice() %></td>
                        <td><%= product.getStock() %></td>
                        <td>
                            <form action="CartServlet" method="post" class="form-inline">
                                <input type="hidden" name="type" value="add">
                                <input type="hidden" name="productId" value="<%= product.getProductId() %>">
                                <input type="hidden" name="userId" value="1">
	                                <input type="hidden" name="rol" value="<%=role %>">
                                <div class="form-group mx-sm-3 mb-2">
                                    <label for="quantity<%= product.getProductId() %>" class="sr-only">Quantity</label>
                                    <input type="number" class="form-control" id="quantity<%= product.getProductId() %>" name="quantity" value="1" min="1" max="<%= product.getStock() %>">
                                </div>
                                <button type="submit" class="btn btn-primary mb-2">Add to Cart</button>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="6" class="text-center">No products available</td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
        <% } else if ("trabajador".equals(role)) { %>
        	<h1 class="mb-4">Product List (Trabajador)</h1>
        	
			<a class="btn btn-warning" href="anadirProduct.jsp">Añadir</a>
	        <div class="table-responsive">
	            <table class="table table-bordered table-hover">
	                <thead class="thead-dark">
	                    <tr>
	                        <th>Product ID</th>
	                        <th>Name</th>
	                        <th>Description</th>
	                        <th>Price</th>
	                        <th>Stock</th>
	                        <th>Action</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <%
	                    List<Product> listProducts = (List<Product>) request.getAttribute("products");
	                    if (listProducts != null) {
	                        for (Product product : listProducts) {
	                    %>
	                    <tr>
	                    	
	                        <td><%= product.getProductId() %></td>
	                        <td><%= product.getName() %></td>
	                        <td><%= product.getDescription() %></td>
	                        <td><%= product.getPrice() %></td>
	                        <td><%= product.getStock() %></td>
	                        <td>
	                            <form action="CartServlet" method="post" class="form-inline">
	                                <input type="hidden" name="type" value="add">
	                                <input type="hidden" name="productId" value="<%= product.getProductId() %>">
	                                <input type="hidden" name="userId" value="1">
	                                <input type="hidden" name="rol" value="<%=role %>">
	                                <div class="form-group mx-sm-3 mb-2">
	                                    <label for="quantity<%= product.getProductId() %>" class="sr-only">Quantity</label>
	                                    <input type="number" class="form-control" id="quantity<%= product.getProductId() %>" name="quantity" value="1" min="1" max="<%= product.getStock() %>">
	                                </div>
	                                <button type="submit" class="btn btn-primary mb-2">Add to Cart</button>
	                            </form>
	                        </td>
	                        <td>
	                    		<a class="btn btn-success" href="ProductServlet?type=get&productId=<%=product.getProductId()%>">Editar</a>
		      					<a class="btn btn-danger" href="ProductServlet?type=delete&productId=<%=product.getProductId()%>&role=trabajador">Eliminar</a>
		      				</td>
	                    </tr>
	                    <%
	                        }
	                    } else {
	                    %>
	                    <tr>
	                        <td colspan="6" class="text-center">No products available</td>
	                    </tr>
	                    <%
	                    }
	                    %>
	                </tbody>
	            </table>
	        </div>
         <% } %>
    </div>
    
    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
