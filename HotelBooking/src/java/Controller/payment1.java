package Controller;

import database.Database_Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class payment1 extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
  response.setContentType("text/html;charset=UTF-8");
       PrintWriter out = response.getWriter();
try
{
   String user = request.getParameter("uname");
   String pass = request.getParameter("psswd");
String pwd="";
String id = "";
Database_Connection.create_Connection();
PreparedStatement stmt = Database_Connection.con.prepareStatement("Select pswd,id FROM client where uname=?");
stmt.setString(1,user);
ResultSet rs = stmt.executeQuery();
if (rs.next())
{
pwd = rs.getString(1);
id = rs.getString(2);
} 
Database_Connection.con.close();
 
 HttpSession ss = request.getSession();
  if(pwd.equals(pass))
  {
      ss.setAttribute("id",id);
      ss.setAttribute("user",user);
      ss.setAttribute("pass",pass);
      out.print("success");
      RequestDispatcher rd = request.getRequestDispatcher("payment1.jsp");
      request.setAttribute("id",id);
      rd.forward(request, response);
  }
  else
  {
  }
   
   
}
catch(Exception e)
{
 e.printStackTrace();   
}

}
}