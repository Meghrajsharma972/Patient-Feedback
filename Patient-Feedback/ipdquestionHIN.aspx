<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ipdquestionHIN.aspx.cs" Inherits="Patient_Feedback.ipdquestionHIN" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

   
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
               
               .error-message {
                      font-size: 14px;
                      margin-top: 5px;
                      color: red; /* Already handled by ForeColor attribute, but can be added here if needed */
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
         function toggleObservationField(show) {
    var textbox = document.getElementById("<%= TextBox1.ClientID %>");
    if (show) {
        textbox.classList.remove("hidden");
    } else {
        textbox.classList.add("hidden");
    }
}

     </script>


   
    <main>
        <header>
            <div class="contener1">
                <div class="txt">
                     <h1>आईपीडी मरीजों का अनुभव</h1>
                   <p>यदि आप अस्पताल में भर्ती मरीज हैं/थे, तो कृपया निम्नलिखित प्रश्नों के उत्तर देकर हमें अस्पताल में आपके अनुभव के बारे में बताएं। उत्तर देने के लिए, कृपया उपयुक्त प्रतिक्रिया का चयन करें।</p>

                </div>
              
                
               <%-- doctore feedback--%>
                  <div class="Dquestions">
                  <div class="card">
                 <div class="card-header">
                       डॉक्टर की प्रतिक्रिया
                 </div>
                 <div class="card-body">
                 <h4>क्या आप संतुष्ट हैं?</h4>
                   
                    <input type="radio" id="RadioButton3" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton4" name="Q1" value="No" />No
                    <br />                    
                      <%-- <input type="text" id="TextBox1" class="hidden" placeholder="Any Other Observation?" />--%>
                     <%-- <input type="text" id="TextBox1" name="TextBox1"  class="hidden form-control mt-3" placeholder="Any Other Observation?" /> --%>
                  <asp:TextBox ID="TextBox1" runat="server" CssClass="hidden form-control mt-3" Placeholder="Aक्या आप कोई अन्य टिप्पणी देना कहते है|"></asp:TextBox>
   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="TextBox1"  ErrorMessage="This field is required."  CssClass="error-message"  Display="Dynamic" ForeColor="Red" /><br />
                                         
                    <%--  <button  type="button" id="Button1" class="hidden" onclick="Button1_Click">Submit your Response</button>--%>
                     <asp:Button ID="Button1" runat="server" CssClass="hidden btn btn-primary mt-2 " OnClick="DoctorFedbackYES" Text="Submit your Response" />
                    
                    <div id="feedbackTable" class="hidden">
                          <table>
                        <thead>
                                <tr>
                                    <th>Ratings</th>
                                    <th>Always</th>
                                    <th>Usually</th>
                                    <th>Sometimes</th>
                                    <th>Never</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>आपके डॉक्टर ने आपके साथ कितनी बार शिष्टाचार और सम्मान से व्यवहार किया?</td>
                                    <td><input type="radio" name="DRq1" value="1"></td>
                                    <td><input type="radio" name="DRq1" value="2"></td>
                                    <td><input type="radio" name="DRq1" value="3"></td>
                                    <td><input type="radio" name="DRq1" value="4"></td>
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
                            </thead>
                            <tbody>
                                <tr>
                                    <td>डॉक्टर ने आपकी स्थिति और उपचार के विकल्पों को कितनी स्पष्टता से समझाया?</td>
                                    <td><input type="radio" name="DRq2" value="5"></td>
                                    <td><input type="radio" name="DRq2" value="6"></td>
                                    <td><input type="radio" name="DRq2" value="7"></td>
                                    <td><input type="radio" name="DRq2" value="8"></td>
                                </tr>
                                <tr>
                                    <td>क्या आप संतुष्ट हैं? डॉक्टर ने आपके साथ बिताए समय की अवधि और गुणवत्ता के बारे में</td>
                                    <td><input type="radio" name="DRq3" value="5"></td>
                                    <td><input type="radio" name="DRq3" value="6"></td>
                                    <td><input type="radio" name="DRq3" value="7"></td>
                                    <td><input type="radio" name="DRq3" value="8"></td>
                                </tr>
                                <tr>
                                    <td>आपको अपने डॉक्टर की उपचार क्षमता पर कितना विश्वास था?</td>
                                    <td><input type="radio" name="DRq4" value="5"></td>
                                    <td><input type="radio" name="DRq4" value="6"></td>
                                    <td><input type="radio" name="DRq4" value="7"></td>
                                    <td><input type="radio" name="DRq4" value="8"></td>
                                </tr>
                            </tbody>

                              </thead>
                    </table>
                          <div id="feedbackComment" class="hidden" >
                           <input type="text" id="TextBox35" class="form-control mt-3" name="TextBox35"  placeholder="Any Other Observation?"/><br />
                          <asp:Button ID="Button35" runat="server" class="btn btn-secondary mt-2" OnClick="DoctorFedbackNO" Text="Submit your Response" />

                        </div>
                      </div>
                    </div>
                   </div>                   
                </div> <br />   

              <%----------------------------------------------------   nurse feedback --------------------------------------------------------------------%>
                
               <div class="Dquestions">
                    <div class="card">
                    <div class="card-header">
                        नर्सिंग प्रतिक्रिया
                    </div>
                        <div class="card-body">
                        <h4>क्या आप संतुष्ट हैं?</h4>
                   
                    <input type="radio" id="RadioButton5" name="Q1" value="Yes"/>हाँ
                   <input type="radio" id="RadioButton6" name="Q1" value="No"/>नहीं
            <br />
                    <br />
                    
                <%--  <input type="text" id="TextBox1" class="hidden" placeholder="Any Other Observation?" />--%>
                     <input type="text" id="txtfeebdackObservation1" name="txtfeebdackObservation1" class="form-control hidden mt-3" placeholder="क्या आप कोई अन्य टिप्पणी देना कहते है|" />

                   <%--   <button  type="button" id="Button1" class="hidden">Submit your Response</button>--%>
                     <asp:Button ID="Button2" runat="server" CssClass="hidden btn btn-primary mt-2 " OnClick="btnNurseFedbackYES"  Text="Submit your Response" />
                  
                    
                    <div id="feedbackTable" class="hidden">

                          <table>
                        <thead>
                                <tr>
                                    <th>Ratings</th>
                                    <th>Always</th>
                                    <th>Usually</th>
                                    <th>Sometimes</th>
                                    <th>Never</th>
                                </tr>
                            </thead>
                            <tbody>
                               <tr>
                            <td>नर्स ने आपके साथ कितनी बार शिष्टाचार और सम्मान से व्यवहार किया?</td>
                            <td><input type="radio" name="Nq1" value="1"></td>
                            <td><input type="radio" name="Nq1" value="2"></td>
                            <td><input type="radio" name="Nq1" value="3"></td>
                            <td><input type="radio" name="Nq1" value="4"></td>
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
                            </thead>
                            <tbody>
                                <tr>
                            <td>नर्स ने आपकी स्थिति और उपचार के विकल्पों को कितनी स्पष्टता से समझाया?</td>
                            <td><input type="radio" name="Nq2" value="5"></td>
                            <td><input type="radio" name="Nq2" value="6"></td>
                            <td><input type="radio" name="Nq2" value="7"></td>
                            <td><input type="radio" name="Nq2" value="8"></td>
                        </tr>
                                 <tr>
                            <td>क्या आप नर्स द्वारा दिए गए समय की अवधि और गुणवत्ता से संतुष्ट हैं?</td>
                            <td><input type="radio" name="Nq3" value="5"></td>
                            <td><input type="radio" name="Nq3" value="6"></td>
                            <td><input type="radio" name="Nq3" value="7"></td>
                            <td><input type="radio" name="Nq3" value="8"></td>
                        </tr>
                        <tr>
                            <td>आपको नर्स की उपचार क्षमता पर कितना विश्वास था?</td>
                            <td><input type="radio" name="Nq4" value="5"></td>
                            <td><input type="radio" name="Nq4" value="6"></td>
                            <td><input type="radio" name="Nq4" value="7"></td>
                            <td><input type="radio" name="Nq4" value="8"></td>
                        </tr>
                            </tbody>
                           </table>
                          <div id="feedbackComment" class="hidden" >
                            <input type="text" id="txtfeebdackObservation2" class="form-control mt-3" name="txtfeebdackObservation2" placeholder="Any other observation"  /><br />
                               <asp:Button ID="Button3" runat="server"  class="btn btn-secondary mt-2" OnClick="btnNurseFeedbackNo" Text="Submit your Response" />
                            
                        </div>                  
                    </div>
                   </div>
                   </div>                   
                </div> <br />   

                <%------------------=--------------------------------- addmission feedback--------------------------------------%>

                 div class="Dquestions"> 
    <div class="card">
        <div class="card-header">
            प्रवेश प्रतिक्रिया
        </div>
        <div class="card-body">
            <h4>क्या आप संतुष्ट हैं?</h4>
                     
                   
                    <input type="radio" id="RadioButton3" name="Q1" value="Yes"/>हाँ
            <input type="radio" id="RadioButton4" name="Q1" value="No"/>नहीं
            <br />
                    
                          <input type="text" id="txtAdmissionObservation1" name="txtAdmissionObservation1" class="form-control hidden mt-3" placeholder="Any other observation"  /><br />
                        <%-- <button  type="button" id="Button1" CssClass="hidden btn btn-primary mt-2 " >Submit your Response</button>--%>
                    <asp:Button ID="Button11" runat="server" CssClass="hidden btn btn-primary mt-2 " OnClick="btnAdmissionFeedbackYES "  Text="Submit your Response" /> 
                  
                    
                    <div id="feedbackTable" class="hidden">

                          <table>
                         <thead>
                                <tr>
                                    <th>Ratings</th>
                                    <th>Always</th>
                                    <th>Usually</th>
                                    <th>Sometimes</th>
                                    <th>Never</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                   <td>अस्पताल में भर्ती होने के समय प्रतीक्षा करते समय आपका अनुभव कैसा था?</td>
                                    <td><input type="radio" name="Adq1" value="1"></td>
                                    <td><input type="radio" name="Adq1" value="2"></td>
                                    <td><input type="radio" name="Adq1" value="3"></td>
                                    <td><input type="radio" name="Adq1" value="4"></td>
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
                            </thead>
                            <tbody>
                                <tr>
                                       <td>प्रवेश के समय आपकी स्थिति और आवश्यक जानकारी कितनी स्पष्टता से प्रदान की गई?</td>
                                    <td><input type="radio" name="Adq2" value="5"></td>
                                    <td><input type="radio" name="Adq2" value="6"></td>
                                    <td><input type="radio" name="Adq2" value="7"></td>
                                    <td><input type="radio" name="Adq2" value="8"></td>
                                </tr>
                                <tr>
                                     <td>प्रवेश के समय स्वागत स्टाफ कितना शिष्ट और मददगार था?</td>
                                    <td><input type="radio" name="Adq3" value="5"></td>
                                    <td><input type="radio" name="Adq3" value="6"></td>
                                    <td><input type="radio" name="Adq3" value="7"></td>
                                    <td><input type="radio" name="Adq3" value="8"></td>
                                </tr>                

                            </tbody>
                           </table>

                          <div id="feedbackComment" class="hidden" >
                            <input type="text" id="txtAdmissionObservation2" name="txtAdmissionObservation2" class="form-control mt-3" placeholder="Any other observation"  /><br />

                            <button type="button" id="Button35" class="btn btn-secondary mt-2" OnClick="btnAdmissionFeedbackNo" >Submit your response</button>
                        </div>
                       </div>
                    </div>                   
                   </div>
                </div> <br />   

              <%----------------------------------------------------  discharge feedback-----------------------------------------------------------%>

               <div class="Dquestions"> 
    <div class="card">
        <div class="card-header">
            छुट्टी प्रतिक्रिया
        </div>
        <div class="card-body">
            <h4>क्या आप संतुष्ट हैं?</h4>

                   
                   
                    <input type="radio" id="RadioButton3" name="Q1" value="Yes"/>हाँ
            <input type="radio" id="RadioButton4" name="Q1" value="No"/>नहीं
            <br />
                    
                  <input type="text" id="txtDischargeObservation1" name="txtDischargeObservation1"  class="form-control hidden mt-3" placeholder="Any Other Observation?" />
                  <%--    <button  type="button" id="Button1"   CssClass="hidden btn btn-primary mt-2 " >Submit your Response</button>--%>
                  <asp:Button ID="Button12" runat="server" CssClass="hidden btn btn-primary mt-2 " OnClick="btnDischargeFeedbackYES "  Text="Submit your Response" />    
                    
                    <div id="feedbackTable" class="hidden">

                          <table>
                        <thead>
                                <tr>
                                    <th>Ratings</th>
                                    <th>Always</th>
                                    <th>Usually</th>
                                    <th>Sometimes</th>
                                    <th>Never</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                   <td>क्या आपको आपकी छुट्टी सारांश और फॉलो-अप निर्देश स्पष्ट रूप से समझाए गए?</td>
                                    <td><input type="radio" name="Dq1" value="1"></td>
                                    <td><input type="radio" name="Dq1" value="2"></td>
                                    <td><input type="radio" name="Dq1" value="3"></td>
                                    <td><input type="radio" name="Dq1" value="4"></td>
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
                            </thead>
                            <tbody>
                                <tr>
                                       <td>क्या आपको छुट्टी के बारे में स्पष्ट रूप से बताया गया था?</td>
                                    <td><input type="radio" name="Dq2" value="5"></td>
                                    <td><input type="radio" name="Dq2" value="6"></td>
                                    <td><input type="radio" name="Dq2" value="7"></td>
                                    <td><input type="radio" name="Dq2" value="8"></td>
                                </tr>
                                <tr>
                                     <td>क्या आपकी छुट्टी समय पर और प्रभावी ढंग से की गई?</td>
                                    <td><input type="radio" name="Dq3" value="5"></td>
                                    <td><input type="radio" name="Dq3" value="6"></td>
                                    <td><input type="radio" name="Dq3" value="7"></td>
                                    <td><input type="radio" name="Dq3" value="8"></td>
                                </tr>
                                <tr>
                                   <td>अस्पताल में आपके ठहरने के दौरान आपको कितना आरामदायक महसूस हुआ?</td>
                                    <td><input type="radio" name="Dq4" value="5"></td>
                                    <td><input type="radio" name="Dq4" value="6"></td>
                                    <td><input type="radio" name="Dq4" value="7"></td>
                                    <td><input type="radio" name="Dq4" value="8"></td>
                                </tr>
                            </tbody>
                    </table>
                          <div id="feedbackComment" class="hidden" >
                            <input type="text" id="txtDischargeObservation2" class="form-control mt-3" name="txtDischargeObservation2" placeholder="Any other observation"  /><br />
                            <button type="button" id="Button35" class="btn btn-secondary mt-2"  onclick ="btnDischargeFeedbackNo">Submit your response</button>
                        </div>
                  
                    </div>
                   </div>
                   </div>
                </div> <br />  

               <%-- ---------------------------------billing feedback ---------------------------------------------------------------------------%>

                  <div class="Dquestions"> 
    <div class="card">
        <div class="card-header">
            बिलिंग फीडबैक
        </div>
        <div class="card-body">
            <h4>क्या आप संतुष्ट हैं?</h4>   
            <input type="radio" id="RadioButton3" name="Q1" value="Yes"/>हाँ
            <input type="radio" id="RadioButton4" name="Q1" value="No" />नहीं
            <br />
  
                  <input type="text" id="txtBillingObservation1"  name="txtBillingObservation1" class="form-control hidden mt-3" placeholder="Any Other Observation?" />
                    <%--  <button  type="button" id="Button1" CssClass="hidden btn btn-primary mt-2 " >Submit your Response</button>--%>
                         <asp:Button ID="Button13" runat="server" CssClass="hidden btn btn-primary mt-2 " OnClick="btnbillingFeedbackYES "  Text="Submit your Response" /> 
                  
                    
                    <div id="feedbackTable" class="hidden">

                          <table>
                       <thead>
                                <tr>
                                    <th>Ratings</th>
                                    <th>Always</th>
                                    <th>Usually</th>
                                    <th>Sometimes</th>
                                    <th>Never</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>क्या आपको आपके उपचार की अनुमानित लागत स्पष्ट रूप से समझाई गई थी?</td>
                                    <td><input type="radio" name="rdBillingq1" value="1"></td>
                                    <td><input type="radio" name="rdBillingq1" value="2"></td>
                                    <td><input type="radio" name="rdBillingq1" value="3"></td>
                                    <td><input type="radio" name="rdBillingq1" value="4"></td>
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
                            </thead>
                            <tbody>
                                <tr>
                                   <td>आप बिलिंग स्टाफ की शिष्टता को कैसे रेट करेंगे?</td>
                                    <td><input type="radio" name="rdBillingq2" value="5"></td>
                                    <td><input type="radio" name="rdBillingq2" value="6"></td>
                                    <td><input type="radio" name="rdBillingq2" value="7"></td>
                                    <td><input type="radio" name="rdBillingq2" value="8"></td>
                                </tr>
                                <tr>
                                    <td>क्या आपका अंतिम बिल आपके अनुमानित बिल के अनुरूप था?</td>
                                    <td><input type="radio" name="rdBillingq3" value="5"></td>
                                    <td><input type="radio" name="rdBillingq3" value="6"></td>
                                    <td><input type="radio" name="rdBillingq3" value="7"></td>
                                    <td><input type="radio" name="rdBillingq3" value="8"></td>
                                </tr>
                                <tr>
                                   <td>आप पार्क हॉस्पिटल टीपीए/इंश्योरेंस डेस्क को कैसे रेट करेंगे?</td>
                                    <td><input type="radio" name="rdBillingq4" value="5"></td>
                                    <td><input type="radio" name="rdBillingq4" value="6"></td>
                                    <td><input type="radio" name="rdBillingq4" value="7"></td>
                                    <td><input type="radio" name="rdBillingq4" value="8"></td>
                                </tr>
                            </tbody>
                    </table>
                          <div id="feedbackComment" class="hidden" >
                            <input type="text" id="txtBillingObservation2" class="form-control mt-3" name="txtBillingObservation2"  placeholder="Any other observation"  /><br />
                            <button type="button" id="Button35" class="btn btn-secondary mt-2" OnClick="btnBillingFeedbackNo">Submit your response</button>
                        </div>
                  
                    </div>
                   </div>
                   </div>
                </div> <br />

         <%--  -----------------------------------------------investigationfeedback--------------------------------------------------------------------------------------------%>

                 <div class="Dquestions">
    <div class="card">
        <div class="card-header">
            जांच फीडबैक
        </div>
        <div class="card-body">
            <h4>क्या आप संतुष्ट हैं?</h4>
            <input type="radio" id="RadioButton3" name="Q1" value="Yes"/>हाँ
            <input type="radio" id="RadioButton4" name="Q1" value="No" />नहीं
            <br />
                    
                  <input type="text" id="txtInvestigationObservation1"  name="txtInvestigationObservation1" class="form-control hidden mt-3" placeholder="Any Other Observation?" />

                   <%--   <button  type="button" id="Button1" CssClass="hidden btn btn-primary mt-2 ">Submit your Response</button>--%>
                         <asp:Button ID="Button14" runat="server" CssClass="hidden btn btn-primary mt-2 " OnClick="btninvestigationFeedbackYES"  Text="Submit your Response" /> 
                  
                    
                    <div id="feedbackTable" class="hidden">

                          <table>
                      <thead>
                                <tr>
                                    <th>Ratings</th>
                                    <th>Always</th>
                                    <th>Usually</th>
                                    <th>Sometimes</th>
                                    <th>Never</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                 <td>आप ब्लड सैंपल लेने वाले स्टाफ के कौशल को कैसे रेट करेंगे?</td>
                                    <td><input type="radio" name="rdInvestigationq1" value="1"></td>
                                    <td><input type="radio" name="rdInvestigationq1" value="2"></td>
                                    <td><input type="radio" name="rdInvestigationq1" value="3"></td>
                                    <td><input type="radio" name="rdInvestigationq1" value="4"></td>
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
                            </thead>
                            <tbody>
                                <tr>
                                    <td>क्या आपको ब्लड सैंपल लेने से पहले उचित रूप से सूचित किया गया?</td>
                                    <td><input type="radio" name="rdInvestigationq2" value="5"></td>
                                    <td><input type="radio" name="rdInvestigationq2" value="6"></td>
                                    <td><input type="radio" name="rdInvestigationq2" value="7"></td>
                                    <td><input type="radio" name="rdInvestigationq2" value="8"></td>
                                </tr>
                                <tr>
                                      <td>क्या आपको रेडियोलॉजी स्टाफ द्वारा प्रक्रिया समझाई गई थी?</td>
                                    <td><input type="radio" name="rdInvestigationq3" value="5"></td>
                                    <td><input type="radio" name="rdInvestigationq3" value="6"></td>
                                    <td><input type="radio" name="rdInvestigationq3" value="7"></td>
                                    <td><input type="radio" name="rdInvestigationq3" value="8"></td>
                                </tr>
                                <tr>
                                   <td>क्या आप लैब रिपोर्ट की समयबद्धता से संतुष्ट हैं?</td>
                                    <td><input type="radio" name="rdInvestigationq4" value="5"></td>
                                    <td><input type="radio" name="rdInvestigationq4" value="6"></td>
                                    <td><input type="radio" name="rdInvestigationq4" value="7"></td>
                                    <td><input type="radio" name="rdInvestigationq4" value="8"></td>
                                </tr>
                            </tbody>
                    </table>
                          <div id="feedbackComment" class="hidden" >
                            <input type="text" id="txtInvestigationObservation2" class="form-control mt-3" name="txtInvestigationObservation2" placeholder="Any other observation"  /><br />
                            <button type="button" id="Button35" class="btn btn-secondary mt-2" OnClick="btnInvestigationFeedbackNo">Submit your response</button>
                        </div>
                  
                    </div>
                   </div>
                   </div>
                </div> <br />

               <%----------------------------------------------------------------------------------------- f&B feedback --------------------------------------------------------------------------%>

                 <div class="Dquestions">
                  <div class="card">
                  <div class="card-header">
                  F-and-Bquestions
                     </div>
                      <div class="card-body">
                     <h4>Are You Satisfied?</h4>                
                    <input type="radio" id="RadioButton3" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton4" name="Q1" value="No" />No
                    <br />
                    
                  <input type="text" id="txtf&bObservation1" name="txtf&bObservation1" class="form-control hidden mt-3" placeholder="Any Other Observation?" />
                     <%-- <button  type="button" id="Button1" CssClass="hidden btn btn-primary mt-2 ">Submit your Response</button>--%>               

                 <asp:Button ID="Button15" runat="server" CssClass="hidden btn btn-primary mt-2 " OnClick=" btnFBFeedbackYES"  Text="Submit your Response" /> 
                  
                    
                    <div id="feedbackTable" class="hidden">

                          <table>
                       <thead>
                                <tr>
                                    <th>Ratings</th>
                                    <th>Always</th>
                                    <th>Usually</th>
                                    <th>Sometimes</th>
                                    <th>Never</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>खाने की गुणवत्ता कैसी थी (जैसे स्वाद, प्रस्तुति)?</td>
                                    <td><input type="radio" name="rdF&Bq1" value="1"></td>
                                    <td><input type="radio" name="rdF&Bq1" value="2"></td>
                                    <td><input type="radio" name="rdF&Bq1" value="3"></td>
                                    <td><input type="radio" name="rdF&Bq1" value="4"></td>
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
                            </thead>
                            <tbody>
                                <tr>
                                   <td>आपको डाइट काउंसलिंग कितनी स्पष्ट लगी?</td>
                                    <td><input type="radio" name="rdF&Bq2" value="5"></td>
                                    <td><input type="radio" name="rdF&Bq2" value="6"></td>
                                    <td><input type="radio" name="rdF&Bq2" value="7"></td>
                                    <td><input type="radio" name="rdF&Bq2" value="8"></td>
                                </tr>
                                <tr>
                                     <td>भोजन की सही और समय पर डिलीवरी को आप कैसे रेट करेंगे?</td>
                                    <td><input type="radio" name="rdF&Bq3" value="5"></td>
                                    <td><input type="radio" name="rdF&Bq3" value="6"></td>
                                    <td><input type="radio" name="rdF&Bq3" value="7"></td>
                                    <td><input type="radio" name="rdF&Bq3" value="8"></td>
                                </tr>
                           
                            </tbody>
                    </table>
                          <div id="feedbackComment" class="hidden" >
                            <input type="text" id="txtf&bObservation2" class="form-control mt-3" name="txtf&bObservation2"  placeholder="Any other observation"  /><br />
                            <button type="button" id="Button35" class="btn btn-secondary mt-2" OnClick="btnFBFeedbackNo">Submit your response</button>
                        </div>
                  
                    </div>
                   </div>
                   </div>
                </div> <br />

              <%--  ----------------------------------------------------------------------housekeeping feedback -------------------------------------------------------------------------------%>

                  <div class="Dquestions">
                    <div class="card">
                     <div class="card-header">
                         हाउसकीपिंग फीडबैक
                     </div>
                        <div class="card-body">
                     <h4>क्या आप संतुष्ट हैं?</h4>
                   
                   
                    <input type="radio" id="RadioButton3" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton4" name="Q1" value="No" />No
                    <br />
                 
 
                  <input type="text" id="txtHouseKeepingObservation1" name="txtHouseKeepingObservation1" class="form-control hidden mt-3" placeholder="Any Other Observation?" />
                    <%--  <button  type="button" id="Button1"  CssClass="hidden btn btn-primary mt-2 ">Submit your Response</button>--%>
                         <asp:Button ID="Button16" runat="server" CssClass="hidden btn btn-primary mt-2 " OnClick="btnHouseKeepingFeedbackYES "  Text="Submit your Response" /> 
                  
                    
                    <div id="feedbackTable" class="hidden">

                          <table>
                     <thead>
                                <tr>
                                    <th>Ratings</th>
                                    <th>Always</th>
                                    <th>Usually</th>
                                    <th>Sometimes</th>
                                    <th>Never</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                   <td>आपको कमरे और आसपास के क्षेत्रों की सफाई का मानक कैसा लगा?</td>
                                    <td><input type="radio" name="rdHouseKeepingq1" value="1"></td>
                                    <td><input type="radio" name="rdHouseKeepingq1" value="2"></td>
                                    <td><input type="radio" name="rdHouseKeepingq1" value="3"></td>
                                    <td><input type="radio" name="rdHouseKeepingq1" value="4"></td>
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
                            </thead>
                            <tbody>
                                <tr>
                                     <td>हाउसकीपिंग कितनी जल्दी आपकी आवश्यकता का जवाब देती थी?</td>
                                    <td><input type="radio" name="rdHouseKeepingq2" value="5"></td>
                                    <td><input type="radio" name="rdHouseKeepingq2" value="6"></td>
                                    <td><input type="radio" name="rdHouseKeepingq2" value="7"></td>
                                    <td><input type="radio" name="rdHouseKeepingq2" value="8"></td>
                                </tr>
                                <tr>
                                     <td>हाउसकीपिंग स्टाफ का व्यवहार आप कैसे रेट करेंगे?</td>
                                    <td><input type="radio" name="rdHouseKeepingq3" value="5"></td>
                                    <td><input type="radio" name="rdHouseKeepingq3" value="6"></td>
                                    <td><input type="radio" name="rdHouseKeepingq3" value="7"></td>
                                    <td><input type="radio" name="rdHouseKeepingq3" value="8"></td>
                                </tr>
                           
                            </tbody>
                           </table>
                          <div id="feedbackComment" class="hidden" >
                            <input type="text" id="txtHouseKeepingObservation2" name="txtHouseKeepingObservation2" class="form-control mt-3"  placeholder="Any other observation"  /><br />
                            <button type="button" id="Button35" class="btn btn-secondary mt-2" OnClick="btnHouseKeepingFeedbackNo">Submit your response</button>
                        </div>                  
                    </div>
                   </div>
                   </div>
                </div> <br />

               <%----------------------------------------------------------------- overall experince --------------------------------------------------------------------------------------------------%>

                 <div class="Dquestions">
                 <div class="card">
                  <div class="card-header">
                        समग्र अनुभव
                     </div>
                     <div class="card-body">
                     <h4>क्या आप संतुष्ट हैं?</h4>
                    <input type="radio" id="RadioButton3" name="Q1" value="Yes" />हाँ
                     <input type="radio" id="RadioButton4" name="Q1" value="No" />नहीं
                    <br />

 
                  <input type="text" id="txtOverallObservation1" name="txtOverallObservation1"  class="form-control hidden mt-3" placeholder="Any Other Observation?" />
                    <%--  <button  type="button" id="Button1"   CssClass="hidden btn btn-primary mt-2 " >Submit your Response</button>--%>
                   <asp:Button ID="Button17" runat="server" CssClass="hidden btn btn-primary mt-2 " OnClick="btnOverallFeedbackYES"  Text="Submit your Response" /> 
                  
                    
                    <div id="feedbackTable" class="hidden">

                          <table>
                   <thead>
                                <tr>
                                    <th>Ratings</th>
                                    <th>Always</th>
                                    <th>Usually</th>
                                    <th>Sometimes</th>
                                    <th>Never</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                   <td>कार पार्किंग की सुविधा कितनी अच्छी थी?</td>
                                    <td><input type="radio" name="rdOverAllq1" value="1"></td>
                                    <td><input type="radio" name="rdOverAllq1" value="2"></td>
                                    <td><input type="radio" name="rdOverAllq1" value="3"></td>
                                    <td><input type="radio" name="rdOverAllq1" value="4"></td>
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
                            </thead>
                            <tbody>
                                <tr>
                                    <td>क्या अस्पताल में साइनबोर्ड मरीजों और आगंतुकों की मदद करते हैं?</td>
                                    <td><input type="radio" name="rdOverAllq2" value="5"></td>
                                    <td><input type="radio" name="rdOverAllq2" value="6"></td>
                                    <td><input type="radio" name="rdOverAllq2" value="7"></td>
                                    <td><input type="radio" name="rdOverAllq2" value="8"></td>
                                </tr>
                                <tr>
                                     <td>अस्पताल की फार्मेसी सेवाओं को आप कैसे रेट करेंगे?</td>
                                    <td><input type="radio" name="rdOverAllq3" value="5"></td>
                                    <td><input type="radio" name="rdOverAllq3" value="6"></td>
                                    <td><input type="radio" name="rdOverAllq3" value="7"></td>
                                    <td><input type="radio" name="rdOverAllq3" value="8"></td>
                                </tr>

                                 <tr>
                                     <td>क्या हमारा स्टाफ आपकी गोपनीयता और आराम का सम्मान करता है?</td>
                                    <td><input type="radio" name="rdOverAllq4" value="5"></td>
                                    <td><input type="radio" name="rdOverAllq4" value="6"></td>
                                    <td><input type="radio" name="rdOverAllq4" value="7"></td>
                                    <td><input type="radio" name="rdOverAllq4" value="8"></td>
                                </tr>
                                <tr>
                                    <td>क्या आप अस्पताल की सेवाओं को मूल्यवान मानते हैं?</td>
                                    <td><input type="radio" name="rdOverAllq5" value="5"></td>
                                    <td><input type="radio" name="rdOverAllq5" value="6"></td>
                                    <td><input type="radio" name="rdOverAllq5" value="7"></td>
                                    <td><input type="radio" name="rdOverAllq5" value="8"></td>
                                </tr>
                                 <tr>
                                     <td>क्या आप भविष्य में स्वास्थ्य देखभाल के लिए इस अस्पताल में आना चाहेंगे?</td>
                                    <td><input type="radio" name="rdOverAllq6" value="5"></td>
                                    <td><input type="radio" name="rdOverAllq6" value="6"></td>
                                    <td><input type="radio" name="rdOverAllq6" value="7"></td>
                                    <td><input type="radio" name="rdOverAllq6" value="8"></td>
                                </tr>
                                 <tr>
                                     <td>क्या आप इस अस्पताल की सिफारिश अपने दोस्तों और परिवार को करेंगे?</td>
                                    <td><input type="radio" name="rdOverAllq7" value="5"></td>
                                    <td><input type="radio" name="rdOverAllq7" value="6"></td>
                                    <td><input type="radio" name="rdOverAllq7" value="7"></td>
                                    <td><input type="radio" name="rdOverAllq7" value="8"></td>
                                </tr>                           
                            </tbody>
                    </table>
                          <div id="feedbackComment" class="hidden" >
                            <input type="text" id="txtOverallObservation2" class="form-control mt-3" name="txtOverallObservation2" placeholder="Any other observation"  /><br />
                            <button type="button" id="Button35" class="btn btn-secondary mt-2" OnClick="btnOverallFeedbackNo">Submit your response</button>
                        </div>
                  </div>
                    </div>
                     </div>
               </div> <br />  
                
                <asp:Button ID="Button19" runat="server" class="btn btn-secondary mt-2" Text="Save & Process" OnClick="Button12_Click" />
            </div>
        </header>
    </main>
</asp:Content>
