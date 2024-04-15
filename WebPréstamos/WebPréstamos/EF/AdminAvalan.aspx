<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminAvalan.aspx.cs" Inherits="WebPréstamos.EF.AdminAvalan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Admón. de avales con préstamos</title>
    <style type="text/css">
        .auto-style1 {
            height: 785px;
        }
        .auto-style2 {
            height: 776px;
        }
        .auto-style3 {
            height: 25px;
            z-index: 1;
            left: 178px;
            top: 20px;
            position: absolute;
            width: 160px;
            right: 932px;
            margin-top: 116px;
        }
        .auto-style4 {
            z-index: 1;
            left: 445px;
            top: 203px;
            position: absolute;
            height: 94px;
            width: 187px;
        }
        .auto-style5 {
            z-index: 1;
            left: 471px;
            top: 136px;
            position: absolute;
            width: 107px;
        }
        .auto-style6 {
            z-index: 1;
            left: 64px;
            top: 446px;
            position: absolute;
        }
        .auto-style7 {
            z-index: 1;
            left: 299px;
            top: 445px;
            position: absolute;
            width: 157px;
        }
        .auto-style8 {
            z-index: 1;
            left: 67px;
            top: 504px;
            position: absolute;
        }
        .auto-style11 {
            position: absolute;
            top: 398px;
            left: 573px;
            z-index: 1;
            width: 112px;
        }
        .auto-style12 {
            position: absolute;
            top: 440px;
            left: 575px;
            z-index: 1;
            width: 106px;
        }
        .auto-style13 {
            width: 187px;
            height: 133px;
            position: absolute;
            top: 495px;
            left: 495px;
            z-index: 1;
        }
        .auto-style14 {
            right: 1083px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style1" style="background-color: #FF9933">
        <div class="auto-style2" style="background-color: #FFCC99">
            <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 369px; top: 71px; position: absolute" Text="Administración de avales y los préstamos que avalan."></asp:Label>
            <asp:DropDownList ID="DdlAvales" runat="server" AutoPostBack="True" Enabled="False" OnSelectedIndexChanged="DdlAvales_SelectedIndexChanged" style="z-index: 1; left: 252px; top: 223px; position: absolute; height: 21px; width: 127px" Visible="False">
            </asp:DropDownList>
            <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 56px; top: 193px; position: absolute; right: 1123px" Text="Préstamos:" Visible="False"></asp:Label>
            <asp:Label ID="Label4" runat="server" style="z-index: 1; left: 256px; top: 195px; position: absolute" Text="Avales:" Visible="False"></asp:Label>
            <asp:TextBox ID="TxtMonto" runat="server" Enabled="False" style="z-index: 1; left: 159px; top: 309px; position: absolute; width: 125px" Visible="False">50000</asp:TextBox>
            <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 161px; top: 284px; position: absolute" Text="Monto:" Visible="False"></asp:Label>
            <asp:DropDownList ID="DdlPréstamos" runat="server" AutoPostBack="True" CssClass="auto-style14" OnSelectedIndexChanged="DdlPréstamos_SelectedIndexChanged" style="z-index: 1; left: 52px; top: 223px; position: absolute; height: 19px; width: 124px;" Visible="False">
            </asp:DropDownList>
            <asp:Button ID="BtnBaja" runat="server" CssClass="auto-style5" OnClick="BtnBaja_Click" Text="Baja" />
            <asp:Button ID="BtnAlta" runat="server" CssClass="auto-style3" OnClick="BtnAlta_Click" Text="Alta" />
            <asp:GridView ID="GrdAvalan" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" Caption="Préstamos y sus avales" CellPadding="2" CssClass="auto-style4" Enabled="False" ForeColor="Black" GridLines="None" OnRowDeleting="GrdAvalan_RowDeleting" OnSelectedIndexChanged="GrdAvalan_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
            </asp:GridView>
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="auto-style8" NavigateUrl="~/Default.aspx">Página inicial</asp:HyperLink>
            <asp:Button ID="BtnEjecutar" runat="server" CssClass="auto-style7" Enabled="False" OnClick="BtnEjecuta_Click" Text="Ejecutar" Visible="False" />
            <asp:Button ID="btnMuestraAval" runat="server" CssClass="auto-style11" OnClick="btnMuestraAval_Click" Text="Muestra aval" />
            <asp:Button ID="btnOcultaAval" runat="server" CssClass="auto-style12" Text="Oculta aval" Visible="False" OnClick="btnOcultaAval_Click" />
            <asp:GridView ID="GrdAvales" runat="server" CssClass="auto-style13" Visible="False">
            </asp:GridView>
            <asp:Label ID="LblMensaje" runat="server" CssClass="auto-style6" Text="Operación: en espera"></asp:Label>
        </div>
    </form>
</body>
</html>
