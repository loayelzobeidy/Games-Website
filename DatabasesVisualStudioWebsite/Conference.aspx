<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Conference.aspx.cs" Inherits="Conference" %>

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
            <div class="uppernav" runat="server">
					
						<asp:Button type="button" runat="server" id="btnAttendConference" text="Attend Conference" OnClick="btnAttendConference_Click"/>
						<asp:Button type="button" runat="server" id="btnDevelopmentTeam_add_game" text="add Game" OnClick="btnDevelopment_team_add_game_clik" />
						<asp:Button type="button" runat="server" id="btnAddReview" text="add Review" OnClick="btnAddReview_Click" />
                        <asp:Button type="button" runat="server" id="btn_Navigate_Review" text="Go" OnClick="Review_Click" />
						
			
				</div>
			
            
                <div class="inner">
                    <div class="jumbotron">
                        <label>Conference Name</label>
                        <label id="lblConferenceName" runat="server"></label>
                        <br/>
                        <label>Date</label>
                         <label id="lblDate" runat="server"></label>
                        <br/>
                        <label >Location</label>
                         <label id="lblLocation" runat="server"></label>
                    </div>

        <asp:GridView runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" ID="ReviewGridView"  >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />            
        </asp:GridView>
    
                    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="White" />
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />

                    </asp:GridView>
                    </div>

               
    
       </div>
          <div runat="server"  id="Add_review_Conference" visible="false">
                        <label id="Review">Review content</label>
                        <input class="txtCommunity" type ="text" runat="server" id="txtReviewContent" />
                       <asp:Button type="button" runat="server" Text="Submit" ID="btnReview" OnClick="btnReview_Click"/>
                     
                        <br />
                        
                    </div>  
        
 
    </form>
</body>
</html>
