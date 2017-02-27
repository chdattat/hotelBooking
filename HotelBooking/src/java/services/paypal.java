package services;

import database.Database_Connection;
import java.sql.PreparedStatement;
import javax.jws.WebService;

@WebService(endpointInterface = "services.payment_gateway")
public class paypal implements payment_gateway
{

    @Override
 public String createPayment(String id ,String checkin,String checkout,String person_number,String room,String amount,String debit_card_select ,String dcard_number,String dname_on_card ,String dcvv_number,String dexpiry_date_month,String dexpiry_date_year)
  {
 try
{
Database_Connection.create_Connection();
PreparedStatement stmt = Database_Connection.con.prepareStatement("update client set checkin=?,checkout=?,person_number=?,room=?,amount=?, debit_card_select=? ,dcard_number=?,dname_on_card=?, dcvv_number=?,dexpiry_date_month=?,dexpiry_date_year=? where id=?");

stmt.setString(1,checkin);
stmt.setString(2,checkout);
stmt.setString(3,person_number);
stmt.setString(4,room);
stmt.setString(5,amount);
stmt.setString(6,debit_card_select);
stmt.setString(7,dcard_number);
stmt.setString(8,dname_on_card);
stmt.setString(9,dcvv_number);
stmt.setString(10,dexpiry_date_month);
stmt.setString(11,dexpiry_date_year);
stmt.setInt(12,Integer.parseInt(id));
stmt.executeUpdate();
//Database_Connection.con.close();
}
catch(Exception e)
{
System.out.println(e);
}
return "record Created Succesfully";
}
}
    

