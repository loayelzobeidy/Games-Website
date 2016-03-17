<%@ Page Language="C#" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="profile.css"/>
</head>
<body>
    <form id="form1" runat="server">
   
		
        <div id="content" class="main" runat="server">
            <div id="MainNav" runat="server">
                <ul runat="server">
                    <li runat="server"><a href="WebFormRegistration.aspx">Profile</a></li>
                    <li runat="server"><a href="About.aspx">Games</a></li>
                    <li runat="server"><a href="ContactUS.aspx">Conferences</a> </li>
					<li runat="server"><a href="ContactUS.aspx">Communites</a></li>
					<li runat="server"><a href="Gallery.html">Gallery</a></li>
					 <li runat="server"> <a href="ContactUS.aspx">Contact Us</a></li>
					


                </ul>

            </div>
			
            
                <div class="inner" runat="server">
               <div class="uppernav" runat="server">
					<ul>
						<li runat="server"><a href="#">View Friend List</a></li>
						<li runat="server"><a href="#">View Pending Friend Requests</a></li>
                        <li runat="server"><a href="#">View Messages</a></li>
                         
					</ul>	
		           </div>
		
		<div class="user_information" runat="server">	
		
		   <div class = "user_photo" runat="server">
			<img src = "icons/user.jpg"  width= "250"/>
			</div>
			<div class = "user_information_text" >
			<img src = "icons/users81.png" width  ="20"/>
		    <label  runat="server"> Name : Omar Tag </label>
			<br/>
			<img src = "icons/videogame10.png" width  = "20"/>
		    <label  runat="server">  Preferred Game Genre : Action  </label>
			<br/>
			<img src = "icons/videogame10.png" width  = "20"/>
		    <label  runat="server">   : Action  </label>
			<br/>
			<img src = "icons/videogame10.png" width  = "20"/>
		    <label  runat="server">  Preferred Game Genre : Action  </label>
			 <div  class = "upload"> 
			     <label id="lbl_Upload" runat="server"> Upload A Photo of yours </label>
                 <br />
			     <input  class= "upload_input" type = "file" runat="server"/>
			     <input type = "submit" value ="Upload" runat="server"/>
             </div>
			</div>

		<div class = "middle" runat="server">
		</div>
		
	
						
                </div>
            </div>     
       
                </div>
               
         
		<script src= "jquery-1.11.3.min.js"> </script>
		<script src= "profile.js"> </script>
=
    </form>
</body>
</html>
