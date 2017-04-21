<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
    <table>
        <tr>
            <td>Username</td>
            <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            <td><asp:Label ID="Label1" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input id="Password1" type="password" runat="server"/></td>
            <td><asp:Label ID="Label2" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>Confirm password</td>
            <td><input id="Password2" type="password" runat="server"/></td>
            <td><asp:Label ID="Label3" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" /></td>
            <td><asp:Label ID="Label4" runat="server"></asp:Label></td>
        </tr>
    </table>
    </div>
        <div>
       <table>
            <tr>
              <td>Username</td>
              <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
              <td><asp:Label ID="Label5" runat="server"></asp:Label></td>
            </tr>
            <tr>
              <td>Password</td>
              <td><input id="Password3" type="password" runat="server"/></td>
              <td><asp:Label ID="Label6" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Button ID="Button2" runat="server" Text="Login" OnClick="Button2_Click" /></td>
                <td><asp:Label ID="Label7" runat="server"></asp:Label></td>
            </tr>
         </table>
        </div>
        <div>
            <asp:Button ID="ButtonJatekos" runat="server" Text="Jatekos" OnClick="ButtonJatekos_Click" />
            <asp:Button ID="ButtonKarakter" runat="server" Text="Karakter" OnClick="ButtonKarakter_Click" />
            <asp:Button ID="ButtonItem" runat="server" Text="Item" OnClick="ButtonItem_Click" />
            <asp:Button ID="ButtonHos" runat="server" Text="Hos" OnClick="ButtonHos_Click" />
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RPGgameConnectionString %>" DeleteCommand="DELETE FROM [Jatekos] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Jatekos] ([Username], [Password], [Aktiv], [Regisztracio], [Utolsobejelentkezes]) VALUES (@Username, @Password, @Aktiv, @Regisztracio, @Utolsobejelentkezes)" SelectCommand="SELECT * FROM [Jatekos]" UpdateCommand="UPDATE [Jatekos] SET [Username] = @Username, [Password] = @Password, [Aktiv] = @Aktiv, [Regisztracio] = @Regisztracio, [Utolsobejelentkezes] = @Utolsobejelentkezes WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Aktiv" Type="Boolean" />
                <asp:Parameter Name="Regisztracio" Type="DateTime" />
                <asp:Parameter Name="Utolsobejelentkezes" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Aktiv" Type="Boolean" />
                <asp:Parameter Name="Regisztracio" Type="DateTime" />
                <asp:Parameter Name="Utolsobejelentkezes" Type="DateTime" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="KarakterId" DataSourceID="SqlDataSource2" OnRowDeleting="GridView2_RowDeleting" OnRowEditing="GridView2_RowEditing">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="KarakterId" HeaderText="KarakterId" InsertVisible="False" ReadOnly="True" SortExpression="KarakterId" />
                <asp:BoundField DataField="Tipus" HeaderText="Tipus" SortExpression="Tipus" />
                <asp:BoundField DataField="Leiras" HeaderText="Leiras" SortExpression="Leiras" />
                <asp:BoundField DataField="AlapHP" HeaderText="AlapHP" SortExpression="AlapHP" />
                <asp:BoundField DataField="AlapPancel" HeaderText="AlapPancel" SortExpression="AlapPancel" />
                <asp:BoundField DataField="AlapSebzes" HeaderText="AlapSebzes" SortExpression="AlapSebzes" />
                <asp:BoundField DataField="AlapMagia" HeaderText="AlapMagia" SortExpression="AlapMagia" />
                <asp:BoundField DataField="url" HeaderText="url" SortExpression="url" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RPGgameConnectionString3 %>" DeleteCommand="DELETE FROM [Karakterek] WHERE [KarakterId] = @KarakterId" InsertCommand="INSERT INTO [Karakterek] ([Tipus], [Leiras], [AlapHP], [AlapPancel], [AlapSebzes], [AlapMagia], [url]) VALUES (@Tipus, @Leiras, @AlapHP, @AlapPancel, @AlapSebzes, @AlapMagia, @url)" SelectCommand="SELECT * FROM [Karakterek]" UpdateCommand="UPDATE [Karakterek] SET [Tipus] = @Tipus, [Leiras] = @Leiras, [AlapHP] = @AlapHP, [AlapPancel] = @AlapPancel, [AlapSebzes] = @AlapSebzes, [AlapMagia] = @AlapMagia, [url] = @url WHERE [KarakterId] = @KarakterId">
            <DeleteParameters>
                <asp:Parameter Name="KarakterId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Tipus" Type="String" />
                <asp:Parameter Name="Leiras" Type="String" />
                <asp:Parameter Name="AlapHP" Type="Int32" />
                <asp:Parameter Name="AlapPancel" Type="Int32" />
                <asp:Parameter Name="AlapSebzes" Type="Int32" />
                <asp:Parameter Name="AlapMagia" Type="Int32" />
                <asp:Parameter Name="url" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Tipus" Type="String" />
                <asp:Parameter Name="Leiras" Type="String" />
                <asp:Parameter Name="AlapHP" Type="Int32" />
                <asp:Parameter Name="AlapPancel" Type="Int32" />
                <asp:Parameter Name="AlapSebzes" Type="Int32" />
                <asp:Parameter Name="AlapMagia" Type="Int32" />
                <asp:Parameter Name="url" Type="String" />
                <asp:Parameter Name="KarakterId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView3" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource3">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Nev" HeaderText="Nev" SortExpression="Nev" />
                <asp:BoundField DataField="kep" HeaderText="kep" SortExpression="kep" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RPGgameConnectionString4 %>" DeleteCommand="DELETE FROM [Item] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Item] ([Nev], [kep]) VALUES (@Nev, @kep)" SelectCommand="SELECT * FROM [Item]" UpdateCommand="UPDATE [Item] SET [Nev] = @Nev, [kep] = @kep WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Nev" Type="String" />
                <asp:Parameter Name="kep" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nev" Type="String" />
                <asp:Parameter Name="kep" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView4" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource4">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Tulajdonos" HeaderText="Tulajdonos" SortExpression="Tulajdonos" />
                <asp:BoundField DataField="Karakter" HeaderText="Karakter" SortExpression="Karakter" />
                <asp:BoundField DataField="Nev" HeaderText="Nev" SortExpression="Nev" />
                <asp:BoundField DataField="Szint" HeaderText="Szint" SortExpression="Szint" />
                <asp:BoundField DataField="HP" HeaderText="HP" SortExpression="HP" />
                <asp:BoundField DataField="Pancel" HeaderText="Pancel" SortExpression="Pancel" />
                <asp:BoundField DataField="Sebzes" HeaderText="Sebzes" SortExpression="Sebzes" />
                <asp:BoundField DataField="Magia" HeaderText="Magia" SortExpression="Magia" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:RPGgameConnectionString5 %>" DeleteCommand="DELETE FROM [Hos] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Hos] ([Tulajdonos], [Karakter], [Nev], [Szint], [HP], [Pancel], [Sebzes], [Magia]) VALUES (@Tulajdonos, @Karakter, @Nev, @Szint, @HP, @Pancel, @Sebzes, @Magia)" SelectCommand="SELECT * FROM [Hos]" UpdateCommand="UPDATE [Hos] SET [Tulajdonos] = @Tulajdonos, [Karakter] = @Karakter, [Nev] = @Nev, [Szint] = @Szint, [HP] = @HP, [Pancel] = @Pancel, [Sebzes] = @Sebzes, [Magia] = @Magia WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Tulajdonos" Type="Int32" />
                <asp:Parameter Name="Karakter" Type="Int32" />
                <asp:Parameter Name="Nev" Type="String" />
                <asp:Parameter Name="Szint" Type="Int32" />
                <asp:Parameter Name="HP" Type="Int32" />
                <asp:Parameter Name="Pancel" Type="Int32" />
                <asp:Parameter Name="Sebzes" Type="Int32" />
                <asp:Parameter Name="Magia" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Tulajdonos" Type="Int32" />
                <asp:Parameter Name="Karakter" Type="Int32" />
                <asp:Parameter Name="Nev" Type="String" />
                <asp:Parameter Name="Szint" Type="Int32" />
                <asp:Parameter Name="HP" Type="Int32" />
                <asp:Parameter Name="Pancel" Type="Int32" />
                <asp:Parameter Name="Sebzes" Type="Int32" />
                <asp:Parameter Name="Magia" Type="Int32" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
