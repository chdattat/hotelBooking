<%-- 
    Document   : payment
    Created on : 21 Apr, 2015, 2:24:43 AM
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
		
<div class="content">

<div class="login"><br><br>
<p>Fill Your Details Here.....<br/><br/>
 </div>


	<div class="payment"><br>
	<h1>Pay Your Bill Here</h1><br />
        <form action="transcation" method="post">
<table>
    <%
 String id = (String)session.getAttribute("id") ;
 out.println(id);
        %>
<tr><td>
        <input type="hidden" name="id" value="<%=id%>">
<label class='span-3' for='dcard_number'>Check In</label></td><td>
<input type='text' name='checkin' class='required creditcard debitcard text' maxlength='25' id='dcard_number' autocomplete='off' placeholder='dd\mm\yyyy' >
</td></tr>
<tr><td>
<label class='span-3' for='dname_on_card'>Check Out</label></td><td>
<input type='text' name='checkout' class='text req' id='dname_on_card' maxlength='50' autocomplete='off' placeholder='dd\mm\yyyy'>											
</td></tr>
<tr><td>
<label class='span-3' for='dcard_number'>Persons</label></td><td>
<input type='text' name='person_number' class='required creditcard debitcard text' maxlength='25' id='dcard_number' autocomplete='off' >
</td></tr>
<tr><td>
<label class='span-3' for='dname_on_card'>Rooms</label></td><td>
<input type='text' name='room' class='text req' id='dname_on_card' maxlength='50' autocomplete='off'>											
</td></tr>
<tr><td>
<label class='span-3' for='amount'>Total Amount</label></td><td>
<input type='text' name='amount' class='text req' id='dname_on_card' maxlength='50' autocomplete='off'>											
</td></tr>
<tr><td>
<p class="card-options">
<label class="span-3" for="debit_card_select">Select debit card</label> </td><td>
<select class="required" id="debit_card_select" name="debit_card_select" style="width: 195px;">
<option value="" selected="selected">Select Debit Card Type</option>
<option value="debitcard_VISA_1" >Visa Debit Cards (All Banks)</option><option value="debitcard_MAST_1" >MasterCard Debit Cards (All Banks)</option><option value="debitcard_SMAE_1" >State Bank Maestro Cards</option><option value="debitcard_MAES_1" >Other Maestro Cards</option><option value="debitcard_CITD_1" >CITI Debit Card</option><option value="debitcard_RUPAY_1" >Rupay Debit Card</option>										</select>
</p>
</td></tr>	
<tr><td>
<label class='span-3' for='dcard_number'>Card Number</label></td><td>
<input type='text' name='dcard_number' class='required creditcard debitcard text' maxlength='25' id='dcard_number' autocomplete='off'  >
</td></tr>
<tr><td>
<label class='span-3' for='dname_on_card'>Name on Card</label></td><td>
<input type='text' name='dname_on_card' class='text req' id='dname_on_card' maxlength='50' autocomplete='off'>											
</td></tr>
<tr><td>
<label class="span-3 cvvExp" for="dcvv_number">CVV Number</label>
</td><td><input type="password" name="dcvv_number" class="required validccvv digits password" maxlength="3" id="dcvv_number" pattern="[0-9]*" autocomplete="off"><tr><td>
<p class="dropdowns">
	<label class="span-3 cvvExp">Expiry Date</label>
	</td><td>
	<select id="dexpiry_date_month" name="dexpiry_date_month">
	<option value="" selected="selected">Month</option>
	<option value="01">Jan (1)</option>
	<option value="02">Feb (2)</option>
	<option value="03">Mar (3)</option>
	<option value="04">Apr (4)</option>
	<option value="05">May (5)</option>
	<option value="06">Jun (6)</option>
	<option value="07">Jul (7)</option>
	<option value="08">Aug (8)</option>
	<option value="09">Sep (9)</option>
	<option value="10">Oct (10)</option>
	<option value="11">Nov (11)</option>
	<option value="12">Dec (12)</option>
	</select> 
	<select id="dexpiry_date_year" name="dexpiry_date_year">
	<option value="" selected="selected">Year</option>
	<option value="2015">2015</option>
	<option value="2016">2016</option>
	<option value="2017">2017</option>
	<option value="2018">2018</option>
	<option value="2019">2019</option>
	<option value="2020">2020</option>
	<option value="2021">2021</option>
	<option value="2022">2022</option>
	<option value="2023">2023</option>
	<option value="2024">2024</option>
	<option value="2025">2025</option>
	<option value="2026">2026</option>
	<option value="2027">2027</option>
	<option value="2028">2028</option>
	<option value="2029">2029</option>
	<option value="2030">2030</option>
	<option value="2031">2031</option>
	</select>
												</td></tr>

													
<tr><td><span style="clear: both"></span><input type="submit" name="pay_button" value="Pay Now" 
onclick="form_params();" class=""  id="pay_button"> 
                                                                          
                                                                       
							
						
		</td></tr>
</table><br>
		</form>
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
			
		    <div class="clear"></div>
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