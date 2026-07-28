<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventList.aspx.cs" Inherits="EventManagementSystem.EventList" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Campus Events</title>
    <style>
        .error { color: red; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Campus Events</h2>

        <!-- Category Dropdown -->
        Category:
        <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true" />
        
        &nbsp;&nbsp;

        <!-- Search Textbox with Validation -->
        <asp:TextBox ID="txtSearch" runat="server" Placeholder="Search Event Name" />
        <asp:RegularExpressionValidator ID="revSearch" runat="server"
            ControlToValidate="txtSearch"
            ValidationExpression="^[a-zA-Z0-9\s]*$"
            ErrorMessage="Only alphanumeric characters allowed in search!"
            ForeColor="Red" Display="Dynamic" />
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />

        <hr />

        <!-- GridView -->
        <asp:GridView ID="gvEvents" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="EventID" HeaderText="ID" />
                <asp:BoundField DataField="EventName" HeaderText="Event Name" />
                <asp:BoundField DataField="CategoryName" HeaderText="Category" />
                <asp:BoundField DataField="EventDate" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
                <asp:BoundField DataField="Location" HeaderText="Location" />
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:HyperLink ID="lnkReg" runat="server"
                            NavigateUrl='<%# Eval("EventID", "RegisterEvent.aspx?EventID={0}") %>'
                            Text="Register" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </form>
</body>
</html>
