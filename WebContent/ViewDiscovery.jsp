<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList,bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#primary_nav_wrap
{
	margin-top:15px
}

#primary_nav_wrap ul
{
	list-style:none;
	position:relative;
	float:left;
	margin:0;
	padding:0
}

#primary_nav_wrap ul a
{
	display:block;
	color:;
	text-decoration:none;
	font-weight:700;
	font-size:12px;
	line-height:32px;
	padding:0 15px;
	font-family:"HelveticaNeue","Helvetica Neue",Helvetica,Arial,sans-serif
}

#primary_nav_wrap ul li
{
	position:relative;
	float:left;
	margin:0;
	padding:0
}

#primary_nav_wrap ul li.current-menu-item
{
	background:;
}

#primary_nav_wrap ul li:hover
{
	background:;
}

#primary_nav_wrap ul ul
{
	display:none;
	position:absolute;
	top:100%;
	left:0;
	background:#FF8000
	padding:0
}

#primary_nav_wrap ul ul li
{
	float:none;
	width:200px
}

#primary_nav_wrap ul ul a
{
	line-height:120%;
	padding:10px 15px
}

#primary_nav_wrap ul ul ul
{
	top:0;
	left:100%
}

#primary_nav_wrap ul li:hover > ul
{
	display:block
}

</style>

<title>Home - Wattpad</title>
	<!-- include css file here-->
    <link rel="stylesheet" href="css/style.css"/>
	<link rel="stylesheet" href="css/desktop-web.min.css"/>
   <!-- include icon file here-->
   <link rel="icon" type="image/png" href="images/wattpad_icon.png" sizes="16x16">
   <!-- include icon file here for IE-->
   <link rel="icon" type="image/x-icon" href="images/wattpad_icon.ico" />
   <link rel="shortcut icon" href="images/wattpad_icon.ico">
   
   <link rel="stylesheet" id="child-theme-css" href="css/style1.css" type="text/css" media="all" />
   <link rel="stylesheet" id="responsive-main-css-css" href="css/responsive-main.min.css" type="text/css" media="all" />


<%!

String Allid ;
String AllidArray [];
String url="";
ArrayList allDescoveryDetails=new ArrayList();


DiscoveryBean  oDiscoveryBean =null;
 %>
<%
System.out.println("After Decalaring methods ");

if(request.getAttribute("AllIDS")!=null && request.getAttribute("AllDiscoveryDetails")!=null)
{
	allDescoveryDetails=(ArrayList)request.getAttribute("AllDiscoveryDetails");
	 if(allDescoveryDetails!=null)
	 {
		 System.out.println("The size of All Descovery details is as : "+allDescoveryDetails.size());
	 }
	Allid = (String)request.getAttribute("AllIDS");
	 System.out.println("All of the id is as :  "+Allid);
	if(Allid!=null&& !Allid.trim().equals(""))
	{
		AllidArray = Allid.split(",");
		System.out.println(" Array id is as :  "+AllidArray.toString());
	}
	
}
 %>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">

function viewBigImage()
{
	alert('viewBigImage viewBigImage viewBigImage');
	
}


</script>




</head>
<body class="home blog header-full-width full-width-content">


<div id="header-container">
      <div role="banner" id="header" style="display: table;">
      <nav role="navigation">
        <ul class="list-inline">
          <li id="header-item-logo">
            <a class="on-navigate" href="#" title="Wattpad Home" data-gtm="Nav|Pages|Home" aria-label="Home">
              <img class="wp-logo hidden-xs" src="images/wattpad_logo_140.png" width="123" height="35" alt="Wattpad">
              <img class="wp-logo visible-xs-inline-block" src="images/wattpad_logo_40.png" width="35" height="35">
            </a>
         </li>
      
          <li id="discover-dropdown" class="button-group dropdown">
            <a href="ViewDiscovery" data-toggle="dropdown">Discover </a>
          </li>
      
          <li>
            <a class="on-navigate" href="Create.jsp" rel="nofollow" title="Create" aria-label="Create">
              <span>Create</span>
            </a>
          </li>
        </ul>
      </nav>
      
      <div id="header-item-search" aria-label="Search">
        <div><form class="form-horizontal dropdown" role="form" name="search" action="#" autocomplete="off">
        <div class="loading-icon"></div>
        
       
        <input type="hidden" name="ref" value="1">
        <div class="dropdown-menu items" aria-label="search-dropdown">
            <ul aria-label="Autocomplete" class="autocomplete-item-container"></ul>
        </div>
        <div class="triangle"></div>
        
        
      </form>
      </div>
      </div>
      
 <div id="profile-dropdown" class="button-group dropdown" role="menu" aria-label="User">
         <nav id="primary_nav_wrap">
         <ul>
         <li> <a href="#" data-toggle="dropdown">
            <div class="avatar avatar-sm">
               <img name="connectAvatar" hash="[object Object]" data="[object Object]" src="images/f.24.jpg" width="25" height="25" alt="zain">
            </div>
            <%=session.getAttribute("name")%>
             <span class="username hidden-xs">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </span>
            </a>
    <ul>
      <li class="dir"><a href="disply.jsp">Profile</a></li>
      <li class="dir"><a href="pwdUpdate.jsp">password change</a></li>
      <li class="dir"><a href="index.jsp">Logout</a></li>
    </ul>
  </li>
              </ul>
          </div>
        </div>
      </div>
    </div>
<!-- Menu End -->


  <div id="wrap">
<div id="inner">
<div class="wrap">
	<% 
		for(int i=0;i<AllidArray.length;i++)
		{         oDiscoveryBean = (DiscoveryBean)allDescoveryDetails.get(i);
				String position  = AllidArray[i];
				String newposition =position.replace("'", "");
				System.out.println("Postion is as : "+newposition);
				url ="http://localhost:8080/wattpad/DisplayDiscovery?id="+newposition;
				request.setAttribute("id", newposition);
				%>
		<input type="hidden" value='<%=newposition%>' name="id"/>
			<div id="content-sidebar-wrap">
							
				       <div id="content" class="hfeed">
				
										     <div class="post-5 post type-post status-publish format-standard hentry category-featured category-parent-category-i entry feature feature"></div>    	           
											<div class="post-1 post type-post status-publish format-standard hentry category-featured category-uncategorized entry fourcol first one-third teaser first">
										
														<a href="#" title="wattpad">
										
																			
																			<img width="150" height="90"   class="alignleft post-image" alt="2" src='<%=url%>' />
																	
																	
																			
																			</a>
																					
																		   <h2 class="entry-title"><a href="#" title="Hello world!" rel="bookmark"><%=oDiscoveryBean.getArtical_name() %></a></h2> 
																			<div class="entry-content">
																						<p><%=oDiscoveryBean.getDescription() %></p>
																						<a class="bigg-read-more" href="<%=url%>" onclick=""><%=oDiscoveryBean.getCategory() %></a>		
																			</div>
																			
																
																
										   </div>

                       </div>


        </div>



<%} %>





</body>
</html>