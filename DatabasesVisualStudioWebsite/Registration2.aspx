

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link href="Registration.css" rel="stylesheet" />
     <script src= "jquery-1.11.3.min.js"> </script>
    <script src="Registration.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        
        <header id="header" runat="server"></header>
        <div id="logindiv" runat="server">
            <li><asp:Label id="lblLoginEmail" class="loginDivElements" runat="server" >Email</asp:Label></li>
                    <li><asp:TextBox id="txtLoginEmail" class="loginDivElements" runat="server"></asp:TextBox></li>
                       <li><asp:Label id="LblLoginPassword" class="loginDivElements" runat="server" >Password</asp:Label></li>
                    <li><asp:TextBox id="txtLoginPassword" class="loginDivElements" runat="server"></asp:TextBox></li>
                     <li id="btnlogin">
                        <asp:ImageButton id="ImageButton1" class="loginDivElements" runat="server" ImageUrl="../Images/loginLogo.jpg"></asp:ImageButton>
                    </li>
					
        </div>
        <div id="content" runat="server" class="main">
            <nav runat="server" id="MainNav">
               <input type="button" id="LoginButton"  class="loginDivElements" />
                   
                <ul>
                    <li><a href="WebFormRegistration.aspx">REGISTRATION</a></li>
                    <li><a href="About.aspx">ABOUT</a></li>
                    <li><a href="ContactUS.aspx">CONTACT US</a> </li>    
                </ul>

            </nav>
            <div runat="server" id="imagebox">
                <div runat="server" class="inner">
                   <img src="../GamesImages/1.jpg" width = "960" height = "250"/>
                </div>
            </div>

            <div runat="server" id="registration">

              
                <div runat="server" id="leftreg">
                  
                    <h2 id = "status_add"><strong>1-ADD YOUR DETAILS</strong></h2>
                    <fieldset runat="server" class="fieldset">
                        <div runat="server" class="field">

                           <label  runat="server" class="lbl" for="email"><img src="../icons/users81.png" width="10" /> Email</label>
                            <input runat="server" type="text" runat="server" id="txtemail" name="txt1" width="225" height="31" class="Textbox"/>
                     
                              </div>
                        <div runat="server" class="field">
                            &nbsp;<label  runat="server" class="lbl" for="ConfirmEmail"><img src="../icons/users81.png" width="10" />Confirm Email</label>
                            <input type="text" runat="server" id="txt5" name="txt1" width="225" height="31" class="Textbox"/>
                        </div>
                        <div runat="server" class="field">
                            &nbsp;<label runat="server" class="lbl" value="Password"><img src="../icons/key63.png" width="10" />Password</label>
                            <input type="text" runat="server" id="txtpassword" name="txt1" width="225" height="31" class="Textbox"/>
                        </div>
                        <div class="field" runat="server">
                            &nbsp;<label class="lbl" runat="server" value="ConfirmPassword"><img src="../icons/key63.png" width="10" />Confirm Password</label>
                            <input type="text" runat="server" id="txt7" name="txt1" width="225" height="31" class="Textbox"/>
                        </div>

                         <div class="field" runat="server">
                         <label  runat="server" class="lbl" for="gamegenre"><img src="../icons/key63.png" width="10" />Prefered Game Genre</label>
						      
							   <div runat="server" id="RadioButtonList1">
                                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" >
                                 <asp:ListItem value="RPGS"  >RPGS</asp:ListItem>
                                  <asp:ListItem value="Sports">Sports</asp:ListItem>
                                  <asp:ListItem value="Strategies">Strategies</asp:ListItem>
                                  <asp:ListItem value="Action">Action</asp:ListItem>
                                 
                             </asp:RadioButtonList>
                         
								
							
							 
							 </div>
							 
                        </div>
                        <br >
                        <br >
                        <div runat="server" class="field">
                            <label runat="server" class="lbl" for="gamegenre"><img src="../icons/key63.png" width="10" />Prefered Game Genre</label>
                            
                            <img src="../icons/users81.png" width="10" />
                            <input runat="server" class="NormalUser" name="user" type="radio" onclick="open1()" />
                            <label runat="server" class="NormalUserLabel"><strong>Normal User</strong> </label>
                            <br />
                            <img src="../icons/magnifying-glass11.png" width="10" />
                            <input runat="server" class="VerifiedReviewer" name="user" type="radio" onclick="open2()" />
                            <label runat="server" class="VerifiedReviewerLabel"><strong>Verified Reviewer</strong>  </label>
                            <br />
                            <img src="../icons/business53.png" width="10" />
                            <input runat="server" class="DevelopmentTeam" name="user" type="radio" onclick="open3()" />
                            <label runat="server" class="DevelopmentTeamLabel"><strong>Development Team</strong> </label>
                        </div>
                    </fieldset>
                    <div runat="server" id="SecondryData" style="visibility: hidden;">
                        <h2><strong id="status">2-Normal User Data</strong></h2>
                        <fieldset class="fieldset">
                            <div class="field">
                                <label class="lbl">
                                    <img src="../icons/label37.png" width="10" id="img1" /><label for="txt1" id="lbl1">First Name</label></label>
                                <input type="text" runat="server" id="txt1" name="txt1" width="225" height="31" class="Textbox"/>
                            </div>
                            <div runat="server" class="field">
                                <label runat="server" class="lbl">
                                    <img src="../icons/label37.png" width="10" id="img2" /><label for="txt2" id="lbl2">Last Name</label></label>
                                <input type="text" runat="server" id="txt2" name="txt2" width="225" height="31" class="Textbox" />
                            </div>
                            <div class="field">
                                <label class="lbl">
                                    <img src="../icons/birthday10.png" width="10" id="img3" /><label for="date" id="lbl3"1>Date Of Birth</label>
                                <input type="text" runat="server" id="txt3" name="txt3" width="225" height="31" class="Textbox"/>

                            </div>

                            <div class="field">
                            
                            </div>

                        </fieldset>
                    </div>
                </div>
                <div id="rightreg">
                </div>
            </div>


        </div>
    </form>
  
</body>
</html>
