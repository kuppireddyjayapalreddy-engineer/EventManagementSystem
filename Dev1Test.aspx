<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dev1Test.aspx.cs" Inherits="EventManagementSystem.Dev1Test" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Developer 1 Test</title>
    <style>.error{color:red}</style>
</head>
<body>
    <form id="form1" runat="server">

        <h2>Developer 1 Backend Test Page</h2>

        <asp:Label runat="server" Text="Event ID:" />
        <asp:TextBox ID="txtEventID" runat="server" Text="1"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEventID" runat="server" ControlToValidate="txtEventID" ErrorMessage="Event ID required" ForeColor="Red" Display="Dynamic" />
        <asp:RegularExpressionValidator ID="revEventID" runat="server" ControlToValidate="txtEventID" ValidationExpression="^\d+$" ErrorMessage="Only numbers allowed" ForeColor="Red" Display="Dynamic" />
        <br /><br />

        <asp:Label runat="server" Text="Full Name:" />
        <asp:TextBox ID="txtName" runat="server" Text="Test User"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvName1" runat="server" ControlToValidate="txtName" ErrorMessage="Name required" ForeColor="Red" Display="Dynamic" />
        <br /><br />

        <asp:Label runat="server" Text="Email:" />
        <asp:TextBox ID="txtEmail" runat="server" Text="test@mail.com"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEmail1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email required" ForeColor="Red" Display="Dynamic" />
        <asp:RegularExpressionValidator ID="revEmail1" runat="server" ControlToValidate="txtEmail" ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" ErrorMessage="Invalid email format!" ForeColor="Red" Display="Dynamic" />
        <br /><br />

        <asp:Label runat="server" Text="Phone:" />
        <asp:TextBox ID="txtPhone" runat="server" Text="9999999999"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvPhone1" runat="server" ControlToValidate="txtPhone" ErrorMessage="Phone required" ForeColor="Red" Display="Dynamic" />
        <asp:RegularExpressionValidator ID="revPhone1" runat="server" ControlToValidate="txtPhone" ValidationExpression="^\d{10}$" ErrorMessage="10 digits only" ForeColor="Red" Display="Dynamic" />
        <br /><br />

        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
        <br /><br />

        <asp:Label ID="lblOutput" runat="server" ForeColor="Green" />

    </form>
</body>
</html>
