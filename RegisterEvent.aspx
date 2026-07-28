<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterEvent.aspx.cs" Inherits="EventManagementSystem.RegisterEvent" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Register for Event</title>
    <style>
        .error { color: red; }
        .success { color: green; font-weight: bold; }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <h2>Register for Event</h2>
        <asp:Label ID="lblEventName" runat="server" Font-Bold="True" />

        <asp:ValidationSummary  
            ID="ValidationSummary1" runat="server" 
            ForeColor="Red" 
            HeaderText="⚠ Please correct the following errors:" 
            DisplayMode="BulletList" />

        <br /><br />
        <!-- NAME -->
        <asp:Label Text="Your Name:" runat="server" />
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator 
            ID="rfvName" runat="server" 
            ControlToValidate="txtName" 
            ErrorMessage="Name is required!" 
            ForeColor="Red" Display="Dynamic" />
        <br /><br />

        <!-- EMAIL -->
        <asp:Label Text="Email:" runat="server" />
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator 
            ID="rfvEmail" runat="server" 
            ControlToValidate="txtEmail" 
            ErrorMessage="Email is required!" ForeColor="Red" Display="Dynamic" />
        <asp:RegularExpressionValidator 
            ID="revEmail" runat="server"
            ControlToValidate="txtEmail"
            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
            ErrorMessage="Invalid email format!" ForeColor="Red" Display="Dynamic" />
        <br /><br />

        <!-- PHONE -->
        <asp:Label Text="Phone:" runat="server" />
        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator 
            ID="rfvPhone" runat="server" 
            ControlToValidate="txtPhone" 
            ErrorMessage="Phone number is required!" 
            ForeColor="Red" Display="Dynamic" />
        <asp:RegularExpressionValidator
            ID="revPhone" runat="server"
            ControlToValidate="txtPhone"
            ValidationExpression="^\d{10}$"
            ErrorMessage="Enter a 10-digit phone number (digits only)!" 
            ForeColor="Red" Display="Dynamic" />
        <br /><br />

        <asp:Button ID="btnSubmit" runat="server" Text="Register Now" OnClick="btnSubmit_Click" />
        <br /><br />

        <asp:Label ID="lblMsg" runat="server" Font-Bold="True" />

    </form>
</body>
</html>
