<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="opdquestionHIN.aspx.cs" Inherits="Patient_Feedback.opdquestionHIN" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">

     
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
         <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
                      body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .header, footer {
            background-color: darkblue;
            padding: 20px;
            text-align: center;
            color: white;
        }

        .txt {
            color: lightseagreen;
            text-align: center;
            margin-bottom: 30px;
        }

                    .Dquestions, .Nquestions, .Aquestions, .Dquestions, .Bquestions, .Iquestions, .F-and-Bquestions, .Hquestions, .Oquestions
                    {
                           margin-bottom: 20px;
                    }

                .hidden {
            display: none;
        }

        .card-header {
            background-color: #006c91; /* Dark cyan/blue color */
            color: white;
            text-align: center;
            font-size: 1.25rem;
            padding: 10px;
        }

        #feedbackTable table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
        }

        #feedbackTable th, #feedbackTable td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }

        #feedbackTable th {
            background-color: lightseagreen;
            color: white;
        }

        #feedbackTable tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        </style>


         <script>
             document.addEventListener('DOMContentLoaded', function ()
             {

                       var questions = document.querySelectorAll('.Dquestions, .Nquestions, .Aquestions, .Dquestions, .Bquestions, .Iquestions, .F-and-Bquestions, .Hquestions, .Oquestions');

                 questions.forEach(function (question)
                 {
                var yesRadioButton = question.querySelector('input[type=radio][value=Yes]');
                var noRadioButton = question.querySelector('input[type=radio][value=No]');
                var textBox = question.querySelector('input[type=text]');
                var submitButton = question.querySelector('button[type=button]');
                var feedbackTable = question.querySelector('#feedbackTable');
                var feedbackComment = question.querySelector('#feedbackComment');

                yesRadioButton.addEventListener('click', function () {
                    textBox.classList.remove('hidden');
                    submitButton.classList.remove('hidden');
                    feedbackTable.classList.add('hidden');
                    feedbackComment.classList.add('hidden');
                });

                noRadioButton.addEventListener('click', function () {
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
              
                
               <%-- doctore feedback--%>

                  <div class="Dquestions">
                    <h1>Doctor`s Feedback</h1>
                    <h4>Are You Satisfied?</h4>
                   
                    <input type="radio" id="RadioButton3" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton4" name="Q1" value="No" />No
                    <br />
                    
                  <input type="text" id="TextBox1" class="hidden" placeholder="Any Other Observation?" />
                      <button  type="button" id="Button1" class="hidden">Submit your Response</button>
                  
                    
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
                        <td>डॉक्टर ने आपकी समस्या को किस हद तक समझा?</td>
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
                                          <td>डॉक्टर ने आपकी स्थिति और उपचार के कोर्स को कितनी स्पष्टता से समझाया?</td>
                                           <td><asp:RadioButton ID="RadioButton9" runat="server" GroupName="drfdbk1" /></td>
                                           <td><asp:RadioButton ID="RadioButton10" runat="server" GroupName="drfdbk1" /></td>
                                           <td><asp:RadioButton ID="RadioButton11" runat="server" GroupName="drfdbk1" /></td>
                                           <td><asp:RadioButton ID="RadioButton12" runat="server"  GroupName="drfdbk1" /></td>      
                                              <tr>
                                       <td>आप डॉक्टर के इंतजार के समय को कैसे वर्णन करेंगे?</td>
                                         <td><asp:RadioButton ID="RadioButton13" runat="server" GroupName="drfdbk2" /></td>
                                           <td><asp:RadioButton ID="RadioButton14" runat="server" GroupName="drfdbk2" /></td>
                                           <td><asp:RadioButton ID="RadioButton15" runat="server" GroupName="drfdbk2" /></td>
                                           <td><asp:RadioButton ID="RadioButton16" runat="server"  GroupName="drfdbk2" /></td>      
                                      </tr>
                                      <tr>
                                          <td> डॉक्टर द्वारा दी गई शिष्टाचार और सम्मान को आप कैसे रेट करेंगे?</td>
                                          <td><asp:RadioButton ID="RadioButton17" runat="server" GroupName="drfdbk3" /></td>
                                          <td><asp:RadioButton ID="RadioButton18" runat="server" GroupName="drfdbk3" /></td>
                                          <td><asp:RadioButton  ID="RadioButton19" runat="server" GroupName="drfdbk3" /></td>
                                          <td><asp:RadioButton ID="RadioButton20" runat="server" GroupName="drfdbk3" /></td>
                                      </tr>
                                  </tbody>

                              </thead>
                    </table>
                          <div id="feedbackComment" class="hidden" >
                            <input type="text" id="TextBox35" placeholder="Any other observation"  /><br />
                            <button type="button" id="Button35">Submit your response</button>
                        </div>
                  
                    </div>
                   
                   
                </div> <br />   

              <%--   lab feedback --%>
                
               <div class="Dquestions">
                    <h1>Lab Services</h1>
                    <h4>Are You Satisfied?</h4>
                   
                    <input type="radio" id="RadioButton3" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton4" name="Q1" value="No" />No
                    <br />
                    
                  <input type="text" id="TextBox1" class="hidden" placeholder="Any Other Observation?" />
                      <button  type="button" id="Button1" class="hidden">Submit your Response</button>
                  
                    
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
                        <td>सैंपल संग्रह के लिए इंतजार के समय को आप कैसे वर्णन करेंगे?</td>
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
                                          <td>Were you appropriately considered before drawing the blood samples?</td>
                                           <td><asp:RadioButton ID="RadioButton23" runat="server" GroupName="drfdbk1" /></td>
                                           <td><asp:RadioButton ID="RadioButton24" runat="server" GroupName="drfdbk1" /></td>
                                           <td><asp:RadioButton ID="RadioButton25" runat="server" GroupName="drfdbk1" /></td>
                                           <td><asp:RadioButton ID="RadioButton26" runat="server"  GroupName="drfdbk1" /></td>      
                                              <tr>
                                       <td>How did you rate the skill level ofthe staff collecting samples?</td>
                                         <td><asp:RadioButton ID="RadioButton27" runat="server" GroupName="drfdbk2" /></td>
                                           <td><asp:RadioButton ID="RadioButton28" runat="server" GroupName="drfdbk2" /></td>
                                           <td><asp:RadioButton ID="RadioButton29" runat="server" GroupName="drfdbk2" /></td>
                                           <td><asp:RadioButton ID="RadioButton30" runat="server"  GroupName="drfdbk2" /></td>      
                                      </tr>
                                      <tr>
                                          <td>How would you rate the courtesy of the sample collection staff?</td>
                                          <td><asp:RadioButton ID="RadioButton31" runat="server" GroupName="drfdbk3" /></td>
                                          <td><asp:RadioButton ID="RadioButton32" runat="server" GroupName="drfdbk3" /></td>
                                          <td><asp:RadioButton  ID="RadioButton33" runat="server" GroupName="drfdbk3" /></td>
                                          <td><asp:RadioButton ID="RadioButton34" runat="server" GroupName="drfdbk3" /></td>
                                      </tr>
                                  </tbody>
                    </table>
                          <div id="feedbackComment" class="hidden" >
                            <input type="text" id="TextBox35" placeholder="Any other observation"  /><br />
                            <button type="button" id="Button35">Submit your response</button>
                        </div>
                  
                    </div>
                   
                   
                </div> <br />   



                <%--Radiology feedback--%>



                  <div class="Dquestions">
                    <h1>Radiology</h1>
                    <h4>Are You Satisfied?</h4>
                   
                    <input type="radio" id="RadioButton3" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton4" name="Q1" value="No" />No
                    <br />
                    
                  <input type="text" id="TextBox1" class="hidden" placeholder="Any Other Observation?" />
                      <button  type="button" id="Button1" class="hidden">Submit your Response</button>
                  
                    
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
                                          <td>How would you describe the nursing care you received? </td>
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
                                          <td>How clearly did the doctor explain  your  condition  and courses of  tratment </td>
                                           <td><asp:RadioButton ID="RadioButton39" runat="server" GroupName="drfdbk5" /></td>
                                           <td><asp:RadioButton ID="RadioButton40" runat="server" GroupName="drfdbk5" /></td>
                                           <td><asp:RadioButton ID="RadioButton41" runat="server" GroupName="drfdbk5" /></td>
                                           <td><asp:RadioButton ID="RadioButton42" runat="server"  GroupName="drfdbk5" /></td>      
                                              <tr>
                                       <td>Are You satisfy ? Duration and quality of time the doctor  spent with you </td>
                                         <td><asp:RadioButton ID="RadioButton43" runat="server" GroupName="drfdbk6" /></td>
                                           <td><asp:RadioButton ID="RadioButton44" runat="server" GroupName="drfdbk6" /></td>
                                           <td><asp:RadioButton ID="RadioButton45" runat="server" GroupName="drfdbk6" /></td>
                                           <td><asp:RadioButton ID="RadioButton46" runat="server"  GroupName="drfdbk6" /></td>      
                                      </tr>
                                      <tr>
                                          <td>How confident were you on your doctor`sability to treat you?</td>
                                          <td><asp:RadioButton ID="RadioButton47" runat="server" GroupName="drfdbk7" /></td>
                                          <td><asp:RadioButton ID="RadioButton48" runat="server" GroupName="drfdbk7" /></td>
                                          <td><asp:RadioButton  ID="RadioButton49" runat="server" GroupName="drfdbk7" /></td>
                                          <td><asp:RadioButton ID="RadioButton50" runat="server" GroupName="drfdbk7" /></td>
                                      </tr>
                                  </tbody>

                    </table>
                          <div id="feedbackComment" class="hidden" >
                            <input type="text" id="TextBox35" placeholder="Any other observation"  /><br />
                            <button type="button" id="Button35">Submit your response</button>
                        </div>
                  
                    </div>
                   
                   
                </div> <br />   


              <%--  Frontoffice/overall feedback--%>


                 <div class="Dquestions">
                    <h1>Frontoffice/overall</h1>
                    <h4>Are You Satisfied?</h4>
                   
                    <input type="radio" id="RadioButton3" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton4" name="Q1" value="No" />No
                    <br />
                    
                  <input type="text" id="TextBox1" class="hidden" placeholder="Any Other Observation?" />
                      <button  type="button" id="Button1" class="hidden">Submit your Response</button>
                  
                    
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
                                          <td>How would you describe the nursing care you received? </td>
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
                                          <td>How clearly did the doctor explain  your  condition  and courses of  tratment </td>
                                           <td><asp:RadioButton ID="RadioButton71" runat="server" GroupName="drfdbk5" /></td>
                                           <td><asp:RadioButton ID="RadioButton72" runat="server" GroupName="drfdbk5" /></td>
                                           <td><asp:RadioButton ID="RadioButton73" runat="server" GroupName="drfdbk5" /></td>
                                           <td><asp:RadioButton ID="RadioButton74" runat="server"  GroupName="drfdbk5" /></td>      
                                              <tr>
                                       <td>Are You satisfy ? Duration and quality of time the doctor  spent with you </td>
                                         <td><asp:RadioButton ID="RadioButton75" runat="server" GroupName="drfdbk6" /></td>
                                           <td><asp:RadioButton ID="RadioButton76" runat="server" GroupName="drfdbk6" /></td>
                                           <td><asp:RadioButton ID="RadioButton77" runat="server" GroupName="drfdbk6" /></td>
                                           <td><asp:RadioButton ID="RadioButton78" runat="server"  GroupName="drfdbk6" /></td>      
                                      </tr>
                                      <tr>
                                          <td>How confident were you on your doctor`sability to treat you?</td>
                                          <td><asp:RadioButton ID="RadioButton79" runat="server" GroupName="drfdbk7" /></td>
                                          <td><asp:RadioButton ID="RadioButton80" runat="server" GroupName="drfdbk7" /></td>
                                          <td><asp:RadioButton  ID="RadioButton81" runat="server" GroupName="drfdbk7" /></td>
                                          <td><asp:RadioButton ID="RadioButton82" runat="server" GroupName="drfdbk7" /></td>
                                      </tr>
                                  </tbody>

                              </thead>

                    </table>
                          <div id="feedbackComment" class="hidden" >
                            <input type="text" id="TextBox35" placeholder="Any other observation"  /><br />
                            <button type="button" id="Button35">Submit your response</button>
                        </div>
                  
                    </div>
                   
                   
                </div> <br />  

 
                
                <asp:Button ID="Button12" runat="server" Text="Submit your Response" OnClick="Button1_Click"   />
            </div>
        </header>
    </main>

</asp:Content>
