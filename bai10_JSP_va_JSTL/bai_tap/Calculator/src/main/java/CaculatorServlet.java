import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CaculatorServlet", value = "/caculator")
public class CaculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float first = Float.parseFloat(request.getParameter("first operator"));
        float second = Float.parseFloat(request.getParameter("second operator"));
        String operatorString = request.getParameter("operator");
        char operator = operatorString.charAt(0);
        float result = Caculator.Caculate(first,second,operator);

        PrintWriter writer = response.getWriter();
        writer.println("<HTML>");
        writer.println("<h1>Result: " +result +"</h1>");
        writer.println("</HTML>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
