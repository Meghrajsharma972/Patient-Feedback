<%@ Page Title="Patientquestions" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ipdquestionsENG.aspx.cs" Inherits="Patient_Feedback.About" %>

  <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--  <h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>--%>
    

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
            <div class="contener4">
                <div class="txt">
                     <h1>IPD Patients Experince</h1>
                     <p>If you are/were a patient admitted to the hospital,please answer the following questions to let us know of your experince  to the hospital.To answer, please select appropriate response.</p>
                </div>                 
               <%----------------------------------------------------- doctore feedback-----------------------------------------------------------------%>
                  <div class="Dquestions">
                  <div class="card">
                 <div class="card-header">
                       Doctor's Feedback
                 </div>
                 <div class="card-body">
                 <h4>Are You Satisfied?</h4>
                   
                    <input type="radio" id="RadioButton3" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton4" name="Q1" value="No" />No
                    <br />                    
                      <%-- <input type="text" id="TextBox1" class="hidden" placeholder="Any Other Observation?" />--%>
                     <%-- <input type="text" id="TextBox1" name="TextBox1"  class="hidden form-control mt-3" placeholder="Any Other Observation?" /> --%>
               <asp:TextBox ID="TextBox1" runat="server" CssClass="hidden form-control mt-3" Placeholder="Any Other Observation?"></asp:TextBox>
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
                                    <td>How often did your doctor treat you with courtesy and respect?</td>
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
                                    <td>How clearly did the doctor explain your condition and courses of treatment?</td>
                                    <td><input type="radio" name="DRq2" value="5"></td>
                                    <td><input type="radio" name="DRq2" value="6"></td>
                                    <td><input type="radio" name="DRq2" value="7"></td>
                                    <td><input type="radio" name="DRq2" value="8"></td>
                                </tr>
                                <tr>
                                    <td>Are you satisfied with the duration and quality of time the doctor spent with you?</td>
                                    <td><input type="radio" name="DRq3" value="5"></td>
                                    <td><input type="radio" name="DRq3" value="6"></td>
                                    <td><input type="radio" name="DRq3" value="7"></td>
                                    <td><input type="radio" name="DRq3" value="8"></td>
                                </tr>
                                <tr>
                                    <td>How confident were you in your doctor’s ability to treat you?</td>
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
                        Nursing Feedback
                    </div>
                        <div class="card-body">
                        <h4>Are You Satisfied?</h4>
                   
                    <input type="radio" id="RadioButton5" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton6" name="Q1" value="No" />No
                    <br />
                    
                <%--  <input type="text" id="TextBox1" class="hidden" placeholder="Any Other Observation?" />--%>
                     <input type="text" id="txtfeebdackObservation1" name="txtfeebdackObservation1" class="form-control hidden mt-3" placeholder="Any Other Observation?" />

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
                                   <td>How would you describe the nursing care you received? </td>
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
                                    <td>Did the nurse communicate with you in a wayyou could understand?</td>
                                    <td><input type="radio" name="Nq2" value="5"></td>
                                    <td><input type="radio" name="Nq2" value="6"></td>
                                    <td><input type="radio" name="Nq2" value="7"></td>
                                    <td><input type="radio" name="Nq2" value="8"></td>
                                </tr>
                                <tr>
                                     <td>How did the nurse listen and understandyour problem patiently?</td>
                                    <td><input type="radio" name="Nq3" value="5"></td>
                                    <td><input type="radio" name="Nq3" value="6"></td>
                                    <td><input type="radio" name="Nq3" value="7"></td>
                                    <td><input type="radio" name="Nq3" value="8"></td>
                                </tr>
                                <tr>
                                    <td>How often did the nurse respond to the call promptly?</td>
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

                  <div class="Dquestions">
                      <div class="card">
                       <div class="card-header">
                      Admission Feedback
                     </div>
                          <div class="card-body">
                     <h4>Are You Satisfied?</h4>
                     
                   
                    <input type="radio" id="RadioButton3" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton4" name="Q1" value="No" />No
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
                                    <td>How was your experince while wating to get admitted in the hospital?</td>
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
                                    <td>How adequately were you provided with information required for your stay at time of addmission?</td>
                                    <td><input type="radio" name="Adq2" value="5"></td>
                                    <td><input type="radio" name="Adq2" value="6"></td>
                                    <td><input type="radio" name="Adq2" value="7"></td>
                                    <td><input type="radio" name="Adq2" value="8"></td>
                                </tr>
                                <tr>
                                    <td>How courteous and helpfull wasthe reception staff at the time of admission?</td>
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
                    Discharge Feedback
                     </div>
                        <div class="card-body">
                     <h4>Are You Satisfied?</h4>
                   
                   
                    <input type="radio" id="RadioButton3" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton4" name="Q1" value="No" />No
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
                                   <td>How clearly wereyouexplained your discharge summary and follow uo instruction? </td>
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
                                    <td>How clearly were you briefed about your discharge?</td>
                                    <td><input type="radio" name="Dq2" value="5"></td>
                                    <td><input type="radio" name="Dq2" value="6"></td>
                                    <td><input type="radio" name="Dq2" value="7"></td>
                                    <td><input type="radio" name="Dq2" value="8"></td>
                                </tr>
                                <tr>
                                     <td>Wasyour discharge done in timely and effective manner?</td>
                                    <td><input type="radio" name="Dq3" value="5"></td>
                                    <td><input type="radio" name="Dq3" value="6"></td>
                                    <td><input type="radio" name="Dq3" value="7"></td>
                                    <td><input type="radio" name="Dq3" value="8"></td>
                                </tr>
                                <tr>
                                    <td>How comfortable was your stay in the hospital?</td>
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
                            Billing Feedback
                     </div>
                         <div class="card-body">
                     <h4>Are You Satisfied?</h4>   
                    
                                                                       
                     
                    <input type="radio" id="RadioButton3" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton4" name="Q1" value="No" />No
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
                                   <td>How clearly where you explained the estimated cost for you treatment?</td>
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
                                    <td>How would you rate the courtesy of billing staff?</td>
                                    <td><input type="radio" name="rdBillingq2" value="5"></td>
                                    <td><input type="radio" name="rdBillingq2" value="6"></td>
                                    <td><input type="radio" name="rdBillingq2" value="7"></td>
                                    <td><input type="radio" name="rdBillingq2" value="8"></td>
                                </tr>
                                <tr>
                                     <td>Was your final bill in line with your estimated?</td>
                                    <td><input type="radio" name="rdBillingq3" value="5"></td>
                                    <td><input type="radio" name="rdBillingq3" value="6"></td>
                                    <td><input type="radio" name="rdBillingq3" value="7"></td>
                                    <td><input type="radio" name="rdBillingq3" value="8"></td>
                                </tr>
                                <tr>
                                    <td>How would you rate park hospital TPA/Insurance desk?</td>
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
                            Investigation Feedback
                     </div>
                    <div class="card-body">
                     <h4>Are You Satisfied?</h4>
                   
                    <input type="radio" id="RadioButton3" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton4" name="Q1" value="No" />No
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
                                   <td>How do you rate the skill level of the staff collecting the blood samples?</td>
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
                                    <td>Where you appropriately considered before drawing the blood samples?</td>
                                    <td><input type="radio" name="rdInvestigationq2" value="5"></td>
                                    <td><input type="radio" name="rdInvestigationq2" value="6"></td>
                                    <td><input type="radio" name="rdInvestigationq2" value="7"></td>
                                    <td><input type="radio" name="rdInvestigationq2" value="8"></td>
                                </tr>
                                <tr>
                                     <td>Were you explained the radiology procedure by the radiology staff?</td>
                                    <td><input type="radio" name="rdInvestigationq3" value="5"></td>
                                    <td><input type="radio" name="rdInvestigationq3" value="6"></td>
                                    <td><input type="radio" name="rdInvestigationq3" value="7"></td>
                                    <td><input type="radio" name="rdInvestigationq3" value="8"></td>
                                </tr>
                                <tr>
                                    <td>How satisfied are you with the timeliness of the lab reporting?</td>
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
                                   <td>How was the quality of food (e.g. taste,presentation)?</td>
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
                                    <td>How clear to you was your diet counselling?</td>
                                    <td><input type="radio" name="rdF&Bq2" value="5"></td>
                                    <td><input type="radio" name="rdF&Bq2" value="6"></td>
                                    <td><input type="radio" name="rdF&Bq2" value="7"></td>
                                    <td><input type="radio" name="rdF&Bq2" value="8"></td>
                                </tr>
                                <tr>
                                     <td>How would you rate the correctness and timelines of the food delivered?</td>
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
                          Housekeeping Feedback
                     </div>
                        <div class="card-body">
                     <h4>Are You Satisfied?</h4>
                   
                   
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
                                   <td>How did you find the cleanline standard of the room and surrounding areas? </td>
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
                                    <td>How often did housekeeping respond promptly to your need?</td>
                                    <td><input type="radio" name="rdHouseKeepingq2" value="5"></td>
                                    <td><input type="radio" name="rdHouseKeepingq2" value="6"></td>
                                    <td><input type="radio" name="rdHouseKeepingq2" value="7"></td>
                                    <td><input type="radio" name="rdHouseKeepingq2" value="8"></td>
                                </tr>
                                <tr>
                                     <td> How would you rate the behaviour of the housekeeping staff?</td>
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
                       Overall Experince
                     </div>
                     <div class="card-body">
                     <h4>Are You Satisfied?</h4>
                    <input type="radio" id="RadioButton3" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton4" name="Q1" value="No" />No
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
                                   <td>How convenient was the car parking?</td>
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
                                    <td>Does signage in the hospital aid in easy movement of patient and visitors?</td>
                                    <td><input type="radio" name="rdOverAllq2" value="5"></td>
                                    <td><input type="radio" name="rdOverAllq2" value="6"></td>
                                    <td><input type="radio" name="rdOverAllq2" value="7"></td>
                                    <td><input type="radio" name="rdOverAllq2" value="8"></td>
                                </tr>
                                <tr>
                                     <td>How would you rate the pharmacy services of the hospital?</td>
                                    <td><input type="radio" name="rdOverAllq3" value="5"></td>
                                    <td><input type="radio" name="rdOverAllq3" value="6"></td>
                                    <td><input type="radio" name="rdOverAllq3" value="7"></td>
                                    <td><input type="radio" name="rdOverAllq3" value="8"></td>
                                </tr>

                                 <tr>
                                     <td> Does our staff have respect and concern for our privacy and comfort?</td>
                                    <td><input type="radio" name="rdOverAllq4" value="5"></td>
                                    <td><input type="radio" name="rdOverAllq4" value="6"></td>
                                    <td><input type="radio" name="rdOverAllq4" value="7"></td>
                                    <td><input type="radio" name="rdOverAllq4" value="8"></td>
                                </tr>
                                <tr>
                                     <td>Do you consider service offered by the hospital as value for money?</td>
                                    <td><input type="radio" name="rdOverAllq5" value="5"></td>
                                    <td><input type="radio" name="rdOverAllq5" value="6"></td>
                                    <td><input type="radio" name="rdOverAllq5" value="7"></td>
                                    <td><input type="radio" name="rdOverAllq5" value="8"></td>
                                </tr>
                                 <tr>
                                     <td>Would you visit PARK for future health care needs?</td>
                                    <td><input type="radio" name="rdOverAllq6" value="5"></td>
                                    <td><input type="radio" name="rdOverAllq6" value="6"></td>
                                    <td><input type="radio" name="rdOverAllq6" value="7"></td>
                                    <td><input type="radio" name="rdOverAllq6" value="8"></td>
                                </tr>
                                 <tr>
                                     <td> Would you recommend this hospital to your frends and femily?</td>
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
