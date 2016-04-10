<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CommintyNew.aspx.cs" Inherits="CommintyNew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="Community.css"/>
</head>
<body>
    <form id="form1" runat="server">
   
   
	
	<input class= "btnlogin" type = "submit" value="" />
        <div id="content" class="main">
		
            <div id="MainNav">
                <ul>
                    <li><a href="profile.aspx">Profile</a></li>
                    <li><a href="About.aspx">Games</a></li>
                    <li><a href="ContactUS.aspx">Conferences</a></li>
					<li><a href="ContactUS.aspx">Communites</a></li>
					<li><a href="Gallery.html">Gallery</a></li>
					 <li><a href="ContactUS.aspx">Contact Us</a></li>
                </ul>
				
            </div>
			
            
                <div class="inner"> 
                     <div id="uppernav">       
                        <asp:Button runat="server" id="btn_Join" type="button" text="Join community" Onclick="btn_Join_Click"/>
                          <asp:Button runat="server" id="btn_Create_Community" type="button" text="Create Community" Onclick="btn_Create_Community_Click"/>	
 		                	
 		                <input runat="server"  id="btn_Topic" type="button" value="Add Topic"/>    
                     </div>            
                     <div id="CommunityDiv" runat="server"> 
                        <h1 id="comm" runat="server"></h1>
 		                <label id="description" runat="server"></label>
                     </div>

                    <div id="TopicsDiv">


                        <asp:GridView ID="GridView1" runat="server">
                        </asp:GridView>
						
						
                    </div>

                    <div runat="server"  id="CreateCommunityDiv" visible="false">
                        <label id="CommunityName">Community Name</label>
                        <input class="txtCommunity" type ="text" runat="server" id="txtCommunityName" />
                        <br />
                        <label id="CommunityDescription">Community Description</label>
                        <input class="txtCommunity" type="text" runat="server" id="txtCommunityDescription" />
                        <br />
                        <label id="CommunityTheme">Community Theme</label>
                        <input class="txtCommunity" type="text" runat="server" id="txtCommunityTheme" />
                        <br />
                        <asp:Button type="bu" runat="server" Text="Request!" ID="btnRequest" OnClick="btnRequest_Click"/>
                        <br />
                    <label id="lblResponse" runat="server"></label>

                    </div>
                    <br />
                </div>

             </div>

               
         <script src= "jquery-1.11.3.min.js"> </script>
		<script src= "MainDesign.js"> </script>
	
    </form>
</body>
</html>
