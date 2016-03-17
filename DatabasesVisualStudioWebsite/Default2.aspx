
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Registration.css" rel="stylesheet" />
    <script src="Registration.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    


        <header id="header"></header>
        <div id="content" class="main">
            <nav id="MainNav">
                <input type="button" id="LoginButton"  class="loginDivElements" />
                <ul>
                    <li><a href="WebFormRegistration.aspx">REGISTERATION</a></li>
                    <li><a href="About.aspx">ABOUT</a></li>
                    <li><a href="ContactUS.aspx">CONTACT US</a><!--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --> </li>
                   <li><asp:Label ID="lblLoginEmail" runat="server" >Email</asp:Label></li>
                    <li><asp:TextBox ID="txtLoginEmail" runat="server"></asp:TextBox></li>
                       <li><asp:Label ID="LblLoginPassword" runat="server" >Password</asp:Label></li>
                    <li><asp:TextBox ID="txtLoginPassword" runat="server"></asp:TextBox></li>
                     <li id="btnlogin">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Images/loginLogo.jpg"></asp:ImageButton>
                    </li>


                </ul>
            </nav>
            <div id="imagebox">
                <div class="inner">
                    <img src="../Images/Image1.jpg" />
                </div>
            </div>

            <div id="registration">

              
                <div id="leftreg">
                  
                    <h2><strong>1-ADD YOUR DETAILS</strong></h2>
                    <fieldset class="fieldset">
                        <div class="field">

                            &nbsp;<label class="lbl" for="email">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUN"
                        runat="server" ForeColor="Red"
                          text="*"
                        ErrorMessage="Email is Required"
                        ControlToValidate="txtemail" Display="Dynamic"
                        ValidationGroup="Registration"
                     
                        >
                    </asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator 
                            ID="RegularExpressionValidatorEmail" 
                            runat="server"
                            ErrorMessage="Invalid Email Format" 
                            ControlToValidate="txtemail" ForeColor="Red"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                           text="*"  Display="Dynamic"
                            ValidationGroup="Registration">
                        </asp:RegularExpressionValidator>
                                   <asp:CompareValidator ID="CompareValidator2" 
                            runat="server" 
                            ErrorMessage="Email and Confirm Email must match"
                            ControlToValidate="txtemail" 
                            ControlToCompare="txt5" Operator="Equal"
                            Type="String" ForeColor="Red"  
                            ValidationGroup="Registration"
                         Display="Dynamic"
                         Text="*" >
                        </asp:CompareValidator>
                                <img src="../Images/users81.png" width="10"  id="Hatem" runat="server" />&nbsp; Email</label>
                            <asp:TextBox runat="server" ID="txtemail" name="txt1" Width="225px" Height="31px" class="Textbox" TextMode="Email" ></asp:TextBox>
                     
                              </div>


                        <div class="field">
                            &nbsp;<label class="lbl" for="ComfirmEmail">  <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server" ForeColor="Red"
                        ErrorMessage="Comfirm Email is Required"
                        ControlToValidate="txt5" Display="Dynamic"
                        ValidationGroup="Registration"
                        text="*"
                        >
                    </asp:RequiredFieldValidator>
                                  <asp:RegularExpressionValidator 
                            ID="RegularExpressionValidator1" 
                            runat="server"
                            ErrorMessage="Invalid Email Format" 
                            ControlToValidate="txt5" ForeColor="Red"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                           text="*"  Display="Dynamic"
                            ValidationGroup="Registration">
                        </asp:RegularExpressionValidator>
                                   <asp:CompareValidator ID="CompareValidator3" 
                            runat="server" 
                            ErrorMessage="Email and Confirm Email must match"
                            ControlToValidate="txtemail" 
                            ControlToCompare="txt5" Operator="Equal"
                            Type="String" ForeColor="Red"  
                            ValidationGroup="Registration"
                                        Display="Dynamic"
                        
                         Text="*" >
                        </asp:CompareValidator>
                                <img src="../Images/users81.png" width="10" />&nbsp;Comfirm Email</label>
                            <asp:TextBox runat="server" ID="txt5" name="txt1" Width="225px" Height="31px" class="Textbox" TextMode="Email" ></asp:TextBox>
                        </div>



                        <div class="field">
                            &nbsp;<label class="lbl" for="Password">      <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        runat="server" ForeColor="Red"
                        ErrorMessage="Password is Required"
                        ControlToValidate="txtpassword" Display="Dynamic"
                        ValidationGroup="Registration"
                        text="*"
                        >
                                   
                    </asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidatorPassword" 
                            runat="server" 
                            ErrorMessage="Password and Confirm Password must match"
                            ControlToValidate="txt7" 
                            ControlToCompare="txtpassword" Operator="Equal"
                            Type="String" ForeColor="Red" 
                            ValidationGroup="Registration"
                                         Display="Dynamic"
                        text="*"
                        >
                        </asp:CompareValidator>
                                <img src="../Images/key63.png" width="10" />&nbsp;Password</label>
                            <asp:TextBox runat="server" ID="txtpassword" name="txt1" Width="225px" Height="31px" class="Textbox" TextMode="Password" ></asp:TextBox>
                        </div>



                        <div class="field">
                            &nbsp;<label class="lbl" for="ComfirmPassword">   <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                        runat="server" ForeColor="Red"
                        ErrorMessage="Comfirm Password is Required"
                        ControlToValidate="txt7" Display="Dynamic"
                        ValidationGroup="Registration"
                          text="*"
                          >
                                   
                    </asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator4" 
                            runat="server" 
                            ErrorMessage="Password and Confirm Password must match"
                            ControlToValidate="txt7" 
                            ControlToCompare="txtpassword" Operator="Equal"
                            Type="String" ForeColor="Red" 
                            ValidationGroup="Registration"
                                         Display="Dynamic"
                        text="*"
                        >
                        </asp:CompareValidator>
                                <img src="../Images/key63.png" width="10" />&nbsp;Comfirm Password</label>
                            <asp:TextBox runat="server" ID="txt7" name="txt1" Width="225px" Height="31px" class="Textbox" TextMode="Password" ></asp:TextBox>
                        </div>

                         <div class="field">
                            &nbsp;<label class="lbl" for="gamegenre"><img src="../Images/key63.png" width="10" />&nbsp;Prefered Game Genre</label>
                             <asp:RadioButtonList ID="RadioButtonList1" runat="server" >
                                 <asp:ListItem value="RPGS"  >RPGS</asp:ListItem>
                                  <asp:ListItem value="Sports">Sports</asp:ListItem>
                                  <asp:ListItem value="Strategies">Strategies</asp:ListItem>
                                  <asp:ListItem value="Action">Action</asp:ListItem>
                                 
                             </asp:RadioButtonList>
                         
                        </div>
                        <br />
                        <br />
                        
                        <div class="field">
                             &nbsp;<label class="lbl" for="gamegenre"><img src="../Images/key63.png" width="10" />&nbsp;MemberType</label>
                            <asp:RadioButtonList ID="RadioButtonList2" runat="server"  AutoPostBack="true">
                              <asp:ListItem value="Normal User" Selected="True"> Normal User</asp:ListItem>
                           <asp:ListItem value="Verified Reviewer" > Verified Reviewer</asp:ListItem>
                         <asp:ListItem value="Development Team">Development Team</asp:ListItem>
                            </asp:RadioButtonList>
                           
                            
                              </div>
                    </fieldset>
                    <div id="SecondryData" style="visibility: visible;">
                       
                      <h2><strong id="status" >2- <asp:label ID="lblstatus" runat="server" >Normal User</asp:label></strong></h2>
                        <fieldset id="fieldset" class="fieldset" runat="server">
                            <div class="field">
                                <label class="lbl">
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                        runat="server" ForeColor="Red"
                          text="*"
                        ErrorMessage="All Fields are Required"
                        ControlToValidate="txt1" Display="Dynamic"
                        ValidationGroup="Registration"
                     
                        ></asp:RequiredFieldValidator>

                                     <asp:Image runat="server" ImageUrl="../Images/label37.png" width="10" id="img1" />&nbsp;<asp:label runat="server" id="lbl1">First Name</asp:label></label>
                                <asp:TextBox runat="server" ID="txt1" name="txt1" Width="225px" Height="31px" class="Textbox"></asp:TextBox>
                            </div>
                            <div class="field">
                                <label class="lbl">
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                        runat="server" ForeColor="Red"
                          text="*"
                        ErrorMessage="All Fields are Required"
                        ControlToValidate="txt1" Display="Dynamic"
                        ValidationGroup="Registration"
                     
                        ></asp:RequiredFieldValidator>
                                     <asp:Image ImageUrl="../Images/label37.png" width="10" id="img2" runat="server" />&nbsp;<asp:label id="lbl2" runat="server">&nbsp;Last Name</asp:label></label>
                                <asp:TextBox runat="server" ID="txt2" name="txt2" Width="225px" Height="31px" class="Textbox"></asp:TextBox>
                            </div>
                            <div class="field">
                                <label class="lbl">
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                        runat="server" ForeColor="Red"
                          text="*"
                        ErrorMessage="All Fields are Required"
                        ControlToValidate="txt1" Display="Dynamic"
                        ValidationGroup="Registration"
                     
                        ></asp:RequiredFieldValidator>
                                    <asp:Image runat="server" ImageUrl="../Images/birthday10.png" width="10" id="img3" />&nbsp;<asp:label runat="server" id="lbl3">&nbsp;Date Of Birth</asp:label></label>
                                <asp:TextBox runat="server" ID="txt3" name="txt3" Width="225px" Height="31px" class="Textbox" TextMode="Date" ></asp:TextBox>

                            </div>

                            <div class="field">
                                <label class="lbl">&nbsp;</label>

                                

                            </div>

                        </fieldset>
                    </div>
                </div>
                <div id="rightreg">

                    <asp:Label ID="LblRegistrationStatus" runat="server" ></asp:Label>

                    <br />
                    <br />
                  
                    <br />
                    <br />
              
                    <br />
                    <br />

                   

                    <br />
                    <br />

                   
                    
                    <br />
                    <br />
                    
                    <br />
                    <br />
                
                    <br/>
                    <br/>
                       
                  
                    <br />
                    <br />
                 
                    <br />
                    <br />
                    
                              <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            ForeColor="Red" HeaderText="Registration Errors" ShowMessageBox="True" 
                            ShowSummary="true" DisplayMode="List" 
                            ValidationGroup="Registration"/>

                </div>
            </div>


      </div>
  

    </form>
</body>
</html>
