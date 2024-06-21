#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69236 "Employee Requisition Card"
{
    DeleteAllowed = false;
    InsertAllowed = true;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Functions,Job';
    SourceTable = "Employee Requisitions";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Requisition No."; "Requisition No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Requisition Date"; "Requisition Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                }
                field(Requestor; Requestor)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Caption = 'Center';
                    Importance = Promoted;
                }
                field("Job ID"; "Job ID")
                {
                    ApplicationArea = Basic;
                    Editable = "Job IDEditable";
                    Importance = Promoted;
                    TableRelation = "ManPower Planning Lines"."Entry No";
                }
                field("Job Description"; Obstxt)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        /*CALCFIELDS("Job Description");
                        "Job Description".CREATEINSTREAM(ObjInstr);
                        Obj.READ(ObjInstr);
                        
                        
                        IF Obstxt<>FORMAT(Obj) THEN
                        BEGIN
                         CLEAR("Job Description");
                         CLEAR(Obj);
                         Obj.ADDTEXT(Obstxt);
                         "Job Description".CREATEOUTSTREAM(ObjOutStr);
                         Obj.WRITE(ObjOutStr);
                        // MODIFY;
                        END;
                        */

                    end;
                }
                field("Job Title"; "Job Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Grade"; "Job Grade")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field("Reason For Request"; "Reason For Request")
                {
                    ApplicationArea = Basic;
                    Editable = "Reason For RequestEditable";
                }
                field("Type of Contract Required"; "Type of Contract Required")
                {
                    ApplicationArea = Basic;
                }
                field(Priority; Priority)
                {
                    ApplicationArea = Basic;
                    Editable = PriorityEditable;
                }
                field("Vacant Positions"; "Vacant Positions")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Required Positions"; "Required Positions")
                {
                    ApplicationArea = Basic;
                    Editable = "Required PositionsEditable";
                    Importance = Promoted;
                }
                field("Closing Date"; "Closing Date")
                {
                    ApplicationArea = Basic;
                    Editable = "Closing DateEditable";
                    Importance = Promoted;
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Type"; "Requisition Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advertisement Type';
                    Editable = "Requisition TypeEditable";
                    Importance = Promoted;
                }
                field(Closed; Closed)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
            }
            group("Additional Information")
            {
                Caption = 'Additional Information';
                field("Any Additional Information"; "Any Additional Information")
                {
                    ApplicationArea = Basic;
                    Editable = AnyAdditionalInformationEditab;
                }
                field("Reason for Request(Other)"; "Reason for Request(Other)")
                {
                    ApplicationArea = Basic;
                    Editable = ReasonforRequestOtherEditable;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755020; Outlook)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Fu&nctions")
            {
                Caption = 'Fu&nctions';
                action(Advertise)
                {
                    ApplicationArea = Basic;
                    Caption = 'Advertise';
                    Image = Salutation;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        if Status <> Status::Approved then Error('The job position should first be approved');

                        /*HREmp.RESET;
                        HREmp.SETRANGE(HREmp."No.");
                        REPEAT
                        HREmp.TESTFIELD(HREmp."Company E-Mail");
                        SMTP.CreateMessage('Job Advertisement','info@leventis.com',HREmp."Company E-Mail",
                        'Leventis Job Vacancy','A vacancy with the job description' +"Job Description"+'is open for applications',TRUE);
                        SMTP.Send();
                        UNTIL HREmp.NEXT=0;*/

                        TestField("Requisition Type", "requisition type"::Internal);

                        HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                        if HREmp.Find('-') then

                            //GET E-MAIL PARAMETERS FOR JOB APPLICATIONS
                            HREmailParameters.Reset;
                        HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."associate with"::"Vacancy Advertisements");
                        if HREmailParameters.Find('-') then begin
                            //      repeat
                            //      HREmp.TestField(HREmp."Company E-Mail");
                            //      SMTP.CreateMessage(HREmailParameters."Sender Name",HREmailParameters."Sender Address",HREmp."Company E-Mail",
                            //      HREmailParameters.Subject,'Dear'+' '+ HREmp."First Name" +' '+
                            //      HREmailParameters.Body+' '+"Job Title" +' '+ HREmailParameters."Body 2"+' '+ Format("Closing Date")+'. '+
                            //      HREmailParameters."Body 3",true);
                            //      SMTP.Send();
                            //      until HREmp.Next=0;

                            // Message('All Employees have been notified about this vacancy');
                        end;

                    end;
                }
                action("Mark as Closed/Open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mark as Closed/Open';
                    Image = ReopenCancelled;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        if Closed then begin
                            if not Confirm('Are you sure you want to Re-Open this Document', false) then exit;
                            Closed := false;
                            Modify;
                            Message('Employee Requisition %1 has been Re-Opened', "Requisition No.");

                        end else begin
                            if not Confirm('Are you sure you want to close this Document', false) then exit;
                            Closed := true;
                            Modify;
                            Message('Employee Requisition %1 has been marked as Closed', "Requisition No.");
                        end;
                    end;
                }
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Image = PrintReport;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        HREmpReq.Reset;
                        HREmpReq.SetRange(HREmpReq."Requisition No.", "Requisition No.");
                        if HREmpReq.Find('-') then
                            Report.Run(55489, true, true, HREmpReq);
                    end;
                }
                action("&Send Mail to HR to add vacant position")
                {
                    ApplicationArea = Basic;
                    Caption = '&Send Mail to HR to add vacant position';
                    Image = Email;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = false;
                    Visible = false;

                    trigger OnAction()
                    begin
                        objEmp.Reset;
                        objEmp.SetRange(objEmp."Global Dimension 2 Code", "Global Dimension 2 Code");
                        objEmp.SetRange(objEmp.HR, true);
                        if objEmp.Find('-') then begin
                            if objEmp."Company E-Mail" = '' then Error('THe HR doesnt have an email Account');
                            //**********************send mail**********************************

                            Message('EMail Sent');
                        end else begin
                            Message('There is no employee marked as HR in that department');
                        end;
                    end;
                }
                action("Re-Open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re-Open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Visible = false;

                    trigger OnAction()
                    begin
                        Status := Status::New;
                        Modify;
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    begin
                        //IF ApprovalsMgmt.CheckSalesApprovalsWorkflowEnabled(Rec) THEN
                        //ApprovalsMgmt.OnSendSalesDocForApproval(Rec);
                        if Confirm('Send Document for Approval?', true) = false then exit;
                        Status := Status::Approved;
                        Message('Approved!');
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    begin
                        //ApprovalsMgmt.OnCancelSalesApprovalRequest(Rec);
                        if Confirm('Cancel Document?', true) = false then exit;
                        Status := Status::New;
                        Message('Cancelled!');
                    end;
                }
            }
            group(Job)
            {
                Caption = 'Job';
                action(Requirements)
                {
                    ApplicationArea = Basic;
                    Caption = 'Requirements';
                    Image = JobListSetup;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Visible = false;
                }
                action(Responsibilities)
                {
                    ApplicationArea = Basic;
                    Caption = 'Responsibilities';
                    Image = JobResponsibility;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Visible = false;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        UpdateControls;

        HRLookupValues.SetRange(HRLookupValues.Code, "Type of Contract Required");
        if HRLookupValues.Find('-') then
            ContractDesc := HRLookupValues.Description;
        /*
        CALCFIELDS("Job Description");
        "Job Description".CREATEINSTREAM(ObjInstr);
        Obj.READ(ObjInstr);
        Obstxt:=FORMAT(Obj);
        */

    end;

    trigger OnInit()
    begin
        TypeofContractRequiredEditable := true;
        AnyAdditionalInformationEditab := true;
        "Required PositionsEditable" := true;
        "Requisition TypeEditable" := true;
        "Closing DateEditable" := true;
        PriorityEditable := true;
        ReasonforRequestOtherEditable := true;
        "Reason For RequestEditable" := true;
        "Responsibility CenterEditable" := true;
        "Job IDEditable" := true;
        "Requisition DateEditable" := true;
        "Requisition No.Editable" := true;
    end;

    var
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL;
        ApprovalEntries: Page "Approval Entries";
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        HREmpReq: Record "Employee Requisitions";
        SMTP: Codeunit Mail;
        HRSetup: Record "Human Resources Setup";
        CTEXTURL: Text[30];
        HREmp: Record Employee;
        HREmailParameters: Record "Hr E-Mail Parameters";
        ContractDesc: Text[30];
        HRLookupValues: Record "HR Lookup Values";
        [InDataSet]
        "Requisition No.Editable": Boolean;
        [InDataSet]
        "Requisition DateEditable": Boolean;
        [InDataSet]
        "Job IDEditable": Boolean;
        [InDataSet]
        "Responsibility CenterEditable": Boolean;
        [InDataSet]
        "Reason For RequestEditable": Boolean;
        [InDataSet]
        ReasonforRequestOtherEditable: Boolean;
        [InDataSet]
        PriorityEditable: Boolean;
        [InDataSet]
        "Closing DateEditable": Boolean;
        [InDataSet]
        "Requisition TypeEditable": Boolean;
        [InDataSet]
        "Required PositionsEditable": Boolean;
        [InDataSet]
        AnyAdditionalInformationEditab: Boolean;
        [InDataSet]
        TypeofContractRequiredEditable: Boolean;
        DimValue: Record "Dimension Value";
        objEmp: Record Employee;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        Obstxt: Text;
        Rectxt: Text;
        Obj1: BigText;
        ObjInstr1: InStream;
        ObjOutStr1: OutStream;
        Obstxt1: Text;


    procedure TESTFIELDS()
    begin
        TestField("Job ID");
        TestField("Closing Date");
        TestField("Type of Contract Required");
        TestField("Requisition Type");
        TestField("Required Positions");
        if "Reason For Request" = "reason for request"::Other then
            TestField("Reason for Request(Other)");
    end;


    procedure UpdateControls()
    begin

        if Status = Status::New then begin
            "Requisition No.Editable" := true;
            "Requisition DateEditable" := true;
            "Job IDEditable" := true;
            "Responsibility CenterEditable" := true;
            "Reason For RequestEditable" := true;
            ReasonforRequestOtherEditable := true;
            PriorityEditable := true;
            "Closing DateEditable" := true;
            "Requisition TypeEditable" := true;
            "Required PositionsEditable" := true;
            "Required PositionsEditable" := true;
            AnyAdditionalInformationEditab := true;
            TypeofContractRequiredEditable := true;
        end else begin
            "Requisition No.Editable" := false;
            "Requisition DateEditable" := false;
            "Job IDEditable" := false;
            "Responsibility CenterEditable" := false;
            "Reason For RequestEditable" := false;
            ReasonforRequestOtherEditable := false;
            PriorityEditable := false;
            "Closing DateEditable" := false;
            "Requisition TypeEditable" := false;
            "Required PositionsEditable" := false;
            "Required PositionsEditable" := false;
            AnyAdditionalInformationEditab := false;

            TypeofContractRequiredEditable := false;
        end;
    end;
}

