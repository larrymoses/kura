#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 50010 "portal"
{

    trigger onrun()
    begin

    end;

    var
        NoReqToApproveErr: Label 'There is no approval request to approve.';
        DelegateOnlyOpenRequestsErr: Label 'You can only delegate open approval requests.';
        ApproveOnlyOpenRequestsErr: Label 'You can only approve open approval requests.';
        RejectOnlyOpenRequestsErr: Label 'You can only reject open approval entries.';
        ApprovalsDelegatedMsg: Label 'The selected approval requests have been delegated.';

        NoReqToRejectErr: Label 'There is no approval request to reject.';
        NoReqToDelegateErr: Label 'There is no approval request to delegate.';

    procedure Approve("Table ID": Integer; DocumentNo: Code[20]; "Document Type": Integer; "Portal User": Code[50]) status: Text
    var
        ThisRecordID: RecordId;
        userId1: Code[50];
    begin
        userId1 := 'KURA\' + "Portal User";
        if ("Table ID" = 0) or (DocumentNo = '') or (userId1 = '') then
            Error('...');
        ThisRecordID := GetRecordID("Table ID", DocumentNo, 0);//.Get(ThisRecordID);
        ApproveRecordApprovalRequest(ThisRecordId, userId1);
        status += 'success*The Record has been approved successfully';
    end;

    procedure getComments("Table ID": Integer; DocumentNo: Code[20]; "Document Type": Enum "Approval Document Type"; "Portal User": Code[50]): Text

    begin

    end;

    Procedure Reject("Table ID": Integer; DocumentNo: Code[20]; "Document Type": Integer; "Portal User": Code[50]; Comments: Text[80]) status: Text
    var
        ThisRecordID: RecordId;
        userId1: Code[50];

    begin
        userId1 := 'KURA\' + "Portal User";
        if ("Table ID" = 0) or (DocumentNo = '') or (userId1 = '') then
            Error('...');
        ThisRecordID := GetRecordID("Table ID", DocumentNo, "Document Type");
        RejectRecordApprovalRequest(ThisRecordID, userId1, Comments);
        status += 'success*The Record has been rejected successfully';
    end;

    Procedure Delegate("Table ID": Integer; DocumentNo: Code[20]; "Document Type": Integer; "Portal User": Code[50]) status: Text
    var
        ThisRecordID: RecordId;
        userId1: code[50];
    begin
        userId1 := 'KURA\' + "Portal User";
        if ("Table ID" = 0) or (DocumentNo = '') or (userId1 = '') then
            Error('...');
        ThisRecordID := GetRecordID("Table ID", DocumentNo, "Document Type");
        DelegateRecordApprovalRequest(ThisRecordID, userId1);
        status += 'success*The Record has been degated successfully';

    end;

    local procedure DelegateRecordApprovalRequest(RecordID: RecordID; "Portal User": Code[50])
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        if not FindOpenApprovalEntryForCurrUser(ApprovalEntry, RecordID, "Portal User") then
            Error(NoReqToDelegateErr);

        ApprovalEntry.SetRecFilter;
        ApprovalsMgmt.DelegateApprovalRequests(ApprovalEntry);
    end;

    local procedure RejectRecordApprovalRequest(RecordID: RecordID; "Portal User": Code[50]; Comments: Text[80])
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        ApprovalCommentLine: Record "Approval Comment Line";
    begin
        if not FindOpenApprovalEntryForCurrUser(ApprovalEntry, RecordID, "Portal User") then
            Error(NoReqToRejectErr);
        if Comments = '' then
            error('Please specify rejection reason on the comments.');
        ApprovalEntry.SetRecFilter;
        InsertComments(RecordID, Comments, "Portal User");
        ApprovalsMgmt.RejectApprovalRequests(ApprovalEntry);
    end;

    Local procedure InsertComments(RecordIDs: RecordID; Comment: Text[80]; "Portal User": Code[50])
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalCommentLine: Record "Approval Comment Line";
        FindRecordManagement: Codeunit "Find Record Management";
    begin
        ApprovalEntry.reset();
        ApprovalEntry.SetRange("Record ID to Approve", RecordIDs);
        ApprovalEntry.SetRange("Table ID", RecordIDs.TableNo);
        ApprovalEntry.SetRange("Approver ID", "Portal User");
        ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);
        if ApprovalEntry.FindFirst() then begin
         //   repeat
                ApprovalCommentLine.Init();
                //ApprovalCommentLine.TransferFields(ApprovalCommentLine);
                ApprovalCommentLine."Entry No." := FindRecordManagement.GetLastEntryIntFieldValue(ApprovalCommentLine, ApprovalCommentLine.FieldNo("Entry No.")) + 1;
                ApprovalCommentLine.Comment := Comment;
                ApprovalCommentLine."Document Type" := ApprovalEntry."Document Type";
                ApprovalCommentLine."User ID" := ApprovalEntry."Approver ID";
                ApprovalCommentLine."Date and Time" := CurrentDateTime;
                ApprovalCommentLine."Workflow Step Instance ID" := ApprovalEntry."Workflow Step Instance ID";
                ApprovalCommentLine."Table ID" := RecordIDs.TableNo;
                ApprovalCommentLine."Document No." := ApprovalEntry."Document No.";
                ApprovalCommentLine."Record ID to Approve" := RecordIDs;
                ApprovalCommentLine.Insert();
            //until ApprovalEntry.Next() = 0;
        end;
    end;



    Local procedure ApproveRecordApprovalRequest(RecordID: RecordID; "Portal User": Code[50])
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        if not FindOpenApprovalEntryForCurrUser(ApprovalEntry, RecordID, "Portal User") then
            Error(NoReqToApproveErr);
        // if not FindOpenApprovalEntryForCurrEmployee(ApprovalEntry, RecordID, "Portal User") then
        // Error(NoReqToApproveErr);

        ApprovalEntry.SetRecFilter;
        ApprovalsMgmt.ApproveApprovalRequests(ApprovalEntry);
    end;

    Local procedure FindOpenApprovalEntryForCurrUser(var ApprovalEntry: Record "Approval Entry"; RecordID: RecordID; "Portal User": Code[50]): Boolean
    var
        UserSetup: Record "User Setup";
    begin
        ApprovalEntry.Reset();
        ApprovalEntry.SetRange("Table ID", RecordID.TableNo);
        ApprovalEntry.SetRange("Record ID to Approve", RecordID);
        ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);
        if UserSetup.Get(UserId) then begin
            if UserSetup."Portal User" then begin
                ApprovalEntry.SetRange("Approver ID", "Portal User");
            end else
                ApprovalEntry.SetRange("Approver ID", UserId);
        end;
        ApprovalEntry.SetRange("Related to Change", false);
        exit(ApprovalEntry.FindFirst);
    end;

    Local procedure FindOpenApprovalEntryForCurrEmployee(var ApprovalEntry: Record "Approval Entry"; RecordID: RecordID; "Portal User": Code[50]): Boolean
    var
        UserSetup: Record "User Setup";
    begin
        ApprovalEntry.Reset();
        ApprovalEntry.SetRange("Table ID", RecordID.TableNo);
        ApprovalEntry.SetRange("Record ID to Approve", RecordID);
        ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);
        UserSetup.Reset();
        UserSetup.SetRange("Portal User", true);
        if UserSetup.FindFirst() then
            ApprovalEntry.SetRange("Approver ID", UserSetup."Approver ID");
        if UserSetup.Get(UserId) then begin
            if UserSetup."Portal User" then
                ApprovalEntry.SetRange("Employee No.", "Portal User");
        end;
        ApprovalEntry.SetRange("Related to Change", false);
        exit(ApprovalEntry.FindFirst);
    end;


     procedure GetRecordID("Table ID": Integer; "No.": Code[20]; "Document Type": Enum "Approval Document Type"): RecordId
    var
        Customer: Record Customer;
        Vendor: Record Vendor;
        Item: Record Item;
        Employee: Record Employee;
        FixedAsset: Record "Fixed Asset";
        Resource: Record Resource;
        SalesHeader: Record "Sales Header";
        PurchaseHeader: Record "Purchase Header";
        Job: Record Job;
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        HRLeaveApplications: Record "HR Leave Applications";
        PurchInvHeader: Record "Purch. Inv. Header";
        PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.";
        VATReportHeader: Record "VAT Report Header";
        DocumentAttachmentDetails: Page "Document Attachment Details";
        RecRef: RecordRef;
        PaymentTerms: Record "Payments";
        PayTerms: Record "Payment Terms";
        PHeader: Record "Purchase Header";
        Receipts: record "Receipts Header1";
        imemo: record "Imprest Memo";
        Measurements: Record "Measurement &  Payment Header";
        InsuranceGuarantee: Record "Insurance/Guarantee Header";
        SiteInstructionsHeader: Record "Site Instructions Header";
        ProjectStaffVoucher: Record "Project Staff Voucher";
        ProjectMobilization: Record "Project Mobilization Header";
        ProjectMeetingRegister: Record "Project Meeting Register";
        WEPContractorSubmission: Record "WEP Contractor Submission";
        TemporarySupervisionReq: Record "Temporary Supervision Requirem";
        WeeklyWorkPlan: Record "Work Plan Header";
        ContractorInspectionRequest: Record "Contractor Inspection Request";
        DailyWorkRecord: Record "Daily Work Records";
        SurveyQualityCheckH: Record "Survey Quality Check Header";
        MaterialTestRecord: Record "Material Test Record";
        InspectionHeader: Record "Inspection Headersss";
        InspectionHeader1: Record "Inspection Header1";
        Jobs: Record Job;
        RoadworksBudgetCeiling: Record "Road Works Budget Ceilings";
        RAMWorkplan: Record "RAM Workplan Header";
        RequestForPCSumExpensing: Record "Request For PC Sum Expensing";
        RecordIdP: RecordId;
    begin
        case "Table ID" of
            0:
                exit;
            DATABASE::Customer:
                begin
                    RecRef.Open(DATABASE::Customer);
                    if Customer.Get("No.") then begin
                        RecRef.GetTable(Customer);
                        RecordIdP := Customer.RecordId;
                    end;


                end;
            DATABASE::Vendor:
                begin
                    RecRef.Open(DATABASE::Vendor);
                    if Vendor.Get("No.") then begin
                        RecRef.GetTable(Vendor);
                        RecordIdP := Vendor.RecordId;
                    end;

                end;
            DATABASE::Item:
                begin
                    RecRef.Open(DATABASE::Item);
                    if Item.Get("No.") then begin
                        RecRef.GetTable(Item);
                        RecordIdP := Item.RecordId;
                    end;

                end;
            DATABASE::Employee:
                begin
                    RecRef.Open(DATABASE::Employee);
                    if Employee.Get("No.") then begin
                        RecRef.GetTable(Employee);
                        RecordIdP := Employee.RecordId;
                    end;

                end;
            DATABASE::"Fixed Asset":
                begin
                    RecRef.Open(DATABASE::"Fixed Asset");
                    if FixedAsset.Get("No.") then begin
                        RecRef.GetTable(FixedAsset);
                        RecordIdP := FixedAsset.RecordId;
                    end;

                end;
            DATABASE::Resource:
                begin
                    RecRef.Open(DATABASE::Resource);
                    if Resource.Get("No.") then begin
                        RecRef.GetTable(Resource);
                        RecordIdP := Resource.RecordId;
                    end;

                end;
            DATABASE::Job:
                begin
                    RecRef.Open(DATABASE::Job);
                    if Job.Get("No.") then begin
                        RecRef.GetTable(Job);
                        RecordIdP := Job.RecordId;
                    end;

                end;
            DATABASE::"Sales Header":
                begin
                    RecRef.Open(DATABASE::"Sales Header");
                    if SalesHeader.Get("Document Type", "No.") then begin
                        RecRef.GetTable(SalesHeader);
                        RecordIdP := SalesHeader.RecordId;
                    end;

                end;
            DATABASE::"Sales Invoice Header":
                begin
                    RecRef.Open(DATABASE::"Sales Invoice Header");
                    if SalesInvoiceHeader.Get("No.") then begin
                        RecRef.GetTable(SalesInvoiceHeader);
                        RecordIdP := SalesInvoiceHeader.RecordId;
                    end;

                end;
            DATABASE::"HR Leave Applications":
                begin
                    RecRef.Open(DATABASE::"HR Leave Applications");
                    if HRLeaveApplications.Get("No.") then begin
                        RecRef.GetTable(HRLeaveApplications);
                        RecordIdP := HRLeaveApplications.RecordId;
                    end;

                end;
            DATABASE::"Sales Cr.Memo Header":
                begin
                    RecRef.Open(DATABASE::"Sales Cr.Memo Header");
                    if SalesCrMemoHeader.Get("No.") then begin
                        RecRef.GetTable(SalesCrMemoHeader);
                        RecordIdP := SalesCrMemoHeader.RecordId;
                    end;

                end;

            DATABASE::"Purch. Inv. Header":
                begin
                    RecRef.Open(DATABASE::"Purch. Inv. Header");
                    if PurchInvHeader.Get("No.") then begin
                        RecRef.GetTable(PurchInvHeader);
                        RecordIdP := PurchInvHeader.RecordId;
                    end;

                end;
            DATABASE::"Purch. Cr. Memo Hdr.":
                begin
                    RecRef.Open(DATABASE::"Purch. Cr. Memo Hdr.");
                    if PurchCrMemoHdr.Get("No.") then begin
                        RecRef.GetTable(PurchCrMemoHdr);
                        RecordIdP := PurchCrMemoHdr.RecordId;
                    end;

                end;
            DATABASE::"Payments":
                begin
                    RecRef.Open(DATABASE::"Payments");
                    if PaymentTerms.Get("No.") then begin
                        RecRef.GetTable(PaymentTerms);
                        RecordIdP := PaymentTerms.RecordId;
                    end;

                end;
            DATABASE::"Imprest Memo":
                begin
                    RecRef.Open(DATABASE::"Imprest Memo");
                    if imemo.Get("No.") then begin
                        RecRef.GetTable(imemo);
                        RecordIdP := imemo.RecordId;
                    end;

                end;
            DATABASE::"Payment Terms":
                begin
                    RecRef.Open(DATABASE::"Payment Terms");
                    if PayTerms.Get("No.") then begin
                        RecRef.GetTable(PayTerms);
                        RecordIdP := PayTerms.RecordId;
                    end;

                end;
            DATABASE::"Receipts Header1":
                begin
                    RecRef.Open(DATABASE::"Receipts Header1");
                    if Receipts.Get("No.") then begin
                        RecRef.GetTable(receipts);
                        RecordIdP := Receipts.RecordId;
                    end;

                end;
            DATABASE::"Purchase Header":
                begin
                    RecRef.Open(DATABASE::"Purchase Header");
                    PHeader.Reset();
                    PHeader.SetRange("No.", "No.");
                    if PHeader.FindFirst() then begin
                        RecRef.GetTable(PHeader);
                        RecordIdP := PHeader.RecordId;
                    end;

                end;
            Database::"Measurement &  Payment Header":
                begin
                    RecRef.Open(Database::"Measurement &  Payment Header");
                    Measurements.Reset();
                    Measurements.SetRange("Document No.", "No.");
                    if Measurements.findfirst() then begin
                        RecRef.GetTable(Measurements);
                        RecordIdP := Measurements.RecordId;
                    end

                end;
            Database::"Insurance/Guarantee Header":
                begin
                    RecRef.Open(Database::"Insurance/Guarantee Header");
                    InsuranceGuarantee.Reset();
                    InsuranceGuarantee.SetRange("Document No.", "No.");
                    if InsuranceGuarantee.findfirst() then begin
                        RecRef.GetTable(InsuranceGuarantee);
                        RecordIdP := InsuranceGuarantee.RecordId;
                    end;

                end;
            Database::"Site Instructions Header":
                begin
                    RecRef.Open(Database::"Site Instructions Header");
                    SiteInstructionsHeader.Reset();
                    SiteInstructionsHeader.SetRange("Document No.", "No.");
                    if SiteInstructionsHeader.FindFirst() then begin
                        RecRef.GetTable(SiteInstructionsHeader);
                        RecordIdP := SiteInstructionsHeader.RecordId;
                    end;

                end;
            Database::"Project Staff Voucher":
                begin
                    RecRef.Open(Database::"Project Staff Voucher");
                    ProjectStaffVoucher.Reset();
                    ProjectStaffVoucher.SetRange("Document No.", "No.");
                    if ProjectStaffVoucher.findfirst() then begin
                        RecRef.GetTable(ProjectStaffVoucher);
                        RecordIdP := ProjectStaffVoucher.RecordId;
                    end;

                end;
            Database::"Project Mobilization Header":
                begin
                    RecRef.Open(Database::"Project Mobilization Header");
                    ProjectMobilization.Reset();
                    ProjectMobilization.SetRange("Document No.", "No.");
                    if ProjectMobilization.findfirst() then begin
                        RecRef.GetTable(ProjectMobilization);
                        RecordIdP := ProjectMobilization.RecordId;
                    end;

                end;
            Database::"Project Meeting Register":
                begin
                    RecRef.Open(Database::"Project Meeting Register");
                    ProjectMeetingRegister.Reset();
                    ProjectMeetingRegister.SetRange("Meeting ID", "No.");
                    if ProjectMeetingRegister.findfirst() then begin
                        RecRef.GetTable(ProjectMeetingRegister);
                        RecordIdP := ProjectMeetingRegister.RecordId;
                    end;

                end;
            Database::"WEP Contractor Submission":
                begin
                    RecRef.Open(Database::"WEP Contractor Submission");
                    WEPContractorSubmission.Reset();
                    WEPContractorSubmission.SetRange("Document No", "No.");
                    if WEPContractorSubmission.findfirst() then begin
                        RecRef.GetTable(WEPContractorSubmission);
                        RecordIdP := WEPContractorSubmission.RecordId;
                    end;

                end;
            Database::"Temporary Supervision Requirem":
                begin
                    RecRef.Open(Database::"Temporary Supervision Requirem");
                    TemporarySupervisionReq.Reset();
                    TemporarySupervisionReq.SetRange("Document No", "No.");
                    if TemporarySupervisionReq.findfirst() then begin
                        RecRef.GetTable(TemporarySupervisionReq);
                        RecordIdP := TemporarySupervisionReq.RecordId;
                    end;

                end;
            Database::"Work Plan Header":
                begin
                    RecRef.Open(Database::"Work Plan Header");
                    WeeklyWorkPlan.Reset();
                    WeeklyWorkPlan.SetRange("Document No.", "No.");
                    if WeeklyWorkPlan.findfirst() then begin
                        RecRef.GetTable(WeeklyWorkPlan);
                        RecordIdP := WeeklyWorkPlan.RecordId;
                    end;

                end;
            Database::"Contractor Inspection Request":
                begin
                    RecRef.Open(Database::"Contractor Inspection Request");
                    ContractorInspectionRequest.Reset();
                    ContractorInspectionRequest.SetRange("Document No.", "No.");
                    if ContractorInspectionRequest.findfirst() then begin
                        RecRef.GetTable(ContractorInspectionRequest);
                        RecordIdP := ContractorInspectionRequest.RecordId;
                    end;

                end;
            Database::"Daily Work Records":
                begin
                    RecRef.Open(Database::"Daily Work Records");
                    DailyWorkRecord.Reset();
                    DailyWorkRecord.SetRange("Daily Work No", "No.");
                    if DailyWorkRecord.findfirst() then begin
                        RecRef.GetTable(DailyWorkRecord);
                        RecordIdP := DailyWorkRecord.RecordId;
                    end;

                end;
            Database::"Survey Quality Check Header":
                begin
                    RecRef.Open(Database::"Survey Quality Check Header");
                    SurveyQualityCheckH.Reset();
                    SurveyQualityCheckH.SetRange("Document No", "No.");
                    if SurveyQualityCheckH.findfirst() then begin
                        RecRef.GetTable(SurveyQualityCheckH);
                        RecordIdP := SurveyQualityCheckH.RecordId;
                    end;

                end;
            Database::"Material Test Record":
                begin
                    RecRef.Open(Database::"Material Test Record");
                    MaterialTestRecord.Reset();
                    MaterialTestRecord.SetRange(Code, "No.");
                    if MaterialTestRecord.findfirst() then begin
                        RecRef.GetTable(MaterialTestRecord);
                        RecordIdP := MaterialTestRecord.RecordId;
                    end;

                end;
            Database::"Inspection Headersss":
                begin
                    RecRef.Open(Database::"Inspection Headersss");
                    InspectionHeader.Reset();
                    InspectionHeader.SetRange("Inspection No", "No.");
                    if InspectionHeader.findfirst() then begin
                        RecRef.GetTable(InspectionHeader);
                        RecordIdP := InspectionHeader.RecordId;
                    end;

                end;
            Database::"Inspection Header1":
                begin
                    RecRef.Open(Database::"Inspection Header1");
                    InspectionHeader1.Reset();
                    InspectionHeader1.SetRange("Inspection No", "No.");
                    if InspectionHeader1.findfirst() then begin
                        RecRef.GetTable(InspectionHeader1);
                        RecordIdP := InspectionHeader1.RecordId;
                    end;

                end;
            Database::Job:
                begin
                    RecRef.Open(Database::Job);
                    Jobs.Reset();
                    Jobs.SetRange("No.", "No.");
                    if Jobs.findfirst() then begin
                        RecRef.GetTable(Jobs);
                        RecordIdP := Jobs.RecordId;
                    end;

                end;
            Database::"Road Works Budget Ceilings":
                begin
                    RecRef.Open(Database::"Road Works Budget Ceilings");
                    RoadworksBudgetCeiling.Reset();
                    RoadworksBudgetCeiling.SetRange("Document No", "No.");
                    if RoadworksBudgetCeiling.findfirst() then begin
                        RecRef.GetTable(RoadworksBudgetCeiling);
                        RecordIdP := RoadworksBudgetCeiling.RecordId;
                    end;

                end;
            Database::"RAM Workplan Header":
                begin
                    RecRef.Open(Database::"RAM Workplan Header");
                    RAMWorkplan.Reset();
                    RAMWorkplan.SetRange("Document No", "No.");
                    if RAMWorkplan.findfirst() then begin
                        RecRef.GetTable(RAMWorkplan);
                        RecordIdP := RAMWorkplan.RecordId;
                    end;

                end;
            Database::"Request for PC sum Expensing":
                begin
                    RecRef.Open(Database::"Request for PC sum Expensing");
                    RequestForPCSumExpensing.Reset();
                    RequestForPCSumExpensing.SetRange("Document No.", "No.");
                    if RequestForPCSumExpensing.findfirst() then begin
                        RecRef.Gettable(RequestForPCSumExpensing);
                        RecordIdP := RequestForPCSumExpensing.RecordId;
                    end;

                end;
        //   exit(RecRef);
        end;
        exit(RecordIdP);
    end;

    // trigger OnRun()
    // begin
    //     //addIndividual('kuria' ,'mwangi' ,'victor','3138537','pin12345','Nairobi', '10-nairobi','00100','mwangivictork@gmail.com','0703886940','0703886940',1);
    //     //MESSAGE('%1', mathematics(10,10));
    //     Message(getAbstract('', 'CA-0048'));
    // end;

    // var
    //     objCustomer: Record Customer;
    //     //objCopyright: Record "Copyright Registration Table";
    //     objNoSeriesLine: Record "No. Series Line";
    //     objNoSeries: Record "No. Series";
    //     objPortalUser: Record portalusers;
    //     obj: BigText;
    //     objInstream: InStream;
    //     objOutstream: OutStream;
    //     objText: BigText;
    //     objValidation: Record emailvalidations;
    //     objServiceItems: Record "Service Item";
    //     Authentication: Record "Authentication Device Applicat";
    //     objVendor: Record Vendor;
    //     objCommittee: Record "Board Committees";
    //     objCommMembers: Record "Committee Board Members";
    //     objVoters: Record "Agenda Item Voters";
    //     objVoteItems: Record "Agenda vote items";
    //     objContact: Record Contact;
    //     objCopyrightFile: Record "Copyright Files";
    //     objAuthor: Record "Copyright Authors";
    //     LegInstr: InStream;
    //     LegOutStr: OutStream;
    //     LegText: Text;
    //     Leg: BigText;
    //     PostCodes: Record "Post Code";
    //     copyrightCategories: Record "Copyright Works Categories";
    //     copyrightSubCategories: Record "Copyright Works Sub-Categories";


    // procedure Testconnection()
    // begin
    // end;


    // procedure addIndividual(name: Text;idnumber: Code[8];pinno: Code[50];physicallocation: Text;PObox: Text;postalcode: Code[10];emailaddress: Text;telephone: Code[50];mobileNo: Code[15];category: Integer) status: Text
    // var
    //     objNumberSeries: Record "No. Series";
    // begin
    //     objCustomer.Reset;
    //     objCustomer.SetRange(objCustomer."ID. No.", idnumber);
    //     if objCustomer.Find('-') then begin
    //       status := 'danger*An applicant with the id number <strong>'+idnumber+'</strong> exists';
    //       end else begin
    //     status :='danger* Data could not be captured';
    //     objCustomer.Init;
    //     objCustomer."Customer Type" := objCustomer."customer type"::Trade;
    //     objCustomer."No." :='';
    //     objCustomer.Name := name;
    //     objCustomer."ID. No." :=idnumber;
    //     objCustomer."P.I.N" := pinno;
    //     objCustomer.Address := PObox;
    //     objCustomer."Post Code" :=postalcode;
    //     objCustomer."E-Mail" :=emailaddress;
    //     objCustomer."Address 2" := physicallocation;


    //     if objCustomer.Insert(true)  then begin
    //     status :='success*Your account was successfully created. Please check your email to see the next steps';
    //       objPortalUser.Init;
    //       objPortalUser.changedPassword :=0;
    //       objPortalUser."customer No" := idnumber;
    //        objPortalUser.validated:=false;
    //        objPortalUser.usertype:=0;
    //       objPortalUser.Insert;
    //       end
    //     else begin
    //     status :='danger*Could not insert';
    //     end;

    //     end;
    //     Message(status);
    //     exit(status);
    // end;


    // procedure login(customerNumber: Text;password: Text) status: Text
    // begin
    //     status := 'danger*Customer does not exist';
    //     objPortalUser.Reset;
    //     objPortalUser.SetRange(objPortalUser."customer No", customerNumber);
    //     if objPortalUser.Find('-') then begin
    //       if objPortalUser.Password = password then begin
    //       status := 'success*Login';
    //         end else begin
    //            status := 'danger*Wrong username or password';
    //           end;
    //       end else  begin
    //         //status := 'danger*Wrong username or password';
    //         //check if user is a director
    //         objVendor.Reset;
    //         objVendor.SetRange(objVendor."No.", customerNumber);
    //         if objVendor.Find('-') then begin
    //           //user is a director but not in portal users table
    //           //check user has email
    //           if objVendor."E-Mail" = '' then begin
    //              status := 'danger*Your account does not have a valid email address. Please contact the head office to have your details captured in the system';
    //           end else begin
    //             //create account in portal users
    //             objPortalUser.Init;
    //         objPortalUser."customer No" := customerNumber;
    //         objPortalUser.validated:= false;
    //          objPortalUser.changedPassword :=0;
    //          objPortalUser.usertype:=1;
    //         if objPortalUser.Insert then begin
    //           //send mail with activation link
    //            status := 'success*Board';
    //           end else begin
    //              status := 'danger*Your account could not be created. Please try again later';
    //             end;
    //             end;

    //           end else begin
    //             status := 'danger*Wrong username or password';
    //             end;
    //         end;
    //         exit(status);
    // end;


    // procedure addlog(member: Code[10];"key": Text;generatedAt: Text) status: Text
    // begin
    //     objValidation.Reset;
    //     objValidation.id:=member;
    //     objValidation.user:=key;
    //     objValidation.key:= generatedAt;
    //     objValidation.Insert;
    // end;


    // procedure resetPass(customerNo: Code[10];password: Text) status: Text
    // begin
    //     status:= 'danger*The account does not exist';
    //     //confirm a customer
    //     objCustomer.Reset;
    //     objCustomer.SetRange(objCustomer."ID. No.", customerNo);
    //     objVendor.Reset;
    //     objVendor.SetRange(objVendor."No.", customerNo);
    //     objContact.Reset;
    //     objContact.SetRange(objContact."No.", customerNo);
    //     if objCustomer.Find('-') or objVendor.Find('-') or objContact.Find('-') then begin
    //       objPortalUser.Reset;
    //       objPortalUser.SetRange(objPortalUser."customer No", customerNo);
    //       if objPortalUser.Find('-') then begin end else begin
    //         objPortalUser.Reset;
    //         objPortalUser.Init;
    //         objPortalUser."customer No" := customerNo;
    //         objPortalUser.validated:= true;
    //          objPortalUser.changedPassword :=0;
    //         objPortalUser.Insert;
    //         end;
    //         objPortalUser.Reset;
    //          objPortalUser.SetRange(objPortalUser."customer No", customerNo);
    //          if objPortalUser.Find('-') then begin
    //            objPortalUser.Password:= password;
    //            objPortalUser.validated := true;
    //            if objPortalUser.Modify then begin
    //              status:= 'success* You account password has been set. Please click <a href="Login.aspx"> here</a> to login';
    //              objValidation.Reset;
    //              objValidation.SetRange(objValidation.id, customerNo);
    //              if objValidation.Find('-') then begin
    //                objValidation.generatedAt := true;
    //                objValidation.Modify;
    //                end
    //               end else begin
    //                 status := 'danger*Your account password could not be reset';
    //               end;
    //            end else begin
    //              status := 'danger*your account password could not be reset. Please try agin later';
    //              end;
    //        end;

    //     //confirm a a portal user
    //     //set password
    //     //change account to activated
    //     //use link

    //     exit(status);
    // end;


    // procedure requestAuthenticationDevice(user: Code[10];copyrightWorks: Code[30];quantity: Integer;paymentRef: Code[30]) status: Text
    // begin
    //     status:= 'success*Your request has been received';
    //     //objServiceItems.
    //     /*
    //     status:= 'danger*Your request could not be placed';
    //     objCustomer.RESET;
    //     objCustomer.SETRANGE(objCustomer."No.",user);
    //     IF objCustomer.FIND('-') THEN BEGIN
    //       objServiceItems.INIT;
    //       objServiceItems."Customer No." := objCustomer."No.";
    //       objServiceItems.Name := objCustomer.Name;
    //       objServiceItems.Address := objCustomer.Address;
    //       objServiceItems."Post Code" := objCustomer."Post Code";
    //       objServiceItems.i:= objCustomer
    //         //objServiceItems:= objCustomer
    //       IF objServiceItems.INSERT THEN BEGIN
    //         status:= 'success*Your request was successfully placed';
    //         END ELSE BEGIN
    //           status:='danger*Your request could not be placed';
    //           END;
    //       END ELSE BEGIN
    //         status:= 'danger*The customer does not exist';
    //         END;*/

    //     //EXIT(status);
    //     status:= 'success*Your request has been received';
    //     //objServiceItems.

    //     //status:= 'danger*Your request could not be placed';
    //     objCustomer.Reset;
    //     objCustomer.SetRange(objCustomer."No.",user);
    //     if objCustomer.Find('-') then begin
    //       Authentication.Init;
    //       Authentication.Validate("Applicant No.",objCustomer."No.");
    //       Authentication."Copyright Works":=copyrightWorks;
    //       Authentication."Quantity Requested":=quantity;
    //      //Authentication.PaymentRef:=paymentRef;

    //       if Authentication.Insert then begin
    //         status:= 'success*Your request was successfully placed';
    //         end else begin
    //           status:='danger*Your request could not be placed';
    //           end;
    //       end else begin
    //         status:= 'danger*The customer does not exist';
    //         end;
    //     exit(status);

    // end;


    // procedure SendNotMail()
    // var
    //     Notification: Codeunit Mail;
    //     FileDirectory: Text[100];
    //     FileName: Text[100];
    //     SMTPMailSet: Record "Email Account";
    //     objCopyright1: Record "Copyright Registration Table";
    //     companyinfo: Record "Company Information";
    // begin

    //     SMTPMailSet.Get;

    //     FileDirectory :=  'C:\DOCS\';
    //     FileName := 'Certificate_'+UpperCase(objCopyright."Copyright Title")+'.pdf';
    //      objCopyright1.Reset;
    //      objCopyright1.SetFilter("No.",objCopyright."No.");
    //      Report.SaveAsPdf(56230,FileDirectory+FileName,objCopyright1);

    //     Notification.CreateMessage('Kenya Copyright Board ',SMTPMailSet."Email Sender Address",objCopyright."E-Mail",'Copyright Works',
    //                     'Dear '+ objCopyright.Name + ',<BR/><BR/>'+
    //                     ' Your copyright work ' +UpperCase(objCopyright."Copyright Title") + ' has been submitted',false);

    //     //Notification.AddBodyline(
    //     '<BR/><BR/>Kind Regards,'+
    //     '<BR/><BR/>ED Office.<BR/>');
    //     //Notification.AddBodyline('<BR/>'+companyinfo.Name);
    //     Notification.AddAttachment(FileDirectory+FileName,FileName);
    //     Notification.Send;
    // end;


    // procedure generateCopyrightReport(customerNo: Code[10];CopyrightNo: Code[10]) status: Text
    // var
    //     filelocation: Text;
    //     filefolder: label 'F:\projects\KecoboNew\KecoboNew\Downloads\';
    // begin

    //     status:='danger*Could not generate report';
    //     objCopyright.Reset;
    //     objCopyright.SetRange(objCopyright."No.", CopyrightNo);
    //     objCopyright.SetRange(objCopyright."Applicant Account", customerNo);
    //     if objCopyright.Find('-') then begin
    //       filelocation :=filefolder+CopyrightNo+'.pdf';
    //       if Exists(filelocation) then begin
    //         Erase(filelocation);
    //         end;
    //       Report.SaveAsPdf(56230,filelocation, objCopyright);
    //       status:='success*Your report was successfully generated. Click <a href="http://localhost:5837/Downloads/'+CopyrightNo+'.pdf" target="blank">here</a> to download';
    //       end else begin
    //         status:='danger*Your report could not be generated because of invalid credentials';
    //         end;

    //     exit(status);
    // end;


    // procedure createCommittee(committeeName: Text;startdate: Date;endDate: Date;mandate: Text) status: Text
    // var
    //     committeeCode: Text;
    // begin
    //     status:='danger*Committee Could not be created';
    //     objCommittee.Init;
    //     objCommittee.Description :=committeeName;
    //     objCommittee."Start Date":= startdate;
    //     objCommittee."End Date" :=endDate;
    //     objCommittee.Mandate := mandate;
    //      if objCommittee.Insert then begin
    //        committeeCode:= Format(objCommittee.Code);
    //        status := 'success*Committee Successfully created*'+committeeCode;
    //         end else begin
    //           status := 'danger*Committee could not be created';

    //           end;
    //           exit(status);
    // end;


    // procedure insertMember(committecode: Integer;user: Code[10];designation: Text)
    // begin
    //     /*objCommMembers.RESET;
    //     objCommMembers.Committee:=committecode;
    //     objCommMembers.Code:=user;
    //     objCommMembers."Director No":= user;
    //     IF designation= 'chairman' THEN BEGIN
    //     objCommMembers.Designation :='1';
    //       END ELSE IF designation='secretary' THEN BEGIN
    //         objCommMembers.Designation:='2';
    //         END ELSE BEGIN
    //         objCommMembers.Designation:='3';
    //         END;
    //     objCommMembers.INSERT;
    //     objCommMembers.RESET;
    //     */

    // end;


    // procedure generateDirectorPayslip(director: Code[10];payperiod: Date)
    // begin
    //     objVendor.Reset;
    //     objVendor.SetRange(objVendor."No.", director);
    //     objVendor.SetRange("Pay Period Filter", payperiod);
    //     if objVendor.Find('-') then begin
    //       Report.SaveAsPdf(89033,'F:\projects\KecoboNew\KecoboNew\Downloads\'+director+'.pdf' ,objVendor);
    //       end;
    // end;


    // procedure vote(voteitem: Code[10];user: Code[10];decision: Integer) status: Text
    // begin
    //     status:='danger*You are not allowed to vote';
    //     objVoteItems.Reset;
    //     objVoteItems.SetRange(objVoteItems."Item No", voteitem);
    //     if objVoteItems.Find('-') then begin
    //       objVoters.Reset;
    //       objVoters.SetRange(objVoters."Voter ID",user);
    //       objVoters.SetRange(objVoters."Agenda Vote Item code", voteitem);
    //       if objVoters.Find('-') then begin
    //         status:='danger*You have already cast your vote for the vote item';
    //         end else begin
    //           objVoters.Reset;
    //           objVoters."Voter ID":= user;
    //           objVoters."Agenda Vote Item code" :=voteitem;
    //           objVoters.Voted:=true;
    //           objVoters."Vote decision":= decision;
    //           objVoters.Insert;
    //           if decision=0 then begin
    //           objVoteItems."Yes Count":=objVoteItems."Yes Count"+1;
    //             end else if decision=2 then begin
    //                objVoteItems."Abstain Count":=objVoteItems."Abstain Count"+1;
    //               end else if decision=1 then begin
    //                  objVoteItems."No Count":=objVoteItems."No Count"+1;
    //                 end;
    //                 objVoteItems.Modify;
    //                 status:= 'success*your vote was successfully captured';

    //           end;
    //       end else begin
    //         status:= 'danger*You cannot vote for the item';
    //         end;
    //     exit(status);
    // end;


    // procedure copyrightStep1(customerNo: Code[10];title: Text;category: Code[10];subcategory: Code[10];dateOfFixation: Date;Language: Code[10];abstract: Text) status: Text
    // begin
    //      objCopyright.Reset;
    //         objCopyright.SetRange(objCopyright."Copyright Title", title);
    //         if objCopyright.Find('-') then begin
    //              status :='danger*A Copyright With the specified title exists';
    //           end else begin
    //     objCopyright.Init;
    //     objCopyright."No.":='';
    //     objCopyright.Validate("Applicant Account",customerNo);
    //     objCopyright."Copyright Title" := title;
    //     objCopyright."Copyright Work Category" := category;
    //     objCopyright.Language:= Language;
    //       objCopyright."Copyright Work SubCategory" :=subcategory;
    //        copyrightCategories.Reset;
    //             copyrightCategories.Get(category);
    //             objCopyright."Copyright Category Description":= copyrightCategories.Description;
    //             objCopyright."Copyright Work SubCategory" :=subcategory;
    //             copyrightSubCategories.Reset;
    //             copyrightSubCategories.SetRange(copyrightSubCategories.Code, subcategory);
    //             if copyrightSubCategories.FindSet then
    //               objCopyright."Copyright SubCategory Desc":= copyrightSubCategories.Description;
    //     objCopyright."Date of Fixation/Reduction":= dateOfFixation;
    //     objCopyright.Portal:= true;
    //     objCopyright.CalcFields("Copyright Work Abstract");
    //     objCopyright."Copyright Work Abstract".CreateInstream(objInstream);
    //     obj.Read(objInstream);


    //      if objCopyright.Insert(true) then begin
    //     status :='success*inserted*'+objCopyright."No.";
    //         objCopyright.CalcFields("Copyright Work Abstract");
    //             objCopyright."Copyright Work Abstract".CreateInstream(LegInstr);
    //             Leg.Read(LegInstr);
    //              LegText:= abstract;
    //             if LegText<>Format(Leg) then
    //             begin
    //                    Clear(objCopyright."Copyright Work Abstract");
    //                    Clear(Leg);
    //                    Leg.AddText(LegText);
    //                   objCopyright."Copyright Work Abstract".CreateOutstream(LegOutStr);
    //                    Leg.Write(LegOutStr);
    //                    objCopyright.Modify;
    //             end;
    //       // SendNotMail();
    //        end else begin
    //          status :='warning*We could not place your copyright';
    //          end;
    //          end;
    //          exit(status);
    // end;


    // procedure editCopyrightStep1(customerNo: Code[10];copyrightNo: Code[20];title: Text;category: Code[10];subcategory: Code[10];dateOfFixation: Date;Language: Code[10];abstract: Text) status: Text
    // var
    //     error: Boolean;
    // begin
    //     error:= false;
    //     objCopyright.Reset;
    //         objCopyright.SetRange(objCopyright."Copyright Title", title);
    //         if objCopyright.Find('-') then begin
    //           if objCopyright."No." <> copyrightNo then begin
    //              status :='danger*Please choose another title as there is another copyright with the specified title';
    //           error:=true;
    //          end else begin
    //            objCopyright.Reset;
    //             objCopyright.SetRange(objCopyright."No.", copyrightNo);
    //             objCopyright.SetRange(  objCopyright."Applicant Account", customerNo);
    //             if not objCopyright.Find('-') then begin
    //               status:='danger*You do not have the necessary permissions to make changes to this copyright';
    //               error:=true;
    //               end;
    //           end;
    //           end;
    //          if  not error then begin
    //            objCopyright.Reset;
    //            objCopyright.SetRange(objCopyright."No.", copyrightNo);
    //            if objCopyright.Find('-') then begin
    //             objCopyright."Copyright Title" := title;
    //              objCopyright.Language:= Language;
    //             objCopyright."Copyright Work Category" := category;
    //             copyrightCategories.Reset;
    //             copyrightCategories.Get(category);
    //             objCopyright."Copyright Category Description":= copyrightCategories.Description;
    //             objCopyright."Copyright Work SubCategory" :=subcategory;
    //             copyrightSubCategories.Reset;
    //             copyrightSubCategories.SetRange(copyrightSubCategories.Code, subcategory);
    //             if copyrightSubCategories.FindSet then
    //               objCopyright."Copyright SubCategory Desc":= copyrightSubCategories.Description;

    //             objCopyright."Date of Fixation/Reduction":= dateOfFixation;
    //             objCopyright.Portal:= true;

    //      if objCopyright.Modify then begin
    //     status :='success*Changes saved*'+objCopyright."No.";
    //         objCopyright.CalcFields("Copyright Work Abstract");
    //             objCopyright."Copyright Work Abstract".CreateInstream(LegInstr);
    //             Leg.Read(LegInstr);
    //              LegText:= abstract;
    //             if LegText<>Format(Leg) then
    //             begin
    //                    Clear(objCopyright."Copyright Work Abstract");
    //                    Clear(Leg);
    //                    Leg.AddText(LegText);
    //                   objCopyright."Copyright Work Abstract".CreateOutstream(LegOutStr);
    //                    Leg.Write(LegOutStr);
    //                    objCopyright.Modify;
    //             end;
    //       // SendNotMail();
    //        end else begin
    //          status :='danger*We could not make the requested changes to your copyright';
    //          end;
    //           end;
    //          end;
    //          exit(status);
    // end;


    // procedure copyrightStep2(customerNo: Code[10];copyrightNo: Code[10];agentSurName: Text;agentFirstName: Text;agentMiddleName: Text;agentId: Code[10];agentKraPin: Code[15];agentPhysicalLocation: Text;agentTelephone: Code[15];agentPoBox: Code[10];agentPostCode: Code[20];agentEmail: Text) status: Text
    // begin
    //     status:= 'danger*Your copyright could not be saved. Please try again';
    //     objCopyright.Reset;
    //     objCopyright.SetRange(objCopyright."No.", copyrightNo);
    //     objCopyright.SetRange(objCopyright."Applicant Account", customerNo);
    //     if objCopyright.Find('-') then begin
    //       objCopyright."Agent Surname":=agentSurName;
    //     objCopyright."Agent Middle Name" := agentMiddleName;
    //     objCopyright."Agent First Name" := agentFirstName;
    //     objCopyright."Agent ID. No." := agentId;
    //     objCopyright."Agent P.I.N" :=agentKraPin;
    //     objCopyright."Agent Address" :=agentPhysicalLocation;
    //     objCopyright."Agent Address 2" :=agentPoBox;
    //     objCopyright."Agent Phone No."  :=agentTelephone;
    //     objCopyright."Agent Email":= agentEmail;
    //     objCopyright."Agent Post Code":=agentPostCode;
    //     PostCodes.Reset;
    //     PostCodes.SetRange(PostCodes.Code, agentPostCode);
    //     if PostCodes.FindSet then
    //       objCopyright."Agent City":= PostCodes.City;


    //        if objCopyright.Modify then begin
    //          status:='success*Changes saved';
    //          end else begin
    //            status:='danger*your changes could not be saved';
    //            end;
    //       end else begin
    //         status:='danger*You do not have the necassary permission to make changes to the copyright';
    //         end;
    //     exit(status);
    // end;


    // procedure copyrightStep3(customerNo: Code[10];copyrightNo: Code[10];authorSurName: Text;authorFirstName: Text;authorMiddleName: Text;authorStageName: Text;authorId: Code[20];authorPin: Code[20];authorLocation: Text;authorPoBox: Code[20];authorPostCode: Code[20];authorLandline: Code[20];authorMobile: Code[20];authorEmail: Text) status: Text
    // begin
    //     status:= 'danger*Your copyright could not be saved. Please try again';
    //     objCopyright.Reset;
    //     objCopyright.SetRange(objCopyright."No.", copyrightNo);
    //     objCopyright.SetRange(objCopyright."Applicant Account", customerNo);
    //     if objCopyright.Find('-') then begin
    //       objCopyright."Author First Name" := authorFirstName;
    //     objCopyright."Author Middle Name" :=authorMiddleName;
    //     objCopyright."Author Surname" :=authorSurName;
    //     objCopyright."Author P.I.N" :=authorPin;
    //     objCopyright."Author ID. No." := authorId;
    //     objCopyright."Author Physical Address" := authorLocation;
    //     objCopyright."Author Postal Address":= authorPoBox;
    //     objCopyright."Author Contact" := authorLandline;
    //     objCopyright."Author Phone No." := authorMobile;
    //     objCopyright.authorPostCode:=authorPostCode;
    //     objCopyright."Author Stage Name":= authorStageName;
    //     objCopyright."Author Email":=authorEmail;
    //     PostCodes.Reset;
    //     PostCodes.SetRange(PostCodes.Code, authorPostCode);
    //     if PostCodes.FindSet then
    //       objCopyright."Author City":= PostCodes.City;

    //        if objCopyright.Modify then begin
    //          status:='success*Changes saved';
    //          end else begin
    //            status:='danger*your changes could not be saved';
    //            end;
    //       end else begin
    //         status:='danger*You do not have the necassary permission to make changes to the copyright';
    //         end;
    //     exit(status);
    // end;


    // procedure copyrightStep4(customerNo: Code[10];copyrightNo: Code[10];nameOfProducer: Text;producerId: Code[10];countryOfFirstProduction: Code[10];isbn: Text;categoryOfProduction: Code[20];producerTelephone: Text;producerEmail: Text;"dateOfAssignment/licence": Date;producerPin: Code[20]) status: Text
    // begin
    //     status:= 'danger*Your copyright could not be saved. Please try again';
    //     objCopyright.Reset;
    //     objCopyright.SetRange(objCopyright."No.", copyrightNo);
    //     objCopyright.SetRange(objCopyright."Applicant Account", customerNo);
    //     if objCopyright.Find('-') then begin
    //       objCopyright."Prod/Pub Name" :=nameOfProducer;
    //     objCopyright."Prod/Pub ID No/Company Reg No" := producerId;
    //     objCopyright."1st Country of Production" :=countryOfFirstProduction;
    //     objCopyright.ISBN := isbn;
    //     objCopyright."Prod/Pub Phone No." :=producerTelephone;
    //     objCopyright."Prod/Pub Email" :=producerEmail;
    //     objCopyright."Prod/Pub P.I.N":= producerPin;
    //     objCopyright."Assignment/License Date":="dateOfAssignment/licence";
    //     objCopyright."Production Category":=objCopyright."production category"::"Self-Produced";
    //     if categoryOfProduction<>'Self-produced' then
    //       objCopyright."Production Category":=objCopyright."production category"::"Label/Record Company";
    //        if objCopyright.Modify then begin
    //          status:='success*Changes saved';
    //          end else begin
    //            status:='danger*your changes could not be saved';
    //            end;
    //       end else begin
    //         status:='danger*You do not have the necassary permission to make changes to the copyright';
    //         end;
    //     exit(status);
    // end;


    // procedure addFile(customerNo: Code[10];copyrightNo: Code[10];fileName: Text) status: Text
    // begin
    //     status:='danger*Your file could not be updated';
    //     objCopyright.Reset;
    //     objCopyright.SetRange(objCopyright."No.", copyrightNo);
    //     objCopyright.SetRange(objCopyright."Applicant Account", customerNo);
    //     if objCopyright.Find('-') then begin
    //       objCopyrightFile.Init;
    //       objCopyrightFile.CopyrightNo:= copyrightNo;
    //       objCopyrightFile.fileName:= fileName;
    //       objCopyrightFile.dateUploaded:= Today;
    //       if objCopyrightFile.Insert(true) then begin
    //         status:='success*File added';
    //         end else begin
    //           status:='danger*The file could not be added';
    //           end;
    //       end else begin
    //         status:='danger*You do not have the necessary permissions to add a file to the copyright';
    //         end;
    //     exit(status);
    // end;


    // procedure forgotPass(registrationNo: Code[10]) status: Text
    // var
    //     email: Text;
    // begin
    //     objCustomer.Reset;
    //     objCustomer.SetRange(objCustomer."ID. No.", registrationNo);
    //     if objCustomer.Find('-') then begin
    //       email:= objCustomer."E-Mail";
    //       if email = '' then begin
    //         status:= 'danger*The customer does not have a valid email address';
    //         end else begin
    //           status:='success*Reseting your password*'+email;
    //           end;
    //       end else begin
    //         status:= 'danger*Customer with the specified id/registration number does not exist';
    //         end;
    //         exit(status);
    // end;


    // procedure changePassword(customerNo: Code[10];currentPassword: Text;newPassword: Text;confirmNewPassword: Text) status: Text
    // begin
    //     status:='danger*user not found';
    //     objPortalUser.Reset;
    //     objPortalUser.SetRange(objPortalUser."customer No", customerNo);
    //     if objPortalUser.Find('-') then begin
    //       if objPortalUser.Password = currentPassword then begin
    //         if newPassword = confirmNewPassword then begin
    //           objPortalUser.Password:= newPassword;
    //          if objPortalUser.Modify then  begin
    //            status:='success*Your password was successfully changed';
    //            end else begin
    //              status:='danger*Your password could not be reset';
    //              end;
    //           end else begin
    //             status:='danger*New password and confirm new password do not match';
    //             end;
    //         end else begin
    //           status:='danger*Wrong current password';
    //           end;
    //       end else begin
    //         status:='danger*The specified customer does not exist';
    //         end;
    // end;


    // procedure addAuthor(customerNo: Code[10];copyrightNo: Code[10];authorSurName: Text;authorFirstName: Text;authorMiddleName: Text;authorPoBox: Code[10];authorPostCode: Code[10];authorPostTown: Text;authorEmail: Text;authorPhone: Text;authorPin: Text;authorPseudoName: Text;authortelephone: Code[20];authorid: Code[10]) status: Text
    // begin
    //     status:= 'danger*Author could not be added';
    //     objCopyright.Reset;
    //     objCopyright.SetRange(objCopyright."No.", copyrightNo);
    //     objCopyright.SetRange(objCopyright."Applicant Account", customerNo);
    //     if objCopyright.Find('-') then begin
    //     objAuthor.Reset;
    //     objAuthor.SetRange(objAuthor."Copyright Reg No", copyrightNo);
    //     objAuthor.SetRange(objAuthor."ID. No.", authorid);
    //     if objAuthor.Find('-') then begin
    //       status:='danger*The author has already been added for the selected copyright';
    //       end else begin
    //         objAuthor.Init;
    //         objAuthor."Copyright Reg No" := copyrightNo;
    //         objAuthor.Surname:= authorSurName;
    //        objAuthor."First Name":= authorFirstName;
    //        objAuthor."Middle Name":= authorMiddleName;
    //        objAuthor.Address:= authorPoBox;
    //        //objAuthor."Author Postal Code":= authorPostCode;
    //       // objAuthor."Author City":= authorPostTown;
    //        objAuthor."Phone No.":= authorPhone;
    //        objAuthor."Address 2":= authortelephone;
    //        objAuthor."P.I.N":= authorPin;
    //        objAuthor."Email Address":= authorEmail;
    //        objAuthor."ID. No.":= authorid;
    //        objAuthor."Pseudo Name":= authorPseudoName;
    //         if objAuthor.Insert(true) then begin
    //           status:= 'success*Author successfully added';
    //           end else begin
    //             status:='danger*The author could not be added';
    //             end;
    //         end;
    //         end else begin
    //            status:='danger*You do not have the necessary rights to add an author';
    //           end;
    //     exit(status);
    // end;


    // procedure deleteLine(customerNo: Code[10];lineNo: Integer;CopyrightNo: Code[10])
    // begin
    //     objCopyright.Reset;
    //     objCopyright.SetRange(objCopyright."No.", CopyrightNo);
    //     objCopyright.SetRange(objCopyright."Applicant Account", customerNo);
    //     if objCopyright.Find('-') then begin
    //       objAuthor.Reset;
    //       objAuthor.SetRange(objAuthor."Line No", lineNo);
    //       objAuthor.SetRange(objAuthor."Copyright Reg No", CopyrightNo);
    //       if objAuthor.Find('-') then
    //         objAuthor.Delete;

    //       end;
    // end;


    // procedure mathematics(a: Integer;b: Integer) "sum": Integer
    // begin
    //     sum:= a+b;
    // end;


    // procedure getAbstract(customerNo: Code[20];copyrightNo: Code[20]) status: Text
    // begin

    //     objCopyright.Reset;
    //     objCopyright.SetRange(objCopyright."No.", copyrightNo);
    //     objCopyright.SetRange(objCopyright."Applicant Account", customerNo);
    //     if objCopyright.FindSet then begin
    //     objCopyright.CalcFields("Copyright Work Abstract");
    //     objCopyright."Copyright Work Abstract".CreateInstream(LegInstr);
    //     Leg.Read(LegInstr);
    //     LegText:=Format(Leg);

    //     //Convert Project Legectives from BLOB to TXT
    //     objCopyright.CalcFields("Copyright Work Abstract");
    //     objCopyright."Copyright Work Abstract".CreateInstream(LegInstr);
    //     Leg.Read(LegInstr);

    //     if LegText<>Format(obj) then
    //     begin
    //      Clear(objCopyright."Copyright Work Abstract");
    //      Clear(Leg);
    //      Leg.AddText(LegText);
    //      objCopyright."Copyright Work Abstract".CreateOutstream(LegOutStr);
    //      Leg.Write(LegOutStr);
    //     end;
    //     status:= Format(Leg);
    //     end;
    //     exit(status);
    // end;
}

