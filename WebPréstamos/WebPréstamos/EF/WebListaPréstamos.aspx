<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebListaPréstamos.aspx.cs" Inherits="WebPréstamos.EF.WebListaPréstamos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Lista de préstamos</title>
    <style type="text/css">
        .auto-style1 {
            height: 596px;
        }
        .auto-style2 {
            height: 577px;
        }
        .auto-style3 {
            position: absolute;
            top: 521px;
            left: 35px;
            z-index: 1;
        }
        .auto-style4 {
            position: absolute;
            top: 49px;
            left: 343px;
            z-index: 1;
        }
        .auto-style5 {
            width: 345px;
            height: 51px;
            position: absolute;
            top: 88px;
            left: 304px;
            z-index: 1;
        }
        .auto-style6 {
            position: absolute;
            top: 176px;
            left: 476px;
            z-index: 1;
        }
        .auto-style7 {
            position: absolute;
            top: 175px;
            left: 354px;
            z-index: 1;
        }
        .auto-style8 {
            width: 406px;
            height: 54px;
            position: absolute;
            top: 234px;
            left: 268px;
            z-index: 1;
            bottom: 346px;
        }
        .auto-style9 {
            width: 95%;
            height: 28px;
            position: absolute;
            top: 319px;
            left: 27px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style1" style="background-color: #FFCC66">
        <div class="auto-style2" style="background-color: #FF9966">
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="auto-style3" NavigateUrl="~/Default.aspx">Página de inicio</asp:HyperLink>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style4" Text="Lista de préstamos del cliente"></asp:Label>
            <asp:Table ID="TblCliente" runat="server" BorderStyle="Groove" CssClass="auto-style5" GridLines="Both">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">RFC</asp:TableCell>
                    <asp:TableCell runat="server">Nombre</asp:TableCell>
                    <asp:TableCell runat="server">Domicilio</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server"></asp:TableCell>
                    <asp:TableCell runat="server"></asp:TableCell>
                    <asp:TableCell runat="server"></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Table ID="TblPréstamo" runat="server" CssClass="auto-style8">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Folio</asp:TableCell>
                    <asp:TableCell runat="server">Monto</asp:TableCell>
                    <asp:TableCell runat="server">Mensualidad</asp:TableCell>
                    <asp:TableCell runat="server">Saldo</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server"></asp:TableCell>
                    <asp:TableCell runat="server"></asp:TableCell>
                    <asp:TableCell runat="server"></asp:TableCell>
                    <asp:TableCell runat="server"></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:DropDownList ID="DdlPréstamos" runat="server" AutoPostBack="True" CssClass="auto-style6" OnSelectedIndexChanged="DdlPréstamos_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:Label ID="Label2" runat="server" CssClass="auto-style7" Text="Préstamos:"></asp:Label>
            <table class="auto-style9">
                <caption>
                    Datos de pagos, avales y folio con pagos</caption>
                <tr>
                    <td>
                        <asp:GridView ID="GrdPagos" runat="server" EmptyDataText="El préstamo no tiene pagos.">
                        </asp:GridView>
                    </td>
                    <td>
                        <asp:GridView ID="GrdAvales" runat="server" EmptyDataText="El préstamo no tiene avales.">
                        </asp:GridView>
                    </td>
                    <td>
                        <asp:GridView ID="GrdPréstPagos" runat="server">
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
