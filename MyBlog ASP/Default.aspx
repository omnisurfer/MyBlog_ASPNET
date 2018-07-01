<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyBlogMaster.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" mode="Conditional" runat="server">
        <ContentTemplate>
            <asp:Repeater ID="BlogPosts" runat="server">
                <ItemTemplate>
                    <div class="BlogPostHolder">
                        <a href="ViewPost.aspx?ID=<%# Eval("ID") %>"><%# Eval("Title") %></a>
                        <p>
                            <span class="BlogPosterSideID">
                                <a href="<%#Eval("OwnerURL") %>">
                                    <img src="<%#Eval("OwnerImageURL") %>" class="BlogPosterSideImage" /></a>
                                <br />
                                <a href="<%#Eval("OwnerURL") %>"><%#Eval("OwnerName") %></a>
                                <br />
                                <%#Eval("CreatedDateTime") %>
                                <br />
                            </span>

                            <%# Eval("Summary") %>
                            <br />
                            <%# Eval("BodyText") %>
                        </p>
                        <span class="BlogPostControls">
                            <a id="ViewPostLink" href="ViewPost.aspx?ID=<%# Eval("ID") %>">View</a>  <a id="EditPostLink" href="Management/AddEditBlogEntry.aspx?ID=<%# Eval("ID") %>">Edit</a>
                        </span>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <!--Place navigation controls in here -->            
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
