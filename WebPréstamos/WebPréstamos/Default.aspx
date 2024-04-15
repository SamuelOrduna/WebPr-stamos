<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebPréstamos.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Página de ingreso</title>
    <style type="text/css">
        .auto-style1 {
            height: 597px;
        }
        .auto-style2 {
            height: 583px;
        }
        .auto-style3 {
            width: 342px;
            height: 147px;
            position: absolute;
            top: 111px;
            left: 301px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style1" style="background-color: #FF9933">
        <div class="auto-style2" style="background-color: #FFCC00">
            <asp:Login ID="Login1" runat="server" CssClass="auto-style3" OnAuthenticate="Login1_Authenticate">
            </asp:Login>
        </div>
    </form>
</body>
</html>
