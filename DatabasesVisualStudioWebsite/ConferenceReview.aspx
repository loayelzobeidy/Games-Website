<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConferenceReview.aspx.cs" Inherits="ConferenceReview" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="ConferenceReview.css"/>
</head>
<body>
    <form id="form1" runat="server">
   
   
	
	    
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
                        <asp:Button runat="server" id="btn_Comment" type="button" text="Add Comment"  OnClick="btn_Comment_Click"/>
                     </div>
                    
                           
                     <div id="Review">
		
			               <div id = "ConferenceReviewInformation">
		                    <label runat="server"> Conference Name: </label>
                            <label id="lblConferenceName" runat ="server">  </label>
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
				                
			                    <asp:GridView ID="GridView1" runat="server" Width="831px" Height="160px" >
                                </asp:GridView>
                               
				                <label runat="server" id ="lblComment"> </label>
				                <br/>
			                </div>
		                </div>
                      
                </div> 
                
       
                
               
         <script src= "jquery-1.11.3.min.js"> </script>
		<script src= "ConferenceReview.js"> </script>
	
    </form>
</body>
</html>
