<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HospitalQR.aspx.cs" Inherits="Patient_Feedback.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <h2>QR Code</h2>
   <h4>To Generate QR Code, Select Your Site ID and Click Generate.</h4>

   <br />
   <table class="nav-justified">
       <tr>
           <td>Select Your Site:</td>
           <td><asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList></td>
           <td><asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Generate QR Code" />
               <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Clear" />
           </td>
       </tr>  
   </table>   
   <br />
  <asp:Image ID="imgQRCode" runat="server" Style="max-width: 100%; height: auto; width: 150px; height: 150px;" Visible="false" />
   <br />    
   <asp:HyperLink ID="hlDownloadLink" runat="server" Visible="false" ></asp:HyperLink>
   <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

 
</asp:Content>
