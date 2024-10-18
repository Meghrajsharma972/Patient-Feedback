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
                   <p>यदि आप अस्पताल में भर्ती मरीज हैं/थे, तो कृपया निम्नलिखित प्रश्नों के उत्तर देकर हमें अस्पताल में आपके अनुभव के बारे में बताएं। उत्तर देने के लिए, कृपया उपयुक्त प्रतिक्रिया का चयन करें।</p>

                </div>
              
                
               <%-- doctore feedback--%>

                  <div class="Dquestions">
                    <h1>डॉक्टर की प्रतिक्रिया</h1>
                    <h4>क्या आप संतुष्ट हैं?</h4>
                    
                   
                    <input type="radio" id="RadioButton3" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton4" name="Q1" value="No" />No
                    <br />
                    
                  <input type="text" id="TextBox1" class="hidden" placeholder="क्या आप कोई अन्य टिप्पणी देना कहते है|" />
                      <button  type="button" id="Button1" class="hidden">Submit your Response</button>
                  
                    
                    <div id="feedbackTable" class="hidden">

                          <table>
                      <thead>
                                <tr>
                                    <th>Rating</th>
                                    <th>always</th>
                                    <th>usually</th>
                                    <th>Sometimes</th>
                                    <th>never</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>   
                                    <td>आपके डॉक्टर ने आपके साथ कितनी बार शिष्टाचार और सम्मान से व्यवहार किया?</td>
                                    <td><asp:RadioButton ID="RadioButton1" runat="server" GroupName="drfbdHIN" /></td>
                                    <td><asp:RadioButton ID="RadioButton2" runat="server" GroupName="drfbdHIN" /></td>
                                    <td><asp:RadioButton ID="RadioButton5" runat="server" GroupName="drfbdHIN" /></td>
                                    <td><asp:RadioButton ID="RadioButtton6" runat="server" GroupName="drfbdHIN" /></td>
                                </tr>
                            </tbody>
                            <thead>
                                <tr>
                                      <th>Ratings</th>
                                      <th>Completely</th>
                                      <th>Mostly</th>
                                      <th>SOmewhat</th>
                                      <th>Not at all</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                   <td>डॉक्टर ने आपकी स्थिति और उपचार के विकल्पों को कितनी स्पष्टता से समझाया?</td>
                                    <td><asp:RadioButton ID="RadioButton7" runat="server" GroupName="drfbdHIN1" /></td>
                                    <td><asp:RadioButton ID="RadioButton8" runat="server" GroupName="drfbdHIN1"/> </td>
                                    <td><asp:RadioButton ID="RadioButton9" runat="server" GroupName="drfbdHIN1"/> </td>
                                    <td> <asp:RadioButton ID="RadioButton10" runat="server" GroupName="drfbdHIN1" /> </td>
                                    <%--<td> <asp:RadioButton ID="RadioButton11" runat="server"  GroupName="drfbdHIN1" /></td>--%>

                                </tr>
                                <tr>

                                 <td>क्या आप संतुष्ट हैं? डॉक्टर ने आपके साथ बिताए समय की अवधि और गुणवत्ता के बारे में</td>
                                <td><asp:RadioButton ID="RadioButton12" runat="server" GroupName="drfbdHIN2" /></td>
                                <td><asp:RadioButton ID="RadioButton13" runat="server" GroupName="drfbdHIN2" /></td>
                                <td><asp:RadioButton ID="RadioButton14" runat="server" GroupName="drfbdHIN2" /></td>
                                <td><asp:RadioButton ID="RadioButton15" runat="server" GroupName="drfbdHIN2" /></td>

                                       </tr>
                                <tr>
                                    <td>आपको अपने डॉक्टर की उपचार क्षमता पर कितना विश्वास था?</td>
                                    <td><asp:RadioButton ID="RadioButton16" runat="server" GroupName="drfbdHIN3" /></td>
                                    <td><asp:RadioButton ID="RadioButton17" runat="server" GroupName="drfbdHIN3" /></td>
                                    <td><asp:RadioButton ID="RadioButton18" runat="server" GroupName="drfbdHIN3" /></td>
                                    <td><asp:RadioButton ID="RadioButton19" runat="server" GroupName="drfbdHIN3" /></td>
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

              <%--   nurse feedback --%>
                
               <div class="Dquestions">
                   <h1>नर्सिंग प्रतिक्रिया</h1>
                    <h4>क्या आप संतुष्ट हैं?</h4>
                   
                    <input type="radio" id="RadioButton3" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton4" name="Q1" value="No" />No
                    <br />
                    
                  <input type="text" id="TextBox1" class="hidden" placeholder="क्या आप कोई अन्य टिप्पणी देना कहते है|"  />
                      <button  type="button" id="Button1" class="hidden">Submit your Response</button>
                  
                    
                    <div id="feedbackTable" class="hidden">

                          <table>
                        <tbody>
                                <tr>   
                                    <td>आपके डॉक्टर ने आपके साथ कितनी बार शिष्टाचार और सम्मान से व्यवहार किया?</td>
                                    <td><asp:RadioButton ID="RadioButton6" runat="server" GroupName="drfbdHIN4" /></td>
                                    <td><asp:RadioButton ID="RadioButton22" runat="server" GroupName="drfbdHIN4" /></td>
                                    <td><asp:RadioButton ID="RadioButton23" runat="server" GroupName="drfbdHIN4" /></td>
                                    <td><asp:RadioButton ID="RadioButton24" runat="server" GroupName="drfbdHIN4" /></td>
                                </tr>
                            </tbody>
                            <thead>
                                <tr>
                                      <th>Ratings</th>
                                      <th>Completely</th>
                                      <th>Mostly</th>
                                      <th>SOmewhat</th>
                                      <th>Not at all</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                   <td>डॉक्टर ने आपकी स्थिति और उपचार के विकल्पों को कितनी स्पष्टता से समझाया?</td>
                                    <td><asp:RadioButton ID="RadioButton25" runat="server" GroupName="drfbdHIN5" /></td>
                                    <td><asp:RadioButton ID="RadioButton26" runat="server" GroupName="drfbdHIN5"/> </td>
                                    <td><asp:RadioButton ID="RadioButton27" runat="server" GroupName="drfbdHIN5"/> </td>
                                    <td> <asp:RadioButton ID="RadioButton28" runat="server" GroupName="drfbdHIN5" /> </td>
                                  <%--  <td> <asp:RadioButton ID="RadioButton29" runat="server"  GroupName="drfbdHIN5" /></td>--%>

                                </tr>
                                <tr>

                                 <td>क्या आप संतुष्ट हैं? डॉक्टर ने आपके साथ बिताए समय की अवधि और गुणवत्ता के बारे में</td>
                                <td><asp:RadioButton ID="RadioButton30" runat="server" GroupName="drfbdHIN6" /></td>
                                <td><asp:RadioButton ID="RadioButton31" runat="server" GroupName="drfbdHIN6" /></td>
                                <td><asp:RadioButton ID="RadioButton32" runat="server" GroupName="drfbdHIN6" /></td>
                                <td><asp:RadioButton ID="RadioButton33" runat="server" GroupName="drfbdHIN6" /></td>

                                       </tr>
                                <tr>
                                    <td>आपको अपने डॉक्टर की उपचार क्षमता पर कितना विश्वास था?</td>
                                    <td><asp:RadioButton ID="RadioButton34" runat="server" GroupName="drfbdHIN7" /></td>
                                    <td><asp:RadioButton ID="RadioButton35" runat="server" GroupName="drfbdHIN7" /></td>
                                    <td><asp:RadioButton ID="RadioButton36" runat="server" GroupName="drfbdHIN7" /></td>
                                    <td><asp:RadioButton ID="RadioButton37" runat="server" GroupName="drfbdHIN7" /></td>
                                </tr>
                            </tbody>
                    </table>
                          <div id="feedbackComment" class="hidden" >
                            <input type="text" id="TextBox35" placeholder="Any other observation"  /><br />
                            <button type="button" id="Button35">Submit your response</button>
                        </div>
                  
                    </div>
                   
                   
                </div> <br /> 


                <%--addmission feedback--%>


               <div class="Dquestions">
                    <h1>डॉक्टर की प्रतिक्रिया</h1>
                    <h4>क्या आप संतुष्ट हैं?</h4>
                   
                    <input type="radio" id="RadioButton3" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton4" name="Q1" value="No" />No
                    <br />
                    
                  <input type="text" id="TextBox1" class="hidden" placeholder="Any Other Observation?" />
                      <button  type="button" id="Button1" class="hidden">Submit your Response</button>
                  
                    
                    <div id="feedbackTable" class="hidden">

                          <table>
                         <thead>
                                <tr>
                                    <th>Rating</th>
                                    <th>always</th>
                                    <th>usually</th>
                                    <th>Sometimes</th>
                                    <th>never</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>   
                                    <td>आपके डॉक्टर ने आपके साथ कितनी बार शिष्टाचार और सम्मान से व्यवहार किया?</td>
                                    <td><asp:RadioButton ID="RadioButton38" runat="server" GroupName="drfbdHIN8" /></td>
                                    <td><asp:RadioButton ID="RadioButton39" runat="server" GroupName="drfbdHIN8" /></td>
                                    <td><asp:RadioButton ID="RadioButton40" runat="server" GroupName="drfbdHIN8" /></td>
                                    <td><asp:RadioButton ID="RadioButton41" runat="server" GroupName="drfbdHIN8" /></td>
                                </tr>
                            </tbody>
                            <thead>
                                <tr>
                                      <th>Ratings</th>
                                      <th>Completely</th>
                                      <th>Mostly</th>
                                      <th>SOmewhat</th>
                                      <th>Not at all</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                   <td>डॉक्टर ने आपकी स्थिति और उपचार के विकल्पों को कितनी स्पष्टता से समझाया?</td>
                                    <td><asp:RadioButton ID="RadioButton42" runat="server" GroupName="drfbdHIN9" /></td>
                                    <td><asp:RadioButton ID="RadioButton43" runat="server" GroupName="drfbdHIN9"/> </td>
                                    <td><asp:RadioButton ID="RadioButton44" runat="server" GroupName="drfbdHIN9"/> </td>
                                    <td> <asp:RadioButton ID="RadioButton45" runat="server" GroupName="drfbdHIN9" /> </td>
                                   <%-- <td> <asp:RadioButton ID="RadioButton46" runat="server"  GroupName="drfbdHIN9" /></td>--%>

                                </tr>
                                <tr>

                                 <td>क्या आप संतुष्ट हैं? डॉक्टर ने आपके साथ बिताए समय की अवधि और गुणवत्ता के बारे में</td>
                                <td><asp:RadioButton ID="RadioButton47" runat="server" GroupName="drfbdHIN10" /></td>
                                <td><asp:RadioButton ID="RadioButton48" runat="server" GroupName="drfbdHIN10" /></td>
                                <td><asp:RadioButton ID="RadioButton49" runat="server" GroupName="drfbdHIN10" /></td>
                                <td><asp:RadioButton ID="RadioButton50" runat="server" GroupName="drfbdHIN10" /></td>

                                       </tr>
                                <tr>
                                    <td>आपको अपने डॉक्टर की उपचार क्षमता पर कितना विश्वास था?</td>
                                    <td><asp:RadioButton ID="RadioButton51" runat="server" GroupName="drfbdHIN11" /></td>
                                    <td><asp:RadioButton ID="RadioButton52" runat="server" GroupName="drfbdHIN11" /></td>
                                    <td><asp:RadioButton ID="RadioButton53" runat="server" GroupName="drfbdHIN11" /></td>
                                    <td><asp:RadioButton ID="RadioButton54" runat="server" GroupName="drfbdHIN11" /></td>
                                </tr>
                            </tbody>
                    </table>
                          <div id="feedbackComment" class="hidden" >
                            <input type="text" id="TextBox35" placeholder="Any other observation"  /><br />
                            <button type="button" id="Button35">Submit your response</button>
                        </div>
                  
                    </div>
                   
                   
                </div> <br />   


              <%--  discharge feedback--%>


                 <div class="Dquestions">
                    <h1>डॉक्टर की प्रतिक्रिया</h1>
                    <h4>क्या आप संतुष्ट हैं?</h4>

                   
                    <input type="radio" id="RadioButton3" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton4" name="Q1" value="No" />No
                    <br />
                    
                  <input type="text" id="TextBox1" class="hidden" placeholder="क्या आप कोई अन्य टिप्पणी देना कहते है|"/>
                      <button  type="button" id="Button1" class="hidden">Submit your Response</button>
                  
                    
                    <div id="feedbackTable" class="hidden">

                          <table>
                        <thead>
                                <tr>
                                    <th>Rating</th>
                                    <th>always</th>
                                    <th>usually</th>
                                    <th>Sometimes</th>
                                    <th>never</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>   
                                    <td>आपके डॉक्टर ने आपके साथ कितनी बार शिष्टाचार और सम्मान से व्यवहार किया?</td>
                                    <td><asp:RadioButton ID="RadioButton55" runat="server" GroupName="drfbdHIN12" /></td>
                                    <td><asp:RadioButton ID="RadioButton56" runat="server" GroupName="drfbdHIN12" /></td>
                                    <td><asp:RadioButton ID="RadioButton57" runat="server" GroupName="drfbdHIN12" /></td>
                                    <td><asp:RadioButton ID="RadioButton58" runat="server" GroupName="drfbdHIN12" /></td>
                                </tr>
                            </tbody>
                            <thead>
                                <tr>
                                      <th>Ratings</th>
                                      <th>Completely</th>
                                      <th>Mostly</th>
                                      <th>SOmewhat</th>
                                      <th>Not at all</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                   <td>डॉक्टर ने आपकी स्थिति और उपचार के विकल्पों को कितनी स्पष्टता से समझाया?</td>
                                    <td><asp:RadioButton ID="RadioButton59" runat="server" GroupName="drfbdHIN13" /></td>
                                    <td><asp:RadioButton ID="RadioButton60" runat="server" GroupName="drfbdHIN13"/> </td>
                                    <td><asp:RadioButton ID="RadioButton61" runat="server" GroupName="drfbdHIN13"/> </td>
                                    <td> <asp:RadioButton ID="RadioButton62" runat="server" GroupName="drfbdHIN13" /> </td>
                                   <%-- <td> <asp:RadioButton ID="RadioButton63" runat="server"  GroupName="drfbdHIN13" /></td>--%>

                                </tr>
                                <tr>

                                 <td>क्या आप संतुष्ट हैं? डॉक्टर ने आपके साथ बिताए समय की अवधि और गुणवत्ता के बारे में</td>
                                <td><asp:RadioButton ID="RadioButton64" runat="server" GroupName="drfbdHIN14" /></td>
                                <td><asp:RadioButton ID="RadioButton65" runat="server" GroupName="drfbdHIN14" /></td>
                                <td><asp:RadioButton ID="RadioButton66" runat="server" GroupName="drfbdHIN14" /></td>
                                <td><asp:RadioButton ID="RadioButton67" runat="server" GroupName="drfbdHIN14" /></td>

                                       </tr>
                                <tr>
                                    <td>आपको अपने डॉक्टर की उपचार क्षमता पर कितना विश्वास था?</td>
                                    <td><asp:RadioButton ID="RadioButton68" runat="server" GroupName="drfbdHIN15" /></td>
                                    <td><asp:RadioButton ID="RadioButton69" runat="server" GroupName="drfbdHIN15" /></td>
                                    <td><asp:RadioButton ID="RadioButton70" runat="server" GroupName="drfbdHIN15" /></td>
                                    <td><asp:RadioButton ID="RadioButton71" runat="server" GroupName="drfbdHIN15" /></td>
                                </tr>
                            </tbody>
                    </table>
                          <div id="feedbackComment" class="hidden" >
                            <input type="text" id="TextBox35" placeholder="Any other observation"  /><br />
                            <button type="button" id="Button35">Submit your response</button>
                        </div>
                  
                    </div>
                   
                   
                </div> <br />  


               <%-- billing feedback --%>


                  <div class="Dquestions">
                   <h1>डॉक्टर की प्रतिक्रिया</h1>
                    <h4>क्या आप संतुष्ट हैं?</h4>
                   
                    <input type="radio" id="RadioButton3" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton4" name="Q1" value="No" />No
                    <br />
                    
                  <input type="text" id="TextBox1" class="hidden" placeholder="क्या आप कोई अन्य टिप्पणी देना कहते है|" />
                      <button  type="button" id="Button1" class="hidden">Submit your Response</button>
                  
                    
                    <div id="feedbackTable" class="hidden">

                          <table>
                      <thead>
                                <tr>
                                    <th>Rating</th>
                                    <th>always</th>
                                    <th>usually</th>
                                    <th>Sometimes</th>
                                    <th>never</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>   
                                    <td>आपके डॉक्टर ने आपके साथ कितनी बार शिष्टाचार और सम्मान से व्यवहार किया?</td>
                                    <td><asp:RadioButton ID="RadioButton72" runat="server" GroupName="drfbdHIN16" /></td>
                                    <td><asp:RadioButton ID="RadioButton73" runat="server" GroupName="drfbdHIN16" /></td>
                                    <td><asp:RadioButton ID="RadioButton74" runat="server" GroupName="drfbdHIN16" /></td>
                                    <td><asp:RadioButton ID="RadioButton75" runat="server" GroupName="drfbdHIN16" /></td>
                                </tr>
                            </tbody>
                            <thead>
                                <tr>
                                      <th>Ratings</th>
                                      <th>Completely</th>
                                      <th>Mostly</th>
                                      <th>SOmewhat</th>
                                      <th>Not at all</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                   <td>डॉक्टर ने आपकी स्थिति और उपचार के विकल्पों को कितनी स्पष्टता से समझाया?</td>
                                    <td><asp:RadioButton ID="RadioButton76" runat="server" GroupName="drfbdHIN17" /></td>
                                    <td><asp:RadioButton ID="RadioButton77" runat="server" GroupName="drfbdHIN17"/> </td>
                                    <td><asp:RadioButton ID="RadioButton78" runat="server" GroupName="drfbdHIN17"/> </td>
                                    <td> <asp:RadioButton ID="RadioButton79" runat="server" GroupName="drfbdHIN17" /> </td>
                                    <%--<td> <asp:RadioButton ID="RadioButton80" runat="server"  GroupName="drfbdHIN17" /></td>--%>

                                </tr>
                                <tr>

                                 <td>क्या आप संतुष्ट हैं? डॉक्टर ने आपके साथ बिताए समय की अवधि और गुणवत्ता के बारे में</td>
                                <td><asp:RadioButton ID="RadioButton81" runat="server" GroupName="drfbdHIN18" /></td>
                                <td><asp:RadioButton ID="RadioButton82" runat="server" GroupName="drfbdHIN18" /></td>
                                <td><asp:RadioButton ID="RadioButton83" runat="server" GroupName="drfbdHIN18" /></td>
                                <td><asp:RadioButton ID="RadioButton84" runat="server" GroupName="drfbdHIN18" /></td>

                                       </tr>
                                <tr>
                                    <td>आपको अपने डॉक्टर की उपचार क्षमता पर कितना विश्वास था?</td>
                                    <td><asp:RadioButton ID="RadioButton85" runat="server" GroupName="drfbdHIN19" /></td>
                                    <td><asp:RadioButton ID="RadioButton86" runat="server" GroupName="drfbdHIN19" /></td>
                                    <td><asp:RadioButton ID="RadioButton87" runat="server" GroupName="drfbdHIN19" /></td>
                                    <td><asp:RadioButton ID="RadioButton88" runat="server" GroupName="drfbdHIN19" /></td>
                                </tr>
                            </tbody>
                    </table>
                          <div id="feedbackComment" class="hidden" >
                            <input type="text" id="TextBox35" placeholder="Any other observation"  /><br />
                            <button type="button" id="Button35">Submit your response</button>
                        </div>
                  
                    </div>                 
                   
                </div> <br />

              <%--  investigation feedback --%>


                  <div class="Dquestions">
                    <h1>डॉक्टर की प्रतिक्रिया</h1>
                    <h4>क्या आप संतुष्ट हैं?</h4>

                   
                    <input type="radio" id="RadioButton3" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton4" name="Q1" value="No" />No
                    <br />
                    
                  <input type="text" id="TextBox1" class="hidden" placeholder="क्या आप कोई अन्य टिप्पणी देना कहते है|" />
                      <button  type="button" id="Button1" class="hidden">Submit your Response</button>
                  
                    
                    <div id="feedbackTable" class="hidden">

                          <table>
                      <thead>
                                <tr>
                                    <th>Rating</th>
                                    <th>always</th>
                                    <th>usually</th>
                                    <th>Sometimes</th>
                                    <th>never</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>   
                                    <td>आपके डॉक्टर ने आपके साथ कितनी बार शिष्टाचार और सम्मान से व्यवहार किया?</td>
                                    <td><asp:RadioButton ID="RadioButton89" runat="server" GroupName="drfbdHIN20" /></td>
                                    <td><asp:RadioButton ID="RadioButton90" runat="server" GroupName="drfbdHIN20" /></td>
                                    <td><asp:RadioButton ID="RadioButton91" runat="server" GroupName="drfbdHIN20" /></td>
                                    <td><asp:RadioButton ID="RadioButton92" runat="server" GroupName="drfbdHIN20" /></td>
                                </tr>
                            </tbody>
                            <thead>
                                <tr>
                                      <th>Ratings</th>
                                      <th>Completely</th>
                                      <th>Mostly</th>
                                      <th>SOmewhat</th>
                                      <th>Not at all</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                   <td>डॉक्टर ने आपकी स्थिति और उपचार के विकल्पों को कितनी स्पष्टता से समझाया?</td>
                                    <td><asp:RadioButton ID="RadioButton93" runat="server" GroupName="drfbdHIN21" /></td>
                                    <td><asp:RadioButton ID="RadioButton94" runat="server" GroupName="drfbdHIN21"/> </td>
                                    <td><asp:RadioButton ID="RadioButton95" runat="server" GroupName="drfbdHIN21"/> </td>
                                    <td> <asp:RadioButton ID="RadioButton96" runat="server" GroupName="drfbdHIN21" /> </td>
                                   <%-- <td> <asp:RadioButton ID="RadioButton97" runat="server"  GroupName="drfbdHIN21" /></td>--%>

                                </tr>
                                <tr>

                                 <td>क्या आप संतुष्ट हैं? डॉक्टर ने आपके साथ बिताए समय की अवधि और गुणवत्ता के बारे में</td>
                                <td><asp:RadioButton ID="RadioButton98" runat="server" GroupName="drfbdHIN22" /></td>
                                <td><asp:RadioButton ID="RadioButton99" runat="server" GroupName="drfbdHIN22" /></td>
                                <td><asp:RadioButton ID="RadioButton100" runat="server" GroupName="drfbdHIN22" /></td>
                                <td><asp:RadioButton ID="RadioButton101" runat="server" GroupName="drfbdHIN22" /></td>

                                       </tr>
                                <tr>
                                    <td>आपको अपने डॉक्टर की उपचार क्षमता पर कितना विश्वास था?</td>
                                    <td><asp:RadioButton ID="RadioButton102" runat="server" GroupName="drfbdHIN23" /></td>
                                    <td><asp:RadioButton ID="RadioButton103" runat="server" GroupName="drfbdHIN23" /></td>
                                    <td><asp:RadioButton ID="RadioButton104" runat="server" GroupName="drfbdHIN23" /></td>
                                    <td><asp:RadioButton ID="RadioButton105" runat="server" GroupName="drfbdHIN23" /></td>
                                </tr>
                            </tbody>
                    </table>
                          <div id="feedbackComment" class="hidden" >
                            <input type="text" id="TextBox35" placeholder="Any other observation"  /><br />
                            <button type="button" id="Button35">Submit your response</button>
                        </div>
                  
                    </div>

                </div> <br />

               <%-- f&B feedback --%>


                 <div class="Dquestions">
                   <h1>डॉक्टर की प्रतिक्रिया</h1>
                    <h4>क्या आप संतुष्ट हैं?</h4>
                   
                    <input type="radio" id="RadioButton3" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton4" name="Q1" value="No" />No
                    <br />
                    
                  <input type="text" id="TextBox1" class="hidden" placeholder="Any Other Observation?" />
                      <button  type="button" id="Button1" class="hidden">Submit your Response</button>
                  
                    
                    <div id="feedbackTable" class="hidden">

                          <table>
                      <thead>
                                <tr>
                                    <th>Rating</th>
                                    <th>always</th>
                                    <th>usually</th>
                                    <th>Sometimes</th>
                                    <th>never</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>   
                                    <td>आपके डॉक्टर ने आपके साथ कितनी बार शिष्टाचार और सम्मान से व्यवहार किया?</td>
                                    <td><asp:RadioButton ID="RadioButton106" runat="server" GroupName="drfbdHIN24" /></td>
                                    <td><asp:RadioButton ID="RadioButton107" runat="server" GroupName="drfbdHIN24" /></td>
                                    <td><asp:RadioButton ID="RadioButton108" runat="server" GroupName="drfbdHIN24" /></td>
                                    <td><asp:RadioButton ID="RadioButton109" runat="server" GroupName="drfbdHIN24" /></td>
                                </tr>
                            </tbody>
                            <thead>
                                <tr>
                                      <th>Ratings</th>
                                      <th>Completely</th>
                                      <th>Mostly</th>
                                      <th>SOmewhat</th>
                                      <th>Not at all</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                   <td>डॉक्टर ने आपकी स्थिति और उपचार के विकल्पों को कितनी स्पष्टता से समझाया?</td>
                                    <td><asp:RadioButton ID="RadioButton110" runat="server" GroupName="drfbdHIN25" /></td>
                                    <td><asp:RadioButton ID="RadioButton111" runat="server" GroupName="drfbdHIN25"/> </td>
                                    <td><asp:RadioButton ID="RadioButton112" runat="server" GroupName="drfbdHIN25"/> </td>
                                    <td> <asp:RadioButton ID="RadioButton113" runat="server" GroupName="drfbdHIN25" /> </td>
                                   <%-- <td> <asp:RadioButton ID="RadioButton114" runat="server"  GroupName="drfbdHIN25" /></td>--%>

                                </tr>
                                <tr>

                                 <td>क्या आप संतुष्ट हैं? डॉक्टर ने आपके साथ बिताए समय की अवधि और गुणवत्ता के बारे में</td>
                                <td><asp:RadioButton ID="RadioButton115" runat="server" GroupName="drfbdHIN26" /></td>
                                <td><asp:RadioButton ID="RadioButton116" runat="server" GroupName="drfbdHIN26" /></td>
                                <td><asp:RadioButton ID="RadioButton117" runat="server" GroupName="drfbdHIN26" /></td>
                                <td><asp:RadioButton ID="RadioButton118" runat="server" GroupName="drfbdHIN26" /></td>

                                       </tr>
                                <tr>
                                    <td>आपको अपने डॉक्टर की उपचार क्षमता पर कितना विश्वास था?</td>
                                    <td><asp:RadioButton ID="RadioButton119" runat="server" GroupName="drfbdHIN27" /></td>
                                    <td><asp:RadioButton ID="RadioButton120" runat="server" GroupName="drfbdHIN27" /></td>
                                    <td><asp:RadioButton ID="RadioButton121" runat="server" GroupName="drfbdHIN27" /></td>
                                    <td><asp:RadioButton ID="RadioButton122" runat="server" GroupName="drfbdHIN27" /></td>
                                </tr>
                            </tbody>

                    </table>
                          <div id="feedbackComment" class="hidden" >
                            <input type="text" id="TextBox35" placeholder="Any other observation"  /><br />
                            <button type="button" id="Button35">Submit your response</button>
                        </div>
                  
                    </div>     




                </div> <br />


              <%--  housekeeping feedback --%>


                  <div class="Dquestions">
                   <h1>डॉक्टर की प्रतिक्रिया</h1>
                    <h4>क्या आप संतुष्ट हैं?</h4>

                   
                    <input type="radio" id="RadioButton3" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton4" name="Q1" value="No" />No
                    <br />
                    
                  <input type="text" id="TextBox1" class="hidden" placeholder="क्या आप कोई अन्य टिप्पणी देना कहते है|"  />
                      <button  type="button" id="Button1" class="hidden">Submit your Response</button>
                  
                    
                    <div id="feedbackTable" class="hidden">

                          <table>
                     <thead>
                                <tr>
                                    <th>Rating</th>
                                    <th>always</th>
                                    <th>usually</th>
                                    <th>Sometimes</th>
                                    <th>never</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>   
                                    <td>आपके डॉक्टर ने आपके साथ कितनी बार शिष्टाचार और सम्मान से व्यवहार किया?</td>
                                    <td><asp:RadioButton ID="RadioButton123" runat="server" GroupName="drfbdHIN28" /></td>
                                    <td><asp:RadioButton ID="RadioButton124" runat="server" GroupName="drfbdHIN28" /></td>
                                    <td><asp:RadioButton ID="RadioButton125" runat="server" GroupName="drfbdHIN28" /></td>
                                    <td><asp:RadioButton ID="RadioButton126" runat="server" GroupName="drfbdHIN28" /></td>
                                </tr>
                            </tbody>
                            <thead>
                                <tr>
                                      <th>Ratings</th>
                                      <th>Completely</th>
                                      <th>Mostly</th>
                                      <th>SOmewhat</th>
                                      <th>Not at all</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                   <td>डॉक्टर ने आपकी स्थिति और उपचार के विकल्पों को कितनी स्पष्टता से समझाया?</td>
                                    <td><asp:RadioButton ID="RadioButton127" runat="server" GroupName="drfbdHIN29" /></td>
                                    <td><asp:RadioButton ID="RadioButton128" runat="server" GroupName="drfbdHIN29"/> </td>
                                    <td><asp:RadioButton ID="RadioButton129" runat="server" GroupName="drfbdHIN29"/> </td>
                                    <td> <asp:RadioButton ID="RadioButton130" runat="server" GroupName="drfbdHIN29" /> </td>
                                   <%-- <td> <asp:RadioButton ID="RadioButton131" runat="server"  GroupName="drfbdHIN29" /></td>--%>

                                </tr>
                                <tr>

                                 <td>क्या आप संतुष्ट हैं? डॉक्टर ने आपके साथ बिताए समय की अवधि और गुणवत्ता के बारे में</td>
                                <td><asp:RadioButton ID="RadioButton132" runat="server" GroupName="drfbdHIN30" /></td>
                                <td><asp:RadioButton ID="RadioButton133" runat="server" GroupName="drfbdHIN30" /></td>
                                <td><asp:RadioButton ID="RadioButton134" runat="server" GroupName="drfbdHIN30" /></td>
                                <td><asp:RadioButton ID="RadioButton135" runat="server" GroupName="drfbdHIN30" /></td>

                                       </tr>
                                <tr>
                                    <td>आपको अपने डॉक्टर की उपचार क्षमता पर कितना विश्वास था?</td>
                                    <td><asp:RadioButton ID="RadioButton136" runat="server" GroupName="drfbdHIN31" /></td>
                                    <td><asp:RadioButton ID="RadioButton137" runat="server" GroupName="drfbdHIN31" /></td>
                                    <td><asp:RadioButton ID="RadioButton138" runat="server" GroupName="drfbdHIN31" /></td>
                                    <td><asp:RadioButton ID="RadioButton139" runat="server" GroupName="drfbdHIN31" /></td>
                                </tr>
                            </tbody>
                    </table>
                          <div id="feedbackComment" class="hidden" >
                            <input type="text" id="TextBox35" placeholder="Any other observation"  /><br />
                            <button type="button" id="Button35">Submit your response</button>
                        </div>
                  
                    </div>              




                </div> <br />

               <%-- overall experince --%>

                 <div class="Dquestions">
                    <h1>डॉक्टर की प्रतिक्रिया</h1>
                    <h4>क्या आप संतुष्ट हैं?</h4>

                   
                    <input type="radio" id="RadioButton3" name="Q1"  value="Yes"/>Yes
                    <input type="radio" id="RadioButton4" name="Q1" value="No" />No
                    <br />
                    
                  <input type="text" id="TextBox1" class="hidden" placeholder="क्या आप कोई अन्य टिप्पणी देना कहते है|" />
                      <button  type="button" id="Button1" class="hidden">Submit your Response</button>
                  
                    
                    <div id="feedbackTable" class="hidden">

                          <table>
                   <thead>
                                <tr>
                                    <th>Rating</th>
                                    <th>always</th>
                                    <th>usually</th>
                                    <th>Sometimes</th>
                                    <th>never</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>   
                                    <td>आपके डॉक्टर ने आपके साथ कितनी बार शिष्टाचार और सम्मान से व्यवहार किया?</td>
                                    <td><asp:RadioButton ID="RadioButton140" runat="server" GroupName="drfbdHIN32" /></td>
                                    <td><asp:RadioButton ID="RadioButton141" runat="server" GroupName="drfbdHIN32" /></td>
                                    <td><asp:RadioButton ID="RadioButton142" runat="server" GroupName="drfbdHIN32" /></td>
                                    <td><asp:RadioButton ID="RadioButton143" runat="server" GroupName="drfbdHIN32" /></td>
                                </tr>
                            </tbody>
                            <thead>
                                <tr>
                                      <th>Ratings</th>
                                      <th>Completely</th>
                                      <th>Mostly</th>
                                      <th>SOmewhat</th>
                                      <th>Not at all</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                   <td>डॉक्टर ने आपकी स्थिति और उपचार के विकल्पों को कितनी स्पष्टता से समझाया?</td>
                                    <td><asp:RadioButton ID="RadioButton144" runat="server" GroupName="drfbdHIN33" /></td>
                                    <td><asp:RadioButton ID="RadioButton145" runat="server" GroupName="drfbdHIN33"/> </td>
                                    <td><asp:RadioButton ID="RadioButton146" runat="server" GroupName="drfbdHIN33"/> </td>
                                    <td> <asp:RadioButton ID="RadioButton147" runat="server" GroupName="drfbdHIN33" /> </td>
                                    <%--<td> <asp:RadioButton ID="RadioButton148" runat="server"  GroupName="drfbdHIN33" /></td>--%>

                                </tr>
                                <tr>

                                 <td>क्या आप संतुष्ट हैं? डॉक्टर ने आपके साथ बिताए समय की अवधि और गुणवत्ता के बारे में</td>
                                <td><asp:RadioButton ID="RadioButton149" runat="server" GroupName="drfbdHIN34" /></td>
                                <td><asp:RadioButton ID="RadioButton150" runat="server" GroupName="drfbdHIN34" /></td>
                                <td><asp:RadioButton ID="RadioButton151" runat="server" GroupName="drfbdHIN34" /></td>
                                <td><asp:RadioButton ID="RadioButton152" runat="server" GroupName="drfbdHIN34" /></td>

                                       </tr>
                                <tr>
                                    <td>आपको अपने डॉक्टर की उपचार क्षमता पर कितना विश्वास था?</td>
                                    <td><asp:RadioButton ID="RadioButton153" runat="server" GroupName="drfbdHIN35" /></td>
                                    <td><asp:RadioButton ID="RadioButton154" runat="server" GroupName="drfbdHIN35" /></td>
                                    <td><asp:RadioButton ID="RadioButton155" runat="server" GroupName="drfbdHIN35" /></td>
                                    <td><asp:RadioButton ID="RadioButton156" runat="server" GroupName="drfbdHIN35" /></td>
                                </tr>
                            </tbody>

                    </table>
                          <div id="feedbackComment" class="hidden" >
                            <input type="text" id="TextBox35" placeholder="Any other observation"  /><br />
                            <button type="button" id="Button35">Submit your response</button>
                        </div>
                  
                    </div>

                </div> <br />   
                
                <asp:Button ID="Button12" runat="server" Text="Submit your Response" OnClick="Button12_Click" />
            </div>
        </header>
    </main>
</asp:Content>
