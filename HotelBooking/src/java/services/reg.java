package services;

import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

@WebService
@SOAPBinding(style = SOAPBinding.Style.RPC) 
public interface reg 
{
 @WebMethod public int getCountRegistration(String table_name);
 @WebMethod public String createClient(int id,String name,String dob,String uname,String pswd,String addrss,String mob,String email);
    
}
