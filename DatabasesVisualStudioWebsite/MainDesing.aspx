<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainDesing.aspx.cs" Inherits="MainDesing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="MainDesign.css"/>
</head>
<body>
    <form id="form1" runat="server">
   
   
	
	<input class= "btnlogin" type = "submit" value="" />
        <div id="content" class="main">
		
            <div id="MainNav">
                <ul>
                    <li><a href="profile.html">Profile</a></li>
                    <li><a href="About.aspx">Games</a></li>
                    <li><a href="ContactUS.aspx">Conferences</a></li>
					<li><a href="ContactUS.aspx">Communites</a></li>
					<li><a href="Gallery.html">Gallery</a></li>
					  <li><a href="ContactUS.aspx">Contact Us</a></li>
					
					

                </ul>
				
            </div>
			
            
                <div class="inner">     
                     </div>            
                     <div class="Review">
		
			                <div id = "GameReviewInformation">
		                    <label> Game Name : Call Of Duty Black Ops 1 </label>
                             <label id="LblGameName" runat ="server">  </label>
			                <br/>
                             <label> Review :1 </label>
                             <label id="LblReview" runat ="server">  </label>
			                 <br/>
			                <a  runat="server" class ="ReviewerProfile" href ="#" >  Reviewer Profile : nazih@gmail </a>
			                <br/>
			                <br/>
			                <a class ="ReviewComments" href ="#Commentsdiv">  Review Comments  </a>
			
			                </div>

                        </div>
		                </div>
		                <div class="Commentsdiv">	
			                <div class="Comments">
				                <label><a class = "UserProfile" href ="profile.html"> Tag</a> </label>
				                <label id="lblComment"> </label>
				                <br/>
				                
				               
				               
			                </div>
		                </div>
		 
                                     
                     </div>
						
						
                </div>
                
       
                
               
         <script src= "jquery-1.11.3.min.js"> </script>
		<script src= "MainDesign.js"> </script>
	
    </form>
</body>
</html>
