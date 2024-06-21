
report 50015 "Processing Only"
{
    ApplicationArea = All;
    Caption = 'Processing Only';
    UsageCategory = Tasks;
    ProcessingOnly = true;
    dataset
    {
        dataitem(payments;payments)
        {
            trigger OnAfterGetRecord()
            begin
             ImpSurrLines.Reset();
             ImpSurrLines.SetRange(No,"No.");
             if ImpSurrLines.FindSet() then begin
                repeat
           
                until ImpSurrLines.Next()=0;
             end;  
            end;
            trigger OnPreDataItem()
            begin
                SetRange("Payment Type","Payment Type"::Surrender);
            end;
        }
      

        // dataitem(Employee; Employee)
        // {

        //     // trigger OnAfterGetRecord()
        //     // begin
        //     //     Clear(JsonObj);
        //     //     clear(Headers);
        //     //     Clear(JsonObj1);
        //     //     Clear(JsonObj2);
        //     //     Clear(JsonObj3);



        //     //     JsonObj.WriteTo(ContentText);
        //     //     // Message(ContentText);
        //     //     Contents.Clear();

        //     //     Contents.WriteFrom(ContentText);
        //     //     //Contents.WriteFrom('{"startDateTime":"2024-03-12T14:30:34.2444915-07:00","endDateTime":"2024-03-12T15:00:34.2464912-07:00","subject":"User meeting in Microsoft Teams channel."}');
        //     //     Contents.GetHeaders(Headers);
        //     //     Headers.Remove('Content-Type');
        //     //     Headers.Remove('Charset');
        //     //     Headers.Add('Content-Type', 'application/json');
        //     //     Headers.Add('X-Api-Key','lkfJNcmQeoF5ut+5WO48Aw==cfVhqT4gbg3RJUY0');
        //     //     httpRequest.GetHeaders(Headers);
        //     //     //Contents.WriteFrom('{"startDateTime":"2024-03-10T14:30:34.2444915-07:00","endDateTime":"2024-03-10T15:00:34.2464912-07:00","subject":"User Token Meeting"}');
        //     //     httpRequest.Content(Contents);
        //     //     httpRequest.Method('GET');
        //     //     url := 'https://api.api-ninjas.com/v1/randomuser';
        //     //     // url := 'https://api.parser.name/?api_key=YOUR_KEY&endpoint=generate';
        //     //     client.Clear();
        //     //     Client.SetBaseAddress(url);
        //     //     Client.DefaultRequestHeaders.Add('Charset', 'utf-8');
        //     //     Client.DefaultRequestHeaders.Add('X-Api-Key', 'lkfJNcmQeoF5ut+5WO48Aw==cfVhqT4gbg3RJUY0');
        //     //     if Client.Get(url, ResponseMessage) then
        //     //         //(url, contents, ResponseMessage) then
        //     //         //if Client.Send(httpRequest, ResponseMessage) then
        //     //         ResponseMessage.Content.ReadAs(Response);
        //     //     if ResponseMessage.IsSuccessStatusCode = false then
        //     //         Error(Response);
        //     //     Clear(NameObj);
        //     //     Clear(EmailObj);
        //     //     Clear(DOBObj);
        //     //     Clear(NameToken);
        //     //     Clear(EmailToken);
        //     //     Clear(DOBToken);
        //     //     NameTxt := '';
        //     //     EmailTxt := '';
        //     //     DOBTxt := '';
        //     //     address := '';
        //     //     NameObj.ReadFrom(Response);
        //     //     NameObj.get('name', NameToken);
        //     //     NameTxt := NameToken.AsValue().AsText();
        //     //     EmailObj.ReadFrom(Response);
        //     //     EmailObj.get('address', EmailToken);
        //     //     EmailTxt := EmailToken.AsValue().AsText();
        //     //     DOBObj.ReadFrom(Response);
        //     //     DOBObj.get('birthday', DOBToken);
        //     //     DOBTxt := DOBToken.AsValue().AsText();
        //     //     addressObj.ReadFrom(Response);
        //     //     addressObj.get('address', addressToken);
        //     //     addressTxt := addressToken.AsValue().AsText();
        //     //     // message('Name: ' + Name + ' Email ' + Email + ' DOB: ' + DOB + ' Address ' + address);
        //     //     Employee."First Name" := NameTxt;
        //     //     Employee."E-Mail" := EmailTxt;
        //     //     Employee.Address := AddressTxt;
            
        //     //     //Employee.Validate("No.");
        //     //   //  Employee.Modify();
        //     // end;


        // }

    }


    requestpage
    {
        layout
        {
            area(content)
            {

            }
        }

        actions
        {
            area(processing)
            {
            }
        }
    }
    var

        HRSetup: Record "Human Resources Setup";
        HRLeavePeriods: Record "HR Leave Periods";
        JsonObj: JsonObject;
        JsonObj1: JsonObject;
        JsonObj2: JsonObject;
        JsonObj3: JsonObject;
        ResultObj: JsonObject;
        ResultJtoken: JsonToken;
        Contents: HttpContent;
        Headers: HttpHeaders;
        Client: HttpClient;
        ResponseMessage: HttpResponseMessage;
        httprequest: HttpRequestMessage;
        DateTimeFormatTxt: Label '<Year4><Month,2><Day,2>T<Hours24,2><Minutes,2><Seconds,2>', Locked = true;
        StartTime: Time;
        EndTime: Time;
        JArray: JsonArray;
        ContentText: Text;
        url: Text;
        Response: Text;
        NameTxt: Text;
        LastName: Text;
        Salutation: Text;
        EmailTxt: Text;
        DOBTxt: Text;
        addressTxt: Text;
        addressObj: JsonObject;
        addressToken: JsonToken;
        NameObj: JsonObject;
        EmailObj: JsonObject;
        DOBObj: JsonObject;
        NameToken: JsonToken;
        EmailToken: JsonToken;
        DOBToken: JsonToken;
        
        PettyCashLines: Record "Petty Cash Lines";
         ImpHeader: Record payments;
        ImpLines: Record "Imprest Lines";
        ImpSurrLines: Record "Imprest Lines";
        PurchLines: Record "PV Lines";
        PurchLine: Record "PV Lines";
        EmployeeLedgerEntry: Record "Employee Ledger Entry";
     



}
