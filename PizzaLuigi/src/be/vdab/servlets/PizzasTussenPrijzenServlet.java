package be.vdab.servlets;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import be.vdab.repositories.PizzaRepository;

@WebServlet("/pizzas/tussenprijzen.htm")
public class PizzasTussenPrijzenServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String VIEW = "/WEB-INF/JSP/pizzatussenprijzen.jsp";
    private final transient PizzaRepository pizzaRepository = new PizzaRepository();

    @Resource(name = PizzaRepository.JNDI_NAME)
    void setDataSource(DataSource dataSource) {
	pizzaRepository.setDataSource(dataSource);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	if (request.getQueryString() != null) {
	    Map<String, String> fouten = new HashMap<>();
	    BigDecimal van = null;
	    try {
		van = new BigDecimal(request.getParameter("van"));
	    } catch (NullPointerException | NumberFormatException ex) {
		fouten.put("van", "tik een getal");
	    }
	    BigDecimal tot = null;
	    try {
		tot = new BigDecimal(request.getParameter("tot"));
	    } catch (NullPointerException | NumberFormatException ex) {
		fouten.put("tot", "tik een getal");
	    }
	    if (fouten.isEmpty()) {
		request.setAttribute("pizzas", pizzaRepository.findByPrijsBetween(van, tot));
	    } else {
		request.setAttribute("fouten", fouten);
	    }
	}
	request.getRequestDispatcher(VIEW).forward(request, response);
    }

}


