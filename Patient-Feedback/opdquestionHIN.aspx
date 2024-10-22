<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="opdquestionHIN.aspx.cs" Inherits="Patient_Feedback.opdquestionHIN" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">

     
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
         <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
     
     <style>
             body 
             {
              font-family: Arial, sans-serif;
              margin: 0;
              padding: 0;
              background-color: #f8f8f8; /* Fallback color */
              background-image: radial-gradient(circle, rgba(255, 0, 0, 0.5) 2px, transparent 2px), 
                                radial-gradient(circle, rgba(255, 0, 0, 0.5) 2px, transparent 2px);
              background-position: 0 0, 25px 25px;
              background-size: 50px 50px;
             }

              .header, footer
              {
                   background-color: darkblue;
                   padding: 20px;
                   text-align: center;
                   color: white;
               }
               
               .txt
               {
                   color: lightseagreen;
                   text-align: center;
                   margin-bottom: 30px;
               }
               
               .Dquestions, .Nquestions, .Aquestions, .Dquestions, .Bquestions, .Iquestions, .F-and-Bquestions, .Hquestions, .Oquestions
               {
                   margin-bottom: 20px;
               }
               
               .hidden
               {
                   display: none;
               }
               
               .card-header
               {
                   background-color: #006c91; /* Dark cyan/blue color */
                   color: white;
                   text-align: center;
                   font-size: 1.25rem;
                   padding: 10px;
               }
               
               #feedbackTable table 
               {
                   width: 100%;
                   margin: 20px 0;
                   border-collapse: collapse;
               }
               
               #feedbackTable th, #feedbackTable td
               {
                   padding: 10px;
                   text-align: center;
                   border: 1px solid #ddd;
               }
               
               #feedbackTable th
               {
                   background-color: lightseagreen;
                   color: white;
               }
               
               #feedbackTable tbody tr:nth-child(even) 
               {
                   background-color: #f2f2f2;
               }
               
               .card-header
               {
                       background-color: #006c91; /* Dark cyan/blue */
                       color: white;
                       text-align: center;
               }
               .card-body {
                       padding: 20px;
               }
               .hidden
               {
                       display: none;
               }
               

        </style>


       <script>
         document.addEventListener('DOMContentLoaded', function ()
         {

                  var questions = document.querySelectorAll('.Dquestions, .Nquestions, .Aquestions, .Dquestions, .Bquestions, .Iquestions, .F-and-Bquestions, .Hquestions, .Oquestions');

             questions.forEach(function (question)
             {
                        var yesRadioButton = question.querySelector('input[type=radio][value="Yes"]');
                        var noRadioButton = question.querySelector('input[type=radio][value="No"]');
                        var textBox = question.querySelector('input[type=text]');
                        // Target asp:Button rendered as input[type=submit]
                        var submitButton = question.querySelector('input[type=submit]');
                        var feedbackTable = question.querySelector('#feedbackTable');
                        var feedbackComment = question.querySelector('#feedbackComment');
                      
                 yesRadioButton.addEventListener('click', function ()
                 {
                            textBox.classList.remove('hidden');
                            submitButton.classList.remove('hidden');
                            feedbackTable.classList.add('hidden');
                            feedbackComment.classList.add('hidden');
                 });
                      
                 noRadioButton.addEventListener('click', function ()
                 {
                            textBox.classList.add('hidden');
                            submitButton.classList.add('hidden');
                            feedbackTable.classList.remove('hidden');
                            feedbackComment.classList.remove('hidden');
                 });
              });
         });

     </script>


   
    <main>
        <header>
            <div class="contener1">
                <div class="txt">
                   <h1>आईपीडी मरीजों का अनुभव</h1>
                            <p>यदि आप अस्पताल में भर्ती मरीज हैं/थे, तो कृपया निम्नलिखित प्रश्नों का उत्तर दें ताकि आप हमें अपने अस्पताल में अनुभव के बारे में बता सकें। उत्तर देने के लिए, कृपया उपयुक्त उत्तर का चयन करें।</p>

                </div>
              
                
               <%---------------------------------------------------- doctore feedback------------------------------------------------------------------%>

                   <div class="Dquestions">
                  <div class="card">
                 <div class="card-header">
                       डॉक्टर की प्रतिक्रिया
                 </div>
                 <div class="card-body">
                 <h4>क्या आप संतुष्ट हैं?</h4>
                   
                     <input type="radio" id="RadioButton3" name="Q1" value="Yes" />हाँ
            <input type="radio" id="RadioButton4" name="Q1" value="No" />नहीं
            <br />
                    
                      <%-- <input type="text" id="TextBox1" class="hidden form-control mt-3"  placeholder="Any Other Observation?" />--%>
                     <%-- <input type="text" id="TextBox1" name="TextBox1"  class="hidden form-control mt-3" placeholder="Any Other Observation?" />--%>
                    <%--  <button  type="button" id="Button1" CssClass="hidden btn btn-primary mt-2 ">Submit your Response</button>--%>
                      <asp:TextBox ID="TextBox1" runat="server" CssClass="hidden form-control mt-3" Placeholder="Any Other Observation?"></asp:TextBox>
   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="TextBox1"  ErrorMessage="This field is required."  CssClass="error-message"  Display="Dynamic" ForeColor="Red" /><br />
                       <asp:Button ID="Button2" runat="server" CssClass="hidden btn btn-primary mt-2 " OnClick="btnDoctorFedbackYES" Text="Submit your Response" />
                    
                    <div id="feedbackTable" class="hidden">

                          <table>
                      <thead>
                             <tr>
                       <th>Ratings</th>
                       <th>always</th>
                       <th>usually</th>
                       <th>sometimes</th>
                       <th>never</th>
                   </tr>
                        </thead>
                        <tbody>
                             <tr>
                         <td>डॉक्टर ने आपकी समस्या को कितनी अच्छी तरह समझा?</td>
                        <td><asp:RadioButton ID="RadioButton5" runat="server" GroupName="drfdbk" /></td>
                        <td><asp:RadioButton ID="RadioButton6" runat="server" GroupName="drfdbk" /></td>
                        <td><asp:RadioButton ID="RadioButton7" runat="server" GroupName="drfdbk" /></td>
                        <td><asp:RadioButton ID="RadioButton8" runat="server"  GroupName="drfdbk" /></td>
                        
                    </tr>
                        </tbody>

                              <thead>
                                  <tr>
                                      <th>Ratings</th>
                                      <th>Completely</th>
                                      <th>Mostly</th>
                                      <th>Somewhat</th>
                                      <th>Not at all</th>

                                  </tr>
                                  <tbody>
                                      <tr>
                                         <td>डॉक्टर ने आपकी स्थिति और उपचार का कोर्स कितनी स्पष्टता से समझाया?</td>
                                           <td><asp:RadioButton ID="RadioButton9" runat="server" GroupName="drfdbk1" /></td>
                                           <td><asp:RadioButton ID="RadioButton10" runat="server" GroupName="drfdbk1" /></td>
                                           <td><asp:RadioButton ID="RadioButton11" runat="server" GroupName="drfdbk1" /></td>
                                           <td><asp:RadioButton ID="RadioButton12" runat="server"  GroupName="drfdbk1" /></td>      
                                              <tr>
                                       <td>डॉक्टर का प्रतीक्षा समय कैसा रहा?</td>
                                         <td><asp:RadioButton ID="RadioButton13" runat="server" GroupName="drfdbk2" /></td>
                                           <td><asp:RadioButton ID="RadioButton14" runat="server" GroupName="drfdbk2" /></td>
                                           <td><asp:RadioButton ID="RadioButton15" runat="server" GroupName="drfdbk2" /></td>
                                           <td><asp:RadioButton ID="RadioButton16" runat="server"  GroupName="drfdbk2" /></td>      
                                      </tr>
                                      <tr>
                                          <td>डॉक्टर द्वारा प्रदान किए गए शिष्टाचार और सम्मान को आप कैसे रेट करेंगे?</td>
                                          <td><asp:RadioButton ID="RadioButton17" runat="server" GroupName="drfdbk3" /></td>
                                          <td><asp:RadioButton ID="RadioButton18" runat="server" GroupName="drfdbk3" /></td>
                                          <td><asp:RadioButton  ID="RadioButton19" runat="server" GroupName="drfdbk3" /></td>
                                          <td><asp:RadioButton ID="RadioButton20" runat="server" GroupName="drfdbk3" /></td>
                                      </tr>
                                  </tbody>

                              </thead>
                    </table>
                          <div id="feedbackComment" class="hidden" >
                            <%--<input type="text" id="TextBox35" placeholder="Any other observation"  /><br />
                            <button type="button" id="Button35">Submit your response</button>--%>

                               <input type="text" id="TextBox35" class="form-control mt-3" name="TextBox35"  placeholder="Any Other Observation?"/><br />
                         <%-- <asp:Button ID="Button35" runat="server" class="btn btn-secondary mt-2"   Text="Submit your Response" />--%>
                              <asp:Button ID="Button35" runat="server"  class="btn btn-secondary mt-2"  OnClick="btnDoctorFedbackNO" Text="Submit your Response" />
                        </div>
                    </div>
                    </div>
                     </div>
                   
                </div> <br />   

              <%--  --------------------------------------------------- lab feedback ----------------------------------------------------------------------%>
                
              <div class="Dquestions">
                  <div class="card">
                 <div class="card-header">
                    प्रयोगशाला सेवाएं
                    </div>
                 <div class="card-body">
                <h4>क्या आप संतुष्ट हैं?</h4>
                   
                    <input type="radio" id="RadioButton3" name="Q1" value="Yes" />हां
            <input type="radio" id="RadioButton4" name="Q1" value="No" />नहीं
            <br />
                    
                 <%-- <input type="text" id="TextBox1" class="hidden" placeholder="Any Other Observation?" />--%>
                 <input type="text" id="txtNursingObservation1" name="txtNursingObservation1" class="form-control hidden mt-3" placeholder="Any Other Observation?" />

                    <%--  <button  type="button" id="Button1" class="hidden">Submit your Response</button>--%>
                    <asp:Button ID="Button1" runat="server" CssClass="hidden btn btn-primary mt-2 " OnClick="btnLabFeedbackYes" Text="Submit your Response" />
                    
                    <div id="feedbackTable" class="hidden">

                          <table>
                       <table>
                        <thead>
                             <tr>
                       <th>Ratings</th>
                       <th>always</th>
                       <th>usually</th>
                       <th>sometimes</th>
                       <th>never</th>
                   </tr>
                        </thead>
                        <tbody>
                             <tr>
                        <td>नमूना संग्रह के लिए प्रतीक्षा समय का आप कैसे वर्णन करेंगे?</td>
                        <td><asp:RadioButton ID="RadioButton1" runat="server" GroupName="drfdbk" /></td>
                        <td><asp:RadioButton ID="RadioButton2" runat="server" GroupName="drfdbk" /></td>
                        <td><asp:RadioButton ID="RadioButton21" runat="server" GroupName="drfdbk" /></td>
                        <td><asp:RadioButton ID="RadioButton22" runat="server"  GroupName="drfdbk" /></td>
                        
                    </tr>
                        </tbody>

                              <thead>
                                  <tr>
                                      <th>Ratings</th>
                                      <th>Completely</th>
                                      <th>Mostly</th>
                                      <th>Somewhat</th>
                                      <th>Not at all</th>

                                  </tr>
                                  <tbody>
                                      <tr>
                                          <td>क्या रक्त नमूने लेने से पहले आपको उचित जानकारी दी गई थी?</td>
                                           <td><asp:RadioButton ID="RadioButton23" runat="server" GroupName="drfdbk1" /></td>
                                           <td><asp:RadioButton ID="RadioButton24" runat="server" GroupName="drfdbk1" /></td>
                                           <td><asp:RadioButton ID="RadioButton25" runat="server" GroupName="drfdbk1" /></td>
                                           <td><asp:RadioButton ID="RadioButton26" runat="server"  GroupName="drfdbk1" /></td>      
                                              <tr>
                                       <td>नमूना संग्रहण स्टाफ की कौशलता का आप कैसे मूल्यांकन करेंगे?</td>
                                         <td><asp:RadioButton ID="RadioButton27" runat="server" GroupName="drfdbk2" /></td>
                                           <td><asp:RadioButton ID="RadioButton28" runat="server" GroupName="drfdbk2" /></td>
                                           <td><asp:RadioButton ID="RadioButton29" runat="server" GroupName="drfdbk2" /></td>
                                           <td><asp:RadioButton ID="RadioButton30" runat="server"  GroupName="drfdbk2" /></td>      
                                      </tr>
                                      <tr>
                                          <td>नमूना संग्रहण स्टाफ की शिष्टाचार का आप कैसे मूल्यांकन करेंगे?</td>
                                          <td><asp:RadioButton ID="RadioButton31" runat="server" GroupName="drfdbk3" /></td>
                                          <td><asp:RadioButton ID="RadioButton32" runat="server" GroupName="drfdbk3" /></td>
                                          <td><asp:RadioButton  ID="RadioButton33" runat="server" GroupName="drfdbk3" /></td>
                                          <td><asp:RadioButton ID="RadioButton34" runat="server" GroupName="drfdbk3" /></td>
                                      </tr>
                                         <tr>
                                          <td>क्या आपको रिपोर्ट प्राप्त करने का समय उचित लगता है?</td>
                                          <td><asp:RadioButton ID="RadioButton51" runat="server" GroupName="drfdbk3" /></td>
                                          <td><asp:RadioButton ID="RadioButton52" runat="server" GroupName="drfdbk3" /></td>
                                          <td><asp:RadioButton  ID="RadioButton53" runat="server" GroupName="drfdbk3" /></td>
                                          <td><asp:RadioButton ID="RadioButton54" runat="server" GroupName="drfdbk3" /></td>
                                      </tr>
                                  </tbody>
                    </table>
                          <div id="feedbackComment" class="hidden" >
                           <%-- <input type="text" id="TextBox35" placeholder="Any other observation"  /><br />
                            <button type="button" id="Button35">Submit your response</button>--%>

                              <input type="text" id="txtNursingObservation2" class="form-control mt-3" name="txtNursingObservation2" placeholder="Any other observation"  /><br />
                               <asp:Button ID="Button55" runat="server"  class="btn btn-secondary mt-2"  OnClick="btnLabFeedbackNo" Text="Submit your Response" />
                        </div>
                  
                    </div>
                     </div>
                   </div>
                </div> <br />   



                <%-----------------------------------------------------Radiology feedback------------------------------------------------%>


                       <div class="Dquestions">
                  <div class="card">
                 <div class="card-header">
                  रेडियोलॉजी
        </div>
        <div class="card-body">
            <h4>क्या आप संतुष्ट हैं?</h4>
            <input type="radio" id="RadioButton3" name="Q1" value="Yes" />हाँ
            <input type="radio" id="RadioButton4" name="Q1" value="No" />नहीं
            <br />
                    
                 <%-- <input type="text" id="TextBox1" class="hidden" placeholder="Any Other Observation?" />--%>
               <input type="text" id="txtRadiologyObservation1" name="txtRadiologyObservation1" class="form-control hidden mt-3" placeholder="Any other observation"  /><br />
                    <%--  <button  type="button" id="Button1" class="hidden">Submit your Response</button>--%>
                      <asp:Button ID="Button56" runat="server" CssClass="hidden btn btn-primary mt-2 " OnClick="btnRadiologyYes" Text="Submit your Response" /> 
                  
                    
                    <div id="feedbackTable" class="hidden">

                          <table>
                        <thead>
                             <tr>
                       <th>Ratings</th>
                       <th>always</th>
                       <th>usually</th>
                       <th>sometimes</th>
                       <th>never</th>
                   </tr>
                        </thead>
                                  <tbody>
                                      <tr>
                                         <td>रेडियोलॉजी जांच के लिए प्रतीक्षा समय का आप कैसे वर्णन करेंगे?</td>
                                          <td><asp:RadioButton ID="RadioButton35" runat="server" GroupName="nsfdbk4" /></td>
                                           <td><asp:RadioButton ID="RadioButton36" runat="server" GroupName="nsfdbk4" /></td>
                                           <td><asp:RadioButton ID="RadioButton37" runat="server" GroupName="nsfdbk4" /></td>
                                           <td><asp:RadioButton ID="RadioButton38" runat="server" GroupName="nsfdbk4" /></td>

                                      </tr>
                                  </tbody>
                                </tr>
                            </thead>

                            <tr>
                                      <th>Ratings</th>
                                      <th>Completely</th>
                                      <th>Mostly</th>
                                      <th>Somewhat</th>
                                      <th>Not at all</th>

                                  </tr>
                                  <tbody>
                                      <tr>
                                         <td>क्या आपको रेडियोलॉजी प्रक्रिया रेडियोलॉजी स्टाफ द्वारा समझाई गई थी?</td>
                                           <td><asp:RadioButton ID="RadioButton39" runat="server" GroupName="drfdbk5" /></td>
                                           <td><asp:RadioButton ID="RadioButton40" runat="server" GroupName="drfdbk5" /></td>
                                           <td><asp:RadioButton ID="RadioButton41" runat="server" GroupName="drfdbk5" /></td>
                                           <td><asp:RadioButton ID="RadioButton42" runat="server"  GroupName="drfdbk5" /></td>      
                                              <tr>
                                       <td>रेडियोलॉजी स्टाफ की शिष्टाचार को आप कैसे रेट करेंगे?</td>
                                         <td><asp:RadioButton ID="RadioButton43" runat="server" GroupName="drfdbk6" /></td>
                                           <td><asp:RadioButton ID="RadioButton44" runat="server" GroupName="drfdbk6" /></td>
                                           <td><asp:RadioButton ID="RadioButton45" runat="server" GroupName="drfdbk6" /></td>
                                           <td><asp:RadioButton ID="RadioButton46" runat="server"  GroupName="drfdbk6" /></td>      
                                      </tr>
                                      <tr>
                                         <td>क्या आपको रिपोर्ट प्राप्त करने का समय उपयुक्त लगता है?</td>
                                          <td><asp:RadioButton ID="RadioButton47" runat="server" GroupName="drfdbk7" /></td>
                                          <td><asp:RadioButton ID="RadioButton48" runat="server" GroupName="drfdbk7" /></td>
                                          <td><asp:RadioButton  ID="RadioButton49" runat="server" GroupName="drfdbk7" /></td>
                                          <td><asp:RadioButton ID="RadioButton50" runat="server" GroupName="drfdbk7" /></td>
                                      </tr>
                                  </tbody>

                    </table>
                          <div id="feedbackComment" class="hidden" >
                           <%-- <input type="text" id="TextBox35" placeholder="Any other observation"  /><br />
                            <button type="button" id="Button35">Submit your response</button>--%>

                               <input type="text" id="txtRadiologyObservation2" name="txtRadiologyObservation2" class="form-control mt-3" placeholder="Any other observation"  /><br />
                          <%--  <button type="button" id="Button57" class="btn btn-secondary mt-2"   >Submit your response</button>--%>
                         <asp:Button ID="Button57" runat="server"  class="btn btn-secondary mt-2"  OnClick="btnRadiologyNo" Text="Submit your Response" />

                        </div>
                  </div>
                    </div>
                   </div>
                   
                </div> <br />   


              <%--  ----------------------------------- Frontoffice/overall feedback----------------------------------------------%>

                       <div class="Dquestions">
                  <div class="card">
                 <div class="card-header">
                 फ्रंटऑफिस/कुल मिलाकर
        </div>
        <div class="card-body">
            <h4>क्या आप संतुष्ट हैं?</h4>
            <input type="radio" id="RadioButton3" name="Q1" value="Yes"/>हां
            <input type="radio" id="RadioButton4" name="Q1" value="No" />नहीं
            <br />

                    
               <%--   <input type="text" id="TextBox1" class="hidden" placeholder="Any Other Observation?" />--%>
                      <input type="text" id="txtOverallObservation1" name="txtOverallObservation1" class="form-control hidden mt-3" placeholder="Any other observation"  /><br />
                    <%--  <button  type="button" id="Button1" class="hidden">Submit your Response</button>--%>
                        <asp:Button ID="Button58" runat="server" CssClass="hidden btn btn-primary mt-2 " OnClick="btnFrontofficeYes" Text="Submit your Response" /> 
                  
                    
                    <div id="feedbackTable" class="hidden">

                          <table>
                       <thead>
                             <tr>
                       <th>Ratings</th>
                       <th>always</th>
                       <th>usually</th>
                       <th>sometimes</th>
                       <th>never</th>
                   </tr>
                        </thead>
                                  <tbody>
                                      <tr>
                                        <td>आप हमारे OPD अपॉइंटमेंट शेड्यूलिंग सिस्टम को कैसे रेट करेंगे?</td>
                                          <td><asp:RadioButton ID="RadioButton67" runat="server" GroupName="nsfdbk4" /></td>
                                           <td><asp:RadioButton ID="RadioButton68" runat="server" GroupName="nsfdbk4" /></td>
                                           <td><asp:RadioButton ID="RadioButton69" runat="server" GroupName="nsfdbk4" /></td>
                                           <td><asp:RadioButton ID="RadioButton70" runat="server" GroupName="nsfdbk4" /></td>

                                      </tr>
                                  </tbody>
                                </tr>
                            </thead>

                            <tr>
                                      <th>Ratings</th>
                                      <th>Completely</th>
                                      <th>Mostly</th>
                                      <th>Somewhat</th>
                                      <th>Not at all</th>

                                  </tr>
                                  <tbody>
                                      <tr>
                                          <td>फ्रंट ऑफिस स्टाफ कितना विनम्र और सहायक था?</td>
                                           <td><asp:RadioButton ID="RadioButton71" runat="server" GroupName="drfdbk5" /></td>
                                           <td><asp:RadioButton ID="RadioButton72" runat="server" GroupName="drfdbk5" /></td>
                                           <td><asp:RadioButton ID="RadioButton73" runat="server" GroupName="drfdbk5" /></td>
                                           <td><asp:RadioButton ID="RadioButton74" runat="server"  GroupName="drfdbk5" /></td>      
                                              <tr>
                                     <td>क्या आपका बिलिंग और पंजीकरण समय पर किया गया था?</td>
                                         <td><asp:RadioButton ID="RadioButton75" runat="server" GroupName="drfdbk6" /></td>
                                           <td><asp:RadioButton ID="RadioButton76" runat="server" GroupName="drfdbk6" /></td>
                                           <td><asp:RadioButton ID="RadioButton77" runat="server" GroupName="drfdbk6" /></td>
                                           <td><asp:RadioButton ID="RadioButton78" runat="server"  GroupName="drfdbk6" /></td>      
                                      </tr>
                                      <tr>
                                          <td>कार पार्किंग कितनी सुविधाजनक थी?</td>
                                          <td><asp:RadioButton ID="RadioButton79" runat="server" GroupName="drfdbk7" /></td>
                                          <td><asp:RadioButton ID="RadioButton80" runat="server" GroupName="drfdbk7" /></td>
                                          <td><asp:RadioButton  ID="RadioButton81" runat="server" GroupName="drfdbk7" /></td>
                                          <td><asp:RadioButton ID="RadioButton82" runat="server" GroupName="drfdbk7" /></td>
                                      </tr>
                                      <tr>
                                        <td>क्या अस्पताल में साइन बोर्ड मरीजों और आगंतुकों की आसान आवाजाही में मदद करता है?</td>
                                          <td><asp:RadioButton ID="RadioButton55" runat="server" GroupName="drfdbk7" /></td>
                                          <td><asp:RadioButton ID="RadioButton56" runat="server" GroupName="drfdbk7" /></td>
                                          <td><asp:RadioButton  ID="RadioButton57" runat="server" GroupName="drfdbk7" /></td>
                                          <td><asp:RadioButton ID="RadioButton58" runat="server" GroupName="drfdbk7" /></td>
                                      </tr>
                                      <tr>
                                          <td>आप अस्पताल की फार्मेसी सेवाओं को कैसे रेट करेंगे?</td>
                                          <td><asp:RadioButton ID="RadioButton59" runat="server" GroupName="drfdbk7" /></td>
                                          <td><asp:RadioButton ID="RadioButton60" runat="server" GroupName="drfdbk7" /></td>
                                          <td><asp:RadioButton  ID="RadioButton61" runat="server" GroupName="drfdbk7" /></td>
                                          <td><asp:RadioButton ID="RadioButton62" runat="server" GroupName="drfdbk7" /></td>
                                      </tr>
                                      <tr>
                                          >क्या हमारे स्टाफ ने आपकी गोपनीयता और आराम का सम्मान किया?</td>
                                          <td><asp:RadioButton ID="RadioButton63" runat="server" GroupName="drfdbk7" /></td>
                                          <td><asp:RadioButton ID="RadioButton64" runat="server" GroupName="drfdbk7" /></td>
                                          <td><asp:RadioButton  ID="RadioButton65" runat="server" GroupName="drfdbk7" /></td>
                                          <td><asp:RadioButton ID="RadioButton66" runat="server" GroupName="drfdbk7" /></td>
                                      </tr>
                                  </tbody>

                              </thead>

                    </table>
                          <div id="feedbackComment" class="hidden" >
                            <%--<input type="text" id="TextBox35" placeholder="Any other observation"  /><br />
                            <button type="button" id="Button35">Submit your response</button>--%>
                               <input type="text" id="txtOverallObservation2" name="txtOverallObservation2" class="form-control mt-3" placeholder="Any other observation"  /><br />
                            <button type="button" id="Button58" class="btn btn-secondary mt-2" onclick="btnFrontofficeNo" >Submit your response</button>
                        </div>
                      </div>
                    </div>
                   </div>
                   
                </div> <br />   
                
                <asp:Button ID="Button12" class="btn btn-secondary mt-2" runat="server" Text="Save & Process" OnClick="Button1_Click"   />
            </div>
        </header>
    </main>

</asp:Content>
