<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyBlogMaster.master" AutoEventWireup="true" CodeFile="ContactMe.aspx.cs" Inherits="About_ContactMe" %>

<%@ Register Src="~/Controls/ContactForm.ascx" TagPrefix="uc1" TagName="ContactForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
        <uc1:ContactForm runat="server" ID="ContactForm" />
</asp:Content>


