package sit.int202.classicmodels.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.classicmodels.entities.Customer;
import sit.int202.classicmodels.repositories.OrderRepository;

import java.io.IOException;

import static java.lang.Integer.parseInt;

@WebServlet(name = "OrderListServlet", value = "/order-list")
public class OrderListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Customer customer = (Customer) request.getSession().getAttribute("user");
        OrderRepository orderRepository = new OrderRepository();
        request.setAttribute("orders", orderRepository.findAll(customer.getCustomerNumber()));
        String orderNumber = request.getParameter("orderNumber");
        if (orderNumber != null) {
            Integer orderNumberInt = Integer.parseInt(orderNumber);
            request.setAttribute("totalPrice", orderRepository.getTotalPrice(orderNumberInt));
            request.setAttribute("selectedOrder", orderRepository.findOrder(orderNumberInt));
        }
        getServletContext().getRequestDispatcher("/components/OrderList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
