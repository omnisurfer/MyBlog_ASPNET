<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MarkupSnippets.aspx.cs" Inherits="Snippets_MarkupSnippits" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">    
    <!--This will be populated dynamically by the code behind-->
            <div class="BlogPostHolder">

                <h1><a href="#">BLAH POST 1</a></h1>
                <p>
                    <span class="BlogPosterSideID">
                        <asp:Image ID="Image1" CssClass="BlogPosterSideImage" src="Images/zoidberg.jpg" runat="server" />
                        <br />
                        <a href="#">Daniel</a>
                        <br />
                        August 31st, 2013
                                    <br />
                        2100 MST 
                    </span>
                    <asp:Panel ID="Panel1" runat="server">
                        <asp:Label ID="Label1" runat="server" Text="Label">
                        MAIN CONTENTXXX Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do                                         
                        eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,                     
                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis                     
                        aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla                     
                        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt                     
                        mollit anim id est laborum...   
                        </asp:Label>
                    </asp:Panel>                                        
                </p>
            </div>
            <div class="BlogPostHolder">
                <h1><a href="#">BLAH POST 2</a></h1>
                <p>
                    <span class="BlogPosterSideID">
                        <asp:Image ID="Image2" CssClass="BlogPosterSideImage" src="Images/zoidberg.jpg" runat="server" />
                        <br />
                        <a href="#">Daniel</a>
                        <br />
                        August 30th, 2013
                                    <br />
                        2000 MST </span>MAIN CONTENT Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do                                         
                        eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,                     
                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis                     
                        aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla                     
                        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt                     
                        mollit anim id est laborum...
                </p>
            </div>
            <div class="BlogPostHolder">
                <h1><a href="#">BLAH POST 3</a></h1>
                <p>
                    <span class="BlogPosterSideID">
                        <asp:Image ID="Image3" CssClass="BlogPosterSideImage" src="Images/zoidberg.jpg" runat="server" />
                        <br />
                        <a href="#">Daniel</a>
                        <br />
                        August 29th, 2013
                                    <br />
                        1900 MST </span>MAIN CONTENT Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do                                         
                        eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,                     
                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis                     
                        aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla                     
                        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt                     
                        mollit anim id est laborum...                                     
                </p>
            </div>    
    </form>
</body>
</html>
