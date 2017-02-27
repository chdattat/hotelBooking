package Controller;

import database.Database_Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.confirm_msg;
import services.paypal;


public class transcation extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       PrintWriter out = response.getWriter(); 
try
{
String id = request.getParameter("id");
String checkin = request.getParameter("checkin");
String checkout = request.getParameter("checkout");
String person_number = request.getParameter("person_number");
String room = request.getParameter("room");
String amount = request.getParameter("amount");
String debit_card_select = request.getParameter("debit_card_select");
String dcard_number = request.getParameter("dcard_number");
String dname_on_card = request.getParameter("dname_on_card");
String dcvv_number = request.getParameter("dcvv_number");
String dexpiry_date_month = request.getParameter("dexpiry_date_month");
String dexpiry_date_year = request.getParameter("dexpiry_date_year");

paypal pm = new paypal();
pm.createPayment(id ,checkin,checkout,person_number,room,amount,debit_card_select ,dcard_number,dname_on_card ,dcvv_number,dexpiry_date_month,dexpiry_date_year);

PreparedStatement stmt1 = Database_Connection.con.prepareStatement("select * from client where id=?");
stmt1.setInt(1,Integer.parseInt(id));
ResultSet rs = stmt1.executeQuery();
if(rs.next())
{
    String email = rs.getString(8);
    String transaction = rs.getString(13);
    
    String ur = "YOUR Transaction of Rs. = "+transaction+" is Sucessfully Done";
    confirm_msg mg = new confirm_msg();
    mg.sendConfirm(email,"Account Details",ur);   
}


Database_Connection.con.close();

response.sendRedirect("user_payment_response.jsp");
}
catch(Exception e)
{
System.out.println(e);
}
}
}
