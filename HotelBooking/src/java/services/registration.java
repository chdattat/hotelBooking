package services;

import database.Database_Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.jws.WebService;

@WebService(endpointInterface = "services.reg")
public class registration implements reg
{
    @Override
    public int getCountRegistration(String table_name) {
       int numusers = 0;
try
{
Database_Connection.create_Connection();
String query = "Select count(*) FROM "+table_name;
Statement stmt = Database_Connection.con.createStatement();
ResultSet rs = stmt.executeQuery(query);
while (rs.next()) {
numusers = rs.getInt(1);
} 
Database_Connection.con.close();
} 
catch(Exception e)
{
e.printStackTrace();
}
return numusers;
}

    @Override
    public String createClient(int id,String name,String dob,String uname,String pswd,String addrss,String mob,String email)
    {
        try
        {
Database_Connection.create_Connection();


PreparedStatement stmt = Database_Connection.con.prepareStatement("insert into client values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
stmt.setInt(1,id);
stmt.setString(2,name);
stmt.setString(3,dob);
stmt.setString(4,uname);
stmt.setString(5,pswd);
stmt.setString(6,addrss);
stmt.setString(7,mob);
stmt.setString(8,email);
stmt.setString(9,"");
stmt.setString(10,"");
stmt.setString(11,"");
stmt.setString(12,"");
stmt.setString(13,"");
stmt.setString(14,"");
stmt.setString(15,"");
stmt.setString(16,"");
stmt.setString(17,"");
stmt.setString(18,"");
stmt.setString(19,"");
stmt.executeUpdate();
Database_Connection.con.close();
    }
        catch(Exception e)
        {
         System.out.println(e);   
        }
return "";
    
    
}    
}
