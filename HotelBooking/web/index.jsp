<%-- 
    Document   : index
    Created on : 21 Apr, 2015, 2:19:52 AM
    Author     : Sahil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<title>The Royal-Hotel for Website Template | Home :: w3layouts</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/libs/jquery-1.6.2.min.js"></script>
<script src="js/basic-jquery-slider.js"></script>
<link href='http://fonts.googleapis.com/css?family=Monda' rel='stylesheet' type='text/css'>
</head>
<body>
<div class="header">
<div class="wrap">
	<div class="wrapper">
 	<div class="logo">
			<a href="index.html"><img src="images/logo3.png" /></a>
	</div>
 	<div class="menu">
			<ul>
				<li class="active"><a href="index.jsp">Home</a></li>
				<li><a href="tariff.jsp">Tariff</a></li>
				<li><a href="food.jsp">Food</a></li>
				<li><a href="contact.jsp">Contact</a></li>
				<li><a href="payment.jsp">Book&Pay</a></li>
			</ul>
			 <div class="clear"></div> 
	</div>
	<div id="container">
      <div id="banner">
        <ul class="bjqs">
          <li><img src="images/banner3.jpg" title="Automatically generated caption"></li>
          <li><img src="images/banner2.jpg" title="Automatically generated caption"></li>
          <li><img src="images/banner1.jpg" title="Automatically generated caption"></li>
        </ul>
      </div>
   </div>
   <script>
      $(document).ready(function() {
        
        $('#banner').bjqs({
          'animation' : 'slide',
          'width' : 920,
          'height' : 450
        });
        
      });
    </script>
<div class="content">
<div class="content-top">
		<div class="grid">
				<div class="tariff">
					   	<div class="text">
				 			<h2>24 hours Reception</h2>
							<p>Contrary to popular belief. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia</p
							><a href="tariff.html"><p><span class="yellow">Read More</span></p></a>	
						</div>
				<div class="clear"></div>
				</div>
		</div>
		<div class="grid1">
					<div class="tariff">
					   	<div class="text">
				 			<h2>Breakfast</h2>
							<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia</p>
							<a href="tariff.html"><p><span class="yellow">Read More</span></p></a>	
						</div>
					<div class="clear"></div>
					</div>
		</div>
		<div class="grid2">
			 <h4>Register & Book Here</h4>
		      <div class="booking">	
                          <form action="Registration_Form" method="post">
	              <fieldset>
	                <div class="field">
	                	<h5>Registration Information:</h5>
                                <% String a = request.getParameter("a");
                                String msg="";
                                if(a==null||a.equals(""))
                                {
                                    msg="";
                                }
                                else
                                {
                                    msg="You Have Registered Sucessfully";
                                }
                                %>
                                <h5><%=msg%></h5>    
		<table>
<tr><td><label>Name:</label></td><td><input type="text"         name="name" placeholder="Enter Name"></td></tr>
<tr><td><label>D.O.B:</label></td><td><input type="text"        name="dob"  placeholder="dd\mm\yyyy"></td></tr>
<tr><td><label>User Name:</label></td><td><input type="text"    name="uname"></td></tr>
<tr><td><label>Password:</label></td><td><input type="Password" name="pswd"></td></tr>
<tr><td><label>Address:</label></td><td><textarea               name="addrss" rows="3" cols="10"></textarea></td></tr>
<tr><td><label>Mob No.:</label></td><td><input type="text"      name="mob" placeholder="Enter Mob. NO."></td></tr>
<tr><td><label>E-mail:</label></td><td><input type="text"       name="email" placeholder="Enter E-mail Id"></td></tr>
<tr><td colspan="3"><input type="submit" value="Submit & Register"></td></tr>
	              </table>
				  
				  </fieldset>
            </form>
            <div class="clear"></div>
         </div>
		</div>
		<div class="clear"></div>
      </div>
   </div>
  </div>
 </div>
</div>
<div class="content-bottom">
<div class="wrap">
	<div class="bottom-gallery">			
			<div class="bottom-image">
				<img src="images/pic.jpg">
			</div>
			<div class="bottom-image">
				<img src="images/pic4.jpg">
			</div>
			<div class="bottom-image">
				<img src="images/pic10.jpg">
			</div>
			<div class="bottom-image1">
				<img src="images/pic7.jpg">
			</div>
			<div class="clear"></div>
	</div>
 </div>
</div>

 </div>
</div>	
<div class="footer-bottom">
<div class="wrap">	
	<div class="copy">
		<p>&copy; 2012 All rights Reserved | Design by <a href="http://w3layouts.com">W3Layouts</a></p>
	</div>
 </div>
</div>
</body>
</html>