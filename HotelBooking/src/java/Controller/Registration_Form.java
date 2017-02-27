package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.registration;

public class Registration_Form extends HttpServlet {
       @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
try
{
String name = request.getParameter("name");    
String dob = request.getParameter("dob");    
String uname = request.getParameter("uname");
String pswd = request.getParameter("pswd");
String addrss = request.getParameter("addrss");
String mob = request.getParameter("mob");
String email = request.getParameter("email");

registration db = new registration();
int id = db.getCountRegistration("client");
id = id+1;
String s = db.createClient(id,name,dob,uname,pswd,addrss,mob,email);
response.sendRedirect("index.jsp?a="+"registered Sucessfully");
}
catch(Exception e)
{
    out.println(e);
}
    
    
    }    
    
}