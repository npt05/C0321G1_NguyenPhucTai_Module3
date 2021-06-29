package controller;

import model.Product;
import service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ControllerServlet", urlPatterns = "/products")
public class ControllerServlet extends HttpServlet {
    ProductService productService = new ProductService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action="";
        }
        switch (action){
            case "create":
                createNewProduct(request,response);
                break;
            case "edit":
                editProduct(request,response);
                break;
            case "delete":
                deleteProduct(request,response);
            default:
                break;
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action="";
        }
        switch (action){
            case "create":
                newProductForm(request,response);
                break;
            case "edit":
                editProductFrom(request,response);
                break;
            case "delete":
                deleteProductForm(request,response);
                break;
            case "view":
                viewProduct(request,response);
                break;
            case "name":
                findByName(request,response);
                break;
            default:
                showALl(request,response);
        }

    }



    private void createNewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int price =Integer.parseInt(request.getParameter("price")) ;
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
        List<Product> products = productService.showAll();
        Product lastProduct = products.get(products.size()-1);
        int id = lastProduct.getId()+1;
        productService.create(new Product(id,name,price,description,producer));
        request.setAttribute("message","Đã tạo mới thành công");
        RequestDispatcher dispatcher = request.getRequestDispatcher("products/create.jsp");
        dispatcher.forward(request,response);
    }

    private void newProductForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("products/create.jsp");
        dispatcher.forward(request,response);
    }

    private void showALl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = productService.showAll();
        request.setAttribute("products",products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("products/showAll.jsp");
        dispatcher.forward(request,response);
    }
    private void editProductFrom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findByID(id);
        request.setAttribute("product",product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("products/edit.jsp");
        dispatcher.forward(request,response);
    }
    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int price =Integer.parseInt(request.getParameter("price")) ;
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
        int id = Integer.parseInt(request.getParameter("id"));
        productService.update(id,new Product(id,name,price,description,producer));
        showALl(request,response);
    }

    private void deleteProductForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findByID(id);
        request.setAttribute("product",product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("products/delete.jsp");
        dispatcher.forward(request,response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.delete(id);
        showALl(request,response);
    }

    private void viewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findByID(id);
        request.setAttribute("product",product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("products/view.jsp");
        dispatcher.forward(request,response);
    }
    private void findByName(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        String name = request.getParameter("name");
        Product product = productService.findByName(name);
        request.setAttribute("product",product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("products/view.jsp");
        dispatcher.forward(request,response);
    }
}
