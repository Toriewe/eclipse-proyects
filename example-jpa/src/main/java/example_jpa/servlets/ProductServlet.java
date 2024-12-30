package example_jpa.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import example_jpa.model.Product;
import example_jpa.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductServlet
 */
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductServlet() {
        super();
    }
    
    private ProductService productService = new ProductService();

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     String type = request.getParameter("type");

			switch (type) {
			case "register":
				String id = request.getParameter("productId");
				if (id != null && !id.isEmpty()) {
					updateProduct(request, response);
				} else {
					addProduct(request, response);
				}
				break;
			case "list":
				listProducts(request, response);
				break;
			case "get":
				getProduct(request, response);
				break;
			case "delete":
				deleteProduct(request, response);
				break;
			default:
				break;
			}
	       
	}
	
	private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("productId");
		
		productService.delete(Long.parseLong(id));
		
		listProducts(request, response);
	}

	private void getProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String id = request.getParameter("productId");
		
		Product p = productService.find(Long.parseLong(id));
		request.setAttribute("product", p);
		
		request.getRequestDispatcher("/anadirProduct.jsp").forward(request, response);
		
	}

	private void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String description = request.getParameter("descripcion");
		String price = request.getParameter("price");
		String stock = request.getParameter("stock");
		
		Product p = new Product();
		p.setName(name);
		p.setDescription(description);
		p.setPrice(Double.parseDouble(price));
		p.setStock(Integer.parseInt(stock));
		
		productService.add(p);
		
		listProducts(request, response);
		
	}

	private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("productId");
		
		String name = request.getParameter("name");
		String description = request.getParameter("descripcion");
		String price = request.getParameter("price");
		String stock = request.getParameter("stock");
		
		Product p = new Product();
		p.setProductId(Long.parseLong(id));
		p.setName(name);
		p.setDescription(description);
		p.setPrice(Double.parseDouble(price));
		p.setStock(Integer.parseInt(stock));
		
		productService.update(p);
		
		listProducts(request, response);
		
	}

	private void listProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Product> products = productService.list();
		
        request.setAttribute("products", products);
        request.getRequestDispatcher("/ProductList.jsp").forward(request, response);
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
