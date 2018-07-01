<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactForm.ascx.cs" Inherits="Controls_ContactForm" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }

    .auto-style2 {
        width: 324px;
    }

    .auto-style3 {
    }
</style>

<asp:UpdatePanel ID="ContactPanel" runat="server">
    <ContentTemplate>
        <div id="TableWrapper">
            <table class="auto-style1" runat="server" id="FormTable">
                <tr>
                    <td colspan="3">
                        <h1>Daniel's Pretend Blog</h1>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Name</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name" CssClass="ErrorMessage" ErrorMessage="Enter your name">*</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">Email</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="Email" runat="server" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Email" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="E-mail address required.">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Valid e-mail address required." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">Confirm Email</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="ConfirmEmail" runat="server" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ConfirmEmail" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="E-mail confirmation required.">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Email" ControlToValidate="ConfirmEmail" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="E-mail addresses do not match!">*</asp:CompareValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">Comments</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="Comments" runat="server" TextMode="MultiLine" Width="292px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Comments" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Please enter a comment.">*</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3" colspan="3">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="ErrorMessage" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Button ID="Send" runat="server" Text="Send" OnClick="Send_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <asp:Label ID="Message" runat="server" Text="Message Sent" Visible="false" CssClass="Attention" />
        <p runat="server" id="MessageSentPara" visible="false">Thank you for your message!</p>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="ContactPanel" runat="server">
    <ProgressTemplate>
        <div class="PleaseWait">
            Please Wait...            
            <br />
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>

<script type="text/javascript">
    $(function () {
        $('form').bind('submit', function () {
            if (Page_IsValid) {
                $('#TableWrapper').slideUp(6000);
            }
        }
        );
    });

    function pageLoad() {
        $('.Attention').animate({ width: '600px' }, 3000).animate({ width: '100px' }, 3000).fadeOut('slow');
    }

</script>
