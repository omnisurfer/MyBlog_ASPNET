<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MonthYearSelector.ascx.cs" Inherits="Controls_MonthYearSelector" %>

<script type="text/javascript">
    
    jQuery(window).load(GetYears());

    function GetYears() {
        MonthYearSelectService.GetYears(GetYears_OnSucceeded, GetYears_OnFailed);
    }

    function GetYears_OnSucceeded(result) {
        //this adds the spans if they do not exist already
        for (var i = 0; i < result.length; i++) {

            //look to see if the span already exists, otherwise add it            
            if (!$('#year' + result[i]).length) {
                $('#YearSelectHolder').append("<div id=\"year" + result[i] + "\"></div>");
                $('#year' + result[i]).append("<a href=\"%23\" onclick=\"GetMonths(" + result[i] + ")\; return false\;\" >" + result[i] + "</a>");
            }
        }
    }

    function GetYears_OnFailed() {

    }

    function GetMonths(result) {
        //call the webservice
        MonthYearSelectService.GetMonths(result, GetMonths_OnSucceeded);        
    }

    function GetMonths_OnSucceeded(result) {        

        var year = result[0];

        //check the monthyear span exists, otherwise add it and then add the links
        if (!$('#year' + result[0] + 'months').length) {

            $('#year' + result[0]).append("<div id=\"year" + result[0] + "months\"></div>");

            //get the months and display them. start at i = 1 to skip the year that is retruned at index 0    
            for (var i = 1; i < result.length; i++) {
                
                //$('#year' + result[0] + 'months').append("<a href=\"/MyBlog ASP/Default.aspx?YEAR=" + result[0] + "&MONTH=" + result[i] + "\">" + GetMonthName(result[i]) + "</a><br />");
                $('#year' + result[0] + 'months').append("<a href=\"/Default.aspx?YEAR=" + result[0] + "&MONTH=" + result[i] + "\">" + GetMonthName(result[i]) + "</a><br />");                
            }
        }

    }

    function GetMonthName(result) {      
        var monthName;

        var d = parseInt(result, 10);

        switch (d) {
            case 1:
                monthName = "January";
                break;

            case 2:
                monthName = "February";
                break;

            case 3:
                monthName = "March";
                break;

            case 4:
                monthName = "April";
                break;

            case 5:
                monthName = "May";
                break;

            case 6:
                monthName = "June";
                break;

            case 7:
                monthName = "July";
                break;

            case 8:
                monthName = "August";
                break;

            case 9:
                monthName = "September";
                break;

            case 10:
                monthName = "October";
                break;

            case 11:
                monthName = "November";
                break;

            case 12:
                monthName = "December";
                break;

            default:                
                monthName = "GetMonthNameError";
                break;
        }

        return monthName;
    }

</script>

<asp:ScriptManagerProxy ID="MonthYearSelectorControl" runat="server">
    <Services>
        <asp:ServiceReference Path="~/Services/MonthYearSelectService.asmx" />
    </Services>
</asp:ScriptManagerProxy>

<div id="YearSelectHolder"></div>

