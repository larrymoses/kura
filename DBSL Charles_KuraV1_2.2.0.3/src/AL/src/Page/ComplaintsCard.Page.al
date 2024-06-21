#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56086 "Complaints Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Cases Management";
    SourceTableView = where(Status = filter(Open));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Enquiry Number"; "Enquiry Number")
                {
                    ApplicationArea = Basic;
                    Caption = 'Complaints No';
                    Editable = false;
                }
                field("Date of Complaint"; "Date of Complaint")
                {
                    ApplicationArea = Basic;
                }
                field("Received From"; "Received From")
                {
                    ApplicationArea = Basic;
                }
                field("Receiving Officer"; "Receiving Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Type"; "Customer Type")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Group Code"; "Customer Group Code")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Group"; "Customer Group")
                {
                    ApplicationArea = Basic;
                }
                field("Mode of Lodging Complaints Cod"; "Mode of Lodging Complaints Cod")
                {
                    ApplicationArea = Basic;
                }
                field("Mode of Lodging Complaints"; "Mode of Lodging Complaints")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Employment Info")
            {
                Caption = 'Employment Info';
                Editable = false;
                Visible = false;
                field(Control23; "Employment Info")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        if "Employment Info" = "employment info"::Employed then begin
                            EmployerCodeEditable := true;
                            DepartmentEditable := true;
                            TermsofEmploymentEditable := true;
                            ContractingEditable := false;
                            EmployedEditable := false;
                            OccupationEditable := false;
                            PositionHeldEditable := true;
                            EmploymentDateEditable := true;
                            EmployerAddressEditable := true;
                            NatureofBussEditable := false;
                            IndustryEditable := false;
                            BusinessNameEditable := false;
                            PhysicalBussLocationEditable := false;
                            YearOfCommenceEditable := false;



                        end else
                            if "Employment Info" = "employment info"::Contracting then begin
                                ContractingEditable := true;
                                EmployerCodeEditable := false;
                                DepartmentEditable := false;
                                TermsofEmploymentEditable := false;
                                OccupationEditable := false;
                                PositionHeldEditable := false;
                                EmploymentDateEditable := false;
                                EmployerAddressEditable := false;
                                NatureofBussEditable := false;
                                IndustryEditable := false;
                                BusinessNameEditable := false;
                                PhysicalBussLocationEditable := false;
                                YearOfCommenceEditable := false;
                            end else
                                if "Employment Info" = "employment info"::Others then begin
                                    OthersEditable := true;
                                    ContractingEditable := false;
                                    EmployerCodeEditable := false;
                                    DepartmentEditable := false;
                                    TermsofEmploymentEditable := false;
                                    OccupationEditable := false;
                                    PositionHeldEditable := false;
                                    EmploymentDateEditable := false;
                                    EmployerAddressEditable := false
                                end else
                                    if "Employment Info" = "employment info"::"Self-Employed" then begin
                                        OccupationEditable := true;
                                        EmployerCodeEditable := false;
                                        DepartmentEditable := false;
                                        TermsofEmploymentEditable := false;
                                        ContractingEditable := false;
                                        EmployedEditable := false;
                                        NatureofBussEditable := true;
                                        IndustryEditable := true;
                                        BusinessNameEditable := true;
                                        PhysicalBussLocationEditable := true;
                                        YearOfCommenceEditable := true;
                                        PositionHeldEditable := false;
                                        EmploymentDateEditable := false;
                                        EmployerAddressEditable := false

                                    end;




                        /*IF "Identification Document"="Identification Document"::"Nation ID Card" THEN BEGIN
                          PassportEditable:=FALSE;
                          IDNoEditable:=TRUE
                          END ELSE
                          IF "Identification Document"="Identification Document"::"Passport Card" THEN BEGIN
                          PassportEditable:=TRUE;
                          IDNoEditable:=FALSE
                          END ELSE
                          IF "Identification Document"="Identification Document"::"Aliens Card" THEN BEGIN
                          PassportEditable:=TRUE;
                          IDNoEditable:=TRUE;
                        END;*/

                    end;
                }
                label(Control22)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employer Name"; "Employer Name")
                {
                    ApplicationArea = Basic;
                    Editable = EmployedEditable;
                }
                field("Employer Address"; "Employer Address")
                {
                    ApplicationArea = Basic;
                    Editable = EmployerAddressEditable;
                }
                field(Department; Department)
                {
                    ApplicationArea = Basic;
                    Caption = 'WorkStation / Depot';
                    Editable = DepartmentEditable;
                }
                field("Terms of Employment"; "Terms of Employment")
                {
                    ApplicationArea = Basic;
                    Editable = TermsofEmploymentEditable;
                    ShowMandatory = true;
                }
                field("Date of Employment"; "Date of Employment")
                {
                    ApplicationArea = Basic;
                    Editable = EmploymentDateEditable;
                }
                field("Position Held"; "Position Held")
                {
                    ApplicationArea = Basic;
                    Editable = PositionHeldEditable;
                }
                field("Expected Monthly Income"; "Expected Monthly Income")
                {
                    ApplicationArea = Basic;
                    Editable = MonthlyIncomeEditable;
                }
                field("Nature Of Business"; "Nature Of Business")
                {
                    ApplicationArea = Basic;
                    Editable = NatureofBussEditable;
                }
                field(Industry; Industry)
                {
                    ApplicationArea = Basic;
                    Editable = IndustryEditable;
                }
                field("Business Name"; "Business Name")
                {
                    ApplicationArea = Basic;
                    Editable = BusinessNameEditable;
                }
                field("Physical Business Location"; "Physical Business Location")
                {
                    ApplicationArea = Basic;
                    Editable = PhysicalBussLocationEditable;
                }
                field("Year of Commence"; "Year of Commence")
                {
                    ApplicationArea = Basic;
                    Editable = YearOfCommenceEditable;
                }
                field(Occupation; Occupation)
                {
                    ApplicationArea = Basic;
                    Editable = OccupationEditable;
                }
                field("Others Details"; "Others Details")
                {
                    ApplicationArea = Basic;
                    Editable = OthersEditable;
                }
            }
            group("Referee Details")
            {
                Caption = 'Referee Details';
                Editable = false;
                Visible = false;
                field("Referee Member No"; "Referee Member No")
                {
                    ApplicationArea = Basic;
                }
                field("Referee Name"; "Referee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Referee ID No"; "Referee ID No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Referee Mobile Phone No"; "Referee Mobile Phone No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group("Case Information")
            {
                Caption = 'Complaints Information';
                field("Case Description"; "Case Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Complaints Description';
                }
                field(Comments; Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Root Cause';
                    MultiLine = true;
                }
                field(Implications; Implications)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Follow up Action"; "Follow up Action")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(Recomendations; Recomendations)
                {
                    ApplicationArea = Basic;
                    Caption = 'Recommendation';
                    MultiLine = true;
                }
                field("Support Documents"; "Support Documents")
                {
                    ApplicationArea = Basic;
                }
                field("Loan No"; "Loan No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
            }
            group("Member Information")
            {
                Caption = 'Complaints Escalation';
                Visible = true;
                field("Assigned Officer"; "Assigned Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Officer Email"; "Assigned Officer Email")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Officer Name"; "Assigned Officer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Escalation"; "Date of Escalation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Time of Escalation"; "Time of Escalation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Closed By"; "Closed By")
                {
                    ApplicationArea = Basic;
                    Caption = 'Due Date';
                }
                field(Priority; Priority)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Mark Resolved")
            {
                ApplicationArea = Basic;
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Status = Status::Resolved then begin
                        Error('Case already resolved');
                    end;

                    if Confirm('Are you sure you want to mark this case as resolved?', false) = true then begin
                        Status := Status::Resolved;
                        "Date Resolved" := Today;
                        "Time Resolved" := Time;
                        "Case Solved" := true;
                    end;
                end;
            }
            action("Additional Case Details")
            {
                ApplicationArea = Basic;
                Caption = 'Additional Complaints Details';
                Image = Form;
                Promoted = true;
                PromotedCategory = Process;
                //   RunObject = Page "HR Job Applications Card";
                //  RunPageLink = "Application No"=field("Enquiry Number");
                Visible = false;
            }
            action("Escalate Complaint")
            {
                ApplicationArea = Basic;
                Caption = 'Escalate Complaint';
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Process;

                // trigger OnAction()
                // begin
                //     TestField("Assigned Officer");
                //     //TESTFIELD("Action Taken");
                //     //TESTFIELD("Date To Settle Case");
                //     //TESTFIELD("solution Remarks");
                //     "Date Sent" := WorkDate;
                //     "Time Sent" := Time;
                //     "Sent By" := UserId;

                //     Status := Status::Assigned;
                //     Modify;
                //     Sendtouser();
                //     SendEmailuser();
                //     sms();
                //     Message('Case has been Assigned to %1', AssignedReas."Resource Assigned");
                // end;
            }
        }
    }

    var
        CustCare: Record "General Equiries.";
        AssignedReas: Record "Cases Management";
        lineno: Integer;
        notifymail: Codeunit Mail;
        Asmember: Boolean;
        EmploymentInfoEditable: Boolean;
        EmployedEditable: Boolean;
        ContractingEditable: Boolean;
        NatureofBussEditable: Boolean;
        IndustryEditable: Boolean;
        BusinessNameEditable: Boolean;
        PhysicalBussLocationEditable: Boolean;
        YearOfCommenceEditable: Boolean;
        PositionHeldEditable: Boolean;
        EmploymentDateEditable: Boolean;
        EmployerAddressEditable: Boolean;
        EmployerCodeEditable: Boolean;
        DepartmentEditable: Boolean;
        TermsofEmploymentEditable: Boolean;
        OccupationEditable: Boolean;
        OthersEditable: Boolean;
        MonthlyIncomeEditable: Boolean;
        LoanNoVisible: Boolean;
        SMTSetup: Record "Email Account";

    local procedure sms()
    var
        iEntryNo: Integer;
    begin

        //SMS MESSAGE
        /*   SMSMessages.RESET;
           IF SMSMessages.FIND('+') THEN BEGIN
           iEntryNo:=SMSMessages."Entry No";
           iEntryNo:=iEntryNo+1;
           END
           ELSE BEGIN
           iEntryNo:=1;
           END;

           SMSMessages.RESET;
           SMSMessages.INIT;
           SMSMessages."Entry No":=iEntryNo;
           SMSMessages."Account No":="Member No";
           SMSMessages."Date Entered":=TODAY;
           SMSMessages."Time Entered":=TIME;
           SMSMessages.Source:='Cases';
           SMSMessages."Entered By":=USERID;
           SMSMessages."Sent To Server":=SMSMessages."Sent To Server"::No;
           //SMSMessages."Sent To Server":=SMSMessages."Sent To Server::No;
           SMSMessages."SMS Message":='Your case/complain has been received and assigned to.'+"Resource#1"+
                                     ' kindly contact the resource for follow ups';
           Cust.RESET;
           IF Cust.GET("Member No") THEN
           SMSMessages."Telephone No" := Cust."Phone No.";
           SMSMessages.INSERT;*/

    end;

    local procedure smsResolved()
    var
        iEntryNo: Integer;
        Usersetup: Record User;
        phoneNo: Code[20];
        userAuthorizer: Text;
    begin

        //SMS MESSAGE
        /* SMSMessages.RESET;
         IF SMSMessages.FIND('+') THEN BEGIN
         iEntryNo:=SMSMessages."Entry No";
         iEntryNo:=iEntryNo+1;
         END
         ELSE BEGIN
         iEntryNo:=1;
         END;

         SMSMessages.RESET;
         SMSMessages.INIT;
         SMSMessages."Entry No":=iEntryNo;
         SMSMessages."Account No":="Member No";
         SMSMessages."Date Entered":=TODAY;
         SMSMessages."Time Entered":=TIME;
         SMSMessages.Source:='Cases';
         SMSMessages."Entered By":=USERID;
         SMSMessages."Sent To Server":=SMSMessages."Sent To Server"::No;
         //SMSMessages."Sent To Server":=SMSMessages."Sent To Server::No;
         SMSMessages."SMS Message":='Your case/complain has been resolved by.'+"Resolved User"+
                                   ' Thank you for your being our priority customer';
         Cust.RESET;
         IF Cust.GET("Member No") THEN
         SMSMessages."Telephone No" := Cust."Phone No.";
         SMSMessages.INSERT;*/

    end;

    // local procedure Sendtouser()
    // var
    //     iEntryNo: Integer;
    //     Usersetup: Record User;
    //     phoneNo: Code[20];
    //     userAuthorizer: Text;
    // begin
    /*Usersetup.RESET;
    Usersetup.SETRANGE(Usersetup."User Name","Resource Assigned");
    IF Usersetup.FIND('-')THEN BEGIN
    phoneNo:=Usersetup."Phone No";
    END;
        IF SMSMessage.FIND('+') THEN BEGIN
          iEntryNo:=SMSMessage."Entry No";
          iEntryNo:=iEntryNo+1;
          END
          ELSE BEGIN
          iEntryNo:=1;
          END;

          SMSMessage.RESET;
          SMSMessage.INIT;
          SMSMessage."Entry No":=iEntryNo;
          SMSMessage."Account No":=userAuthorizer;
          SMSMessage."Date Entered":=TODAY;
          SMSMessage."Time Entered":=TIME;
          SMSMessage.Source:= 'CASES';
          SMSMessage."Entered By":=USERID;
          SMSMessage."Sent To Server":=SMSMessage."Sent To Server"::No;
          SMSMessage."SMS Message":='Your have been assigned a cases of '+ "Member No"+'of '+"Case Description"+'on'+FORMAT(TODAY)+'at'+FORMAT(TIME)+'kindly give it priority' ;
          SMSMessage."Telephone No":=phoneNo;
          SMSMessage.INSERT;
          */

    //   end;

    //     local procedure SendEmailuser()
    //     var
    //         Usersetup: Record "User Setup";
    //         phoneNo: Code[20];
    //         UserEmail: Text;
    //         CaseRec: Record "Cases Management";
    //     begin

    //         SMTSetup.Get;
    //         //IF GenSetUp."Send Email Notifications" = TRUE THEN BEGIN
    //         notifymail.CreateMessage('UTAP Notification',SMTSetup."Email Sender Address","Assigned Officer Email",'Case Reported','Dear '+"Assigned Officer Name"+',  Your have been assigned a complaint of '+ "Received From"+' ' +"Case Description"+
    //         Format(Today)+'. Kindly give it priority.',false);

    //   //      notifymail.Send;

    //         //END;
    //     end;

    // // local procedure Emailcustomer()
    // // var
    // //     CustomerEmailtext: Text;
    // // begin
    // //     /*IF memb.GET("Member No")THEN BEGIN
    //       CustomerEmailtext:=memb."E-Mail (Personal)";
    //       END ELSE
    //       CustomerEmailtext:=memb."E-Mail";
    //     GenSetUp.GET();
    //     IF GenSetUp."Send Email Notifications" = TRUE THEN BEGIN
    //      //notifymail.CreateMessage('Cases Reported',GenSetUp."Sender Address",UserEmail,'Your have been assigned a cases of '+ "Member No"+'of '+"Case Description"+'on'+FORMAT(TODAY)+'at'+FORMAT(TIME)+'kindly give it priority',FALSE);
    //     notifymail.CreateMessage(USERID,GenSetUp."Sender Address",{CustomerEmailtext}'petermwololo2@gmail.com','Case Reported','Dear '+memb.Name+' Your case/complain has been fully resolved by '+' User: '+ USERID+' ' +"Case Description"+' on '
    //     +FORMAT(TODAY)+'thank you  for being our customer',FALSE);


    //     notifymail.Send;



    //     END;
    //     */

    // end;
}

