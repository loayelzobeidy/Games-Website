<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GamePage.aspx.cs" Inherits="GamePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="GamePage.css"/>
</head>
<body>
    <form id="form1" runat="server">
    
    <div id="content" runat="server" class="main">
            <div id="MainNav" runat="server">
                <ul>
                    <li><a href="profile.aspx">Profile</a></li>
                    <li><a href="About.aspx">Games</a></li>
                    <li><a href="ContactUS.aspx">Conferences</a></li>
					<li><a href="ContactUS.aspx">Communites</a></li>
					<li><a href="Gallery.html">Gallery</a></li>
					<li><a href="ContactUS.aspx">Contact Us</a></li>
                </ul>
            </div>

			<div class = "upperlist" runat="server">
			    <div class="uppernav" runat="server">
					<ul>
						<li><a href="#ScreenShots">Screen Shots</a></li>
						<li><a href="#Videos">Videos</a></li>
						<li><a href="#">Game Reviews</a></li>
					</ul>
				</div>
			</div>
            
                <div class="inner" runat="server">
                   	<div class="upper" runat="server">
					</div>
					<div class="middle" runat="server">
					    <div class = "GameInformation" runat="server">
					         <fieldset id="fieldGameInformation" runat="server">
                                <div>
                                    
                                    <label runat="server">Game Name :  </label>
                                    <label id="lblGameName" runat="server"></label>
                                </div>
                                <br />
                                <div>
                                 
                                    <label runat="server">Age Limit:  </label>
                                    <label id="LblAgeLimit" runat="server"></label>
                                </div>
                                <br />
                                <div>
                                   
                                    <label runat="server">Development Team :  </label>
                                    <label id="LblDevTeam" runat="server"></label>
                                </div>
                                <br />
                                <div>
                                    
                                    <label runat="server">Rating:  </label>
                                    <label id="LblRating" runat="server"></label>
                                </div>
                                <br />
                                <div>
                                    
                                    <label runat="server"> Type :  </label>
                                    <label id="LblType" runat="server"></label>
                                </div>
                                <br />
                               
					            <div class = "RatingsDiv" runat="server"> 
						            <p runat="server"> Please Rate This Game On The Scale from 1-5 for the following criteria: </p>
						            <label runat="server">Graphics</label> 
						            <input  id="txtGraphics" runat="server" class = "RatingsText" type = "number"/>
						            <br/>
						            <label runat="server">Interactivity</label> 
						            <input  id="txtInteractivity" runat="server" class = "RatingsText" type = "number"/>
						            <br/>
						            <label  runat="server"  >Uniquness</label>
						            <input   id="txtUniquness" runat="server" class = "RatingsText" type = "number"/>
						            <br/>
						            <label runat="server">Level Design</label>
						            <input   id="txtLevelDesign" runat="server" class = "RatingsText" type = "number"/>

						            <br/>
                                    <asp:Button runat="server" ID  ="btnRating" text="submit" value="submit" OnClick="Ratings" />
							
				                </div>

                         </fieldset>
			</div>
                        
		</div>
                    
		<div class="belowmiddle" runat="server">
			<p id= "ScreenShots" runat="server"> Game Play Screen Shots </p>
			<img id="Screenshot1" runat="server" src = "ImageIcons/blackops2.jpg" width = "400" height = "300"/>
			<img id="Screenshot2" runat="server" src = "ImageIcons/blackops3.jpg" width = "400" height = "300"/>
			<p id = "Videos" runat="server">Game Play Videos </p> 
			<a href = "http:www.youtube.com" target = "_blank"> Youtube Videos </a>
			<br/>
			<label runat="server"> Recommend this game to user: </label>
			<input id="lblRecommmendUser" class = "RecommendToUser" type = "text" />
		
		</div>
                </div>
            </div>     
       
                
                <div id="rightreg" runat="server">
                </div>
           


       
	
		<script src= "jquery-1.11.3.min.js"> </script>
		<script src= "GamePage.js"> </script>
   
    </form>
</body>
</html>
