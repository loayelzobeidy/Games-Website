

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="GameReview.css"/>
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
                         
                    <div id="uppernav">       
                        <asp:Button runat="server" id="btn_Comment" type="button" text="Add Comment" />
                     </div>
                    
                           
                     <div id="Review">
		
			               <div id = "GameReviewInformation">
		                    <label runat="server"> Game Name: </label>
                            <label id="lblGameName" runat ="server">  </label>
			                <br/>
                             <label runat="server"> Review : </label>
                             <label id="lblReview" runat ="server">  </label>
			                 <br/>
                            <label  runat ="server">by:  </label>
			                <a  runat="server" id ="ReviewerProfile" href ="#" ></a>
			                <br/>
			                <br/>
			                
			                </div>

                        </div>
		                </div>
		                <div class="Commentsdiv">	
			                <div class="Comments">
				                <label><a runat="server" class = "UserProfile" href ="profile.html"> Tag</a> </label>
				                <label runat="server" id ="lblComment"> </label>
				                <br/>
			                </div>
		                </div>
		 
                                     
                </div> 
                
       
                
               
         <script src= "jquery-1.11.3.min.js"> </script>
		<script src= "GameReview.js"> </script>
	
    </form>
</body>
</html>
