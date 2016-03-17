<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TopicNew.aspx.cs" Inherits="TopicNew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="Topic.css"/>
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
                        <input id="btnAddComment"  runat="server" type="button" value="Add Comment"/>	
                         </div>        
                     <div id="TopicDiv" runat="server"> 
                        <label id="lblTopicTitle" runat="server"></label>
                         <label id="lblBy" runat="server">by:</label>
                        <label id="lblUserProfile" runat="server">
                        <a  runat="server" id="linkUserProfile" href="profile.aspx">
                            Nazih
                        </a>
                        </label>

                         <div id="ThemeDiv">
                        <label id="lblTheme" runat="server">Theme: </label>
                        <label id="lblTopicTheme" runat="server">  </label>
                         </div>
                         <br />
 		                <label  runat="server" id="lbldescription"></label>
                     </div>
						
					<div id="Commentsdiv">
			            <div id="Comments">
				            
				            <label id="lblUserCommented" runat="server"> Ahmed Nazih </label>
				            <label id="lblComment">  Nice Review, but you forgot to say something.</label>
                            <input id="btnDeleteComment" type="button" value=" x" />
				            <br/>
				          
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

