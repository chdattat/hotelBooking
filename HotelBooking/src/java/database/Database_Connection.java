package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database_Connection 
{
static String dbUrl="",dbClass="",userName="",password="";
public static Connection con=null;
 public static void create_Connection()
{
   
try
        {
dbUrl = "jdbc:mysql://localhost/hotel";
dbClass = "com.mysql.jdbc.Driver";
userName = "root";
password = "";
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection (dbUrl, userName, password);
        }
            catch(Exception e)
                    {
   System.out.print(e);                 
                    }
}

    
}
