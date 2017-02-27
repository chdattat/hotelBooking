package services;

import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

@WebService
@SOAPBinding(style = SOAPBinding.Style.RPC)

public interface Confirmation_Msg
{
    @WebMethod String sendConfirm(String email1 , String sub , String msg1);

}
