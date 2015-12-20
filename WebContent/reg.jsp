<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>user registration form</title>
<style>
*{
	margin:0px;
	padding:0px;
	}
body{
	font-family:Tahoma, Geneva, sans-serif;
	}
#container{
	width:550px;
	background-color:rgba(250,250,252,.9);
	margin:auto;
	margin-top:10px;
	margin-bottom:10px;
	box-shadow:0 0 3px #999;
	}
#container_body{
	padding:20px;
	}
.form_title{
	font-size:35px;
	color:#141823;
	text-align:center;
	padding:10px;
	font-weight:normal;
	}
.head_para{
	font-size:19px;
	color:#99a2a7;
	text-align:center;
	font-weight:normal;
	}
#form_name{
	padding:25px 0 0 15px;
	}
.firstnameorlastname{
	 margin-right:20px;
	}
.input_name{
	width:207px;
	padding:5px;
	font-size:18px;
	}
#email_form{
	clear:both;
	padding:15px 0 10px 0px;
	}
.input_email{
	width:434px;
	padding:5px;
	font-size:18px;
	}
#Re_email_form{
	padding:10px 0 10px 0px;
	}
.input_Re_email{
	width:434px;
	padding:5px;
	font-size:18px;
	}
#password_form{
	padding:10px 0 10px 0px;
	}
.input_password{
	width:434px;
	padding:5px;
	font-size:18px;
	}
.birthday_title{
	font-size:16px; 
	color:#8b919d; 
	font-weight:normal;
	padding:0 0 10px 0;
	}
select{
	padding:5px;
	}
#birthday{
	font-size:12px;
	color:#8b919d;
	padding-top:10px;
	}
#radio_button{
	padding:10px 0 0 0;
	}
#sign_user{
	font-size:14px;
	color:#FFF;
	text-align:center;
	background-color:#3B5998;
	padding:10px;
	margin-top:10px;
	cursor: pointer;
	}
#errorBox{
	color:#F00;
	}



</style>
<script>
function Submit(){
	var emailRegex = /^[A-Za-z0-9._]*\@[A-Za-z]*\.[A-Za-z]{2,5}$/;
	var fname = document.form.First_Name.value,
		lname = document.form.Last_Name.value,		
		fage = document.form.Age.value,
		fmob = document.form.Mobile.value,		
		fcity = document.form.City.value,
		fzip = document.form.Zip_Code.value,		
		femail = document.form.EmailAddress.value,
		freemail = document.form.enterEmail.value,
		fuser = document.form.UserName.value,
		fpassword = document.form.Password.value;
		
		
	if( fname == "" )
   {
     document.form.First_Name.focus() ;
	 document.getElementById("errorBox").innerHTML = "enter the first name";
     return false;
   }
	if( lname == "" )
   {
     document.form.Last_Name.focus() ;
	  document.getElementById("errorBox").innerHTML = "enter the last name";
     return false;
   }
   
	if( fage == "" )
   {
     document.form.Age.focus() ;
	 document.getElementById("errorBox").innerHTML = "enter your Age";
     return false;
   }
   
	if( fmob == "" )
   {
     document.form.Mobile.focus() ;
	  document.getElementById("errorBox").innerHTML = "enter the Mobile Number";
     return false;
   }
   
   if( fcity == "" )
   {
     document.form.City.focus() ;
	 document.getElementById("errorBox").innerHTML = "enter your city Name";
     return false;
   }
   
	if( fzip == "" )
   {
     document.form.Zip_Code.focus() ;
	  document.getElementById("errorBox").innerHTML = "enter the Zip Code";
     return false;
   }
   
   if (femail == "" )
	{
		document.form.EmailAddress.focus();
		document.getElementById("errorBox").innerHTML = "enter the email";
		return false;
	 }else if(!emailRegex.test(femail)){
		document.form.EmailAddress.focus();
		document.getElementById("errorBox").innerHTML = "enter the valid email";
		return false;
	 }
	 
 if (freemail == "" )
	{
		document.form.enterEmail.focus();
		document.getElementById("errorBox").innerHTML = "Re-enter the email";
		return false;
	 }else if(!emailRegex.test(freemail)){
		document.form.enterEmail.focus();
		document.getElementById("errorBox").innerHTML = "Re-enter the valid email";
		return false;
	 }
	 
	 if(freemail !=  femail){
		 document.form.enterEmail.focus();
		 document.getElementById("errorBox").innerHTML = "emails are not matching, re-enter again";
		 return false;
		 }
	
     if(fuser == "")
	 {
		 document.form.UserName.focus();
		 document.getElementById("errorBox").innerHTML = "enter the User Name";
		 return false;
	 }	

	
	if(fpassword == "")
	 {
		 document.form.Password.focus();
		 document.getElementById("errorBox").innerHTML = "enter the password";
		 return false;
	 }	  

	return true;

}
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

</script>
</head>

<body>

<div id="description"></div>
<!--container start-->
<div id="container">
  <div id="container_body">
    <div>
      <h2 class="form_title">User Registration Form</h2>
      <p class="head_para"></p>
    </div>
    <!--Form  start-->
    <div id="form_name">
      
       <form name="form"  method="post" action="register"  onsubmit="return Submit();">
	   <div class="firstnameorlastname">
       
        <input type="text" name="First_Name" value="" placeholder="First Name"  class="input_name" maxlength="15" >
        <input type="text" name="Last_Name" value="" placeholder="Last Name" class="input_name" maxlength="15">
		<br><br>
        <input type="text" name="Age" value="" placeholder="Age"  class="input_name" maxlength="2" onkeypress="return isNumber(event)">
        <input type="text" name="Mobile" value="" placeholder="Mobile" class="input_name" maxlength="10" onkeypress="return isNumber(event)"> 
		<br><br>
		<input type="text" name="City" value="" placeholder="City"  class="input_name" >
        <input type="text" name="Zip_Code" value="" placeholder="Zip Code" class="input_name" maxlength="6" onkeypress="return isNumber(event)"> 
      </div>
      <div id="email_form">
        <input type="text" name="EmailAddress" value=""  placeholder="Your Email" class="input_email" maxlength="30">
      </div>
      <div id="Re_email_form">
        <input type="text" name="enterEmail" value=""  placeholder="Re-enter Email" class="input_Re_email" maxlength="30">
      </div>
	  <div id="username_form">
        <input type="text" name="UserName" value=""  placeholder="User Name" class="input_password" maxlength="15">
      </div>
      <div id="password_form">
        <input type="password" name="Password" value=""  placeholder="Password" class="input_password" maxlength="8">
      </div>
	    <div align="left" id="sign_user" >
       <!-- <p id="sign_user" onClick="Submit()">Sign Up </p>  -->
        <input id="sign_user" type="submit" value="Submit" /> &nbsp;&nbsp;&nbsp;
        <input id="sign_user" type="reset" value="Reset"  />
      </div>
      
     </form>
    </div>
   
    <!--form ends--> 
  </div>
</div>
 <div id="errorBox" align="center"></div>
<!--container ends-->
</body>
</html>

   