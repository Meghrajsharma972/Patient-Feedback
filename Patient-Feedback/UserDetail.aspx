<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserDetail.aspx.cs" Inherits="Patient_Feedback.UserDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .excelbtn {
            background-color: white;
            color: black;
            border: 2px solid #ff0000;
        }

        .calender {
            margin-left: -60%;
            padding-top: 800px;
            float: left;
        }

        .txt-collection {
            float: right;
            text-align: center;
            font-size: xx-large;
            padding: 10px;
            margin-right: -25%;
            margin-top: 60px;
            background-color: purple;
            border-radius: 10px;
            border: 2px solid #8a2be2;
            width: 220px;
            box-sizing: border-box;
        }

             .auto-style3 {
                   width: 120%; 
                   overflow-x: auto;  
                   margin-right:50px;
              }

        /* Responsive table styles */
        @media (max-width: 768px) {
            .auto-style3 {
                font-size: 0.9em; /* Reduce font size on smaller screens */
            }

            .btn-group {
                display: block; /* Stack buttons vertically on smaller screens */
                margin-bottom: 10px;
            }

            .btn-group .btn {
                width: 100%; /* Make buttons full-width */
            }
        }
    </style>

    <div>
        <table align="center" class="nav-justified" style="width: 100%;">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" class="text-center">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowCommand="GridView1_RowCommand"
                        OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing"
                        OnRowUpdating="GridView1_RowUpdating" ShowFooter="True" BackColor="White"
                        BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                        GridLines="Vertical" CssClass="auto-style3" style="width: 120%;">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:TemplateField HeaderText="UserID">
                                <ItemTemplate>
                                    <asp:Label ID="lblDisplayUserID" runat="server" Text='<%# Eval("UserID") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lblEditUserID" runat="server" Text='<%# Bind("UserID") %>'></asp:Label>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblFooterUserID" runat="server" Text="Add UserID Here"></asp:Label>
                                </FooterTemplate>
                                <HeaderTemplate>
                                    User
                                </HeaderTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteditname" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtaddname" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <HeaderTemplate>
                                    Name
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Username">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteditusername" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtaddusername" runat="server" required="required"></asp:TextBox>
                                </FooterTemplate>
                                <HeaderTemplate>
                                    User Name
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Password">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteditpassword" runat="server" TextMode="Password"></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtaddpassword" runat="server" TextMode="Password" required="required" ></asp:TextBox>
                                </FooterTemplate>
                                <HeaderTemplate>
                                    Password
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Role">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteditrole" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtaddrole" runat="server" required="required" ></asp:TextBox>
                                </FooterTemplate>
                                <HeaderTemplate>
                                    Role
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("role") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="User Email">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txteditemail" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtaddemail" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <HeaderTemplate>
                                    Email ID
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("useremail") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Created By">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("CreatedBy") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Last Change">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("modifiedon") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <div class="btn-group" role="group">
                                        <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-warning" />
                                        <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class="btn-group" role="group">
                                        <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-success" />
                                        <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                                    </div>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <div class="btn-group" role="group">
                                        <asp:Button ID="btnAdd" runat="server" CommandName="Add" Text="Add" CssClass="btn btn-primary" />
                                    </div>
                                </FooterTemplate>
                                <HeaderTemplate>
                                    Action
                                </HeaderTemplate>
                            </asp:TemplateField>
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
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
