#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80384 "App Performance Logs Card"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Performance Diary Log";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee No."; "Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Names"; "Employee Names")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Directorate Code"; "Directorate Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Department Code"; "Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Region ID"; "Region ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Personal Scorecard ID"; "Personal Scorecard ID")
                {
                    ApplicationArea = Basic;
                }
                field("Year Reporting Code"; "Year Reporting Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Activity Start Date"; "Activity Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Activity End Date"; "Activity End Date")
                {
                    ApplicationArea = Basic;
                }
                field("CSP ID"; "CSP ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("AWP ID"; "AWP ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Board PC ID"; "Board PC ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("CEO PC ID"; "CEO PC ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Functional PC"; "Functional PC")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; "Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created Time"; "Created Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control25; "Performance Log Lines")
            {
                SubPageLink = "PLog No." = field(No),
                              "Employee No." = field("Employee No."),
                              "Personal Scorecard ID" = field("Personal Scorecard ID"),
                              "Strategy Plan ID" = field("CSP ID");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Suggest Targets")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if not Confirm('Are you sure you want to Suggest Targets', true) then
                        Error('Targets not Suggested');

                    StrategicPlanning.FnSuggestPlogLines(Rec);
                    Message('Performance log Target Lines Successfully');
                end;
            }
            separator(Action30)
            {
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                begin
                    //ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                var
                    ///   ApprovalMgt: Codeunit "Approvals Mgmt.";
                    SMTPSetup: Codeunit Mail;
                    CompanyInfo: Record "Company Information";
                    UserSetup: Record "User Setup";
                    SenderAddress: Text[80];
                    Recipients: Text[80];
                    SenderName: Text[70];
                    Body: Text[250];
                    Subject: Text[80];
                    FileName: Text;
                    FileMangement: Codeunit "File Management";
                    ProgressWindow: Dialog;
                    SMTPMailSet: Record "Email Account";
                    FileDirectory: Text[100];
                    Window: Dialog;
                    WindowisOpen: Boolean;
                    Counter: Integer;
                    cu400: Codeunit Mail;
                    DocLog: Record "Document E-mail Log";
                    BranchName: Code[80];
                    DimValue: Record "Dimension Value";
                    CustEmail: Text[100];
                    HRSetup: Record "Human Resources Setup";
                    CompInfo: Record "Company Information";
                    FundingOpp: Record "Project Contract Header";
                    GrantsSetup: Record "Grants Setup";
                    PerfomanceContractHeader: Record "Perfomance Contract Header";
                    Employee: Record Employee;
                    PlogLines: Record "Plog Lines";
                begin
                    TestField("Approval Status", "approval status"::Open);

                    PlogLines.Reset;
                    PlogLines.SetRange("PLog No.", No);
                    if PlogLines.FindFirst then begin
                        repeat
                            PlogLines.TestField("Achieved Target");
                        until PlogLines.Next = 0;
                    end;

                    "Approval Status" := "approval status"::Released;
                    Modify;
                    Message('Document has been approved Automatically');
                    //status must be open.
                    /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                     IF ApprovalsMgmt.IsBankRecReqApprovalsWorkflowEnabled(Rec) THEN
                      ApprovalsMgmt.OnSendBankRecReqForApproval(Rec);*/



                    /*
                    CompanyInfo.GET();
                      SMTPMailSet.GET;
                      SenderAddress := SMTPMailSet."Email Sender Address";
                      SenderName :=CompanyInfo.Name+' M&E';
                      Subject := STRSUBSTNO('Performance Log');
                         PerfomanceContractHeader.RESET;
                         PerfomanceContractHeader.SETRANGE(No,No);
                         IF PerfomanceContractHeader.FINDFIRST THEN BEGIN
                            FileDirectory :=  'C:\DOCS\';
                            FileName := 'PCA_'+PerfomanceContractHeader.No+'.pdf';
                            //Window.OPEN('processing');
                            Window.OPEN('PROCESSING Performance Log ############1##');
                              Window.UPDATE(1,PerfomanceContractHeader.No+'-'+PerfomanceContractHeader.Description);

                            WindowisOpen := TRUE;
                            IF FileName = '' THEN
                              ERROR('Please specify what the file should be saved as');


                             REPORT.SAVEASPDF(80007,FileDirectory+FileName,PerfomanceContractHeader);




                            IF EXISTS(FileDirectory+FileName) THEN BEGIN
                              Counter:=Counter+1;

                            SMTPMailSet.GET;
                            SenderAddress := SMTPMailSet."Email Sender Address";



                           Employee.RESET;
                           Employee.SETRANGE("No.","Employee No.");
                           IF Employee.FIND('-') THEN BEGIN
                             Recipients :=Employee."Company E-Mail";
                           END;
                           IF Recipients<>'' THEN BEGIN
                             Body:='Dear Team <BR>Please find attached the Plog Report <Br>'+Description;
                              cu400.CreateMessage(CompanyInfo.Name,SenderAddress,Recipients,Subject,Body,TRUE);

                              cu400.AddBodyline(
                              '<BR><BR>Kind Regards,');
                              cu400.AddBodyline('<BR>'+CompInfo.Name);
                              cu400.AddAttachment(FileDirectory+FileName,FileName);
                              cu400.Send;

                              SLEEP(1000);
                              Window.CLOSE;
                          END;
                          END;
                        END;
                  */

                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                begin
                    /*TESTFIELD("Approval Status","Approval Status"::"Pending Approval");//status must be open.
                    ApprovalsMgmt.OnCancelPerformanceLogsApprovalRequest(Rec);*/

                end;
            }
            separator(Action31)
            {
            }
            action("Print Performance Log Summary")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;

                trigger OnAction()
                begin
                    SetRange(No, No);
                    Report.Run(80011, true, true, Rec)
                end;
            }
            separator(Action33)
            {
            }
            action("Post Performance Log")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    PlogLines: Record "Plog Lines";
                    SubPlogLines: Record "Sub Plog Lines";
                begin
                    if not Confirm('Are you sure you want to Post', true) then
                        Error('Perforamnce Log not Posted');
                    TestField("Approval Status", "approval status"::Released);
                    PlogLines.Reset;
                    PlogLines.SetRange("PLog No.", No);
                    if PlogLines.FindFirst then begin
                        repeat
                            if (PlogLines."Activity Type" <> PlogLines."activity type"::"JD Activity") then begin
                                StrategicPlanning.FnInsertPlogEntry("CSP ID", '', '', '', PlogLines."Initiative No.", Description, Entrytype::Actual, "Year Reporting Code", '', PlogLines."Planned Date", "Directorate Code", "Department Code", PlogLines."Achieved Target", 0, No, SourceType
                               , "Employee No.", PlogLines."Achieved Date", Documenttype::Plog, "Region ID", "Personal Scorecard ID", "AWP ID", "Board PC ID", "CEO PC ID", "Functional PC", PlogLines."Unit of Measure");
                            end;
                            if (PlogLines."Activity Type" = PlogLines."activity type"::"JD Activity") then begin
                                StrategicPlanning.FnInsertJDPlogEntry(PlogLines);
                            end;

                            //sub Plog Lines
                            SubPlogLines.Reset;
                            SubPlogLines.SetRange("PLog No.", PlogLines."PLog No.");
                            SubPlogLines.SetRange("Initiative No.", PlogLines."Initiative No.");
                            if SubPlogLines.FindFirst then begin
                                repeat

                                    StrategicPlanning.FnInsertSubPlogEntry("CSP ID", '', '', '', SubPlogLines."Initiative No.", Description, Entrytype::Actual, "Year Reporting Code", '', SubPlogLines."Planned Date", "Directorate Code", "Department Code",
                                    SubPlogLines."Achieved Target", 0, No, SourceType, "Employee No.", SubPlogLines."Achieved Date", Documenttype::Plog, "Region ID", "Personal Scorecard ID", "AWP ID", "Board PC ID", "CEO PC ID", "Functional PC", SubPlogLines."Unit of Measure",
                                    SubPlogLines."Sub Activity No.");
                                until SubPlogLines.Next = 0;
                            end;

                        until PlogLines.Next = 0;
                    end;
                    Posted := true;
                    "Posted By" := UserId;
                    "Posted On" := Today;
                    Modify;

                    Message('Performance Log %1 has been Posted Successfully', No);
                end;
            }
        }
    }

    var
        PerformanceDiaryEntry: Record "Performance Diary Entry";
        StrategicPlanning: Codeunit "Strategic Planning";
        EntryType: Option Planned,Actual;
        SourceType: Option "Strategic Plan","Perfomance Contract";
        DocumentType: Option Plog,Appraisal;
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        AnnualReportingCodes: Record "Annual Reporting Codes";
        QuarterlyReportingPeriods: Record "Quarterly Reporting Periods";
}

