<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyBlogMaster.master" AutoEventWireup="true" CodeFile="ViewPost.aspx.cs" Inherits="ViewPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="Server">
    <div class="BlogPostHolder">
        <asp:Label ID="PostTitle" runat="server"></asp:Label>
        <p>
            <span class="BlogPosterSideID">
                <asp:HyperLink ID="OwnerURLImage" runat="server">
                    <asp:Image ID="OwnerImage" CssClass="BlogPosterSideImage" runat="server" />
                </asp:HyperLink>
                <br />
                <asp:HyperLink ID="OwnerURL" runat="server">
                    <asp:Label ID="OwnerName" runat="server"></asp:Label>
                </asp:HyperLink>
                <br />
                <asp:Label ID="CreatedDateTime" runat="server"></asp:Label>
                <br />
            </span>
            <br />
            <asp:Label ID="BodyText" runat="server"></asp:Label>
        </p>
        <span class="BlogPostControls">
            <asp:HyperLink ID="EditLink" runat="server">Edit</asp:HyperLink>
        </span>
    </div>
</asp:Content>

