<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Patient_Feedback._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<head>
  <style>
      body {
          font-family: Arial;
          margin: 0;
          padding: 0;
          background-color: #f8f8f8; /* Fallback color */
          background-image: radial-gradient(circle, rgba(255, 0, 0, 0.5) 2px, transparent 2px), 
                            radial-gradient(circle, rgba(255, 0, 0, 0.5) 2px, transparent 2px);
          background-position: 0 0, 25px 25px;
          background-size: 50px 50px;
      }

      .contener {
          width: 100%;
          max-width: 1200px;
          margin: 0 auto;
          padding: 20px;
          background-color: white;
      }

      header, footer {
          background-color: darkblue;
          padding: 10px;
          text-align: center;
      }

      .Headcontent {
          color: lightseagreen;
          text-align: center;
      }

      .btn {
          display: flex;
          justify-content: center;
          align-items: center;
      }

      .txt {
          color: lightseagreen;
          text-align: center;
      }
  </style>
</head>

<body>
    <header>
        <!-- Header Content (e.g., Logo, Navigation) -->
    </header>

    <div class="card">
        <div class="contener">
            <div class="Headcontent">
                <h1>The Patient Experience</h1>
                <p>Please take a few moments and select your option to proceed with feedback</p>
            </div><br />

            <div class="btn">
                <asp:Button ID="Button1" runat="server" Text="IPD Patients" OnClick="Button1_Click" CssClass="btn btn-info" style="font-size: xx-large;" />
            </div><br />

            <div class="txt">
                <p>!! Patient admitted to the hospital</p>
                <p>!! आईपीडी रोगी के लिए, यहाँ क्लिक करें</p>
            </div>

            <div class="btn">
                <asp:Button ID="Button2" runat="server" Text="OPD Patients" CssClass="btn btn-info" style="font-size: xx-large;" OnClick="Button2_Click" />
            </div><br />

            <div class="txt">
                <p>!! Patient visited for consultant</p>
                <p>!! ओपीडी रोगी के लिए, यहाँ क्लिक करें</p>
            </div>
        </div>
    </div>

    <footer>
        <!-- Footer Content -->
    </footer>
</body>

</asp:Content>
