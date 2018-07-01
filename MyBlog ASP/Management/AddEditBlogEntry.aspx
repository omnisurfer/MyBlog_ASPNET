<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyBlogMaster.master" AutoEventWireup="true" CodeFile="AddEditBlogEntry.aspx.cs" Inherits="Management_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">  
     
    <style type="text/css">
        .BodyTextBox {
            width: 320px;
            height: 100px;
        }

        .SingleLineTextBox {
            width: 320px;
        }

        .auto-style1 {
            width: 508px;
        }

    </style>
     
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">    
    <!--Look at ASP Examples, AddEditReviewHandCoded.aspx-->

    <table class="blogEntryForm">
        <tr>
            <td>Title</td>
            <td class="auto-style1">
                <asp:TextBox ID="titleTextBox" runat="server" CssClass="SingleLineTextBox"></asp:TextBox>                
                <asp:RequiredFieldValidator ID="titleRFV" runat="server" ControlToValidate="titleTextBox" CssClass="ErrorMessage" ErrorMessage="Enter a Title">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="">Summary</td>
            <td class="auto-style1">
                <asp:TextBox ID="summaryTextBox" runat="server" CssClass="SingleLineTextBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="summaryRFV" runat="server" ControlToValidate="summaryTextBox" CssClass="ErrorMessage" ErrorMessage="Enter a Summary">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="">Body</td>
            <td class="auto-style1">
                <asp:TextBox ID="bodyTextBox" runat="server" TextMode="MultiLine" CssClass="BodyTextBox" Height="200px" Width="325px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="bodyRFV" runat="server" ControlToValidate="bodyTextBox" CssClass="ErrorMessage" ErrorMessage="Blog entry cannot be blank!">*</asp:RequiredFieldValidator>
            </td>                
        </tr>
        <tr>
            <td class="">Contributor</td>
            <td class="auto-style1">
                <asp:DropDownList ID="contributorDropDownList" DataSourceID="EntityDataSource" DataTextField="OwnerName" DataValueField="ID" runat="server">
                </asp:DropDownList>

                <asp:EntityDataSource ID="EntityDataSource" runat="server" ConnectionString="name=dbMyBlogEntities" DefaultContainerName="dbMyBlogEntities" EnableFlattening="False" EntitySetName="BlogContributors">
                </asp:EntityDataSource>

            </td>
        </tr>
        <tr>
            <td class="">Flags</td>
            <td class="auto-style1">
                <asp:CheckBox ID="publishEnableCheckBox" text="Publish" runat="server" /> &nbsp;&nbsp; <asp:CheckBox ID="commentsEnableCheckBox" Text="Comments Enable" runat="server" />                
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style1">
                <asp:Button ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click" />
            </td>
        </tr>
    </table>

    </asp:Content>

