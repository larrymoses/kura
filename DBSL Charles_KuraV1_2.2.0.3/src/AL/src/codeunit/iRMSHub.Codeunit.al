// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings

// dotnet
// {
//     //  assembly(mscorlib)
//     //  {

//     //      type("System.Text.Encoder"; "Encoder")
//     //      { }

//     // } 
//     // assembly(System){
//     //     type("System.Uri"; Uri){}
//     //     type("System.Net.HttpWebRequest";HttpWebRequest){}
//     //     type("System.Net.HttpWebResponse";HttpWebResponse){}
//     //     type("System.Net.CredentialCache";CredentialCache){}
//     //  XmlTextReader  document: dotnet XmlDocument;
//     //credentials: dotnet CredentialCache;


// }
//     assembly("System.Xml"){

//     type("System.Xml.XmlTextReader"; XmlTextReader){}
//     type("System.Xml.XmlDocument"; XmlDocument){}
//     }

//  }
Codeunit 50103 "iRMS Hub"
{

    trigger OnRun()
    begin
        //MESSAGE(FORMAT(fnInsertRFIresponseHeader('VEND002', 'IFP00006')))
        //MESSAGE(FORMAT(fnSubmisionResponseStatus('PRQ00012')))
        //MESSAGE(FORMAT(fnCompleteSupplierReg('VEND002') ))
        //MESSAGE(FORMAT(fnGetEvalCritScores('BST00001', 2)))
        //MESSAGE(FORMAT(FnGenerateVendorstatement('VEND0922', 20190101D, 20191010D)));
        //MESSAGE(FORMAT(fnGetOwnerPercentage('VEND002')));
        //MESSAGE(fnInsertSpecialGrp('VEND002', 'Youth','KKK89' ,20201212D, 20201212D, 'Adulut'));
        //MESSAGE(FnReqforRegistration('margaret','03474647738554', 'margaretmumbi16@gmail.com','PPP89w879872', 'nmanmshsduudusu'))
        //MESSAGE(FnCreateApplicantAccountRequest('margaret','03474647738554', 'margaretmu4mbi465316@gmail.com','PPP89w879872','nmanmshsduudusu'))
        //MESSAGE(fnSubmitTenderResponse('VEND039','ITT00061'));
        //MESSAGE(fnDeleteBidAuditedBalsheet('2019' , 'VEND039', 'P-QUO019'))
        //MESSAGE(fngetBidResponseNumber('ITT00043','VEND017'));
        //MESSAGE(fnCreatWorkExecutionScheduleDetails('VEND009','PCO0014'));
        //MESSAGE(FnGeneratePrequalificationPreviewReport('VEND0034','0201'));
        //MESSAGE(fnDeleteBank('VENDOO34','01092'));
        // MESSAGE(fnInsertPastExperienceDetails('VENDOO34','tygu','iiu','tthgyuk','fghj',TODAY,TODAY,900));
        //MESSAGE(fnInsertRFIResponseLines('0417','CATEGORY 10','0374','VEND0007','R02','C112'));
        //MESSAGE(fnInsertRFIResponseResponsibilityCenter('0221','CATEGORY 7','VEND0007','R05',''));
        //MESSAGE(fnDeleteResponsibilityCenter('VEND943','R21'));
        //ImportTemplate_Test('ADV0000051', 'RMLF/NZ/239/23-24', 'ADV0000051');
    end;

    var
        Contact: Record Contact;
        QuotationsEvaluation: Record "Quotations Evaluation";
        objFiscalYear: Record "Financial Year Code";
        Bidders: Record Bidders;
        objPortalUsers: Record portalusers;
        objProcReqs: Record "Procurement Request";
        objBlogPost: Record Blog_Vendors;
        objBlogReply: Record BlogVendors_Replies;
        FILESPATH: label '\\41.89.63.253\Downloads30\';
        objVendor: Record Vendor;
        objPRLines: Record "Procurement Request Lines";
        objSuppSelection: Record "Supplier Selection1";
        objDocAttachedTbl: Record "Document Attachment";
        objVendorBank: Record "Vendor Bank Account";
        objDirectors: Record "Vendor Business Owner";
        objLitigHistory: Record "Vendor Litigation History";
        objEmailsendCodeunit: Codeunit "Procurement Processing";
        objNoSeriesManagement: Codeunit NoSeriesManagement;
        objProcsetup: Record "Procurement Setup";
        objVendorSpecGentry: Record "Vendor Special Group Entry";
        objPastXp: Record "Vendor Past Experience";
        objBidResponseBalanceSheet: Record "Bid Audited Balance Sheet";
        objBalanceSheet: Record "Vendor Audited Balance Sheet";
        objPastExperience: Record "Bid Past Experience";
        objIncomeStatement: Record "Vendor Audited Income Statemen";
        objPurhcaseLinesDetails: Record "Purchase Line";
        objBidResponseIncomeStatement: Record "Bid Audited Income Statement";
        objFiledUploads: Record "Vendor Filed Reg Document";
        objBidResponseEquipments: Record "Bid Equipment Specification";
        objProfstaff: Record "Vendor Professional Staff";
        objStaffQualif: Record "Vendor Staff Qualification";
        objStaffXP: Record "Vendor Staff Experience";
        objRFIResponse: Record "RFI Response";
        objIFPResponseLine: Record "IFP Response Line";
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
        objRFIrespFiledDocument: Record "RFI Response Filed Document";
        objBidScoreCriteria: Record "Bid Score Criteria Group";
        Purch: Record "Purchase Header";
        Vendor: Record Vendor;
        BidOwner: Record "Bid Business Owner";
        VendBusinessOwner: Record "Vendor Business Owner";
        BidPreferences: Record "Bid Preference & Reservation";
        VendSpecialGroup: Record "Vendor Special Group Entry";
        BidLitigation: Record "Bid Litigation History";
        VendLitigation: Record "Vendor Litigation History";
        BidPastExperience: Record "Bid Past Experience";
        VendPastExperience: Record "Vendor Past Experience";
        BidAuditedBal: Record "Bid Audited Balance Sheet";
        VendAuditedBal: Record "Vendor Audited Balance Sheet";
        BidIncomeStat: Record "Bid Audited Income Statement";
        VendIncomeStat: Record "Vendor Audited Income Statemen";
        BidVendBankAccount: Record "Bid Vendor Bank Account";
        VendBankAccount: Record "Vendor Bank Account";
        BidKeyStaff: Record "Bid Key Staff";
        VendKeyStaff: Record "Vendor Professional Staff";
        BidKeyStaffQual: Record "Bid Key Staff Qualification";
        VendKeyStaffQual: Record "Vendor Staff Qualification";
        BidStaffExperience: Record "Bid Key Staff Experience";
        VendStaffExperience: Record "Vendor Staff Experience";
        IFS: Record "Standard Purchase Code";
        IFSLines: Record "Standard Purchase Line";
        PurchLines: Record "Purchase Line";
        objTenderSecurity: Record "Bid_Contract Security Register";
        objVendorSpecialGroup: Record "Vendor Special Group Entry";
        ExecutionPlanNumber: Code[50];
        FILESPATH3: label 'E:\TESTINGREPORT\';
        FILESPATH4: label 'C:\inetpub\wwwroot\contractorsHub\Downloads\';
        ProjectMobilizationHeader: Record "Project Mobilization Header";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        FILEPATHT: label 'C:\inetpub\wwwroot\contractorsHub\Downloads\';
        RMSManagement: Codeunit "RMS Management";
        Rec: Variant;
        FILESPATH5: label 'C:\inetpub\wwwroot\Procurement\Downloads\';
        FilePathUploads: label 'C:\inetpub\wwwroot\kerrarms\Uploads\';
        DOWNLOADFILEPATH: label 'C:\PortalDocs\ApprovalDownloads\';
        dur: DateFormula;
        DMSManagement: Codeunit "DMS Management";
        DMSDocuments: Record "DMS Documents";
        ProcurementProcessing: Codeunit "Procurement Processing";
        TempBlob_lRec: Codeunit "Temp Blob";
        OutStr: OutStream;
        InStr: InStream;
        RecRef: RecordRef;
        FileManagement_lCdu: Codeunit "File Management";
        Base64Convert: Codeunit "Base64 Convert";


    //  local procedure "<-----------------------------------------------------------------------------------------------Contractor Hub Codes---------->"()
    //   begin
    //   end;

    procedure fnCreatNewWorkExecutionPlan(vendornumber: Code[20]; contractno: Code[50]; region: Code[50]; projecttitle: Code[50]; roadclass: Code[50]; fundingsource: Code[100]; startdate: Date; enddate: Date; projectaccountant: Code[70]; residentengineer: Code[80]) status: Text
    var
        Job: Record Job;
        JobTask: Record "Job Task";
    begin
        Job.Init;
        Job."No." := '';
        //  objProcsetup.GET;
        // Contact.INIT;
        //Contact."No.":=objNoSeriesManagement.GetNextNo(objProcsetup."Request For Registration Nos",TODAY,TRUE);
        Job."Contractor No." := contractno;
        Job.Description := projecttitle;
        Job."Person Responsible" := projectaccountant;
        Job."Project Manager" := residentengineer;
        Job."Region ID" := region;
        Job."Country Entry Code" := region;
        Job."Road Class ID" := roadclass;
        Job."Funding Source" := fundingsource;
        Job."Starting Date" := startdate;
        Job."Ending Date" := enddate;
        if Job.Insert(true) then begin
            status := 'success*New Project Work Execution Was Successfully Created!'
        end else begin
            status := 'danger*Error while Creating the Execution Work Plan!'
        end;
        //END;
    end;

    procedure fnCreatNewWorkExecutionPlanDetails(vendornumber: Code[20]; CommencementOrderNo: Code[50]; ProjectNo: Code[50]; ContractNo: Code[50]) status: Text
    var
        Job: Record Job;
        JobTask: Record "Job Task";
        WorkExecutionPlan: Record "Work Execution Plan";
        RoadManagementSetup: Record "Road Management Setup";
    begin
        WorkExecutionPlan.Reset;
        WorkExecutionPlan.SetRange("Commencement Order ID", CommencementOrderNo);
        WorkExecutionPlan.SetRange("Contractor No.", vendornumber);
        WorkExecutionPlan.SetRange("Project ID", ProjectNo);
        if WorkExecutionPlan.FindLast then begin
            WorkExecutionPlan.Reset;
            WorkExecutionPlan."Contractor No." := vendornumber;
            WorkExecutionPlan."Commencement Order ID" := CommencementOrderNo;
            WorkExecutionPlan.Validate("Commencement Order ID");
            WorkExecutionPlan."Purchase Contract ID" := ContractNo;
            WorkExecutionPlan.Validate("Purchase Contract ID");
            WorkExecutionPlan."Project ID" := ProjectNo;
            WorkExecutionPlan.Validate("Project ID");
            if WorkExecutionPlan.Modify(true) then begin
                status := 'success*Project Work Execution Was Successfully Modified!';
            end else begin
                status := 'danger*Project Work Execution Was Not Successfully Modified!';
            end;
        end else begin
            WorkExecutionPlan.Init;
            WorkExecutionPlan."Document No." := '';
            //objNoSeriesManagement.GetNextNo(RoadManagementSetup."Work Program Nos",TODAY,TRUE);
            WorkExecutionPlan."Contractor No." := vendornumber;
            WorkExecutionPlan."Commencement Order ID" := CommencementOrderNo;
            WorkExecutionPlan.Validate("Commencement Order ID");
            WorkExecutionPlan."Purchase Contract ID" := ContractNo;
            WorkExecutionPlan.Validate("Purchase Contract ID");
            WorkExecutionPlan."Project ID" := ProjectNo;
            WorkExecutionPlan.Validate("Project ID");
            if WorkExecutionPlan.Insert(true) then begin
                status := 'success*New Project Work Execution Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Execution Work Plan!'
            end;
        end;
    end;

    procedure fnCreatWorkExecutionScheduleDetails(vendornumber: Code[20]; CommencementOrderNo: Code[50]) status: Text
    var
        Job: Record Job;
        JobTask: Record "Job Task";
        WorkExecutionPlan: Record "Work Execution Plan";
        RoadManagementSetup: Record "Road Management Setup";
        WEPExecutionSchedule: Record "WEP Execution Schedule";
        ProjectCommencementOrder: Record "Project Commencement Order";
    begin
        ProjectCommencementOrder.Reset;
        ProjectCommencementOrder.SetRange("Notice No.", CommencementOrderNo);
        if ProjectCommencementOrder.FindSet then begin
            WorkExecutionPlan.Reset;
            WorkExecutionPlan.SetRange("Commencement Order ID", CommencementOrderNo);
            WorkExecutionPlan.SetRange("Contractor No.", ProjectCommencementOrder."Contractor No.");
            if WorkExecutionPlan.FindLast then begin
                WorkExecutionPlan.Reset;
                WorkExecutionPlan."Document Type" := WorkExecutionPlan."document type"::"Work Execution Programme";
                WorkExecutionPlan."Contractor No." := vendornumber;
                WorkExecutionPlan."Commencement Order ID" := CommencementOrderNo;
                WorkExecutionPlan.Validate("Commencement Order ID");
                WorkExecutionPlan."Purchase Contract ID" := ProjectCommencementOrder."Purchase Contract ID";
                WorkExecutionPlan.Validate("Purchase Contract ID");
                WorkExecutionPlan."Project ID" := ProjectCommencementOrder."Project ID";
                WorkExecutionPlan.Validate("Project ID");
                WorkExecutionPlan."Department ID" := ProjectCommencementOrder."Department ID";
                WorkExecutionPlan."Constituency ID" := ProjectCommencementOrder."Constituency ID";
                WorkExecutionPlan."Directorate ID" := ProjectCommencementOrder."Directorate ID";
                WorkExecutionPlan.Status := WorkExecutionPlan.Status::Open;
                if WorkExecutionPlan.Modify(true) then begin
                    ExecutionPlanNumber := fngetWorkExecutionPlanNumber(vendornumber, CommencementOrderNo);
                    fnPopulateWorkExecutionPlanLines(ExecutionPlanNumber, ProjectCommencementOrder."Project ID");
                    status := 'success*Project Work Execution Was Successfully Modified!';
                end else begin
                    status := 'danger*Project Work Execution Was Not Successfully Modified!';
                end;
            end else begin
                WorkExecutionPlan.Init;
                WorkExecutionPlan."Document No." := '';
                WorkExecutionPlan."Document Type" := WorkExecutionPlan."document type"::"Work Execution Programme";
                WorkExecutionPlan."Contractor No." := vendornumber;
                WorkExecutionPlan."Commencement Order ID" := CommencementOrderNo;
                WorkExecutionPlan.Validate("Commencement Order ID");
                WorkExecutionPlan."Purchase Contract ID" := ProjectCommencementOrder."Purchase Contract ID";
                WorkExecutionPlan.Validate("Purchase Contract ID");
                WorkExecutionPlan."Project ID" := ProjectCommencementOrder."Project ID";
                WorkExecutionPlan.Validate("Project ID");
                WorkExecutionPlan."Department ID" := ProjectCommencementOrder."Department ID";
                WorkExecutionPlan."Constituency ID" := ProjectCommencementOrder."Constituency ID";
                WorkExecutionPlan."Directorate ID" := ProjectCommencementOrder."Directorate ID";
                WorkExecutionPlan.Status := WorkExecutionPlan.Status::Open;
                if WorkExecutionPlan.Insert(true) then begin
                    ExecutionPlanNumber := fngetWorkExecutionPlanNumber(vendornumber, CommencementOrderNo);
                    fnPopulateWorkExecutionPlanLines(ExecutionPlanNumber, ProjectCommencementOrder."Project ID");
                    status := 'success*New Project Work Execution Was Successfully Created!'
                end else begin
                    status := 'danger*Error while Creating the Execution Work Plan!'
                end;
            end;
        end else begin
            status := 'danger*The Project Commencement Order Cannot be found!';
        end;
    end;

    procedure fngetWorkExecutionPlanNumber(VendorNumber: Code[100]; CommencementOrderNumber: Code[50]) workexecutionplanNumber: Code[100]
    var
        PurchaseHeader: Record "Purchase Header";
        WorkExecutionPlan: Record "Work Execution Plan";
    begin

        WorkExecutionPlan.Reset;
        WorkExecutionPlan.SetRange("Contractor No.", VendorNumber);
        WorkExecutionPlan.SetRange("Document Type", WorkExecutionPlan."document type"::"Work Execution Programme");
        WorkExecutionPlan.SetRange("Commencement Order ID", CommencementOrderNumber);
        if WorkExecutionPlan.FindLast then begin
            workexecutionplanNumber := WorkExecutionPlan."Document No.";
        end else begin
            workexecutionplanNumber := '';
        end;
    end;

    procedure fngetWorkExecutionPlanProjectNumber(VendorNumber: Code[100]; CommencementOrderNumber: Code[50]) ProjectNumber: Code[100]
    var
        PurchaseHeader: Record "Purchase Header";
        WorkExecutionPlan: Record "Work Execution Plan";
    begin

        WorkExecutionPlan.Reset;
        WorkExecutionPlan.SetRange("Contractor No.", VendorNumber);
        WorkExecutionPlan.SetRange("Commencement Order ID", CommencementOrderNumber);
        if WorkExecutionPlan.FindLast then begin
            ProjectNumber := WorkExecutionPlan."Project ID";
        end else begin
            ProjectNumber := '';
        end;
    end;

    procedure fngetContractNo(documentno: Code[50]) contractno: Code[100]
    var
        DailyWorkRecord: Record "Daily Work Record";
    begin
        DailyWorkRecord.Reset;
        DailyWorkRecord.SetRange("Document No.", documentno);
        if DailyWorkRecord.FindLast then begin
            contractno := DailyWorkRecord."Purchase Contract ID";
        end else begin
            contractno := '';
        end;
    end;

    procedure fnSubmitWorkExecutionPlanScheduleDetails(documentNumber: Code[20]; projectNumber: Code[50]; taskNumber: Code[50]; startdate: Date; enddate: Date) status: Text
    var
        Job: Record Job;
        JobTask: Record "Job Task";
        WEPExecutionSchedule: Record "WEP Execution Schedule";
    begin
        WEPExecutionSchedule.Reset;
        WEPExecutionSchedule.SetRange("Document No", documentNumber);
        WEPExecutionSchedule.SetRange("Job No", projectNumber);
        WEPExecutionSchedule.SetRange("Job Task No", taskNumber);
        if WEPExecutionSchedule.FindSet then begin
            WEPExecutionSchedule."Document No" := documentNumber;
            WEPExecutionSchedule."Document Type" := WEPExecutionSchedule."document type"::"Work Execution Programme";
            WEPExecutionSchedule."Job No" := projectNumber;
            WEPExecutionSchedule."Job Task No" := taskNumber;
            WEPExecutionSchedule.Validate("Job Task No");
            WEPExecutionSchedule."Scheduled Start Date" := startdate;
            WEPExecutionSchedule."Scheduled End Date" := enddate;
            if WEPExecutionSchedule.Modify(true) then begin
                status := 'success*New Project Work Execution Plan schedule Was Successfully Modified!'
            end else begin
                status := 'danger*New Project Work Execution Plan schedule could not be Modified!'
            end;
        end else begin
            WEPExecutionSchedule.Init;
            WEPExecutionSchedule."Document No" := documentNumber;
            WEPExecutionSchedule."Document Type" := WEPExecutionSchedule."document type"::"Work Execution Programme";
            WEPExecutionSchedule."Job No" := projectNumber;
            WEPExecutionSchedule."Job Task No" := taskNumber;
            WEPExecutionSchedule.Validate("Job Task No");
            WEPExecutionSchedule."Scheduled Start Date" := startdate;
            WEPExecutionSchedule."Scheduled End Date" := enddate;
            if WEPExecutionSchedule.Insert(true) then begin

                status := 'success*New Project Work Execution Plan schedule Was Successfully Submmitted!'
            end else begin
                status := 'danger*New Project Work Execution Plan schedule could not be Submitted!'
            end;
        end;
    end;

    procedure fnSubmitWorkExecutionPlanContractorTeam(documentNumber: Code[50]; contractor: Code[50]; staffnumber: Code[50]; staffname: Code[50]; emailaddress: Code[50]; address: Code[50]; address2: Code[50]; city: Code[50]; country: Code[50]; postcode: Code[50]; mobilephonenumber: Code[50]; designation: Code[50]; staffcategory: Integer; startdate: Date; idno: Code[20]) status: Text
    var
        Job: Record Job;
        JobTask: Record "Job Task";
        WEPExecutionSchedule: Record "WEP Execution Schedule";
        WEPContractorTeam: Record "WEP Contractor Team";
    begin

        WEPContractorTeam.Reset;
        WEPContractorTeam.SetRange("Document No", documentNumber);
        WEPContractorTeam.SetRange("Contractor Staff No.", staffnumber);
        WEPContractorTeam.SetRange("Contractor No.", contractor);
        if WEPContractorTeam.FindSet then begin
            WEPContractorTeam."Document No" := documentNumber;
            WEPContractorTeam."Document Type" := WEPContractorTeam."document type"::"Contractor Personnel Appointment";
            WEPContractorTeam."Contractor No." := contractor;
            WEPContractorTeam."Contractor Staff No." := staffnumber;
            WEPContractorTeam.Name := staffname;
            WEPContractorTeam."ID Number" := idno;
            WEPContractorTeam.Address := address;
            WEPContractorTeam."Address 2" := address2;
            WEPContractorTeam.City := city;
            WEPContractorTeam."Post Code" := postcode;
            WEPContractorTeam."Country/Region Code" := country;
            WEPContractorTeam.Email := emailaddress;
            WEPContractorTeam.Telephone := mobilephonenumber;
            WEPContractorTeam."Role Code" := designation;
            WEPContractorTeam."Staff Category" := staffcategory;
            WEPContractorTeam."Effective Date" := startdate;
            if WEPContractorTeam.Modify(true) then begin
                WEPContractorTeam.Validate("Contractor Staff No.");
                WEPContractorTeam.Validate("Role Code");
                WEPContractorTeam.Validate("ID Number");
                status := 'success*Contractor Staff Details Was Successfully Modified!';
            end else begin
                status := 'danger*Contractor Staff Details Was Successfully Modified!';
            end;
        end else begin
            WEPContractorTeam.Init;
            WEPContractorTeam."Document No" := documentNumber;
            WEPContractorTeam."Document Type" := WEPContractorTeam."document type"::"Contractor Personnel Appointment";
            WEPContractorTeam."Contractor No." := contractor;
            WEPContractorTeam."Contractor Staff No." := staffnumber;
            WEPContractorTeam.Name := staffname;
            WEPContractorTeam."ID Number" := idno;
            WEPContractorTeam.Address := address;
            WEPContractorTeam."Address 2" := address2;
            WEPContractorTeam.City := city;
            WEPContractorTeam."Post Code" := postcode;
            WEPContractorTeam."Country/Region Code" := country;
            WEPContractorTeam.Email := emailaddress;
            WEPContractorTeam.Telephone := mobilephonenumber;
            WEPContractorTeam."Role Code" := designation;
            WEPContractorTeam."Staff Category" := staffcategory;
            WEPContractorTeam."Effective Date" := startdate;
            if WEPContractorTeam.Insert(true) then begin
                WEPContractorTeam.Validate("Contractor Staff No.");
                WEPContractorTeam.Validate("Role Code");
                WEPContractorTeam.Validate("ID Number");
                status := 'success*Contractor Staff Details Was Successfully Submitted!';
            end else begin
                status := 'danger*Contractor Staff Details Was Successfully Submitted!';
            end;
        end;
    end;

    procedure fnPopulateWorkExecutionPlanLines(documentNumber: Code[50]; projectnumber: Code[50]) status: Text
    var
        Job: Record Job;
        JobTask: Record "Job Task";
        WEPExecutionSchedule: Record "WEP Execution Schedule";
        WEPContractorTeam: Record "WEP Contractor Team";
        WorkExecutionPlan: Record "Work Execution Plan";
        JobPlanningLine: Record "Job Planning Line";
    begin

        JobPlanningLine.Reset;
        JobPlanningLine.SetRange(JobPlanningLine."Job No.", projectnumber);
        if JobPlanningLine.FindSet then begin
            WEPExecutionSchedule.Reset;
            WEPExecutionSchedule.SetRange("Document No", documentNumber);
            if WEPExecutionSchedule.FindSet then
                WEPExecutionSchedule.DeleteAll;
            repeat
                WEPExecutionSchedule.Init;
                WEPExecutionSchedule."Document Type" := WEPExecutionSchedule."document type"::"Work Execution Programme";
                WEPExecutionSchedule."Document No" := documentNumber;
                WEPExecutionSchedule."Job No" := projectnumber;
                WEPExecutionSchedule."Line No" := WEPExecutionSchedule.Count + 1;
                WEPExecutionSchedule."Job Task No" := JobPlanningLine."Job Task No.";
                WEPExecutionSchedule."Job Task Type" := WEPExecutionSchedule."job task type"::Posting;
                WEPExecutionSchedule.Description := JobPlanningLine.Description;
                WEPExecutionSchedule."Budget (Total Cost)" := JobPlanningLine."Unit Cost";
                if not WEPExecutionSchedule.Get(WEPExecutionSchedule."Document Type", WEPExecutionSchedule."Document No", WEPExecutionSchedule."Job No", WEPExecutionSchedule."Job Task No") then
                    WEPExecutionSchedule.Insert(true);
            until JobPlanningLine.Next = 0;
        end;
        /*
        JobPlanningLine.RESET;
        JobPlanningLine.SETRANGE(JobPlanningLine."Job No.",projectnumber);
        IF JobPlanningLine.FINDSET THEN BEGIN
          WEPExecutionSchedule.RESET;
          WEPExecutionSchedule.SETRANGE("Document No",documentNumber);
          IF WEPExecutionSchedule.FINDSET THEN
            WEPExecutionSchedule.DELETEALL;
          REPEAT
            WEPExecutionSchedule.INIT;
            WEPExecutionSchedule."Document Type":=WEPExecutionSchedule."Document Type"::"Work Execution Programme";
            WEPExecutionSchedule."Document No":=WorkExecutionPlan."Document No.";
            WEPExecutionSchedule."Line No":=WEPExecutionSchedule.COUNT+100;
            WEPExecutionSchedule."Job No":=WorkExecutionPlan."Project ID";
            WEPExecutionSchedule."Job Task No":=JobPlanningLine."Job Task No.";
            WEPExecutionSchedule."Job Task Type":=WEPExecutionSchedule."Job Task Type"::Posting;
            WEPExecutionSchedule.Description:=JobPlanningLine.Description;
            WEPExecutionSchedule."Budget (Total Cost)":=JobPlanningLine."Unit Cost";
            WEPExecutionSchedule.INSERT(TRUE);
           UNTIL JobPlanningLine.NEXT=0;
        END;
        */

    end;

    procedure fnSubmitWorkExecutionPlanEquipments(documentNumber: Code[50]; contractor: Code[50]; equipmentnumber: Code[50]; equipmenttype: Code[50]; equipmentdescription: Text; equipmentownership: Integer; equipmentserialnumber: Code[50]; equipmentusability: Integer; yearofuse: Integer; equipmentcondition: Integer; equipmentavailability: Text; scheduledeliverydate: Date; projectphase: Text) status: Text
    var
        Job: Record Job;
        JobTask: Record "Job Task";
        WEPExecutionSchedule: Record "WEP Execution Schedule";
        WEPContractorTeam: Record "WEP Contractor Team";
        WEPContractorEquipment: Record "WEP Contractor Equipment";
    begin

        WEPContractorEquipment.Reset;
        WEPContractorEquipment.SetRange("Document No.", documentNumber);
        WEPContractorEquipment.SetRange("Equipment No.", equipmentnumber);
        WEPContractorEquipment.SetRange("Contractor No.", contractor);
        if WEPContractorEquipment.FindSet then begin
            WEPContractorEquipment."Document Type" := WEPContractorEquipment."document type"::"Contractor Equipment Register";
            WEPContractorEquipment."Document No." := documentNumber;
            WEPContractorEquipment."Equipment No." := equipmentnumber;
            WEPContractorEquipment."Contractor No." := contractor;
            WEPContractorEquipment."Equipment Type Code" := equipmenttype;
            WEPContractorEquipment.Validate("Equipment Type Code");
            WEPContractorEquipment."Ownership Type" := equipmentownership;
            WEPContractorEquipment."Equipment Serial No." := equipmentserialnumber;
            WEPContractorEquipment."Equipment Usability Code" := equipmentusability;
            WEPContractorEquipment."Years of Previous Use" := yearofuse;
            WEPContractorEquipment."Equipment Condition Code" := equipmentcondition;
            WEPContractorEquipment."Equipment Availability" := equipmentavailability;
            WEPContractorEquipment."Scheduled Date of Delivery" := scheduledeliverydate;
            WEPContractorEquipment."Project Phase" := projectphase;
            if WEPContractorEquipment.Modify(true) then begin
                status := 'success*Contractor Equipment Details Was Successfully Modified!';
            end else begin
                status := 'danger*Contractor Equipment Details Was Successfully Modified!';
            end;
        end else begin
            WEPContractorEquipment.Init;
            WEPContractorEquipment."Document Type" := WEPContractorEquipment."document type"::"Contractor Equipment Register";
            WEPContractorEquipment."Document No." := documentNumber;
            WEPContractorEquipment."Equipment No." := equipmentnumber;
            WEPContractorEquipment."Contractor No." := contractor;
            WEPContractorEquipment."Equipment Type Code" := equipmenttype;
            WEPContractorEquipment.Description := equipmentdescription;
            WEPContractorEquipment."Ownership Type" := equipmentownership;
            WEPContractorEquipment."Equipment Serial No." := equipmentserialnumber;
            WEPContractorEquipment."Equipment Usability Code" := equipmentusability;
            WEPContractorEquipment."Years of Previous Use" := yearofuse;
            WEPContractorEquipment."Equipment Condition Code" := equipmentcondition;
            WEPContractorEquipment."Equipment Availability" := equipmentavailability;
            WEPContractorEquipment."Scheduled Date of Delivery" := scheduledeliverydate;
            WEPContractorEquipment."Project Phase" := projectphase;
            if WEPContractorEquipment.Insert(true) then begin
                status := 'success*Contractor Equipment Details Was Successfully Submitted!';
            end else begin
                status := 'danger*Contractor Equipment Details Was Not Submitted!';
            end;
        end;
    end;

    procedure fnSubmitWEPEquipmentRepairPlan(documentNumber: Code[50]; contractor: Code[50]; equipmentnumber: Code[50]; maintenancetype: Integer; tododescription: Text; scheduledate: Date; responsibleperson: Code[50]) status: Text
    var
        WEPContractorEquipmentRepair: Record "WEP Equipment Repair Plan";
    begin

        WEPContractorEquipmentRepair.Reset;
        WEPContractorEquipmentRepair.SetRange("Document No.", documentNumber);
        WEPContractorEquipmentRepair.SetRange("Equipment No.", equipmentnumber);
        WEPContractorEquipmentRepair.SetRange("Contractor No.", contractor);
        if WEPContractorEquipmentRepair.FindSet then begin
            WEPContractorEquipmentRepair."Document Type" := WEPContractorEquipmentRepair."document type"::"Work Execution Programme";
            WEPContractorEquipmentRepair."Document No." := documentNumber;
            WEPContractorEquipmentRepair."Equipment No." := equipmentnumber;
            WEPContractorEquipmentRepair."Contractor No." := contractor;
            WEPContractorEquipmentRepair."Maintenance Type" := maintenancetype;
            WEPContractorEquipmentRepair."To-do Description" := tododescription;
            WEPContractorEquipmentRepair."Scheduled Date" := scheduledate;
            WEPContractorEquipmentRepair."Responsible Staff No." := responsibleperson;
            if WEPContractorEquipmentRepair.Modify(true) then begin
                status := 'success*Contractor Equipment Repair Details Was Successfully Modified!';
            end else begin
                status := 'danger*Contractor Equipment Repair Details Was Successfully Modified!';
            end;
        end else begin
            WEPContractorEquipmentRepair.Init;
            WEPContractorEquipmentRepair."Document Type" := WEPContractorEquipmentRepair."document type"::"Work Execution Programme";
            WEPContractorEquipmentRepair."Document No." := documentNumber;
            WEPContractorEquipmentRepair."Equipment No." := equipmentnumber;
            WEPContractorEquipmentRepair."Contractor No." := contractor;
            WEPContractorEquipmentRepair."Maintenance Type" := maintenancetype;
            WEPContractorEquipmentRepair."To-do Description" := tododescription;
            WEPContractorEquipmentRepair."Scheduled Date" := scheduledate;
            WEPContractorEquipmentRepair."Responsible Staff No." := responsibleperson;
            if WEPContractorEquipmentRepair.Insert(true) then begin
                status := 'success*Contractor Equipment Repair Details Was Successfully Submitted!';
            end else begin
                status := 'danger*Contractor Equipment Repair Details Was Not Submitted!';
            end;
        end;
    end;

    procedure FnSendEmaiNotificationOnApplicantRegRequestAcknowledge(ApplicantRequest: Record Contact)
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        "Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit Mail;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit Mail;
        DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[250];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[250];
        PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        HRSetupNew: Record "Procurement Setup";
    begin
        /*CompInfo.GET;
        HRSetupNew.GET;
        RequesterEmail:=ApplicantRequest."E-Mail";
        RequesterName:=ApplicantRequest.Name;
        Counter:=Counter+1;
        IF CompInfo."E-Mail"='' THEN
          ERROR('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
        SenderAddress:=CompInfo."E-Mail";
        IF HRSetupNew."Default Proc Email Contact" = '' THEN
        ERROR('Please Contact the IT Admin to specify the procurement E-mail address under Human Resource Setup page!!');
        CustEmail:=HRSetupNew."Default Proc Email Contact";
        CompanyDetails:='Dear,'+ApplicantRequest.Name+'<BR>';
        SenderMessage:='<BR>Thank you for using our e-student Portal which has been established to provide you with easy access to our online student services such as e-registration.'+
        'This email is to acknowledge that your Request for registration as a student, done on: '+FORMAT(ApplicantRequest."Last Date Modified")+
        'has been received, summarized as follows:'+'<BR></BR>';
        SupplierDetails:='Registration Request Reference No:'+ApplicantRequest."No."+'<BR></BR>'+'<b>Full Names:</b>'+ApplicantRequest.Name+'<BR></BR>'+
        '<b>KRA Registration (PIN) No:</b>'+ApplicantRequest."VAT Registration No."+'<BR></BR>'+'<b>Primary Email Address<b>:'+ApplicantRequest."E-Mail"+'<BR></BR>'+
        '<b>Mobile Phone No:<b>'+ApplicantRequest."Phone No."+'<BR></BR>';
        IF CustEmail='' THEN
         EXIT;
        emailhdr:='e-registration Acknowledgment (Reference No:'+ApplicantRequest."No."+')';
        cu400.CreateMessage(CompInfo.Name,SenderAddress,CustEmail,emailhdr,
        CompanyDetails+'<BR></BR>'+SenderMessage+SupplierDetails+LoginDetails+ActivationDetails, TRUE);
        cu400.AddCC(RequesterEmail);
        cu400.AddBodyline(ProcNote);
        cu400.Send;
        SendingDate:=TODAY;
        SendingTime:=TIME;
         SLEEP(1000);
         Window.CLOSE;*/

    end;

    procedure FnSendEmaiNotificationOnApplicantAccountActivation(ApplicantRequest: Record Contact)
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        "Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit Mail;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit Mail;
        DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetupNew: Record "Purchases & Payables Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
    begin
        // CompInfo.Get;
        // HRSetup.Get;
        // HRSetupNew.Get;
        // RequesterEmail:=ApplicantRequest."E-Mail";
        // RequesterName:=ApplicantRequest.Name;
        // Counter:=Counter+1;
        // PortalUser.Reset;
        // PortalUser.SetRange("Authentication Email",ApplicantRequest."E-Mail");
        // if PortalUser.FindSet then
        //   Password:=PortalUser."Password Value";
        // if CompInfo."E-Mail"='' then
        //   Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
        // SenderAddress:=CompInfo."E-Mail";
        // if HRSetupNew."Procurement/Stores E-mail" = '' then
        //   Error('Please Contact the IT Admin to specify the HR Manager E-mail address under Human Resource Setup page!!');
        //   CustEmail:=HRSetupNew."Procurement/Stores E-mail";
        // CompanyDetails:='Dear Sir/Madam,';
        // //SenderMessage:='<BR>Please note that your Supplier account has been created on our System, with the following key registration details:</BR>';
        // SenderMessage:='<BR>Thank you for using our e-Procurement Portal which has been established to provide you with easy access to our online business services such as supplier registration, Prequalification and Tendering.'+
        // 'This email is to acknowledge that your Request for registration as a supplier, done on:'+Format(ApplicantRequest."Last Date Modified")+
        // ' has been received.'+'<BR><BR>'+ 'Find below your registration details:'+'<BR></BR>'+

        // 'Registration Request Reference No: '+ApplicantRequest."No."+'<BR></BR>'+'Company Name: '+ApplicantRequest.Name+'<BR></BR>'+
        // 'Tax Registration No: '+ApplicantRequest."VAT Registration No."+'<BR></BR>'+'Primary Email: '+ApplicantRequest."E-Mail"+'<BR></BR>'+
        // 'Mobile Phone No:'+ApplicantRequest."Phone No."+'<BR></BR>';

        // //'<BR>Registration Request Reference No: </>'+ApplicantRequest."No."+'</BR>'+'<BR> Name: </>'+ApplicantRequest.Name+'</BR>'+
        // //'<BR>Mobile Phone No: '+ApplicantRequest."Phone No."+'</BR>';

        // LoginDetails:='<br>We have also created your portal access account with the following login credentials:'+'<BR></BR>'+
        // 'User Name: '+ApplicantRequest."E-Mail"+'<BR></BR>'+'Password: '+Password+'<BR><BR>To access our Supplier Procurement portal and complete your registration, click on the link below:<BR>'+
        // '<a href="http://192.168.1.87:8076/Home/Login/">E-Procurement Portal</a>';

        //  //'<br> <br><a href="http://192.168.1.87:7988/">E-Recruitment Portal Link</a></br>';
        // // ActivationDetails:='<BR><BR>Once you access our portal, you shall be required to complete your supplier profile: </BR>'+
        // // '<BR>Regards,'+
        // // '<BR>Supply Chain Management'+
        // // '<BR>Kenya Rural Roads Authority'+
        // // '<BR><BR>Note: This is a system generated mail. Please DO NOT reply to it.';

        // ActivationDetails:='<BR>If you require any assistance, please contact our Supply chain Management team by Phone <BR>'+ HRSetup."Phone No."+
        // '<BR><BR>Regards,'+
        // '<BR>Supply chain management'+
        // '<BR>Kenya Rural Roads Authority'+
        // '<BR><BR>Note: This is a system generated mail. Please DO NOT reply to it.';
        // if CustEmail='' then
        //  exit;
        // emailhdr:='E-procurement Activation (Applicant Account No:'+ApplicantRequest."No."+')';
        // cu400.CreateMessage(CompInfo.Name,SenderAddress,CustEmail,emailhdr,
        // CompanyDetails+'<BR></BR>'+SenderMessage+SupplierDetails+LoginDetails+ActivationDetails, true);
        // cu400.AddCC(RequesterEmail);
        // cu400.AddBodyline(ProcNote);
        // cu400.Send;
        // SendingDate:=Today;
        // SendingTime:=Time;
        // Sleep(1000);
        // Window.Close;
    end;

    procedure FnCreateApplicantAccountRequest(emailaddress: Text) status: Text
    var
        PortalUSer: Record "Dynasoft Portal User";
        RandomDigit: Text[50];
        entryno: Integer;
        ApplicantProfile: Record Vendor;
        VendorSetup: Record "Purchases & Payables Setup";
        Contact: Record Contact;
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        Contact.Reset;
        Contact.SetRange("E-Mail", emailaddress);
        if Contact.FindSet then begin
            VendorSetup.Get;
            ApplicantProfile.Reset;
            ApplicantProfile.SetRange("E-Mail", emailaddress);
            if not ApplicantProfile.FindSet then begin
                ApplicantProfile.Init;
                ApplicantProfile."No." := NoSeriesMgt.GetNextNo(VendorSetup."Vendor Nos.", Today, true);
                ApplicantProfile.Name := Contact.Name;
                ApplicantProfile.Registered := ApplicantProfile.Registered::No;
                ApplicantProfile."E-Mail" := Contact."E-Mail";
                ApplicantProfile."Post Code" := Contact."Post Code";
                ApplicantProfile."VAT Registration No." := Contact."VAT Registration No.";
                ApplicantProfile.City := Contact.City;
                ApplicantProfile.Address := Contact.Address;
                ApplicantProfile."Phone No." := Contact."Phone No.";
                if ApplicantProfile.Insert(true) then begin
                    // Update Dynasoft Portal user;
                    PortalUSer.Reset;
                    PortalUSer.SetRange("Authentication Email", emailaddress);
                    if not PortalUSer.FindSet then begin
                        PortalUSer.Init;
                        PortalUSer."User Name" := Contact.Name;
                        PortalUSer."Full Name" := Contact.Name;
                        PortalUSer."Authentication Email" := Contact."E-Mail";
                        PortalUSer."Mobile Phone No." := Contact."Phone No.";
                        PortalUSer.State := PortalUSer.State::Enabled;
                        PortalUSer."Record Type" := PortalUSer."record type"::Vendor;
                        PortalUSer."Record ID" := ApplicantProfile."No.";
                        RandomDigit := CreateGuid;
                        RandomDigit := DelChr(RandomDigit, '=', '{}-01');
                        RandomDigit := CopyStr(RandomDigit, 1, 8);
                        PortalUSer."Password Value" := RandomDigit;
                        PortalUSer."Last Modified Date" := Today;
                        if PortalUSer.Insert(true) then begin
                            ;
                        end;
                    end;
                end;
            end;
        end;
    end;

    procedure fnChangePassword(email: Text; oldPassword: Text; newPassword: Text) status: text
    var
        tbl_portalUser: Record "Dynasoft Portal User";
    begin
        tbl_portalUser.reset;
        tbl_portalUser.Setrange("Authentication Email", email);
        tbl_portalUser.Setrange("Password Value", oldPassword);
        tbl_portalUser.Setrange("Record Type", tbl_portalUser."Record Type"::Vendor);
        if tbl_portalUser.findset(true) then begin
            tbl_portalUser."Password Value" := newPassword;
            tbl_portalUser."Last Modified Date" := Today;
            tbl_portalUser."Change Password" := true;
            if tbl_portalUser.modify(true) then begin
                status := 'success*Password was modified successfully';
            end else begin
                status := 'danger*System error when modifying your password. Kindly try again! Contact KURA IT administrator if this error persists.'
            end;
        end else begin
            status := 'wrongpassword*Password Reset was unsuccessful. The credentials entered are not correct. '
        end;


    end;

    procedure fnUpdateAcknowledgementStatus(VendorNumber: Code[100]; documentno: Code[50]; signatoryID: Integer) status: Text
    var
        PurchaseHeader: Record "Purchase Header";
        WorkExecutionPlan: Record "Work Execution Plan";
    begin

        ProjectMobilizationHeader.Reset;
        ProjectMobilizationHeader.SetRange("Document No.", VendorNumber);
        //ProjectMobilizationHeader.SETRANGE("Document Type",ProjectMobilizationHeader."Document Type"::"Order-To-Commence");
        ProjectMobilizationHeader.SetRange("Purchase Contract ID", documentno);
        if ProjectMobilizationHeader.Find('-') then begin
            ProjectMobilizationHeader.Validate("Representative ID", signatoryID);
            ProjectMobilizationHeader."Acknowledgement Status" := ProjectMobilizationHeader."acknowledgement status"::Acknowledged;
            ProjectMobilizationHeader."Acknowledgement Date" := Today;
            ProjectMobilizationHeader.Modify;
            status := 'success*Acknowledgement was successfully submitted!';
        end else begin
            status := 'danger*Error!, could not update acknowledgement status';
        end;
        exit(status);
    end;

    procedure fnUpdateAcknowledgementStatusDWR(documentno: Code[50]; signatoryID: Integer) status: Text
    var
        DailyWorkRecord: Record "Daily Work Record";
    begin
        DailyWorkRecord.Reset;
        DailyWorkRecord.SetRange("Document No.", documentno);
        if DailyWorkRecord.Find('-') then begin
            DailyWorkRecord.Validate("Representative ID", signatoryID);
            DailyWorkRecord."Acknowledgement Status" := DailyWorkRecord."acknowledgement status"::Acknowledged;
            DailyWorkRecord."Acknowledgement DateTime" := CurrentDatetime;
            DailyWorkRecord.Modify;
            status := 'success*Acknowledgement was successfully submitted!';
        end else begin
            status := 'danger*Error!, could not update acknowledgement status';
        end;
        exit(status);
    end;

    procedure fnUpdateAcknowledgementStatusSiteInstructions(documentno: Code[50]; signatoryID: Code[20]) status: Text
    var
        RESiteInstructions: Record "Site Instructions Header";
    begin
        RESiteInstructions.Reset;
        RESiteInstructions.SetRange("Document No.", documentno);
        if RESiteInstructions.Find('-') then begin
            RESiteInstructions."Acknowledged By" := signatoryID;
            RESiteInstructions."Acknowledgement Status" := RESiteInstructions."acknowledgement status"::Acknowledged;
            RESiteInstructions."Acknowledment DateTime" := CurrentDatetime;
            RESiteInstructions.Modify;
            status := 'success*Acknowledgement was successfully submitted!';
        end else begin
            status := 'danger*Error!, could not update acknowledgement status';
        end;
        exit(status);
    end;

    procedure FnGeneratePCOReport(PCONo: Code[20]) BaseImage: Text
    var
        projectHeader: Record "Project Mobilization Header";

    begin
        TempBlob_lRec.CreateOutStream(OutStr, TEXTENCODING::UTF8);
        projectHeader.Reset;
        projectHeader.SetRange(projectHeader."Document Type", ProjectMobilizationHeader."document type"::"Order-To-Commence");
        projectHeader.SetRange(projectHeader."Document No.", PCONo);
        if projectHeader.FindSet then begin
            RecRef.GetTable(projectHeader);
            Report.SaveAs(Report::"Orders to Commence Letter", '', ReportFormat::Pdf, OutStr, RecRef);
            FileManagement_lCdu.BLOBExport(TempBlob_lRec, STRSUBSTNO('OrderToCommence_%1.Pdf', projectHeader."Document No."), TRUE);
            TempBlob_lRec.CreateInstream(InStr, TEXTENCODING::UTF8);
            BaseImage := Base64Convert.ToBase64(InStr);
        end;
    end;

    procedure fnSubmitWEPMethodofWorks(documentNumber: Code[50]; summary: Text; description: Text; entryno: Integer) status: Text
    var
        WEPMethodOfWorks: Record "WEP Method of Work";
    begin
        WEPMethodOfWorks.Reset;
        WEPMethodOfWorks.SetRange("Document No", documentNumber);
        WEPMethodOfWorks.SetRange("Entry No", entryno);
        if WEPMethodOfWorks.FindSet then begin
            WEPMethodOfWorks."Entry No" := entryno;
            WEPMethodOfWorks."Document No" := documentNumber;
            WEPMethodOfWorks."Document Type" := WEPMethodOfWorks."document type"::"Work Execution Programme";
            WEPMethodOfWorks.Description := description;
            WEPMethodOfWorks."Benefits Summary" := summary;
            if WEPMethodOfWorks.Modify(true) then begin
                status := 'success*Method of Work Details Was Successfully Modified!';
            end else begin
                status := 'danger*Method of Work Details Was Successfully Modified!';
            end;
        end else begin
            WEPMethodOfWorks.Init;
            WEPMethodOfWorks."Document No" := documentNumber;
            WEPMethodOfWorks."Document Type" := WEPMethodOfWorks."document type"::"Work Execution Programme";
            WEPMethodOfWorks.Description := description;
            WEPMethodOfWorks."Benefits Summary" := summary;

            if WEPMethodOfWorks.Insert(true) then begin
                status := 'success*Method of Work Details Was Successfully Submitted!';
            end else begin
                status := 'danger*Method of Work Details Was Not Submitted!';
            end;
        end;
    end;

    procedure fnsendWEPRecordForApproval(vendorNo: Code[50]; documentNo: Code[50]; recordType: Text) status: Text
    var
        ProjectMobilizationHeader1: Record "Project Mobilization Header";
    begin
        status := 'danger*The record could not be sent for approval';
        // recordType:=UpperCase(recordType);
        // if recordType ='WEP' then begin
        // status:='danger*The Work Execution Plan could not be sent for approval';
        // ProjectMobilizationHeader.Reset;
        // ProjectMobilizationHeader.SetRange("Document No.", documentNo);
        // ProjectMobilizationHeader.SetRange("Contractor No.", vendorNo);
        // if ProjectMobilizationHeader.FindSet then begin
        //    if ApprovalsMgmt.CheckWEPPCOReqApprovalPossible(ProjectMobilizationHeader) then
        //    ApprovalsMgmt.OnSendWEPPCOReqForApproval(ProjectMobilizationHeader);
        //       if ProjectMobilizationHeader1.Get(ProjectMobilizationHeader."Document No.") then begin
        //           if ProjectMobilizationHeader1.Status = ProjectMobilizationHeader1.Status::Open then begin
        //             status:= 'warning*Your Work Execution Plan  could not be sent for approval';
        //             end else begin
        //               status:= 'success*Your Work Execution Plan was successfully  sent for approval';
        //               end;
        //         end;
        //   end else begin
        //     status:='danger*The Work Execution Plan does not exist or you are not the requester';
        //     end;
        //     end;
        exit(status);
    end;

    procedure fncancelWEPRecordApproval(vendorNo: Code[50]; documentNo: Code[50]; recordType: Text) status: Text
    var
        ProjectMobilizationHeader1: Record "Project Mobilization Header";
    begin
        status := 'danger*The record approval could not be cancelled';
        recordType := Lowercase(recordType);
        if recordType = 'WEP' then begin
            status := 'danger*The Work Execution Plan approval could not be cancelled';
            ProjectMobilizationHeader.Reset;
            ProjectMobilizationHeader.SetRange("Document No.", documentNo);
            ProjectMobilizationHeader.SetRange("Contractor No.", vendorNo);
            if ProjectMobilizationHeader.FindSet then begin
                //    ApprovalsMgmt.OnCancelWEPPCOReqApprovalRequest(ProjectMobilizationHeader);
                //       if ProjectMobilizationHeader1.Get(ProjectMobilizationHeader."Document No.") then begin
                //           if ProjectMobilizationHeader1.Status = ProjectMobilizationHeader1.Status then begin
                //             status:= 'warning*Your Work Execution Plan approval could not be cancelled';
                //             end else begin
                //               status:= 'success*Your Work Execution Plan approval was successfully cancelled';
                //               end;
                //         end;
            end else begin
                status := 'danger*The Work Execution Plan does not exist or you are not the requester';

            end;

        end;

        exit(status);
    end;

    procedure FnGenerateWEPReport(PCONo: Code[20]) BaseImage: Text
    var
        projectHeader: Record "Project Mobilization Header";

    begin
        TempBlob_lRec.CreateOutStream(OutStr, TEXTENCODING::UTF8);
        projectHeader.Reset;
        projectHeader.SetRange(projectHeader."Document Type", ProjectMobilizationHeader."document type"::"Work Execution Programme");
        projectHeader.SetRange(projectHeader."Document No.", PCONo);
        if projectHeader.FindSet then begin
            RecRef.GetTable(projectHeader);
            Report.SaveAs(Report::"Work Execution Plan", '', ReportFormat::Pdf, OutStr, RecRef);
            FileManagement_lCdu.BLOBExport(TempBlob_lRec, STRSUBSTNO('WorkExecutionPlan_%1.Pdf', projectHeader."Document No."), TRUE);
            TempBlob_lRec.CreateInstream(InStr, TEXTENCODING::UTF8);
            BaseImage := Base64Convert.ToBase64(InStr);
        end;
    end;

    procedure fnSubmitProjectPhotoRecord(projectid: Code[50]; externalrefno: Code[10]; comments: Text) status: Text
    var
        ProjectPhotoRecord: Record "Project Photo Record";
    begin

        ProjectPhotoRecord.Init;
        ProjectPhotoRecord.Validate("Project ID", projectid);
        ProjectPhotoRecord."External Reference No." := externalrefno;
        ProjectPhotoRecord."Additional Comments/Notes" := comments;
        ProjectPhotoRecord."Date Filed" := Today;

        if ProjectPhotoRecord.Insert(true) then begin
            status := 'success*Project Photo Record Details Was Successfully Submitted!';
        end else begin
            status := 'danger*Project Photo Record Details Was Not Submitted!';
        end;
    end;

    procedure fnCreateNewDailyWorkRecord(vendornumber: Code[20]; wepID: Code[50]; temperature: Decimal; workingstartdade: Time; workingenddate: Time; casualstaffno: Integer; rainfall: Decimal; otherWeathercondition: Text) status: Text
    var
        DailyWorkRecord: Record "Daily Work Record";
    begin
        DailyWorkRecord.Init;
        DailyWorkRecord."Document No." := '';
        DailyWorkRecord."Document Date" := Today;
        DailyWorkRecord.Validate("Work Execution Programme ID", wepID);
        DailyWorkRecord."Average Temperature" := temperature;
        DailyWorkRecord."Working End Time" := workingenddate;
        DailyWorkRecord."Working Start Time" := workingstartdade;
        DailyWorkRecord."No. of Casual Staff" := casualstaffno;
        DailyWorkRecord."Rainfall (mm)" := rainfall;
        DailyWorkRecord."Other Weather Condition" := otherWeathercondition;
        if DailyWorkRecord.Insert(true) then begin
            status := 'success*' + DailyWorkRecord."Document No." + '*New Daily Work Record Was Successfully Created!'
        end else begin
            status := 'danger*Error while Creating the Daily Work Record!'
        end;
        //END;
    end;

    procedure fnSubmitDailyWorkRecordExecutionLines(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; jobtaskno: Code[20]; lineno: Integer; quantitydone: Decimal; additionalcomments: Text; photono: Code[20]) status: Text
    var
        DailyWorkRecordExecution: Record "Daily Work Record Execution";
    begin
        DailyWorkRecordExecution.Init;
        DailyWorkRecordExecution."Document No." := Documentno;
        if DailyWorkRecordExecution.Insert(true) then begin

            DailyWorkRecordExecution."Document Date" := Today;
            DailyWorkRecordExecution."Job No." := projectid;
            DailyWorkRecordExecution."Job Task No." := jobtaskno;
            DailyWorkRecordExecution.Validate("Line No.", lineno);
            DailyWorkRecordExecution."Quantity Done" := quantitydone;
            DailyWorkRecordExecution."Additional Comments/Notes" := additionalcomments;
            DailyWorkRecordExecution."Photo No." := photono;
            if DailyWorkRecordExecution.Modify(true) then begin
                status := 'success*New Progress of Works Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Progress of Works!'
            end;
        end else begin
            status := 'danger*Error while Creating the Progress of Works!'
        end
    end;

    procedure fngetDWRWorkExecutionPlanNumber(VendorNumber: Code[100]; dailyworkrecordno: Code[50]) workexecutionplanNumber: Code[100]
    var
        DailyWorkRecord: Record "Daily Work Record";
    begin
        DailyWorkRecord.Reset;
        DailyWorkRecord.SetRange("Contractor No.", VendorNumber);
        DailyWorkRecord.SetRange("Document No.", dailyworkrecordno);
        if DailyWorkRecord.FindLast then begin
            workexecutionplanNumber := DailyWorkRecord."Work Execution Programme ID";
        end else begin
            workexecutionplanNumber := '';
        end;
    end;

    procedure fngetDailyWorkRecordProjectNumber(documentno: Code[50]) ProjectNumber: Code[100]
    var
        DailyWorkRecord: Record "Daily Work Record";
    begin
        DailyWorkRecord.Reset;
        DailyWorkRecord.SetRange("Document No.", documentno);
        if DailyWorkRecord.FindLast then begin
            ProjectNumber := DailyWorkRecord."Project ID";
        end else begin
            ProjectNumber := '';
        end;
    end;

    procedure fngetDailyWorkRecordDocumentDate(documentno: Code[50]) ProjectNumber: Code[100]
    var
        DailyWorkRecord: Record "Daily Work Record";
    begin
        DailyWorkRecord.Reset;
        DailyWorkRecord.SetRange("Document No.", documentno);
        if DailyWorkRecord.FindLast then begin
            ProjectNumber := Format(DailyWorkRecord."Document Date");
        end else begin
            ProjectNumber := '';
        end;
    end;

    procedure fngetEOTRequestProjectEngineer(documentno: Code[50]) result: Code[100]
    var
        InternalProjectResource: Record "Internal Project Resource";
    begin
        InternalProjectResource.Reset;
        InternalProjectResource.SetRange(InternalProjectResource."Project ID", documentno);
        InternalProjectResource.SetRange(InternalProjectResource."Project Manager", true);
        if InternalProjectResource.FindSet then begin
            result := InternalProjectResource."Resource No.";
        end
        else begin
            result := '';
        end;
    end;

    procedure fngetEOTRequestProjectManager(documentno: Code[50]) result: Code[100]
    var
        InternalProjectResource: Record "Internal Project Resource";
    begin
        InternalProjectResource.Reset;
        InternalProjectResource.SetRange(InternalProjectResource."Project ID", documentno);
        InternalProjectResource.SetRange(InternalProjectResource."Project Manager", true);
        if InternalProjectResource.FindSet then begin
            result := InternalProjectResource."User ID";

        end
        else begin
            result := '';
        end;
    end;

    procedure fnSubmitDailyWorkRecordKeyTeam(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; contractorstaffno: Code[20]) status: Text
    var
        DailyWorkRecordKeyTeam: Record "Daily Work Record Key Team";
    begin

        DailyWorkRecordKeyTeam.Init;
        DailyWorkRecordKeyTeam."Document No." := Documentno;
        if DailyWorkRecordKeyTeam.Insert(true) then begin
            DailyWorkRecordKeyTeam.Validate("Contractor Staff No.", contractorstaffno);
            if DailyWorkRecordKeyTeam.Modify(true) then begin
                status := 'success*New Key Team Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Key Team!'
            end;
        end else begin
            status := 'danger*Error while Creating the Key Team!'
        end
    end;

    procedure fnSubmitDailyWorkRecordEquipment(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; equipmentno: Code[20]; photono: Code[50]; utilization: Integer; usagehours: Integer; remarks: Text) status: Text
    var
        DailyWorkRecordEquipment: Record "Daily Work Record Equipment";
    begin

        DailyWorkRecordEquipment.Init;
        DailyWorkRecordEquipment."Document No." := Documentno;
        DailyWorkRecordEquipment."Equipment No." := equipmentno;
        //DailyWorkRecordEquipment.VALIDATE("Equipment No.",equipmentno);
        DailyWorkRecordEquipment."Photo No." := photono;
        DailyWorkRecordEquipment."Equipment Utilization" := utilization;
        DailyWorkRecordEquipment."Equipment Usage Hours" := usagehours;
        DailyWorkRecordEquipment.Remarks := remarks;
        if DailyWorkRecordEquipment.Insert(true) then begin
            status := 'success*New Key Team Was Successfully Created!'

        end else begin
            status := 'danger*Error while Creating the Key Team!'
        end
    end;

    procedure fnSubmitDailyWorkRecordMaterialsDelivered(vendornumber: Code[20]; Documentno: Code[50]; materialid: Code[20]; photono: Code[50]; quantity: Integer; materialtestrecid: Code[10]) status: Text
    var
        DailyWorkRecordMaterial: Record "Daily Work Record Material";
    begin

        DailyWorkRecordMaterial.Init;
        DailyWorkRecordMaterial."Document No." := Documentno;
        DailyWorkRecordMaterial."Movement Type" := DailyWorkRecordMaterial."movement type"::"Delivered To Site";
        DailyWorkRecordMaterial.Validate("Material ID", materialid);
        DailyWorkRecordMaterial."Photo No." := photono;
        if materialtestrecid <> 'null' then
            DailyWorkRecordMaterial."Material Test Record ID" := materialtestrecid;
        DailyWorkRecordMaterial.Quantity := quantity;
        if DailyWorkRecordMaterial.Insert(true) then begin

            status := 'success*New Material Delivered Was Successfully Created!'

        end else begin
            status := 'danger*Error while Creating the Material Delivered!'
        end
    end;

    procedure fnSubmitDailyWorkRecordMaterialsRemoved(vendornumber: Code[20]; Documentno: Code[50]; materialid: Code[20]; photono: Code[50]; quantity: Integer; materialtestrecid: Code[10]; reasonsforremoval: Text) status: Text
    var
        DailyWorkRecordMaterial: Record "Daily Work Record Material";
    begin

        DailyWorkRecordMaterial.Init;
        DailyWorkRecordMaterial."Movement Type" := DailyWorkRecordMaterial."movement type"::"Removed From Site";
        DailyWorkRecordMaterial."Document No." := Documentno;
        if materialtestrecid <> 'null' then
            DailyWorkRecordMaterial.Validate("Material ID", materialid);
        DailyWorkRecordMaterial."Photo No." := photono;
        DailyWorkRecordMaterial."Material Test Record ID" := materialtestrecid;
        DailyWorkRecordMaterial.Quantity := quantity;
        DailyWorkRecordMaterial."Reasons for Removal" := reasonsforremoval;
        if DailyWorkRecordMaterial.Insert(true) then begin
            status := 'success*New Material Removed Was Successfully Created!'

        end else begin
            status := 'danger*Error while Creating the Material Removed!'
        end
    end;

    procedure fnSubmitDailyWorkRecordLabourSchedule(vendornumber: Code[20]; Documentno: Code[50]; labourtype: Integer; noofstaff: Integer; averagemanhours: Decimal; estimatetotalwagespaid: Decimal) status: Text
    var
        DailyWorkRecordLabours: Record "Daily Work Record Labor";
    begin

        DailyWorkRecordLabours.Init;
        DailyWorkRecordLabours."Document No." := Documentno;
        if DailyWorkRecordLabours.Insert(true) then begin
            DailyWorkRecordLabours.Validate(Gender, labourtype);
            DailyWorkRecordLabours."Total No. of Staff" := noofstaff;
            DailyWorkRecordLabours."Average ManHours Worked" := averagemanhours;
            DailyWorkRecordLabours."Estimate Total Wages Paid" := estimatetotalwagespaid;
            if DailyWorkRecordLabours.Modify(true) then begin
                status := 'success*New Labour Schedule Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Labour Schedule!'
            end;
        end else begin
            status := 'danger*Error while Creating the Labour Schedule!'
        end
    end;

    procedure fnSubmitDailyWorkRecordVisitor(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; visitorname: Text; organization: Text; timein: Time; timeout: Time; purpose: Text; telephoneno: Code[20]; idpassportno: Code[20]; remarks: Text; vistoremail: Text) status: Text
    var
        DailyWorkRecordVisitor: Record "Daily Work Record Visitor";
    begin
        DailyWorkRecordVisitor.Init;
        DailyWorkRecordVisitor."Document No." := Documentno;
        if DailyWorkRecordVisitor.Insert(true) then begin
            DailyWorkRecordVisitor."Visitor Name" := visitorname;
            DailyWorkRecordVisitor.Organization := organization;
            DailyWorkRecordVisitor."Time In" := timein;
            DailyWorkRecordVisitor."Time Out" := timeout;
            DailyWorkRecordVisitor."Purpose of Visit" := purpose;
            DailyWorkRecordVisitor."Telephone No." := telephoneno;
            DailyWorkRecordVisitor."ID/Passport No." := idpassportno;
            DailyWorkRecordVisitor.Remarks := remarks;
            DailyWorkRecordVisitor."Visitor Email" := vistoremail;
            if DailyWorkRecordVisitor.Modify(true) then begin
                status := 'success*New Visitor Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Visitor!'
            end;
        end else begin
            status := 'danger*Error while Creating the Visitor!'
        end
    end;

    procedure fnSubmitDailyWorkRecordMeetings(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; meetingtype: Code[20]; meetingorganizerid: Code[20]; starttime: Time; endtime: Time; duration: Text; startdate: Date; enddate: Date; meetingstatus: Integer; venue: Text) status: Text
    var
        DailyWorkRecordMeetings: Record "Daily Work Record Meeting";
    begin
        DailyWorkRecordMeetings.Init;
        DailyWorkRecordMeetings."Document No." := Documentno;
        if DailyWorkRecordMeetings.Insert(true) then begin
            DailyWorkRecordMeetings.Validate("Meeting Type", meetingtype);
            DailyWorkRecordMeetings."Meeting Organizer ID" := meetingorganizerid;
            DailyWorkRecordMeetings."Start Date" := startdate;
            DailyWorkRecordMeetings."Start Time" := starttime;
            //DailyWorkRecordMeetings."Duration(Days)",duration);
            DailyWorkRecordMeetings."End Date" := enddate;
            DailyWorkRecordMeetings."End Time" := endtime;
            DailyWorkRecordMeetings."Venue/Location" := venue;
            DailyWorkRecordMeetings."Meeting Status" := meetingstatus;
            if DailyWorkRecordMeetings.Modify(true) then begin
                status := 'success*New Meeting Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Meeting!'
            end;
        end else begin
            status := 'danger*Error while Creating the Meeting!'
        end
    end;

    procedure fnSubmitContractorAdvancePayment(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; advanceamount: Decimal; guaranteeref: Integer; performancesecurityid: Integer; advancejustification: Text) status: Text
    var
        ContractorPaymentRequest: Record "Measurement &  Payment Header";
        ContractorRequestPlanLine: Record "Contractor Request Plan Line";
        ContractorRequestTask: Record "Contractor Request Task";
    begin

        ContractorPaymentRequest.Init;
        ContractorPaymentRequest."Document Type" := ContractorPaymentRequest."document type"::"Contractor Payment Request";
        ContractorPaymentRequest."Payment Certificate Type" := ContractorPaymentRequest."payment certificate type"::"Advance Payment";
        ContractorPaymentRequest."Project ID" := projectid;
        ContractorPaymentRequest."Requested Advance Payment(LCY)" := advanceamount;
        ContractorPaymentRequest."Advance Payment Security ID" := guaranteeref;
        ContractorPaymentRequest."Performance Security ID" := performancesecurityid;
        ContractorPaymentRequest."Advance Payment Justification" := advancejustification;
        if ContractorPaymentRequest.Insert(true) then begin
            ContractorPaymentRequest.Validate("Project ID");
            ContractorPaymentRequest.Validate("Advance Payment Security ID");
            ContractorPaymentRequest.Validate("Performance Security ID");
            ContractorPaymentRequest.Validate("Requested Advance Payment(LCY)");
            if ContractorPaymentRequest.Modify(true) then begin
                Rec := ContractorPaymentRequest;
                RMSManagement.FnSuggesTasks_PlanLinesFromJob(ContractorRequestTask, ContractorRequestPlanLine, Rec);
                status := 'success*' + ContractorPaymentRequest."Document No." + '*New Advance Payment Request Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Advance Payment Request!'
            end;
        end else begin
            status := 'danger*Error while Creating the Advance Payment Request!'
        end
    end;

    procedure fnSubmitContractorPaymentRequest(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; milestonecode: Code[20]; guaranteeref: Integer; performancesecurityid: Integer) status: Text
    var
        ContractorPaymentRequest: Record "Measurement &  Payment Header";
        ContractorRequestPlanLine: Record "Contractor Request Plan Line";
        ContractorRequestTask: Record "Contractor Request Task";
    begin

        ContractorPaymentRequest.Init;
        ContractorPaymentRequest."Document Type" := ContractorPaymentRequest."document type"::"Contractor Payment Request";
        ContractorPaymentRequest."Payment Certificate Type" := ContractorPaymentRequest."payment certificate type"::"Interim Payment";
        ContractorPaymentRequest."Advance Payment Security ID" := guaranteeref;
        ContractorPaymentRequest."Performance Security ID" := performancesecurityid;
        ContractorPaymentRequest."Milestone Code" := milestonecode;
        if ContractorPaymentRequest.Insert(true) then begin
            ContractorPaymentRequest.Validate("Project ID", projectid);
            //ContractorPaymentRequest.Validate("Advance Payment Security ID");
            //  ContractorPaymentRequest.Validate("Performance Security ID");
            if ContractorPaymentRequest.Modify(true) then begin
                Rec := ContractorPaymentRequest;
                RMSManagement.FnSuggesTasks_PlanLinesFromJob(ContractorRequestTask, ContractorRequestPlanLine, Rec);
                status := 'success*' + ContractorPaymentRequest."Document No." + '*New Payment Request Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Payment Request!'
            end;
        end else begin
            status := 'danger*Error while Creating the Payment Request!'
        end
    end;

    procedure fnSubmitContractorRetentionPaymentRequest(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; milestonecode: Code[20]) status: Text
    var
        ContractorPaymentRequest: Record "Measurement &  Payment Header";
        ContractorRequestPlanLine: Record "Contractor Request Plan Line";
        ContractorRequestTask: Record "Contractor Request Task";
    begin

        ContractorPaymentRequest.Init;
        ContractorPaymentRequest."Document Type" := ContractorPaymentRequest."document type"::"Contractor Payment Request";
        ContractorPaymentRequest."Payment Certificate Type" := ContractorPaymentRequest."payment certificate type"::"Retention Payment";
        ContractorPaymentRequest."Project ID" := projectid;
        ContractorPaymentRequest."Milestone Code" := milestonecode;
        if ContractorPaymentRequest.Insert(true) then begin
            ContractorPaymentRequest.Validate("Project ID");
            if ContractorPaymentRequest.Modify(true) then begin
                Rec := ContractorPaymentRequest;
                RMSManagement.FnSuggesTasks_PlanLinesFromJob(ContractorRequestTask, ContractorRequestPlanLine, Rec);
                status := 'success*' + ContractorPaymentRequest."Document No." + '*New Retention Payment Request Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Retention Payment Request!'
            end;
        end else begin
            status := 'danger*Error while Creating the Retention Payment Request!'
        end
    end;

    procedure fnSubmitContractorFinalPaymentRequest(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; milestonecode: Code[20]; guaranteeref: Integer; performancesecurityid: Integer) status: Text
    var
        ContractorPaymentRequest: Record "Measurement &  Payment Header";
        ContractorRequestPlanLine: Record "Contractor Request Plan Line";
        ContractorRequestTask: Record "Contractor Request Task";
    begin

        ContractorPaymentRequest.Init;
        ContractorPaymentRequest."Document Type" := ContractorPaymentRequest."document type"::"Contractor Payment Request";
        ContractorPaymentRequest."Payment Certificate Type" := ContractorPaymentRequest."payment certificate type"::"Final Payment";
        ContractorPaymentRequest."Advance Payment Security ID" := guaranteeref;
        ContractorPaymentRequest."Performance Security ID" := performancesecurityid;
        ContractorPaymentRequest."Milestone Code" := milestonecode;
        if ContractorPaymentRequest.Insert(true) then begin
            ContractorPaymentRequest.Validate("Project ID", projectid);
            ContractorPaymentRequest.Validate("Advance Payment Security ID");
            ContractorPaymentRequest.Validate("Performance Security ID");
            if ContractorPaymentRequest.Modify(true) then begin
                Rec := ContractorPaymentRequest;
                RMSManagement.FnSuggesTasks_PlanLinesFromJob(ContractorRequestTask, ContractorRequestPlanLine, Rec);
                status := 'success*' + ContractorPaymentRequest."Document No." + '*New Final Payment Request Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Final Payment Request!'
            end;
        end else begin
            status := 'danger*Error while Creating the Final Payment Request!'
        end
    end;

    procedure fnSubmitContractorInterestPaymentRequest(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; interestamount: Decimal) status: Text
    var
        ContractorPaymentRequest: Record "Measurement &  Payment Header";
        ContractorRequestPlanLine: Record "Contractor Request Plan Line";
        ContractorRequestTask: Record "Contractor Request Task";
    begin

        ContractorPaymentRequest.Init;
        ContractorPaymentRequest."Document Type" := ContractorPaymentRequest."document type"::"Contractor Payment Request";
        ContractorPaymentRequest."Payment Certificate Type" := ContractorPaymentRequest."payment certificate type"::Interest;
        ContractorPaymentRequest."Project ID" := projectid;
        ContractorPaymentRequest."Requested Advance Payment(LCY)" := interestamount;
        if ContractorPaymentRequest.Insert(true) then begin
            ContractorPaymentRequest.Validate("Project ID");
            // ContractorPaymentRequest.VALIDATE("Requested Advance Payment(LCY)");
            if ContractorPaymentRequest.Modify(true) then begin
                Rec := ContractorPaymentRequest;
                RMSManagement.FnSuggesTasks_PlanLinesFromJob(ContractorRequestTask, ContractorRequestPlanLine, Rec);
                status := 'success*' + ContractorPaymentRequest."Document No." + '*New Interest Payment Request Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Interest Payment Request!'
            end;
        end else begin
            status := 'danger*Error while Creating the Interest Payment Request!'
        end
    end;

    procedure fnSubmiCPRTaskLines(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; jobtaskno: Code[20]; lineno: Integer; quantitydone: Decimal; additionalcomments: Text; photono: Code[20]) status: Text
    var
        ContractorRequestTask: Record "Contractor Request Task";
    begin
        ContractorRequestTask.Init;
        ContractorRequestTask."Document No." := Documentno;
        if ContractorRequestTask.Insert(true) then begin


            ContractorRequestTask."Job No." := projectid;
            ContractorRequestTask."Job Task No." := jobtaskno;
            // ContractorRequestTask.VALIDATE("Line No.",lineno);
            // ContractorRequestTask."Quantity Done":=quantitydone;
            // ContractorRequestTask."Additional Comments/Notes":=additionalcomments;
            // ContractorRequestTask."Photo No.":=photono;
            if ContractorRequestTask.Modify(true) then begin
                status := 'success*New Progress of Works Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Progress of Works!'
            end;
        end else begin
            status := 'danger*Error while Creating the Progress of Works!'
        end
    end;

    procedure fnSubmiCPRPlanningLines(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; jobtaskno: Code[20]; lineno: Integer; quantitydone: Decimal; additionalcomments: Text; photono: Code[20]) status: Text
    var
        ContractorRequestPlanLine: Record "Contractor Request Plan Line";
    begin

        ContractorRequestPlanLine.Init;
        ContractorRequestPlanLine."Document No." := Documentno;
        if ContractorRequestPlanLine.Insert(true) then begin

            ContractorRequestPlanLine."Document Date" := Today;
            ContractorRequestPlanLine."Job No." := projectid;
            ContractorRequestPlanLine."Job Task No." := jobtaskno;
            ContractorRequestPlanLine.Validate("Line No.", lineno);

            if ContractorRequestPlanLine.Modify(true) then begin
                status := 'success*New Progress of Works Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Progress of Works!'
            end;
        end else begin
            status := 'danger*Error while Creating the Progress of Works!'
        end
    end;

    procedure fnSubmitFeeNoteRequest(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]) status: Text
    var
        ContractorPaymentRequest: Record "Measurement &  Payment Header";
        ContractorRequestPlanLine: Record "Contractor Request Plan Line";
        ContractorRequestTask: Record "Contractor Request Task";
    begin

        ContractorPaymentRequest.Init;
        ContractorPaymentRequest."Document Type" := ContractorPaymentRequest."document type"::"Fee Note";
        ContractorPaymentRequest."Payment Certificate Type" := ContractorPaymentRequest."payment certificate type"::"Interim Payment";
        if ContractorPaymentRequest.Insert(true) then begin
            ContractorPaymentRequest.Validate("Project ID", projectid);
            if ContractorPaymentRequest.Modify(true) then begin
                Rec := ContractorPaymentRequest;
                RMSManagement.FnSuggesTasks_PlanLinesFromJob(ContractorRequestTask, ContractorRequestPlanLine, Rec);
                status := 'success*' + ContractorPaymentRequest."Document No." + '*New Payment Request Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Payment Request!'
            end;
        end else begin
            status := 'danger*Error while Creating the Payment Request!'
        end
    end;

    procedure fnSubmiFeeNoteTaskLines(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; jobtaskno: Code[20]; lineno: Integer; quantitydone: Decimal; additionalcomments: Text; photono: Code[20]) status: Text
    var
        ContractorRequestTask: Record "Contractor Request Task";
    begin
        ContractorRequestTask.Init;
        ContractorRequestTask."Document No." := Documentno;
        if ContractorRequestTask.Insert(true) then begin


            ContractorRequestTask."Job No." := projectid;
            ContractorRequestTask."Job Task No." := jobtaskno;
            // ContractorRequestTask.VALIDATE("Line No.",lineno);
            // ContractorRequestTask."Quantity Done":=quantitydone;
            // ContractorRequestTask."Additional Comments/Notes":=additionalcomments;
            // ContractorRequestTask."Photo No.":=photono;
            if ContractorRequestTask.Modify(true) then begin
                status := 'success*New Progress of Works Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Progress of Works!'
            end;
        end else begin
            status := 'danger*Error while Creating the Progress of Works!'
        end
    end;

    procedure fnSubmiFeeNotePlanningLines(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; jobtaskno: Code[20]; lineno: Integer; qtytoorder: Decimal) status: Text
    var
        ContractorRequestPlanLine: Record "Contractor Request Plan Line";
    begin

        ContractorRequestPlanLine.Reset;
        ContractorRequestPlanLine.SetRange("Document No.", Documentno);
        ContractorRequestPlanLine.SetRange("Line No.", lineno);
        if ContractorRequestPlanLine.Find('-') then begin
            ContractorRequestPlanLine."Qty. to Order" := qtytoorder;
            ContractorRequestPlanLine.Validate("Qty. to Order");
            if ContractorRequestPlanLine.Modify(true) then begin
                status := 'success*Fee Note Planning Line Was Successfully Updated!'
            end else begin
                status := 'danger*Error while Creating the Fee Note Planning Line!'
            end;
        end else begin
            status := 'danger*Error while Creating the Fee Note Planning Line!'
        end
    end;

    procedure fngetCPRProjectNumber(documentno: Code[50]) ProjectNumber: Text
    var
        ContractorPaymentRequest: Record "Measurement &  Payment Header";
    begin

        ContractorPaymentRequest.Reset;
        ContractorPaymentRequest.SetRange("Document No.", documentno);
        if ContractorPaymentRequest.FindLast then begin
            ProjectNumber := ContractorPaymentRequest."Project ID" + '*' + ContractorPaymentRequest."Project Name" + '*' + Format(ContractorPaymentRequest."IPC Number")
         + '*' + Format(ContractorPaymentRequest."Settled Amount") + '*' + Format(ContractorPaymentRequest."Project Start Date") + '*' + Format(ContractorPaymentRequest."Contract ID");
        end else begin
            ProjectNumber := '';
        end;
    end;

    procedure fnSubmitRiskManagementPlan(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; primarymission: Text; staffno: Code[20]) status: Text
    var
        RiskManagementPlan: Record "Risk Management Plan";
    begin


        RiskManagementPlan.Init;
        RiskManagementPlan."Document Type" := RiskManagementPlan."document type"::Project;
        if RiskManagementPlan.Insert(true) then begin
            RiskManagementPlan.Validate("Project ID", projectid);
            RiskManagementPlan."Primary MIssion" := primarymission;
            RiskManagementPlan."Risk Likelihood Rate Scale ID" := fngetRiskRatingScaleID(1);
            RiskManagementPlan."Risk Impact Rating Scale ID" := fngetRiskRatingScaleID(2);
            RiskManagementPlan."Overall Risk Rating Scale ID" := fngetRiskRatingScaleID(3);
            RiskManagementPlan."Risk Appetite Rating Scale ID" := fngetRiskRatingScaleID(4);
            if staffno <> '' then
                RiskManagementPlan."Responsible Officer No." := staffno;
            RiskManagementPlan.Status := RiskManagementPlan.Status::Open;
            RiskManagementPlan."Portal Status" := RiskManagementPlan."portal status"::Draft;
            if RiskManagementPlan.Modify(true) then begin

                status := 'success*' + RiskManagementPlan."Document No" + '*New Risk Management Plan Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Risk Management Plan!'
            end;
        end else begin
            status := 'danger*Error while Creating the Risk Management Plan!'
        end
    end;

    procedure fnSubmitRiskManagementPlanLines(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; riskcategory: Code[50]; riskimpacttype: Integer; estimatefinancialimpact: Decimal; risklikelihoodcode: Code[20]; riskresponsestrategy: Code[50]; riskimpactcode: Code[50]; estimatedelayimpactdays: Integer) status: Text
    var
        RiskManagementPlanLines: Record "Risk Management Plan Line";
    begin


        RiskManagementPlanLines.Init;
        RiskManagementPlanLines."Document Type" := RiskManagementPlanLines."document type"::Project;
        RiskManagementPlanLines."Document No" := Documentno;
        RiskManagementPlanLines."Estimate Fin. Impact (LCY)" := estimatefinancialimpact;
        RiskManagementPlanLines."Estimate Delay Impact (Days)" := estimatedelayimpactdays;
        if RiskManagementPlanLines.Insert(true) then begin
            RiskManagementPlanLines.Validate("Risk Category", riskcategory);
            RiskManagementPlanLines."Risk Impact Type" := riskimpacttype;
            RiskManagementPlanLines."Gen. Risk Response Strategy" := riskresponsestrategy;
            RiskManagementPlanLines.Validate("Risk Likelihood Code", risklikelihoodcode);
            RiskManagementPlanLines.Validate("Risk Impact Code", riskimpactcode);
            if RiskManagementPlanLines.Modify(true) then begin

                status := 'success*New Risk Management Plan Line Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Risk Management Plan Line!'
            end;
        end else begin
            status := 'danger*Error while Creating the Risk Management Plan Line!'
        end
    end;

    procedure fnSubmitContractorSupervisionRequirement(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]) status: Text
    var
        TemporarySupervision: Record "Temporary Supervision Requirem";
    begin


        TemporarySupervision.Init;
        if TemporarySupervision.Insert(true) then begin
            TemporarySupervision.Validate("Project No", projectid);
            TemporarySupervision.Status := TemporarySupervision.Status::Open;
            if TemporarySupervision.Modify(true) then begin

                status := 'success*' + TemporarySupervision."Document No" + '*New Contractor Supervision Requirement Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Contractor Supervision Requirement!'
            end;
        end else begin
            status := 'danger*Error while Creating the Contractor Supervision Requirement!'
        end
    end;

    procedure fnSubmitTemporarySupervisionLines(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; documenttype: Integer; provisiontype: Integer; jobtaskno: Code[50]; lineno: Integer; comments: Text; scheduleddeliverydate: Date; identificationno: Code[30]; reversiontype: Integer) status: Text
    var
        TemporarySupervisionLine: Record "Temporary Supervision Line";
    begin


        TemporarySupervisionLine.Init;
        TemporarySupervisionLine."Document No" := Documentno;
        TemporarySupervisionLine."Document Type" := documenttype;
        TemporarySupervisionLine."Project ID" := projectid;
        TemporarySupervisionLine."Task No." := jobtaskno;
        TemporarySupervisionLine.Validate("Plan Line No", lineno);
        TemporarySupervisionLine."Provision Type" := provisiontype;
        TemporarySupervisionLine."Reversion Type" := reversiontype;
        TemporarySupervisionLine.Comments := comments;
        TemporarySupervisionLine.No := identificationno;
        TemporarySupervisionLine."Scheduled Date of Delivery" := scheduleddeliverydate;
        if TemporarySupervisionLine.Insert(true) then begin

            // IF TemporarySupervisionLine.MODIFY(TRUE) THEN BEGIN

            status := 'success*New Supervision Requirement Line Was Successfully Created!'
            //    END ELSE BEGIN
            //      status:='danger*Error while Creating the Supervision Requirement Line!'
            //  END;
        end else begin
            status := 'danger*Error while Creating the Supervision Requirement Line!'
        end
    end;

    procedure fnSubmitSiteAgentNomination(vendornumber: Code[20]; projectid: Code[30]; staffno: Code[20]; staffname: Text; email: Text; telephoneno: Code[20]; address: Code[100]; adress2: Code[100]; city: Text) status: Text
    var
        WEPContractorSubmission: Record "WEP Contractor Submission";
    begin


        WEPContractorSubmission.Init;
        WEPContractorSubmission."Document Type" := WEPContractorSubmission."document type"::"Site Agent Nomination";
        if WEPContractorSubmission.Insert(true) then begin
            WEPContractorSubmission.Validate("Project No", projectid);
            WEPContractorSubmission."Site Agent Staff No" := staffno;
            WEPContractorSubmission."Site Agent Name" := staffname;
            WEPContractorSubmission."Telephone No" := telephoneno;
            WEPContractorSubmission."E-mail" := email;
            WEPContractorSubmission.Address := address;
            WEPContractorSubmission."Address 2" := adress2;
            WEPContractorSubmission.City := city;
            WEPContractorSubmission.Status := WEPContractorSubmission.Status::Open;
            if WEPContractorSubmission.Modify(true) then begin

                status := 'success*' + WEPContractorSubmission."Document No" + '*New Site Agent Nomination Was Successfully Created!'
            end else begin
                status := 'Error while Creating the Site Agent Nomination!';
                ERROR(status);
            end;
        end else begin
            status := 'danger*Error while Creating the Site Agent Nomination!'
        end
    end;

    procedure fnSubmitContractorPersonnelAppointment(vendornumber: Code[20]; projectid: Code[30]) status: Text
    var
        WEPContractorSubmission: Record "WEP Contractor Submission";
        WEPContractorTeam: Record "WEP Contractor Team";
        BidKeyStaff: Record "Bid Key Staff";
    begin


        WEPContractorSubmission.Init;
        WEPContractorSubmission."Document Type" := WEPContractorSubmission."document type"::"Contractor Personnel Appointment";
        if WEPContractorSubmission.Insert(true) then begin
            WEPContractorSubmission.Validate("Project No", projectid);
            WEPContractorSubmission.Status := WEPContractorSubmission.Status::Open;
            if WEPContractorSubmission.Modify(true) then begin

                WEPContractorSubmission.Reset;
                WEPContractorSubmission.SetRange("Document Type", WEPContractorSubmission."Document Type");
                WEPContractorSubmission.SetRange("Document No", WEPContractorSubmission."Document No");
                if WEPContractorSubmission.FindSet then begin

                    //suggest team from bidresponse
                    //TESTFIELD("IFS Code");
                    BidKeyStaff.Reset;
                    BidKeyStaff.SetRange(BidKeyStaff."Vendor No.", WEPContractorSubmission."Contractor No");
                    BidKeyStaff.SetRange(BidKeyStaff."No.", WEPContractorSubmission."Bid Response No");
                    if BidKeyStaff.FindSet then begin
                        repeat
                            WEPContractorTeam.Init;
                            WEPContractorTeam."Document Type" := WEPContractorSubmission."Document Type";
                            WEPContractorTeam."Document No" := WEPContractorSubmission."Document No";
                            WEPContractorTeam."Contractor No." := WEPContractorSubmission."Contractor No";
                            WEPContractorTeam."Contractor Staff No." := BidKeyStaff."Staff No.";
                            WEPContractorTeam."Entry No." := WEPContractorTeam.Count() + 1;
                            WEPContractorTeam.Name := BidKeyStaff."Staff Name";
                            WEPContractorTeam."Country/Region Code" := BidKeyStaff.Nationality;
                            WEPContractorTeam.Email := BidKeyStaff."E-Mail";
                            WEPContractorTeam.Telephone := BidKeyStaff."Phone No.";
                            WEPContractorTeam."Staff Category" := BidKeyStaff."Staff Category";
                            WEPContractorTeam.Designation := BidKeyStaff.Profession;
                            WEPContractorTeam."Role Code" := BidKeyStaff."Proposed Project Role ID";
                            if not WEPContractorTeam.Insert(true) then
                                WEPContractorTeam.Modify(true);
                        until BidKeyStaff.Next = 0;
                    end;
                end;
                //MESSAGE('Vendor staff suggested successfully');

                status := 'success*' + WEPContractorSubmission."Document No" + '*' + WEPContractorSubmission."Contract ID" + '*New Contractor Personnel Appointment Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Contractor Personnel Appointment!'
            end;
        end else begin
            status := 'danger*Error while Creating the Contractor Personnel Appointment!'
        end
    end;

    procedure fnSubmitContractorStaffDisengagement(vendornumber: Code[20]; projectid: Code[30]; appointmentvoucherno: Code[30]) status: Text
    var
        WEPContractorSubmission: Record "WEP Contractor Submission";
    begin


        WEPContractorSubmission.Init;
        WEPContractorSubmission."Document Type" := WEPContractorSubmission."document type"::"Contractor Staff Disengagement";
        WEPContractorSubmission."Project No" := projectid;
        WEPContractorSubmission."Appointment Voucher No" := appointmentvoucherno;
        if WEPContractorSubmission.Insert(true) then begin
            WEPContractorSubmission.Validate("Project No");
            WEPContractorSubmission.Status := WEPContractorSubmission.Status::Open;
            if WEPContractorSubmission.Modify(true) then begin

                status := 'success*' + WEPContractorSubmission."Document No" + '*New Contractor Staff Disengagement Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Contractor Staff Disengagement!'
            end;
        end else begin
            status := 'danger*Error while Creating the Contractor Staff Disengagement!'
        end
    end;

    procedure fnSubmitContractorEquipmentRegister(vendornumber: Code[20]; projectid: Code[30]) status: Text
    var
        WEPContractorSubmission: Record "WEP Contractor Submission";
        PurchaseHeader: Record "Purchase Header";
        WEPContractorEquipment: Record "WEP Contractor Equipment";
        BidEquipmentSpecification: Record "Bid Equipment Specification";
        StandardPurchaseCode: Record "Standard Purchase Code";
        StandardPurchaseLine: Record "Standard Purchase Line";
    begin


        WEPContractorSubmission.Init;
        WEPContractorSubmission."Document Type" := WEPContractorSubmission."document type"::"Plan of Equipment Delivery to Site";
        if WEPContractorSubmission.Insert(true) then begin
            WEPContractorSubmission.Validate("Project No", projectid);

            WEPContractorSubmission.Status := WEPContractorSubmission.Status::Open;
            if WEPContractorSubmission.Modify(true) then begin

                //suggest equipment from bidresponse
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange(PurchaseHeader."No.", WEPContractorSubmission."Bid Response No");
                PurchaseHeader.SetRange(PurchaseHeader."Document Type", PurchaseHeader."document type"::Quote);
                if PurchaseHeader.FindSet then begin
                    PurchaseHeader.TestField("IFS Code");
                    StandardPurchaseCode.Reset;
                    StandardPurchaseCode.SetRange(StandardPurchaseCode.Code, PurchaseHeader."IFS Code");
                    StandardPurchaseCode.SetRange(StandardPurchaseCode."Project ID", WEPContractorSubmission."Project No");
                    if StandardPurchaseCode.FindSet then begin
                        BidEquipmentSpecification.Reset;
                        BidEquipmentSpecification.SetRange(BidEquipmentSpecification."No.", PurchaseHeader."No.");
                        BidEquipmentSpecification.SetRange(BidEquipmentSpecification."Document Type", BidEquipmentSpecification."document type"::Quote);
                        if BidEquipmentSpecification.FindSet then begin
                            repeat
                                WEPContractorEquipment.Init;
                                WEPContractorEquipment."Document Type" := WEPContractorSubmission."Document Type";
                                WEPContractorEquipment."Document No." := WEPContractorSubmission."Document No";
                                WEPContractorEquipment."Contractor No." := WEPContractorSubmission."Contractor No";
                                WEPContractorEquipment."Equipment No." := BidEquipmentSpecification."Equipment Type Code";
                                WEPContractorEquipment.Description := BidEquipmentSpecification.Description;
                                WEPContractorEquipment."Ownership Type" := BidEquipmentSpecification."Ownership Type";
                                WEPContractorEquipment."Equipment Usability Code" := BidEquipmentSpecification."Equipment Usability Code";
                                WEPContractorEquipment."Equipment Serial No." := BidEquipmentSpecification."Equipment Serial";
                                WEPContractorEquipment."Project No" := WEPContractorSubmission."Project No";
                                WEPContractorEquipment."Equipment Condition Code" := BidEquipmentSpecification."Equipment Condition Code";
                                WEPContractorEquipment."Equipment Type Code" := BidEquipmentSpecification."Equipment Type Code";
                                WEPContractorEquipment.Validate("Equipment Type Code");
                                if not WEPContractorEquipment.Insert(true) then
                                    WEPContractorEquipment.Modify(true);
                            until BidEquipmentSpecification.Next = 0;
                        end;
                    end;
                end;
                //MESSAGE('Suggested successfully');


                status := 'success*' + WEPContractorSubmission."Document No" + '*New Contractor Equipment Register Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Contractor Equipment Register!'
            end;
        end else begin
            status := 'danger*Error while Creating the Contractor Equipment Register!'
        end
    end;

    procedure fnSubmitREsOffice(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]) status: Text
    var
        TemporarySupervision: Record "Temporary Supervision Requirem";
    begin


        TemporarySupervision.Init;
        TemporarySupervision."Document Type" := TemporarySupervision."document type"::Vehicle;
        if TemporarySupervision.Insert(true) then begin
            TemporarySupervision.Validate("Project No", projectid);
            TemporarySupervision.Status := TemporarySupervision.Status::Open;
            if TemporarySupervision.Modify(true) then begin

                status := 'success*' + TemporarySupervision."Document No" + '*New REs Office Supervision Requirement Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the REs Office Supervision Requirement!'
            end;
        end else begin
            status := 'danger*Error while Creating the REs Office Supervision Requirement!'
        end
    end;

    procedure fnCreateNewExtensionofTimeRequest(vendornumber: Code[20]; projectid: Code[50]; reasoncode: Code[50]; extensionperiod: Text; costclaimamount: Decimal) status: Text
    var
        EOTRequests: Record "Project Variation Header";
    begin

        EOTRequests.Init;
        EOTRequests."Document Type" := EOTRequests."document type"::"Extension of Time Request";
        EOTRequests."Document No." := '';
        EOTRequests."Document Date" := Today;
        EOTRequests."Project ID" := projectid;
        EOTRequests."Cost Claim Amount" := costclaimamount;
        EOTRequests."Extension Reason Code" := reasoncode;
        if Format(dur) = '' then
            Evaluate(dur, extensionperiod);
        EOTRequests."Requested Extension Period" := dur;

        if EOTRequests.Insert(true) then begin
            EOTRequests.Validate("Project ID");
            EOTRequests.Validate("Extension Reason Code");
            EOTRequests.Validate("Requested Extension Period");
            EOTRequests.Modify();
            status := 'success*' + EOTRequests."Document No." + '*New Extension of Time Request Was Successfully Created!'
        end else begin
            status := 'danger*Error while Creating the  Extension of Time Request!'
        end;
        //END;
    end;

    procedure fngetEOTRequestProjectNumber(documentno: Code[50]) ProjectNumber: Code[100]
    var
        EOTRequests: Record "Project Variation Header";
    begin
        EOTRequests.Reset;
        EOTRequests.SetRange("Document No.", documentno);
        if EOTRequests.FindLast then begin
            ProjectNumber := EOTRequests."Project ID";
        end else begin
            ProjectNumber := '';
        end;
    end;

    procedure fnSubmitEOTRevisedActivitySchedule(DocumentNo: Code[20]; vendornumber: Code[20]; projectid: Code[30]; jobtaskno: Code[20]; lineno: Integer; originalplanningdate: DateTime; extensionperiod: Text; remarks: Text) status: Text
    var
        ExtensionofTimeLine: Record "Extension of Time Line";
    begin

        ExtensionofTimeLine.Init;
        ExtensionofTimeLine."Document No." := DocumentNo;
        ExtensionofTimeLine."Document Type" := ExtensionofTimeLine."document type"::"Extension of Time Request";
        // ExtensionofTimeLine."Job Task No.":=projectid;
        ExtensionofTimeLine."Job Task No." := jobtaskno;
        ExtensionofTimeLine."Line No." := lineno;

        //ExtensionofTimeLine.VALIDATE("Line No.",lineno);
        if Format(dur) = '' then
            Evaluate(dur, extensionperiod);
        ExtensionofTimeLine.Validate("Extension Period (Days)", dur);
        if ExtensionofTimeLine.Insert(true) then begin



            //IF ExtensionofTimeLine.MODIFY(TRUE) THEN BEGIN
            status := 'success*New Revised Schudele Activity Was Successfully Created!'
            //  END ELSE BEGIN
            //    status:='danger*Error while Creating the Revised Schudele Activity!'
            //END;
        end else begin
            status := 'danger*Error while Creating the Revised Schudele Activity!'
        end
    end;

    procedure fnSubmitEOTGrounds(vendornumber: Code[20]; Documentno: Code[50]; eotrequesteddays: Integer; causeofdelay: Text) status: Text
    var
        EOTGrounds: Record "Extension of Time Reason";
    begin
        EOTGrounds.Init;
        EOTGrounds."Document No." := vendornumber;
        EOTGrounds."Document Type" := EOTGrounds."document type"::"Extension of Time Request";
        EOTGrounds."Cause of Delay" := causeofdelay;
        EOTGrounds."EOT Requested Days" := eotrequesteddays;
        if EOTGrounds.Insert(true) then begin
            status := 'success*New Ground for EOT Was Successfully Created!';

        end else begin
            status := 'danger*Error while Creating the Ground for EOT!';
        end
    end;

    procedure fnSubmitEOTProjectVariationSection(vendornumber: Code[20]; Documentno: Code[50]; section: Integer; description: Text) status: Text
    var
        ProjectVariationSection: Record "Project Variation Section";
    begin
        ProjectVariationSection.Init;
        ProjectVariationSection."Document No." := Documentno;
        ProjectVariationSection."Document Type" := ProjectVariationSection."document type"::"Extension of Time Request";
        ProjectVariationSection.Section := section;
        ProjectVariationSection.Description := description;
        if ProjectVariationSection.Insert(true) then begin
            status := 'success*New Project Variation Section Was Successfully Created!';

        end else begin
            status := 'danger*Error while Creating the Project Variation Section!';
        end
    end;

    procedure fnSubmitEOTProjectVariationCommittee(vendornumber: Code[20]; Documentno: Code[50]; resourceno: Code[20]) status: Text
    var
        ProjectVariationCommittee: Record "Project Variation Committee";
    begin
        ProjectVariationCommittee.Init;
        ProjectVariationCommittee."Document No." := Documentno;
        if ProjectVariationCommittee.Insert(true) then begin
            ProjectVariationCommittee.Validate("Resource No.", resourceno);
            if ProjectVariationCommittee.Modify(true) then begin
                status := 'success*New Committee Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Committee!'
            end;
        end else begin
            status := 'danger*Error while Creating the Committee!'
        end
    end;

    procedure fnSubmitContractorVariationRequestLines(DocumentNo: Code[20]; vendornumber: Code[20]; projectid: Code[30]; jobtaskno: Code[20]; lineno: Integer; newquantity: Decimal) status: Text
    var
        ProjectVaiationLines: Record "Project Variation Line";
    begin
        ProjectVaiationLines.Init;
        ProjectVaiationLines."Document No." := DocumentNo;
        ProjectVaiationLines."Document Type" := ProjectVaiationLines."document type"::"Contractor Variation Request";
        ProjectVaiationLines."Job No." := projectid;
        ProjectVaiationLines."Job Task No." := jobtaskno;
        ProjectVaiationLines.Validate("Line No.", lineno);
        // ProjectVaiationLines."Line No.":=lineno;
        ProjectVaiationLines.Validate("New Quantity", newquantity);

        if ProjectVaiationLines.Insert(true) then begin
            //IF ExtensionofTimeLine.MODIFY(TRUE) THEN BEGIN
            status := 'success*New Proposed Varied Works Line Was Successfully Created!'
            //  END ELSE BEGIN
            //    status:='danger*Error while Creating the Revised Schudele Activity!'
            //END;
        end else begin
            status := 'danger*Error while Creating the Proposed Varied Works Line!'
        end
    end;

    procedure fnCreateNewContractorVariationRequest(vendornumber: Code[20]; projectid: Code[50]; variationreasoncode: Code[50]; costclaimamount: Decimal) status: Text
    var
        ProjectVariationHeader: Record "Project Variation Header";
    begin
        ProjectVariationHeader.Init;
        ProjectVariationHeader."Document Type" := ProjectVariationHeader."document type"::"Contractor Variation Request";
        ProjectVariationHeader."Document No." := '';
        ProjectVariationHeader."Document Date" := Today;
        ProjectVariationHeader."Cost Claim Amount" := costclaimamount;
        ProjectVariationHeader."Project ID" := projectid;
        ProjectVariationHeader."Variation Reason Code" := variationreasoncode;

        if ProjectVariationHeader.Insert(true) then begin
            ProjectVariationHeader.Validate("Project ID");
            ProjectVariationHeader.Validate("Variation Reason Code");
            ProjectVariationHeader.Modify();
            status := 'success*' + ProjectVariationHeader."Document No." + '*New Contractor Variation Request Was Successfully Created!'
        end else begin
            status := 'danger*Error while Creating the Contractor Variation Request!'
        end;
    end;

    procedure fnSubmitCVRProjectVariationSection(vendornumber: Code[20]; Documentno: Code[50]; section: Integer; description: Text) status: Text
    var
        ProjectVariationSection: Record "Project Variation Section";
    begin
        ProjectVariationSection.Init;
        ProjectVariationSection."Document No." := Documentno;
        ProjectVariationSection."Document Type" := ProjectVariationSection."document type"::"Contractor Variation Request";
        ProjectVariationSection.Section := section;
        ProjectVariationSection.Description := description;
        if ProjectVariationSection.Insert(true) then begin
            status := 'success*New Project Variation Section Was Successfully Created!';

        end else begin
            status := 'danger*Error while Creating the Project Variation Section!';
        end
    end;

    procedure fnCreateNewCostClaim(vendornumber: Code[20]; projectid: Code[50]; costclaimreason: Code[50]) status: Text
    var
        ProjectVariationHeader: Record "Project Variation Header";
    begin
        ProjectVariationHeader.Init;
        ProjectVariationHeader."Document Type" := ProjectVariationHeader."document type"::"Cost Claim";
        ProjectVariationHeader."Document No." := '';
        ProjectVariationHeader."Document Date" := Today;
        ProjectVariationHeader."Project ID" := projectid;
        ProjectVariationHeader."Cost Claim Reason" := costclaimreason;

        if ProjectVariationHeader.Insert(true) then begin
            ProjectVariationHeader.Validate("Project ID");
            //ProjectVariationHeader.VALIDATE("Cost Claim Reason");
            ProjectVariationHeader.Modify(true);
            status := 'success*' + ProjectVariationHeader."Document No." + '*New Cost Claim Request Was Successfully Created!'
        end else begin
            status := 'danger*Error while Creating the Cost Claim Request!'
        end;
    end;

    procedure fnSubmitCostClaimLineDetails(documentNumber: Code[50]; causeofoverun: Text; costclaimrequested: Decimal; entryno: Integer) status: Text
    var
        CostClaimLines: Record "Cost Claim Lines";
    begin

        CostClaimLines.Reset;
        CostClaimLines.SetRange("Document No.", documentNumber);
        CostClaimLines.SetRange("Line No", entryno);
        if CostClaimLines.FindSet then begin
            CostClaimLines."Document Type" := CostClaimLines."document type"::"Cost Claim";
            CostClaimLines."Document No." := documentNumber;
            CostClaimLines."Cause of Overrun" := causeofoverun;
            CostClaimLines."Cost Claim Requested Amount" := costclaimrequested;

            if CostClaimLines.Modify(true) then begin
                status := 'success*' + CostClaimLines."Document No." + '*Cost Claim Line Details Was Successfully Modified!';
            end else begin
                status := 'danger*Cost Claim Line Details Was Successfully Modified!';
            end;
        end else begin
            CostClaimLines.Init;
            CostClaimLines."Document Type" := CostClaimLines."document type"::"Cost Claim";
            CostClaimLines."Document No." := documentNumber;
            CostClaimLines."Cause of Overrun" := causeofoverun;
            CostClaimLines."Cost Claim Requested Amount" := costclaimrequested;
            if CostClaimLines.Insert(true) then begin
                status := 'success*' + CostClaimLines."Document No." + '*Cost Claim Line Details Was Successfully Submitted!';
            end else begin
                status := 'danger*Cost Claim Line Was Not Submitted!';
            end;
        end;
    end;

    local procedure fngetRiskRatingScaleID(ratingtype: Integer) result: Code[100]
    var
        RiskRatingScale: Record "Risk Rating Scale";
    begin

        RiskRatingScale.Reset;
        RiskRatingScale.SetRange(RiskRatingScale."Risk Rating Scale Type", ratingtype);
        RiskRatingScale.SetRange(RiskRatingScale.Blocked, false);
        if RiskRatingScale.FindSet then begin
            result := RiskRatingScale."Rating Scale ID";

        end
        else begin
            result := '';
        end;
    end;

    procedure fnSubmitContractorRequestforCloseout(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; closeoutjustification: Text) status: Text
    var
        ContractorPaymentRequestHeader: Record "Measurement &  Payment Header";
    begin

        ContractorPaymentRequestHeader.Init;
        ContractorPaymentRequestHeader."Document Type" := ContractorPaymentRequestHeader."document type"::"Contractor Request for Taking Over";
        if ContractorPaymentRequestHeader.Insert(true) then begin
            ContractorPaymentRequestHeader.Validate("Project ID", projectid);
            ContractorPaymentRequestHeader."Close-Out Justification" := closeoutjustification;
            if ContractorPaymentRequestHeader.Modify(true) then begin
                // Rec:=ContractorPaymentRequestHeader;
                // RMSManagement.FnSuggesTasks_PlanLinesFromJob(ContractorRequestTask,ContractorRequestPlanLine,Rec);
                status := 'success*' + ContractorPaymentRequestHeader."Document No." + '*New project Close Out Request Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the project Close Out Request!'
            end;
        end else begin
            status := 'danger*Error while Creating the project Close Out Request!'
        end
    end;

    procedure fnSubmitContractorRequestforDLPInspection(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]) status: Text
    var
        ContractorPaymentRequestHeader: Record "Measurement &  Payment Header";
    begin

        ContractorPaymentRequestHeader.Init;
        ContractorPaymentRequestHeader."Document Type" := ContractorPaymentRequestHeader."document type"::"Contractor Request for End of DLP Inspection";
        if ContractorPaymentRequestHeader.Insert(true) then begin
            ContractorPaymentRequestHeader.Validate("Project ID", projectid);
            if ContractorPaymentRequestHeader.Modify(true) then begin
                status := 'success*' + ContractorPaymentRequestHeader."Document No." + '*New Request for Post DLP Inspection Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating Request for Post DLP Inspection!'
            end;
        end else begin
            status := 'danger*Error while Creating Request for Post DLP Inspection!'
        end
    end;

    procedure UploadContractorSignature(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]; vendorno: Code[20])
    var
        _record: Record "Purchase Header";
        InputFile: File;
        InPutStream: InStream;
        OutPutStream: OutStream;
        filepathurl: Text;
    begin
        filepathurl := FilePathUploads + fileName;
        _record.Reset;
        _record.SetRange(_record."No.", applicationNo);
        _record.SetRange(_record."Buy-from Vendor No.", vendorno);
        if (_record.Find('-')) then begin
            _record.AddLink(filepathurl, fileName);

            if (description = 'Signature') then begin
                if _record."Contractor Signature".Hasvalue then Clear(_record."Contractor Signature");

                if FILE.Exists(filepathurl) then begin
                    InputFile.Open(filepathurl);
                    InputFile.CreateInstream(InPutStream);
                    _record."Contractor Signature".CreateOutstream(OutPutStream);
                    CopyStream(OutPutStream, InPutStream);
                    _record.Modify;
                    InputFile.Close;
                end;
            end;
        end;




    end;

    procedure FnGetContractMilestones(var VarAll: BigText; vendorNo: Code[20]; contractNo: Code[20])
    var
        ContractMilestones: Record "Purchase Contract Milestone";
        Deliverables: Text;
    begin
        Clear(VarAll);
        ContractMilestones.Reset;
        ContractMilestones.SetRange(ContractMilestones."No.", contractNo);
        if ContractMilestones.Find('-') then begin
            repeat

                VarAll.AddText('::::' + ContractMilestones."Milestone Code" + '* ' + ContractMilestones.Description + '* ' + Format(ContractMilestones."Entry No") + '* ' +
                Format(ContractMilestones."Start Date") + '* ' + Format(ContractMilestones."End Date") + '* ' + Deliverables
                 //   ContractMilestones."Milestone Deliverables" 
                 + '* ' + ContractMilestones."Payment Instalment Code");
            until ContractMilestones.Next = 0;

        end;
    end;

    procedure FnGetContractBidSecurity(var VarAll: BigText; vendorNo: Code[20]; contractNo: Code[20])
    var
        ContractBidSecurityRegister: Record "Bid_Contract Security Register";
    begin
        Clear(VarAll);
        ContractBidSecurityRegister.Reset;
        ContractBidSecurityRegister.SetRange(ContractBidSecurityRegister."No.", contractNo);
        if ContractBidSecurityRegister.Find('-') then begin
            repeat

                VarAll.AddText('::::' + Format(ContractBidSecurityRegister."Security ID") + '* ' + Format(ContractBidSecurityRegister."Security Type") + '* ' + ContractBidSecurityRegister.Description
                + '* ' + Format(ContractBidSecurityRegister."Issuer Institution Type") + '* ' + ContractBidSecurityRegister."Vendor No." + '* ' + ContractBidSecurityRegister."Issuer/Guarantor Name" + '* ' + Format(ContractBidSecurityRegister."Reference No") + '* ' +
                Format(ContractBidSecurityRegister."Security Amount (LCY)") + '* ' + Format(ContractBidSecurityRegister."Bid Security Effective Date") + '* ' +
                Format(ContractBidSecurityRegister."Bid Security Validity Expiry") + '* ' + Format(ContractBidSecurityRegister."Guarantee Expiry Notification"));
            until ContractBidSecurityRegister.Next = 0;

        end;
    end;

    procedure FnGetContractInsurance(var VarAll: BigText; vendorNo: Code[20]; contractNo: Code[20])
    var
        ContractInsurance: Record "Purchase Contract Insurance";
    begin
        Clear(VarAll);
        ContractInsurance.Reset;
        ContractInsurance.SetRange(ContractInsurance."No.", contractNo);
        if ContractInsurance.Find('-') then begin
            repeat

                VarAll.AddText('::::' + ContractInsurance."Insurance Type" + '* ' + Format(ContractInsurance."Policy Cover Type") + '* ' + ContractInsurance."Policy ID" + '* ' +
                Format(ContractInsurance."Policy Coverage (LCY)") + '* ' + ContractInsurance."Insurance Company" + '* ' + Format(ContractInsurance."Expiry Date") + '* ' +
                Format(ContractInsurance."Expiry Norification Date") + '* ' + ContractInsurance.Description);
            until ContractInsurance.Next = 0;

        end;
    end;

    procedure FnGetContractSignatories(var VarAll: BigText; vendorNo: Code[20]; contractNo: Code[20])
    var
        ContractSignatory: Record "Purchase Contract Signatory";
    begin
        Clear(VarAll);
        ContractSignatory.Reset;
        ContractSignatory.SetRange(ContractSignatory.No, contractNo);
        if ContractSignatory.Find('-') then begin
            repeat

                VarAll.AddText('::::' + Format(ContractSignatory."Entry No") + '* ' + Format(ContractSignatory."Signatory Type") + '* ' + ContractSignatory."Contract Signing Role" + '* ' +
                ContractSignatory."Executed on behalf of" + '* ' + Format(ContractSignatory."Execution Date") + '* ' + ContractSignatory.Email + '* ' + ContractSignatory."Representative Name");
            until ContractSignatory.Next = 0;

        end;
    end;

    procedure FnGetContractRepresentative(var VarAll: BigText; vendorNo: Code[20]; contractNo: Code[20])
    var
        ContractRepresentative: Record "Contract Representative";
    begin
        Clear(VarAll);
        ContractRepresentative.Reset;
        ContractRepresentative.SetRange(ContractRepresentative."No.", contractNo);
        if ContractRepresentative.Find('-') then begin
            repeat

                VarAll.AddText('::::' + Format(ContractRepresentative."Entry No") + '* ' + Format(ContractRepresentative."Designation/Title") + '* ' + ContractRepresentative."Contract Signing Role" + '* ' +
                ContractRepresentative."Executed on behalf of" + '* ' + ContractRepresentative.Email + '* ' + ContractRepresentative."Representative Name");
            until ContractRepresentative.Next = 0;

        end;
    end;

    procedure FnGetContractPayments(var VarAll: BigText; vendorNo: Code[20]; contractNo: Code[20])
    var
        ContracPayments: Record "Purchase Contract Payment Term";
    begin
        Clear(VarAll);
        ContracPayments.Reset;
        ContracPayments.SetRange(ContracPayments."No.", contractNo);
        if ContracPayments.Find('-') then begin
            repeat

                VarAll.AddText('::::' + Format(ContracPayments."Contract Sum") + '* ' + ContracPayments."Instalment Code" + '* ' + Format(ContracPayments."Payment Certificate Type") + '* ' +
                Format(ContracPayments.Payee) + '* ' + Format(ContracPayments."Payment %") + '* ' + ContracPayments."Currency Code" + '* ' + Format(ContracPayments."Planned Amount") + '* ' +
                Format(ContracPayments."Planned Amount (LCY)") + '* ' + Format(ContracPayments."Paid Amount") + '* ' + Format(ContracPayments."Gross IPC Amount(FCY)"));
            until ContracPayments.Next = 0;

        end;
    end;

    procedure UploadDocumentWorkExecutionPlan(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]) status: Text
    var
        _record: Record "Project Mobilization Header";
        InputFile: File;
        InPutStream: InStream;
        OutPutStream: OutStream;
    begin
        _record.Reset;
        _record.SetRange(_record."Document No.", applicationNo);
        if (_record.Find('-')) then begin
            _record.AddLink(path, fileName);
            if _record.Modify(true) then begin
                status := 'success*Your document uploaded successfully!';
            end else begin
                status := 'danger*System Unknown Error Occured!';
            end

        end;
    end;

    procedure FnGetInsuranceofWorks(var VarAll: BigText; vendorNo: Code[20]; projectno: Code[20]; documenttype: Integer; revisiontype: Integer)
    var
        InsuranceofWorksHeader: Record "Insurance/Guarantee Header";
    begin
        Clear(VarAll);
        InsuranceofWorksHeader.Reset;
        //InsuranceofWorksHeader.SETRANGE(InsuranceofWorksHeader."Project ID",projectno);
        InsuranceofWorksHeader.SetRange(InsuranceofWorksHeader."Contractor ID", vendorNo);
        InsuranceofWorksHeader.SetRange(InsuranceofWorksHeader."Document Type", documenttype);
        InsuranceofWorksHeader.SetRange(InsuranceofWorksHeader.Status, InsuranceofWorksHeader.Status::Open);
        InsuranceofWorksHeader.SetRange(InsuranceofWorksHeader."Revision Type", revisiontype);
        if InsuranceofWorksHeader.Find('-') then begin
            repeat

                VarAll.AddText('::::' + InsuranceofWorksHeader."Insurance Type" + '* ' + Format(InsuranceofWorksHeader."Policy Cover Type") + '* ' + InsuranceofWorksHeader."Policy/Guarantee No" + '* ' +
                Format(InsuranceofWorksHeader."Amount Insured/Guaranteed") + '* ' + InsuranceofWorksHeader."Insurer/Guarantor Name" + '* ' + Format(InsuranceofWorksHeader."Expiry Date") + '* ' +
                Format(InsuranceofWorksHeader."Expiry Notification Date") + '* ' + InsuranceofWorksHeader.Description + '* ' + InsuranceofWorksHeader."Document No." + '* ' +
                Format(InsuranceofWorksHeader."Document Date") + '* ' + InsuranceofWorksHeader."Project ID" + '* ' + InsuranceofWorksHeader."Project Name" + '* ' + Format(InsuranceofWorksHeader."Revision Type") + '* ' + InsuranceofWorksHeader."Rejection Remarks");
            until InsuranceofWorksHeader.Next = 0;

        end;
    end;

    procedure FnGetInsuranceofWorksDetails(var VarAll: BigText; vendorNo: Code[20]; projectno: Code[20]; documenttype: Integer)
    var
        InsuranceofWorksHeader: Record "Insurance/Guarantee Header";
    begin
        Clear(VarAll);
        InsuranceofWorksHeader.Reset;
        InsuranceofWorksHeader.SetRange(InsuranceofWorksHeader."Document No.", projectno);
        InsuranceofWorksHeader.SetRange(InsuranceofWorksHeader."Contractor ID", vendorNo);
        InsuranceofWorksHeader.SetRange(InsuranceofWorksHeader."Document Type", documenttype);
        InsuranceofWorksHeader.SetRange(InsuranceofWorksHeader.Status, InsuranceofWorksHeader.Status::Open);
        if InsuranceofWorksHeader.Find('-') then begin
            repeat

                VarAll.AddText('::::' + InsuranceofWorksHeader."Insurance Type" + '* ' + Format(InsuranceofWorksHeader."Policy Cover Type") + '* ' + InsuranceofWorksHeader."Policy/Guarantee No" + '* ' +
                Format(InsuranceofWorksHeader."Amount Insured/Guaranteed") + '* ' + InsuranceofWorksHeader."Insurer/Guarantor Name" + '* ' + Format(InsuranceofWorksHeader."Expiry Date") + '* ' +
                Format(InsuranceofWorksHeader."Expiry Notification Date") + '* ' + InsuranceofWorksHeader.Description + '* ' + InsuranceofWorksHeader."Document No." + '* ' +
                Format(InsuranceofWorksHeader."Document Date") + '* ' + InsuranceofWorksHeader."Project ID" + '* ' + InsuranceofWorksHeader."Project Name" + '* ' +
                Format(InsuranceofWorksHeader."Revision Type") + '* ' + InsuranceofWorksHeader."Rejection Remarks" + '* ' + Format(InsuranceofWorksHeader."Revised Guaranteed Amount")
                + '* ' + InsuranceofWorksHeader."Issuer Registered Offices" + '* ' + Format(InsuranceofWorksHeader."Effective Date"));
            until InsuranceofWorksHeader.Next = 0;

        end;
    end;

    procedure FnGetInsuranceTypes(var VarAll: BigText)
    var
        InsuranceTypes: Record "Insurance Type";
    begin
        Clear(VarAll);
        InsuranceTypes.Reset;
        if InsuranceTypes.Find('-') then begin
            repeat
                VarAll.AddText('::::' + InsuranceTypes.Code + '* ' + InsuranceTypes.Description);
            until InsuranceTypes.Next = 0;

        end;
    end;

    procedure FnGetTenderSecurityTypes(var VarAll: BigText; securitytype: Integer)
    var
        TenderSecurityTypes: Record "Tender Security Types";
    begin
        Clear(VarAll);
        TenderSecurityTypes.Reset;
        TenderSecurityTypes.SetRange("Security Type", securitytype);
        if TenderSecurityTypes.Find('-') then begin
            repeat
                VarAll.AddText('::::' + TenderSecurityTypes.Code + '* ' + TenderSecurityTypes.Description);
            until TenderSecurityTypes.Next = 0;

        end;
    end;

    procedure fnSubmitProfessionalIndmnity(documentNumber: Code[50]; projectno: Code[20]; vendorno: Code[20]; issuerinstitutiontype: Integer; insurancetype: Code[50]; policycovertype: Integer; policyno: Code[50]; insurername: Text[250]; issuerregisteredoffice: Text; effectivedate: Date; expirydate: Date; amountinsurered: Decimal) status: Text
    var
        InsuranceofWorksHeader: Record "Insurance/Guarantee Header";
    begin

        InsuranceofWorksHeader.Reset;
        InsuranceofWorksHeader.SetRange("Document No.", documentNumber);
        if InsuranceofWorksHeader.FindSet then begin
            InsuranceofWorksHeader."Document No." := documentNumber;
            InsuranceofWorksHeader."Project ID" := projectno;
            InsuranceofWorksHeader."Document Type" := InsuranceofWorksHeader."document type"::"Professional Indemnity";
            InsuranceofWorksHeader."Contractor ID" := vendorno;
            InsuranceofWorksHeader."Insurance Type" := insurancetype;
            InsuranceofWorksHeader."Issuer Institution Type" := issuerinstitutiontype;
            InsuranceofWorksHeader."Policy Cover Type" := policycovertype;
            InsuranceofWorksHeader."Policy/Guarantee No" := policyno;
            InsuranceofWorksHeader."Insurer/Guarantor Name" := insurername;
            InsuranceofWorksHeader."Issuer Registered Offices" := issuerregisteredoffice;
            InsuranceofWorksHeader."Effective Date" := effectivedate;
            InsuranceofWorksHeader."Expiry Date" := expirydate;
            InsuranceofWorksHeader."Amount Insured/Guaranteed" := amountinsurered;
            if InsuranceofWorksHeader.Modify(true) then begin
                InsuranceofWorksHeader.Validate("Project ID");
                InsuranceofWorksHeader.Validate("Contractor ID");
                InsuranceofWorksHeader.Validate("Expiry Date");
                InsuranceofWorksHeader.Modify;
                status := 'success*' + InsuranceofWorksHeader."Document No." + '*Insurance of Works Details Was Successfully Modified!';
            end else begin
                status := 'danger*Insurance of Works Details Was Successfully Modified!';
            end;
        end else begin
            InsuranceofWorksHeader.Init;
            InsuranceofWorksHeader."Document No." := documentNumber;
            InsuranceofWorksHeader."Project ID" := projectno;
            InsuranceofWorksHeader."Document Type" := InsuranceofWorksHeader."document type"::"Professional Indemnity";
            InsuranceofWorksHeader."Contractor ID" := vendorno;
            InsuranceofWorksHeader."Insurance Type" := insurancetype;
            InsuranceofWorksHeader."Issuer Institution Type" := issuerinstitutiontype;
            InsuranceofWorksHeader."Policy Cover Type" := policycovertype;
            InsuranceofWorksHeader."Policy/Guarantee No" := policyno;
            InsuranceofWorksHeader."Insurer/Guarantor Name" := insurername;
            InsuranceofWorksHeader."Issuer Registered Offices" := issuerregisteredoffice;
            InsuranceofWorksHeader."Effective Date" := effectivedate;
            InsuranceofWorksHeader."Expiry Date" := expirydate;
            InsuranceofWorksHeader."Amount Insured/Guaranteed" := amountinsurered;

            if InsuranceofWorksHeader.Insert(true) then begin
                InsuranceofWorksHeader.Validate("Project ID");
                InsuranceofWorksHeader.Validate("Contractor ID");
                InsuranceofWorksHeader.Validate("Expiry Date");
                InsuranceofWorksHeader.Modify;
                status := 'success*' + InsuranceofWorksHeader."Document No." + '*Insurance of Works Details Was Successfully Submitted!';
            end else begin
                status := 'danger*Insurance of Works Details Was Not Submitted!';
            end;
        end;
    end;

    procedure fnSubmitInsuranceofWorks(documentNumber: Code[50]; projectno: Code[20]; vendorno: Code[20]; issuerinstitutiontype: Integer; insurancetype: Code[50]; policycovertype: Integer; policyno: Code[50]; insurername: Text[250]; issuerregisteredoffice: Text; effectivedate: Date; expirydate: Date; amountinsurered: Decimal; issueremail: Text) status: Text
    var
        InsuranceofWorksHeader: Record "Insurance/Guarantee Header";
    begin

        InsuranceofWorksHeader.Reset;
        InsuranceofWorksHeader.SetRange("Document No.", documentNumber);
        if InsuranceofWorksHeader.FindSet then begin
            InsuranceofWorksHeader."Document No." := documentNumber;
            InsuranceofWorksHeader."Project ID" := projectno;
            InsuranceofWorksHeader."Document Type" := InsuranceofWorksHeader."document type"::"Insurance Of Works";
            InsuranceofWorksHeader."Contractor ID" := vendorno;
            InsuranceofWorksHeader."Insurance Type" := insurancetype;
            InsuranceofWorksHeader."Issuer Institution Type" := issuerinstitutiontype;
            InsuranceofWorksHeader."Policy Cover Type" := policycovertype;
            InsuranceofWorksHeader."Policy/Guarantee No" := policyno;
            InsuranceofWorksHeader."Insurer/Guarantor Name" := insurername;
            InsuranceofWorksHeader."Verified Insurer Email Address" := issueremail;
            InsuranceofWorksHeader."Issuer Registered Offices" := issuerregisteredoffice;
            InsuranceofWorksHeader."Effective Date" := effectivedate;
            InsuranceofWorksHeader."Expiry Date" := expirydate;
            InsuranceofWorksHeader."Amount Insured/Guaranteed" := amountinsurered;
            if InsuranceofWorksHeader.Modify(true) then begin
                InsuranceofWorksHeader.Validate("Project ID");
                InsuranceofWorksHeader.Validate("Contractor ID");
                InsuranceofWorksHeader.Validate("Expiry Date");
                InsuranceofWorksHeader.Modify;
                status := 'success*' + InsuranceofWorksHeader."Document No." + '*Insurance of Works Details Was Successfully Modified!';
            end else begin
                status := 'danger*Insurance of Works Details Was Successfully Modified!';
            end;
        end else begin
            InsuranceofWorksHeader.Init;
            InsuranceofWorksHeader."Document No." := documentNumber;
            InsuranceofWorksHeader."Project ID" := projectno;
            InsuranceofWorksHeader."Document Type" := InsuranceofWorksHeader."document type"::"Insurance Of Works";
            InsuranceofWorksHeader."Contractor ID" := vendorno;
            InsuranceofWorksHeader."Insurance Type" := insurancetype;
            InsuranceofWorksHeader."Issuer Institution Type" := issuerinstitutiontype;
            InsuranceofWorksHeader."Policy Cover Type" := policycovertype;
            InsuranceofWorksHeader."Policy/Guarantee No" := policyno;
            InsuranceofWorksHeader."Insurer/Guarantor Name" := insurername;
            InsuranceofWorksHeader."Verified Insurer Email Address" := issueremail;
            InsuranceofWorksHeader."Issuer Registered Offices" := issuerregisteredoffice;
            InsuranceofWorksHeader."Effective Date" := effectivedate;
            InsuranceofWorksHeader."Expiry Date" := expirydate;
            InsuranceofWorksHeader."Amount Insured/Guaranteed" := amountinsurered;

            if InsuranceofWorksHeader.Insert(true) then begin
                InsuranceofWorksHeader.Validate("Project ID");
                InsuranceofWorksHeader.Validate("Contractor ID");
                InsuranceofWorksHeader.Validate("Expiry Date");
                InsuranceofWorksHeader.Modify;
                status := 'success*' + InsuranceofWorksHeader."Document No." + '*Insurance of Works Details Was Successfully Submitted!';
            end else begin
                status := 'danger*Insurance of Works Details Was Not Submitted!';
            end;
        end;
    end;

    procedure fnSubmitAdvancePaymentsGuarantee(documentNumber: Code[50]; projectno: Code[20]; vendorno: Code[20]; issuerinstitutiontype: Integer; formofsecurity: Code[50]; guaranteeno: Code[50]; guarantorname: Text[250]; issuerregisteredoffice: Text; effectivedate: Date; expirydate: Date; amountguaranteed: Decimal; issueremail: Text; contractid: Code[50]) status: Text
    var
        InsuranceofWorksHeader: Record "Insurance/Guarantee Header";
    begin

        InsuranceofWorksHeader.Reset;
        InsuranceofWorksHeader.SetRange("Document No.", documentNumber);
        if InsuranceofWorksHeader.FindSet then begin
            InsuranceofWorksHeader."Document No." := documentNumber;
            InsuranceofWorksHeader.Validate("Project ID", projectno);
            InsuranceofWorksHeader.Validate("Purchase Contract ID", contractid);
            InsuranceofWorksHeader."Document Type" := InsuranceofWorksHeader."document type"::"Advance Payment Guarantee";
            InsuranceofWorksHeader."Revision Type" := InsuranceofWorksHeader."revision type"::Original;
            InsuranceofWorksHeader.Validate("Contractor ID", vendorno);
            InsuranceofWorksHeader."Form of Security" := formofsecurity;
            InsuranceofWorksHeader."Issuer Institution Type" := issuerinstitutiontype;
            InsuranceofWorksHeader."Policy/Guarantee No" := guaranteeno;
            InsuranceofWorksHeader."Policy/Guarantee No" := guaranteeno;
            InsuranceofWorksHeader."Verified Insurer Email Address" := issueremail;
            InsuranceofWorksHeader."Insurer/Guarantor Name" := guarantorname;
            InsuranceofWorksHeader."Issuer Registered Offices" := issuerregisteredoffice;
            InsuranceofWorksHeader."Effective Date" := effectivedate;
            InsuranceofWorksHeader.Validate("Expiry Date", expirydate);
            InsuranceofWorksHeader."Amount Insured/Guaranteed" := amountguaranteed;
            if InsuranceofWorksHeader.Modify(true) then begin
                InsuranceofWorksHeader.Validate("Project ID");
                InsuranceofWorksHeader.Validate("Contractor ID");
                InsuranceofWorksHeader.Validate("Expiry Date");
                InsuranceofWorksHeader.Modify;
                status := 'success*' + InsuranceofWorksHeader."Document No." + '*Advance Payment Guarantee Details Was Successfully Modified!';
            end else begin
                status := 'danger*Advance Payment Guarantee Details Was Successfully Modified!';
            end;
        end else begin
            InsuranceofWorksHeader.Init;
            InsuranceofWorksHeader."Document No." := documentNumber;
            InsuranceofWorksHeader."Project ID" := projectno;
            InsuranceofWorksHeader."Document Type" := InsuranceofWorksHeader."document type"::"Advance Payment Guarantee";
            InsuranceofWorksHeader."Revision Type" := InsuranceofWorksHeader."revision type"::Original;
            InsuranceofWorksHeader."Contractor ID" := vendorno;
            InsuranceofWorksHeader."Form of Security" := formofsecurity;
            InsuranceofWorksHeader."Issuer Institution Type" := issuerinstitutiontype;
            InsuranceofWorksHeader."Policy/Guarantee No" := guaranteeno;
            InsuranceofWorksHeader."Insurer/Guarantor Name" := guarantorname;
            InsuranceofWorksHeader."Verified Insurer Email Address" := issueremail;
            InsuranceofWorksHeader."Issuer Registered Offices" := issuerregisteredoffice;
            InsuranceofWorksHeader."Effective Date" := effectivedate;
            InsuranceofWorksHeader."Expiry Date" := expirydate;
            InsuranceofWorksHeader.Validate("Purchase Contract ID", contractid);
            InsuranceofWorksHeader."Amount Insured/Guaranteed" := amountguaranteed;
            if InsuranceofWorksHeader.Insert(true) then begin
                InsuranceofWorksHeader.Validate("Project ID");
                InsuranceofWorksHeader.Validate("Contractor ID");
                InsuranceofWorksHeader.Validate("Expiry Date");
                InsuranceofWorksHeader.Modify;
                status := 'success*' + InsuranceofWorksHeader."Document No." + '*Advance Payment Guarantee Details Was Successfully Submitted!';
            end else begin
                status := 'danger*Advance Payment Guarantee Details Was Not Submitted!';
            end;
        end;
    end;

    procedure fnSubmitAdvancePaymentsGuaranteeRevised(documentNumber: Code[50]; projectno: Code[20]; vendorno: Code[20]; revisedguaranteedamt: Decimal; advancedocumentnorevised: Code[50]; contractid: Code[50]) status: Text
    var
        InsuranceofWorksHeader: Record "Insurance/Guarantee Header";
    begin

        InsuranceofWorksHeader.Reset;
        InsuranceofWorksHeader.SetRange("Document No.", documentNumber);
        if InsuranceofWorksHeader.FindSet then begin
            InsuranceofWorksHeader."Document No." := documentNumber;
            InsuranceofWorksHeader."Advance Document No To Revise" := advancedocumentnorevised;
            InsuranceofWorksHeader.Validate("Project ID", projectno);
            InsuranceofWorksHeader.Validate("Purchase Contract ID", contractid);
            InsuranceofWorksHeader."Document Type" := InsuranceofWorksHeader."document type"::"Advance Payment Guarantee";
            InsuranceofWorksHeader."Revision Type" := InsuranceofWorksHeader."revision type"::Revision;
            InsuranceofWorksHeader.Validate("Contractor ID", vendorno);
            InsuranceofWorksHeader."Revised Guaranteed Amount" := revisedguaranteedamt;
            if InsuranceofWorksHeader.Modify(true) then begin
                InsuranceofWorksHeader.Validate("Project ID");
                InsuranceofWorksHeader.Validate("Contractor ID");
                InsuranceofWorksHeader.Validate("Advance Document No To Revise");
                InsuranceofWorksHeader.Modify;
                status := 'success*' + InsuranceofWorksHeader."Document No." + '*Advance Payment Guarantee Revision Details Was Successfully Modified!';
            end else begin
                status := 'danger*Advance Payment Guarantee Revision Details Was Successfully Modified!';
            end;
        end else begin
            InsuranceofWorksHeader.Init;
            // InsuranceofWorksHeader."Document No.":=documentNumber;
            InsuranceofWorksHeader."Project ID" := projectno;
            InsuranceofWorksHeader.Validate("Project ID", projectno);
            InsuranceofWorksHeader.Validate("Purchase Contract ID", contractid);
            InsuranceofWorksHeader."Document Type" := InsuranceofWorksHeader."document type"::"Advance Payment Guarantee";
            InsuranceofWorksHeader."Revision Type" := InsuranceofWorksHeader."revision type"::Revision;
            InsuranceofWorksHeader."Contractor ID" := vendorno;
            InsuranceofWorksHeader."Advance Document No To Revise" := advancedocumentnorevised;
            InsuranceofWorksHeader."Revised Guaranteed Amount" := revisedguaranteedamt;
            if InsuranceofWorksHeader.Insert(true) then begin
                InsuranceofWorksHeader.Validate("Project ID");
                InsuranceofWorksHeader.Validate("Contractor ID");
                InsuranceofWorksHeader.Validate("Advance Document No To Revise");
                InsuranceofWorksHeader.Modify;
                status := 'success*' + InsuranceofWorksHeader."Document No." + '*Advance Payment Guarantee Revision Details Was Successfully Submitted!';
            end else begin
                status := 'danger*Advance Payment Guarantee Revision Details Was Not Submitted!';
            end;
        end;
    end;

    procedure fnSubmitPerformancesGuarantee(documentNumber: Code[50]; projectno: Code[20]; vendorno: Code[20]; issuerinstitutiontype: Integer; formofsecurity: Code[50]; guaranteeno: Code[50]; guarantorname: Text[250]; issuerregisteredoffice: Text; effectivedate: Date; expirydate: Date; amountguaranteed: Decimal; issueremail: Text) status: Text
    var
        InsuranceofWorksHeader: Record "Insurance/Guarantee Header";
    begin

        InsuranceofWorksHeader.Reset;
        InsuranceofWorksHeader.SetRange("Document No.", documentNumber);
        if InsuranceofWorksHeader.FindSet then begin
            InsuranceofWorksHeader."Document No." := documentNumber;
            InsuranceofWorksHeader."Project ID" := projectno;
            InsuranceofWorksHeader."Document Type" := InsuranceofWorksHeader."document type"::"Advance Payment Guarantee";
            InsuranceofWorksHeader."Contractor ID" := vendorno;
            InsuranceofWorksHeader."Form of Security" := formofsecurity;
            InsuranceofWorksHeader."Issuer Institution Type" := issuerinstitutiontype;
            InsuranceofWorksHeader."Policy/Guarantee No" := guaranteeno;
            InsuranceofWorksHeader."Insurer/Guarantor Name" := guarantorname;
            InsuranceofWorksHeader."Verified Insurer Email Address" := issueremail;
            InsuranceofWorksHeader."Issuer Registered Offices" := issuerregisteredoffice;
            InsuranceofWorksHeader."Effective Date" := effectivedate;
            InsuranceofWorksHeader."Expiry Date" := expirydate;
            InsuranceofWorksHeader."Amount Insured/Guaranteed" := amountguaranteed;
            if InsuranceofWorksHeader.Modify(true) then begin
                InsuranceofWorksHeader.Validate("Project ID");
                InsuranceofWorksHeader.Validate("Contractor ID");
                InsuranceofWorksHeader.Validate("Expiry Date");
                InsuranceofWorksHeader.Modify;
                status := 'success*' + InsuranceofWorksHeader."Document No." + '*Performance Guarantee Details Was Successfully Modified!';
            end else begin
                status := 'danger*Performance Guarantee Details Was Successfully Modified!';
            end;
        end else begin
            InsuranceofWorksHeader.Init;
            InsuranceofWorksHeader."Document No." := documentNumber;
            InsuranceofWorksHeader."Project ID" := projectno;
            InsuranceofWorksHeader."Document Type" := InsuranceofWorksHeader."document type"::"Performance Guarantee";
            InsuranceofWorksHeader."Contractor ID" := vendorno;
            InsuranceofWorksHeader."Form of Security" := formofsecurity;
            InsuranceofWorksHeader."Issuer Institution Type" := issuerinstitutiontype;
            InsuranceofWorksHeader."Policy/Guarantee No" := guaranteeno;
            InsuranceofWorksHeader."Insurer/Guarantor Name" := guarantorname;
            InsuranceofWorksHeader."Verified Insurer Email Address" := issueremail;
            InsuranceofWorksHeader."Issuer Registered Offices" := issuerregisteredoffice;
            InsuranceofWorksHeader."Effective Date" := effectivedate;
            InsuranceofWorksHeader."Expiry Date" := expirydate;
            InsuranceofWorksHeader."Amount Insured/Guaranteed" := amountguaranteed;
            if InsuranceofWorksHeader.Insert(true) then begin
                InsuranceofWorksHeader.Validate("Project ID");
                InsuranceofWorksHeader.Validate("Contractor ID");
                InsuranceofWorksHeader.Validate("Expiry Date");
                InsuranceofWorksHeader.Modify();
                status := 'success*' + InsuranceofWorksHeader."Document No." + '*Performance Guarantee Details Was Successfully Submitted!';
            end else begin
                status := 'danger*Performance Guarantee Details Was Not Submitted!';
            end;
        end;
    end;

    procedure UploadDocumentInsuranceGuaranteeHeader(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]) status: Text
    var
        _record: Record "Insurance/Guarantee Header";
        InputFile: File;
        InPutStream: InStream;
        OutPutStream: OutStream;
    begin
        _record.Reset;
        _record.SetRange(_record."Document No.", applicationNo);
        if (_record.Find('-')) then begin
            _record.AddLink(path, fileName);
            if _record.Modify(true) then begin
                status := 'success*Your document uploaded successfully!';
            end else begin
                status := 'danger*System Unknown Error Occured!';
            end

        end;
    end;

    procedure fnSubmitSubContractorRequestDetails(documentNumber: Code[50]; projectcode: Code[20]; vendorno: Code[20]; requestjustification: Text) status: Text
    var
        SubContractingHeader: Record "Subcontracting Header";
    begin

        SubContractingHeader.Reset;
        SubContractingHeader.SetRange("Document No", documentNumber);
        if SubContractingHeader.FindSet then begin
            SubContractingHeader."Document No" := documentNumber;
            SubContractingHeader.Validate("Project Code", projectcode);
            SubContractingHeader.Validate("Main Contractor No.", vendorno);
            SubContractingHeader."Request Justification" := requestjustification;

            if SubContractingHeader.Modify(true) then begin
                status := 'success*' + SubContractingHeader."Document No" + '*Sub Contractor Request Details Was Successfully Modified!';
            end else begin
                status := 'danger*Sub Contractor Request Details Was Successfully Modified!';
            end;
        end else begin
            SubContractingHeader.Init;
            SubContractingHeader."Document No" := documentNumber;
            SubContractingHeader.Validate("Project Code", projectcode);
            SubContractingHeader.Validate("Main Contractor No.", vendorno);
            SubContractingHeader."Request Justification" := requestjustification;
            SubContractingHeader."Required Documents Template ID" := 'TEMP002';
            if SubContractingHeader.Insert(true) then begin
                Rec := SubContractingHeader;
                RMSManagement.FnSuggestSubContractorRequiredDocuments(Rec);
                status := 'success*' + SubContractingHeader."Document No" + '*Sub Contractor Request Details Was Successfully Submitted!';
            end else begin
                status := 'danger*Sub Contractor Request Details Was Not Submitted!';
            end;
        end;
    end;

    procedure fnSubmitSubcontractingLineDetails(documentNumber: Code[50]; projectcode: Code[20]; vendorno: Code[20]; scopeofsubcontracting: Text; subcontractorname: Text; subtype: Integer;
    krapinno: Code[20]; vendorgroup: Integer; suppliertype: Integer; descriptionofworks: Text; startdate: Date; enddate: Date) status: Text
    var
        SubContractingLine: Record "Subcontracting Line";
    begin

        SubContractingLine.Reset;
        SubContractingLine.SetRange("Document No", documentNumber);
        SubContractingLine.SetRange("Tax PIN No.", krapinno);
        if SubContractingLine.FindSet then begin
            SubContractingLine."Document No" := documentNumber;
            SubContractingLine."Project Code" := projectcode;
            SubContractingLine."Main Contractor No." := vendorno;
            SubContractingLine.Validate("Project Code");
            SubContractingLine.Validate("Main Contractor No.");
            SubContractingLine."Subcontractor Name" := subcontractorname;
            SubContractingLine."Description Of Works" := descriptionofworks;
            SubContractingLine.Type := subtype;
            SubContractingLine."Tax PIN No." := krapinno;
            SubContractingLine."Vendor Group" := vendorgroup;
            SubContractingLine."Supplier Type" := suppliertype;
            SubContractingLine."Scope of Subcontracting" := scopeofsubcontracting;
            if SubContractingLine.Modify(true) then begin
                status := 'success*' + SubContractingLine."Document No" + '*Sub Contractor Request Details Was Successfully Modified!';
            end else begin
                status := 'danger*Sub Contractor Request Details Was Successfully Modified!';
            end;
        end else begin
            SubContractingLine.Init;
            SubContractingLine."Document No" := documentNumber;
            SubContractingLine."Project Code" := projectcode;
            SubContractingLine."Main Contractor No." := vendorno;
            SubContractingLine.Validate("Project Code");
            SubContractingLine.Validate("Main Contractor No.");
            SubContractingLine."Subcontractor Name" := subcontractorname;
            SubContractingLine."Description Of Works" := descriptionofworks;
            SubContractingLine.Type := subtype;
            SubContractingLine."Tax PIN No." := krapinno;
            SubContractingLine."Vendor Group" := vendorgroup;
            SubContractingLine."Supplier Type" := suppliertype;
            SubContractingLine."Scope of Subcontracting" := scopeofsubcontracting;
            if SubContractingLine.Insert(true) then begin
                status := 'success*' + SubContractingLine."Document No" + '*Subcontracting Details Was Successfully Submitted!';
            end else begin
                status := 'danger*Subcontracting Was Not Submitted!';
            end;
        end;
    end;

    procedure FnGetSubcontractingRequiredDoc(var VarAll: BigText; documentno: Code[20])
    var
        SubcontractingRequiredDocs: Record "Subcontracting Required Doc";
    begin
        Clear(VarAll);
        SubcontractingRequiredDocs.Reset;
        SubcontractingRequiredDocs.SetRange(SubcontractingRequiredDocs."Document No.", documentno);
        if SubcontractingRequiredDocs.Find('-') then begin
            repeat
                VarAll.AddText('::::' + SubcontractingRequiredDocs."Document Type" + '* ' + SubcontractingRequiredDocs.Description + '* ' +
               SubcontractingRequiredDocs."Guidelines/Instructions" + '* ' + Format(SubcontractingRequiredDocs."Due Date"));
            until SubcontractingRequiredDocs.Next = 0;

        end;
    end;

    procedure UploadDocumentSubcontractor(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]) status: Text
    var
        _record: Record "Subcontracting Header";
        InputFile: File;
        InPutStream: InStream;
        OutPutStream: OutStream;
    begin
        _record.Reset;
        _record.SetRange(_record."Document No", applicationNo);
        if (_record.Find('-')) then begin
            _record.AddLink(path, fileName);
            if _record.Modify(true) then begin
                status := 'success*Your document uploaded successfully!';
            end else begin
                status := 'danger*System Unknown Error Occured!';
            end

        end;
    end;

    procedure FnGetFinalAccountTemplateID(var VarAll: BigText)
    var
        ProjectChecklistTemplate: Record "Project Checklist  Template";
    begin
        Clear(VarAll);
        ProjectChecklistTemplate.Reset;
        ProjectChecklistTemplate.SetRange("Project Stage", ProjectChecklistTemplate."project stage"::"Final Account");
        if ProjectChecklistTemplate.Find('-') then begin
            repeat
                VarAll.AddText('::::' + ProjectChecklistTemplate."Template ID" + '* ' + ProjectChecklistTemplate.Description);
            until ProjectChecklistTemplate.Next = 0;

        end;
    end;

    procedure fnSubmitFinalAccount(vendornumber: Code[20]; projectid: Code[30]; templateid: Code[20]) status: Text
    var
        FinalAccount: Record "Final Account";
        FinalAccountLines: Record "Project Material Template Line";
        ContractorRequestTask: Record "Contractor Request Task";
    begin

        FinalAccount.Init;
        FinalAccount."Document Date" := Today;
        if FinalAccount.Insert(true) then begin
            FinalAccount.Validate("Project ID", projectid);
            FinalAccount.Validate("Contractor No", vendornumber);
            FinalAccount.Validate("Template ID", templateid);
            if FinalAccount.Modify(true) then begin
                status := 'success*' + FinalAccount."Document No" + '*Final Account Request Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Final Account!'
            end;
        end else begin
            status := 'danger*Error while Creating the Final Account!'
        end
    end;

    procedure fnSubmitFinalAccountLineDetails(documentno: Code[20]; projectno: Code[30]; lineno: Integer; responsestatus: Integer; comments: Text) Status: Text
    var
        FinalAccountLine: Record "Final Account Line";
    begin
        FinalAccountLine.Reset;
        FinalAccountLine.SetRange("Document No", documentno);
        FinalAccountLine.SetRange("Line No", lineno);
        if FinalAccountLine.FindSet then begin
            FinalAccountLine."Response Type" := responsestatus;

            if comments <> ' ' then
                FinalAccountLine.Comments := comments;

            if FinalAccountLine.Modify then
                Status := 'success*Final Account Line Entry Details updated successfully!'
            else
                Status := 'danger*Error while updating..!'
        end
        else begin
            Status := 'danger*Error while Creating the Final Account Line Entry!'
        end
    end;

    procedure FnGetExpiryStatusInsurance(vendorNo: Code[20]) status: Text
    var
        InsuranceOfWorks: Record "Insurance/Guarantee Header";
        daysremaining: Integer;
    begin
        InsuranceOfWorks.Reset;
        InsuranceOfWorks.SetRange("Contractor ID", vendorNo);
        InsuranceOfWorks.SetRange("Document Type", InsuranceOfWorks."document type"::"Insurance Of Works");
        InsuranceOfWorks.SetRange(Expired, false);
        if InsuranceOfWorks.Find('-') then begin

            daysremaining := InsuranceOfWorks."Expiry Date" - Today;
            //IF (daysremaining <= 90) THEN BEGIN
            status := Format(daysremaining) + '*' + InsuranceOfWorks."Project ID" + ' ' + InsuranceOfWorks."Project Name";

        end;
    end;

    procedure FnGetExpiryStatusAdvanceGuarantee(vendorNo: Code[20]) status: Text
    var
        InsuranceOfWorks: Record "Insurance/Guarantee Header";
        daysremaining: Integer;
    begin
        InsuranceOfWorks.Reset;
        InsuranceOfWorks.SetRange("Contractor ID", vendorNo);
        InsuranceOfWorks.SetRange("Document Type", InsuranceOfWorks."document type"::"Advance Payment Guarantee");
        InsuranceOfWorks.SetRange(Expired, false);
        if InsuranceOfWorks.Find('-') then begin
            daysremaining := InsuranceOfWorks."Expiry Date" - Today;
            //IF (daysremaining <= 90) THEN BEGIN
            status := Format(daysremaining) + '*' + InsuranceOfWorks."Project ID" + ' ' + InsuranceOfWorks."Project Name";


        end;
    end;

    procedure fnSubmitWorkPlan(vendornumber: Code[20]; projectid: Code[30]; documenttype: Integer) status: Text
    var
        WorkPlanHeader: Record "Work Plan Header";
        WorkPlanLine: Record "WorkPlan Line";
        PlanningWorkPlanLine: Record "Planning Work Plan Line";
    begin

        WorkPlanHeader.Init;
        WorkPlanHeader."Document Date" := Today;
        WorkPlanHeader."Document Type" := documenttype;
        WorkPlanHeader."Project ID" := projectid;
        WorkPlanHeader."Contractor No." := vendornumber;
        WorkPlanHeader."Portal Status" := WorkPlanHeader."portal status"::Draft;
        if WorkPlanHeader.Insert(true) then begin
            WorkPlanHeader.Validate("Project ID");
            WorkPlanHeader.Validate("Contractor No.");
            if WorkPlanHeader.Modify(true) then begin

                status := 'success*' + WorkPlanHeader."Document No." + '*Work Plan Was Successfully Created!'
            end else begin
                status := 'danger*Error while Creating the Work Plan!'
            end;
        end else begin
            status := 'danger*Error while Creating the Work Plan!'
        end
    end;

    procedure fnSubmitWorkPlanLine(documentNumber: Code[50]; vendorno: Code[20]; documentntype: Integer; activitycode: Code[50]; entryno: Integer; startdate: Date; enddate: Date) status: Text
    var
        WorkPlanHeader: Record "Work Plan Header";
        WorkPlanLine: Record "WorkPlan Line";
        PlanningWorkPlanLine: Record "Planning Work Plan Line";
    begin
        //    WorkPlanLine.Reset;
        //    WorkPlanLine.SetRange(Indent,entryno);
        //    if WorkPlanLine.FindSet then begin
        //       WorkPlanLine."Document No.":=documentNumber;
        //      WorkPlanLine."Activity Code":=activitycode;
        //     WorkPlanLine."Document Type":=documentntype;
        //      WorkPlanLine."Start Date":=startdate;
        //      WorkPlanLine."End Date":=enddate;
        //   if WorkPlanLine.Modify(true) then begin
        //     WorkPlanLine.Validate("Activity Code");
        //     status:='success*'+WorkPlanLine."Document No."+'*Work Plan Line Details Was Successfully Modified!';
        //   end else begin
        //     status:='danger*Work Plan Line Details Was Successfully Modified!';
        // end;
        // end else begin
        //     WorkPlanLine.Init;
        //    WorkPlanLine.Reset;
        //    WorkPlanLine."Document No.":=documentNumber;
        //    WorkPlanLine."Document Type":=documentntype;
        //    WorkPlanLine."Activity Code":=activitycode;
        //    WorkPlanLine."Start Date":=startdate;
        //      WorkPlanLine."End Date":=enddate;
        //   if WorkPlanLine.Insert(true) then begin
        //     WorkPlanLine.Validate("Activity Code");
        //     if WorkPlanLine.Modify(true) then
        //     status:='success*'+WorkPlanLine."Document No."+'*Work Plan Line Details Was Successfully Modified!';
        //   end else begin
        //     status:='danger*Work Plan Line Details Was Successfully Modified!';


        // end;
        // end;


        /*WorkPlanLine.INIT;
           WorkPlanLine.RESET;
           WorkPlanLine."Document No.":=documentNumber;
           WorkPlanLine."Document Type":=documentntype;
          IF WorkPlanLine.INSERT(TRUE) THEN BEGIN
            WorkPlanLine.VALIDATE("Activity Code",activitycode);
            IF WorkPlanLine.MODIFY(TRUE) THEN
            status:='success*'+WorkPlanLine."Document No."+'*Work Plan Line Details Was Successfully Modified!';
          END ELSE BEGIN
            status:='danger*Work Plan Line Details Was Successfully Modified!';


        END;
        */

    end;

    procedure fnSubmitPlanningWorkPlanLine(documentNumber: Code[50]; vendorno: Code[20]; documentntype: Integer; activitycode: Code[50]; entryno: Integer; totaldonetodate: Decimal;
    workstartchainage: Decimal; workendchainage: Decimal; projectid: Code[20]; unitofmeasure: Code[20]; formarnid: Code[20]; lineno: Integer; description: Text) status: Text
    var
        WorkPlanHeader: Record "Work Plan Header";
        WorkPlanLine: Record "Workplan Line";
        PlanningWorkPlanLine: Record "Planning Work Plan Line";
    begin
        PlanningWorkPlanLine.Reset;
        PlanningWorkPlanLine.SetRange("Entry No", entryno);
        if PlanningWorkPlanLine.FindSet then begin
            PlanningWorkPlanLine."Document No." := documentNumber;
            PlanningWorkPlanLine."Activity Code" := activitycode;
            PlanningWorkPlanLine."Document Type" := documentntype;
            PlanningWorkPlanLine."Line No." := lineno;
            PlanningWorkPlanLine."Project ID" := projectid;
            PlanningWorkPlanLine."Total Done Todate" := totaldonetodate;
            PlanningWorkPlanLine."Works Start Chainage(KM)" := workstartchainage;
            PlanningWorkPlanLine."Works End Chanage(KM)" := workendchainage;
            PlanningWorkPlanLine."Unit Of Measure" := unitofmeasure;
            PlanningWorkPlanLine."Foreman ID" := formarnid;
            PlanningWorkPlanLine."Works Description" := description;

            if PlanningWorkPlanLine.Modify(true) then begin
                PlanningWorkPlanLine.Validate("Activity Code");
                PlanningWorkPlanLine.Validate("Foreman ID");
                status := 'success*' + PlanningWorkPlanLine."Document No." + '*Planning Work Plan Line Details Was Successfully Modified!';
            end else begin
                status := 'danger*Planning Work Plan Line Details Was Successfully Modified!';
            end;
        end else begin
            PlanningWorkPlanLine.Init;
            PlanningWorkPlanLine.Reset;
            PlanningWorkPlanLine."Document No." := documentNumber;
            PlanningWorkPlanLine."Activity Code" := activitycode;
            PlanningWorkPlanLine."Document Type" := documentntype;
            PlanningWorkPlanLine."Line No." := lineno;
            PlanningWorkPlanLine."Project ID" := projectid;
            PlanningWorkPlanLine."Total Done Todate" := totaldonetodate;
            PlanningWorkPlanLine."Works Start Chainage(KM)" := workstartchainage;
            PlanningWorkPlanLine."Works End Chanage(KM)" := workendchainage;
            PlanningWorkPlanLine."Unit Of Measure" := unitofmeasure;
            PlanningWorkPlanLine."Foreman ID" := formarnid;
            PlanningWorkPlanLine."Works Description" := description;

            if PlanningWorkPlanLine.Insert(true) then begin
                PlanningWorkPlanLine.Validate("Activity Code");
                PlanningWorkPlanLine.Validate("Foreman ID");
                status := 'success*' + PlanningWorkPlanLine."Document No." + '*Planning Work Plan Line Details Was Successfully Modified!';
            end else begin
                status := 'danger*Planning Work Plan Line Details Was Successfully Modified!';


            end;
        end;
    end;

    procedure fnSubmitContractorInspectionRequest(documentNumber: Code[50]; vendorno: Code[20]; projectid: Code[50]; requireslabtest: Integer; workplanno: Code[20]; requiressurveychecks: Integer) status: Text
    var
        ContractorInspectionRequest: Record "Contractor Inspection Request";
    begin
        ContractorInspectionRequest.Reset;
        ContractorInspectionRequest.SetRange("Document No.", documentNumber);
        if ContractorInspectionRequest.FindSet then begin
            ContractorInspectionRequest."Document No." := documentNumber;
            ContractorInspectionRequest.Validate("Project ID", projectid);
            ContractorInspectionRequest."Daily/Weekly/Monthly W/Plan No" := workplanno;
            ContractorInspectionRequest.Validate("Daily/Weekly/Monthly W/Plan No");
            if requireslabtest = 1 then
                ContractorInspectionRequest."Requires Lab Test" := true;
            if requiressurveychecks = 1 then
                ContractorInspectionRequest."Requires Survey" := true;

            if ContractorInspectionRequest.Modify(true) then begin
                ContractorInspectionRequest.Validate("Daily/Weekly/Monthly W/Plan No");
                status := 'success*' + ContractorInspectionRequest."Document No." + '*Work Plan Line Details Was Successfully Modified!';
            end else begin
                status := 'danger*Work Plan Line Details Was Successfully Modified!';
            end;
        end else begin
            ContractorInspectionRequest.Init;
            ContractorInspectionRequest.Reset;
            ContractorInspectionRequest."Document No." := documentNumber;
            ContractorInspectionRequest.Validate("Project ID", projectid);
            ContractorInspectionRequest."Daily/Weekly/Monthly W/Plan No" := workplanno;
            ContractorInspectionRequest.Validate("Daily/Weekly/Monthly W/Plan No");
            if requireslabtest = 1 then
                ContractorInspectionRequest."Requires Lab Test" := true;
            if requiressurveychecks = 1 then
                ContractorInspectionRequest."Requires Survey" := true;

            if ContractorInspectionRequest.Insert(true) then begin
                ContractorInspectionRequest.Validate("Daily/Weekly/Monthly W/Plan No");
                status := 'success*' + ContractorInspectionRequest."Document No." + '*Work Plan Line Details Was Successfully Modified!';
            end else begin
                status := 'danger*Work Plan Line Details Was Successfully Modified!';


            end;
        end;
    end;

    procedure fnSubmitContractorInspectionActivities(workstartchainage: Decimal; workendchainage: Decimal; testsrequired: Text; entryno: Integer) status: Text
    var
        TestRequestLine: Record "Test Request Line";
    begin
        TestRequestLine.Reset;
        TestRequestLine.SetRange("Entry No", entryno);
        if TestRequestLine.FindSet then begin
            TestRequestLine."Works Start Chainage(KM)" := workstartchainage;
            TestRequestLine."Works End Chanage(KM)" := workendchainage;
            TestRequestLine."Tests Required" := testsrequired;
            if TestRequestLine.Modify(true) then begin
                status := 'success*' + TestRequestLine."Document No." + '*Test Request Line Details Was Successfully Modified!';
            end else begin
                status := 'danger*Test Request Line Details Was Successfully Modified!';
            end;
        end;
    end;

    procedure fnSubmitContractorInspectionRequestDetails(vendorno: Code[20]; documentNumber: Code[50]) status: Text
    var
        ContractorInspectionRequest: Record "Contractor Inspection Request";
    begin
        ContractorInspectionRequest.Reset;
        ContractorInspectionRequest.SetRange(ContractorInspectionRequest."Document No.", documentNumber);
        if (ContractorInspectionRequest.Find('-')) then begin
            ContractorInspectionRequest."Portal Status" := ContractorInspectionRequest."Portal Status"::Submitted;
            if ContractorInspectionRequest.Modify(true) then begin
                status := 'success*' + ContractorInspectionRequest."Document No." + '*Inspection/Test Request Details Was Successfully Submitted!';
            end else begin
                status := 'danger*Inspection/Test Request Details could not be submitted!!';
            end

        end else begin
            status := 'danger*Inspection/Test Request Details could not be submitted!';
        end;
    end;

    procedure fnSubmitContracorPaymentCertificatesDetails(vendorno: Code[20]; documentNumber: Code[50]) status: Text
    var
        ContractorPaymentRequest: Record "Contractor Inspection Request";
    begin
        ContractorPaymentRequest.Reset;
        ContractorPaymentRequest.SetRange(ContractorPaymentRequest."Document No.", documentNumber);
        if (ContractorPaymentRequest.Find('-')) then begin
            ContractorPaymentRequest."Portal Status" := ContractorPaymentRequest."Portal Status"::Submitted;
            if ContractorPaymentRequest.Modify(true) then begin
                status := 'success*' + ContractorPaymentRequest."Document No." + '*Payment Certificate Request Details Was Successfully Submitted!';
            end else begin
                status := 'danger*Payment Certificate Request Details could not be submitted!!';
            end

        end else begin
            status := 'danger*Payment Certificate Request Details could not be submitted!';
        end;
    end;

    procedure fnSubmitTestMaterialRecord(documentNumber: Code[50]; vendorno: Code[20]; projectid: Code[50]) status: Text
    var
        MaterialTestRecord: Record "Material Test Record";
    begin
        /*   MaterialTestRecord.RESET;
          MaterialTestRecord.SETRANGE(Code,documentNumber);
          IF MaterialTestRecord.FINDSET THEN BEGIN
             MaterialTestRecord."Document Type":= MaterialTestRecord."Document Type"::"Material Test Record";
             MaterialTestRecord.Code:=documentNumber;
            MaterialTestRecord."Contractor No.":=vendorno;
            MaterialTestRecord."Project ID":=projectid;


         IF MaterialTestRecord.MODIFY(TRUE) THEN BEGIN
           MaterialTestRecord.VALIDATE("Project ID");
           status:='success*'+MaterialTestRecord.Code+'*Material Test Record Details Was Successfully Modified!';
         END ELSE BEGIN
           status:='danger*Material Test Record Details Was Successfully Modified!';
       END;
       END ELSE BEGIN
       */
        MaterialTestRecord.Init;
        MaterialTestRecord.Reset;
        MaterialTestRecord."Project ID" := projectid;
        MaterialTestRecord."Contractor No." := vendorno;
        MaterialTestRecord."Document Type" := MaterialTestRecord."document type"::"Material Test Certificate";

        if MaterialTestRecord.Insert(true) then begin
            MaterialTestRecord.Validate("Project ID");
            MaterialTestRecord.Modify;
            status := 'success*' + MaterialTestRecord.Code + '*Material Test Record Details Was Successfully Modified!';
        end else begin
            status := 'danger*Material Test Record Details Was Successfully Modified!';


        end;
        //END;

    end;

    procedure fnSubmitMaterialTestLine(documentNumber: Code[50]; vendorno: Code[20]; projectid: Code[20]; materialid: Code[20]; materialdeliverydate: Date; testingdate: Date; manufacturer: Text; entryno: Integer; quantity: Decimal) status: Text
    var
        MaterialTestRecordLine: Record "Material Test Record Line";
    begin

        MaterialTestRecordLine.Reset;
        MaterialTestRecordLine.SetRange("Line No.", entryno);
        if MaterialTestRecordLine.FindSet then begin
            MaterialTestRecordLine.Code := documentNumber;
            MaterialTestRecordLine."Project ID" := projectid;
            MaterialTestRecordLine."Material ID" := materialid;
            MaterialTestRecordLine."Material Delivery Date" := materialdeliverydate;
            MaterialTestRecordLine."Testing Date" := testingdate;
            MaterialTestRecordLine.Manufacturer := manufacturer;
            MaterialTestRecordLine.Quantity := quantity;

            if MaterialTestRecordLine.Modify(true) then begin
                MaterialTestRecordLine.Validate("Project ID");
                MaterialTestRecordLine.Validate("Material ID");
                //MaterialTestRecordLine.VALIDATE("Purchase Contract ID");
                status := 'success*' + MaterialTestRecordLine.Code + '*Planning Work Plan Line Details Was Successfully Modified!';
            end else begin
                status := 'danger*Planning Work Plan Line Details Was Successfully Modified!';
            end;
        end else begin
            MaterialTestRecordLine.Init;
            MaterialTestRecordLine.Reset;
            MaterialTestRecordLine.Code := documentNumber;
            MaterialTestRecordLine."Project ID" := projectid;
            MaterialTestRecordLine."Material ID" := materialid;
            MaterialTestRecordLine."Material Delivery Date" := materialdeliverydate;
            MaterialTestRecordLine."Testing Date" := testingdate;
            MaterialTestRecordLine.Manufacturer := manufacturer;
            MaterialTestRecordLine.Quantity := quantity;

            if MaterialTestRecordLine.Insert(true) then begin
                MaterialTestRecordLine.Validate("Project ID");
                MaterialTestRecordLine.Validate("Material ID");
                // MaterialTestRecordLine.VALIDATE("Purchase Contract ID");
                MaterialTestRecordLine.Modify;
                status := 'success*' + MaterialTestRecordLine.Code + '*Planning Work Plan Line Details Was Successfully Modified!';
            end else begin
                status := 'danger*Planning Work Plan Line Details Was Successfully Modified!';


            end;
        end;
    end;

    procedure FnGetMaterialTestTemplate(var VarAll: BigText)
    var
        ProjectMaterialTemplate: Record "Project Material Template Head";
    begin
        Clear(VarAll);
        ProjectMaterialTemplate.Reset;
        ProjectMaterialTemplate.SetRange(Blocked, false);
        if ProjectMaterialTemplate.Find('-') then begin
            repeat
                VarAll.AddText('::::' + ProjectMaterialTemplate."Template ID" + '* ' + ProjectMaterialTemplate.Description + '* ' + ProjectMaterialTemplate."Project Type");
            until ProjectMaterialTemplate.Next = 0;

        end;
    end;

    procedure FnGetWorkPlanNo(var VarAll: BigText; vendorno: Code[20]; projectid: Code[20])
    var
        WorkPlanHeader: Record "Work Plan Header";
    begin
        Clear(VarAll);
        WorkPlanHeader.Reset;
        WorkPlanHeader.SetRange("Contractor No.", vendorno);
        WorkPlanHeader.SetRange("Project ID", projectid);
        if WorkPlanHeader.Find('-') then begin
            repeat
                VarAll.AddText('::::' + WorkPlanHeader."Document No." + '* ' + Format(WorkPlanHeader."Document Type") + '* ' + WorkPlanHeader."Project ID");
            until WorkPlanHeader.Next = 0;

        end;
    end;

    procedure UploadDocumentMaterialTestRecord(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]) status: Text
    var
        _record: Record "Material Test Record";
        InputFile: File;
        InPutStream: InStream;
        OutPutStream: OutStream;
    begin
        _record.Reset;
        _record.SetRange(_record.Code, applicationNo);
        if (_record.Find('-')) then begin
            _record.AddLink(path, fileName);
            if _record.Modify(true) then begin
                status := 'success*Your document uploaded successfully!';
            end else begin
                status := 'danger*System Unknown Error Occured!';
            end

        end;
    end;

    procedure UploadDocumentWorkPlan(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]) status: Text
    var
        _record: Record "Work Plan Header";
        InputFile: File;
        InPutStream: InStream;
        OutPutStream: OutStream;
    begin
        _record.Reset;
        _record.SetRange(_record."Document No.", applicationNo);
        if (_record.Find('-')) then begin
            _record.AddLink(path, fileName);
            if _record.Modify(true) then begin
                status := 'success*Your document uploaded successfully!';
            end else begin
                status := 'danger*System Unknown Error Occured!';
            end

        end;
    end;

    procedure UploadDocumentTestRquest(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]) status: Text
    var
        _record: Record "Contractor Inspection Request";
        InputFile: File;
        InPutStream: InStream;
        OutPutStream: OutStream;
    begin
        _record.Reset;
        _record.SetRange(_record."Document No.", applicationNo);
        if (_record.Find('-')) then begin
            _record.AddLink(path, fileName);
            if _record.Modify(true) then begin
                status := 'success*Your document uploaded successfully!';
            end else begin
                status := 'danger*System Unknown Error Occured!';
            end

        end;
    end;

    procedure UploadDocumentSiteAgent(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]) status: Text
    var
        _record: Record "WEP Contractor Submission";
        InputFile: File;
        InPutStream: InStream;
        OutPutStream: OutStream;
    begin
        _record.Reset;
        _record.SetRange(_record."Document No", applicationNo);
        if (_record.Find('-')) then begin
            _record.AddLink(path, fileName);
            if _record.Modify(true) then begin
                status := 'success*Your document uploaded successfully!';
            end else begin
                status := 'danger*System Unknown Error Occured!';
            end

        end;
    end;

    procedure UploadDocumentPaymentRequest(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]) status: Text
    var
        _record: Record "Measurement &  Payment Header";
        InputFile: File;
        InPutStream: InStream;
        OutPutStream: OutStream;
    begin
        _record.Reset;
        _record.SetRange(_record."Document No.", applicationNo);
        if (_record.Find('-')) then begin
            _record.AddLink(path, fileName);
            if _record.Modify(true) then begin
                status := 'success*Your document uploaded successfully!';
            end else begin
                status := 'danger*System Unknown Error Occured!';
            end

        end;
    end;

    procedure UploadDocumentEOT(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]) status: Text
    var
        _record: Record "Project Variation Header";
        InputFile: File;
        InPutStream: InStream;
        OutPutStream: OutStream;
    begin
        _record.Reset;
        _record.SetRange(_record."Document No.", applicationNo);
        if (_record.Find('-')) then begin
            _record.AddLink(path, fileName);
            if _record.Modify(true) then begin
                status := 'success*Your document uploaded successfully!';
            end else begin
                status := 'danger*System Unknown Error Occured!';
            end

        end;
    end;

    procedure UploadDocumentFinalAccount(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]) status: Text
    var
        _record: Record "Final Account";
        InputFile: File;
        InPutStream: InStream;
        OutPutStream: OutStream;
    begin
        _record.Reset;
        _record.SetRange(_record."Document No", applicationNo);
        if (_record.Find('-')) then begin
            _record.AddLink(path, fileName);
            if _record.Modify(true) then begin
                status := 'success*Your document uploaded successfully!';
            end else begin
                status := 'danger*System Unknown Error Occured!';
            end

        end;
    end;

    procedure UploadDocumentReportSubmission(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]) status: Text
    var
        _record: Record "Report Submission Header";
        InputFile: File;
        InPutStream: InStream;
        OutPutStream: OutStream;
    begin
        _record.Reset;
        _record.SetRange(_record."Document No.", applicationNo);
        if (_record.Find('-')) then begin
            _record.AddLink(path, fileName);
            if _record.Modify(true) then begin
                status := 'success*Your document uploaded successfully!';
            end else begin
                status := 'danger*System Unknown Error Occured!';
            end

        end;
    end;

    procedure fnDeleteInspectionActivity(documentno: Code[20]; vendorNo: Code[30]; entryno: Integer) deleteStatus: Text
    var
        TestRequestLine: Record "Test Request Line";
    begin
        TestRequestLine.Reset;
        TestRequestLine.SetRange("Document No.", documentno);
        TestRequestLine.SetRange("Contractor No.", vendorNo);
        TestRequestLine.SetRange("Entry No", entryno);
        if TestRequestLine.FindSet then begin
            if TestRequestLine.Delete then
                deleteStatus := 'success*Test Request Activity entry Removed successfully!'
            else
                deleteStatus := 'danger*Error while deleting..!'
        end
        else begin
            Error('entry not found!');
        end
    end;

    procedure fnSubmitWorkplanMaterialsonSite(vendornumber: Code[20]; Documentno: Code[50]; materialid: Code[20]; activityno: Code[50]; quantity: Decimal; lineno: Integer; documenttype: Integer; approved: Integer) status: Text
    var
        WorkPlanMaterial: Record "Workplan Material on Site";
    begin

        WorkPlanMaterial.Init;
        WorkPlanMaterial."Document No" := Documentno;
        WorkPlanMaterial."Document Type" := documenttype;
        WorkPlanMaterial."Material Code" := materialid;
        WorkPlanMaterial."Activity No" := activityno;
        WorkPlanMaterial."Line No" := lineno;
        WorkPlanMaterial.Quantity := quantity;
        WorkPlanMaterial."Approved?" := approved;
        if WorkPlanMaterial.Insert(true) then begin
            WorkPlanMaterial.Validate("Material Code");
            status := 'success*New Material On Site Was Successfully Created!'

        end else begin
            status := 'danger*Error while Creating the Material On Site!'
        end
    end;

    procedure fnSubmitWorkPlanEquipment(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; equipmentno: Code[20];
    activityno: Code[50]; lineno: Integer; documenttype: Integer; quantity: Decimal; EqipmentTypeCode: Text; Description: Text) status: Text
    var
        WorkPlanEquipment: Record "Workplan Plant and Machinery";
    begin

        WorkPlanEquipment.Init;
        WorkPlanEquipment."Document Type" := documenttype;
        WorkPlanEquipment."Document No" := Documentno;
        WorkPlanEquipment."Equipment No" := equipmentno;
        WorkPlanEquipment."Activity No" := activityno;
        WorkPlanEquipment."Line No" := lineno;
        if WorkPlanEquipment.Insert(true) then begin
            WorkPlanEquipment.Validate("Equipment No");
            status := 'success*New Equipment  Was Successfully Created!'

        end else begin
            status := 'danger*Error while Creating the Key Team!'
        end
    end;

    procedure GenerateTemplate(filename: Text; Project_ID: Text; Document_No: Text)
    var
    // "**mscorlib**": Integer;
    // sb: dotnet StringBuilder;
    // stream: dotnet StreamWriter;
    // str: dotnet Stream;
    // ascii: dotnet Encoder;
    // "**System**": Integer;
    // uriObj: dotnet Uri;
    // lgRequest: dotnet HttpWebRequest;
    // lgResponse: dotnet HttpWebResponse;
    // reader: dotnet XmlTextReader;
    // document: dotnet XmlDocument;
    // credentials: dotnet CredentialCache;
    begin


        // sb:=sb.StringBuilder();
        // sb.Append('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/">');
        // sb.Append('<soapenv:Header/>');
        // sb.Append('<soapenv:Body>');
        // sb.Append('<tem:GenerateCert>');
        // sb.Append('<tem:filename>'+filename+'</tem:filename>');
        // sb.Append('<tem:Project_ID>'+Project_ID+'</tem:Project_ID>');
        // sb.Append('<tem:Document_No>'+Document_No+'</tem:Document_No>');
        // sb.Append('</tem:GenerateCert>');
        // sb.Append('</soapenv:Body>');
        // sb.Append('</soapenv:Envelope>');

        // uriObj:= uriObj.Uri('http://192.168.1.87:7048/KeRRAExcel.asmx');
        // lgRequest:= lgRequest.CreateDefault(uriObj);
        // lgRequest.Method:= 'POST';
        // lgRequest.ContentType :='text/xml';
        // lgRequest.Headers.Add('SOAPAction', 'http://tempuri.org/GenerateCert');
        // lgRequest.Credentials:=credentials.DefaultCredentials;
        // lgRequest.Timeout:=120000;
        // stream:=stream.StreamWriter(lgRequest.GetRequestStream());
        // stream.Write(sb.ToString());
        // stream.Close();
        // lgResponse:=lgRequest.GetResponse();
    end;

    // procedure GenerateTemplateNew(filename: Text; Project_ID: Text; Document_No: Text; mainContractor: Text; contractsum: Decimal; period: Integer; ipcnumber: Integer; settedamount: Decimal; projectstartdate: Date)
    // var
    //     "**mscorlib**": Integer;
    //     sb: dotnet StringBuilder;
    //     stream: dotnet StreamWriter;
    //     str: dotnet Stream;
    //     ascii: dotnet Encoder;
    //     "**System**": Integer;
    //     uriObj: dotnet Uri;
    //     lgRequest: dotnet HttpWebRequest;
    //     lgResponse: dotnet HttpWebResponse;
    //     reader: dotnet XmlTextReader;
    //     document: dotnet XmlDocument;
    //     credentials: dotnet CredentialCache;
    //     sbStr: Text;
    // begin
    //     //  CALCFIELDS("Settled Amount");
    //     sb := sb.StringBuilder();
    //     sb.Append('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/">');
    //     sb.Append('<soapenv:Header/>');
    //     sb.Append('<soapenv:Body>');
    //     sb.Append('<tem:GenerateCert>');
    //     sb.Append('<tem:filename>' + filename + '</tem:filename>');
    //     sb.Append('<tem:Project_ID>' + Project_ID + '</tem:Project_ID>');
    //     sb.Append('<tem:Document_No>' + Document_No + '</tem:Document_No>');
    //     sb.Append('<tem:mainContractor>' + mainContractor + '</tem:mainContractor>');
    //     sb.Append('<tem:contractVal>' + Format(contractsum) + '</tem:contractVal>');
    //     sb.Append('<tem:contractNo>' + Document_No + '</tem:contractNo>');
    //     sb.Append('<tem:certNo>' + Format(ipcnumber) + '</tem:certNo>');
    //     sb.Append('<tem:date>' + Format(projectstartdate) + '</tem:date>');
    //     sb.Append('<tem:prev>' + Format(settedamount) + '</tem:prev>');
    //     sb.Append('</tem:GenerateCert>');
    //     sb.Append('</soapenv:Body>');
    //     sb.Append('</soapenv:Envelope>');
    //     sbStr := DelChr(sb.ToString(), '=', '&');
    //     uriObj := uriObj.Uri('http://192.168.1.65:8047/KuraExcel.asmx');
    //     lgRequest := lgRequest.CreateDefault(uriObj);
    //     lgRequest.Method := 'POST';
    //     lgRequest.ContentType := 'text/xml';
    //     lgRequest.Headers.Add('SOAPAction', 'http://tempuri.org/GenerateCert');
    //     lgRequest.Credentials := credentials.DefaultCredentials;
    //     lgRequest.Timeout := 120000;
    //     stream := stream.StreamWriter(lgRequest.GetRequestStream());
    //     stream.Write(sbStr);
    //     stream.Close();
    //     lgResponse := lgRequest.GetResponse();
    // end;

    // procedure GenerateTemplateNewTest(filename: Text; Project_ID: Text; Document_No: Text; mainContractor: Text; contractsum: Decimal; period: Integer; ipcnumber: Integer; settedamount: Decimal; projectstartdate: Date)
    // var
    //     "**mscorlib**": Integer;
    //     sb: dotnet StringBuilder;
    //     stream: dotnet StreamWriter;
    //     str: dotnet Stream;
    //     ascii: dotnet Encoder;
    //     "**System**": Integer;
    //     uriObj: dotnet Uri;
    //     lgRequest: dotnet HttpWebRequest;
    //     lgResponse: dotnet HttpWebResponse;
    //     reader: dotnet XmlTextReader;
    //     document: dotnet XmlDocument;
    //     credentials: dotnet CredentialCache;
    //     sbStr: Text;
    // begin
    //     //  CALCFIELDS("Settled Amount");
    //     sb := sb.StringBuilder();
    //     sb.Append('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/">');
    //     sb.Append('<soapenv:Header/>');
    //     sb.Append('<soapenv:Body>');
    //     sb.Append('<tem:GenerateCert>');
    //     sb.Append('<tem:filename>' + filename + '</tem:filename>');
    //     sb.Append('<tem:Project_ID>' + Project_ID + '</tem:Project_ID>');
    //     sb.Append('<tem:Document_No>' + Document_No + '</tem:Document_No>');
    //     sb.Append('<tem:mainContractor>' + mainContractor + '</tem:mainContractor>');
    //     sb.Append('<tem:contractVal>' + Format(contractsum) + '</tem:contractVal>');
    //     sb.Append('<tem:contractNo>' + Document_No + '</tem:contractNo>');
    //     sb.Append('<tem:certNo>' + Format(ipcnumber) + '</tem:certNo>');
    //     sb.Append('<tem:date>' + Format(projectstartdate) + '</tem:date>');
    //     sb.Append('<tem:prev>' + Format(settedamount) + '</tem:prev>');
    //     sb.Append('</tem:GenerateCert>');
    //     sb.Append('</soapenv:Body>');
    //     sb.Append('</soapenv:Envelope>');
    //     sbStr := DelChr(sb.ToString(), '=', '&');
    //     uriObj := uriObj.Uri('http://192.168.1.40:8047/KuraExcel.asmx');
    //     lgRequest := lgRequest.CreateDefault(uriObj);
    //     lgRequest.Method := 'POST';
    //     lgRequest.ContentType := 'text/xml';
    //     lgRequest.Headers.Add('SOAPAction', 'http://tempuri.org/GenerateCert');
    //     lgRequest.Credentials := credentials.DefaultCredentials;
    //     lgRequest.Timeout := 120000;
    //     stream := stream.StreamWriter(lgRequest.GetRequestStream());
    //     stream.Write(sbStr);
    //     stream.Close();
    //     lgResponse := lgRequest.GetResponse();
    // end;



    // procedure ImportTemplate_(filename: Text; Project_ID: Text; Document_No: Text)
    // var
    //     "**mscorlib**": Integer;
    //     sb: dotnet StringBuilder;
    //     stream: dotnet StreamWriter;
    //     str: dotnet Stream;
    //     ascii: dotnet Encoder;
    //     "**System**": Integer;
    //     uriObj: dotnet Uri;
    //     lgRequest: dotnet HttpWebRequest;
    //     lgResponse: dotnet HttpWebResponse;
    //     reader: dotnet XmlTextReader;
    //     document: dotnet XmlDocument;
    //     credentials: dotnet CredentialCache;
    //     sbStr: Text;
    // begin
    //     sb := sb.StringBuilder();
    //     sb.Append('<?xml version="1.0" encoding="utf-8"?>');
    //     sb.Append('<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">');
    //     sb.Append('<soap:Body>');
    //     sb.Append('<ReadDoc xmlns="http://tempuri.org/">');
    //     sb.Append('<filename>' + filename + '</filename>');
    //     sb.Append('<Project_ID>' + Project_ID + '</Project_ID>');
    //     sb.Append('<Document_No>' + Document_No + '</Document_No>');
    //     sb.Append('</ReadDoc>');
    //     sb.Append('</soap:Body>');
    //     sb.Append('</soap:Envelope>');
    //     sbStr := DelChr(sb.ToString(), '=', '&');
    //     uriObj := uriObj.Uri('http://192.168.1.65:8047/KuraExcel.asmx');
    //     lgRequest := lgRequest.Create(uriObj);
    //     lgRequest.Method := 'POST';
    //     lgRequest.ContentType := 'text/xml; charset=utf-8';
    //     lgRequest.Headers.Add('SOAPAction', 'http://tempuri.org/ReadDoc');
    //     lgRequest.Credentials := credentials.DefaultCredentials;
    //     lgRequest.Timeout := 120000;
    //     stream := stream.StreamWriter(lgRequest.GetRequestStream());
    //     stream.Write(sbStr);
    //     stream.Close();
    //     lgResponse := lgRequest.GetResponse();
    // end;

    // procedure ImportTemplate_Test(filename: Text; Project_ID: Text; Document_No: Text)
    // var
    //     sb: DotNet StringBuilder;
    //     stream: DotNet StreamWriter;
    //     str: DotNet Stream;
    //     uriObj: DotNet Uri;
    //     lgRequest: DotNet HttpWebRequest;
    //     lgResponse: DotNet HttpWebResponse;
    //     reader: DotNet XmlTextReader;
    //     document: DotNet XmlDocument;
    //     credentials: DotNet CredentialCache;
    //     sbStr: Text;
    // begin
    //     sb := sb.StringBuilder();
    //     sb.Append('<?xml version="1.0" encoding="utf-8"?>');
    //     sb.Append('<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">');
    //     sb.Append('<soap:Body>');
    //     sb.Append('<ReadDoc xmlns="http://tempuri.org/">');
    //     sb.Append('<filename>' + filename + '</filename>');
    //     sb.Append('<Project_ID>' + Project_ID + '</Project_ID>');
    //     sb.Append('<Document_No>' + Document_No + '</Document_No>');
    //     sb.Append('</ReadDoc>');
    //     sb.Append('</soap:Body>');
    //     sb.Append('</soap:Envelope>');
    //     sbStr := DelChr(sb.ToString(), '=', '&');
    //     uriObj := uriObj.Uri('http://192.168.1.40:8047/KuraExcel.asmx');
    //     lgRequest := lgRequest.Create(uriObj);
    //     lgRequest.Method := 'POST';
    //     lgRequest.ContentType := 'text/xml; charset=utf-8';
    //     lgRequest.Headers.Add('SOAPAction', 'http://tempuri.org/ReadDoc');
    //     lgRequest.Credentials := credentials.DefaultCredentials;
    //     lgRequest.Timeout := 120000;
    //     stream := stream.StreamWriter(lgRequest.GetRequestStream());
    //     stream.Write(sbStr);
    //     stream.Close();
    //     lgResponse := lgRequest.GetResponse();
    // end;


    procedure FnGeneratePreviousIPC(VendorNumber: Code[20]; documentno: Code[20]; projectid: Code[20]; projectname: Text) status: Text
    var
        ContractorRequestTask: Record "Contractor Request Task";
        Name: Text;
        ReturnValue: Boolean;
        TempFile: File;
        ToFile: Variant;
        NewStream: InStream;
        FilePath: label 'C:\QuickPay\ExcelTemplates\TempFiles\';
        Filepath2: label 'C:\inetpub\wwwroot\kerrarms\Downloads\';
        contractperiod: Integer;
        ContractorRequestPlanLine: Record "Contractor Request Plan Line";
        MeasurementsPaymentsHeader: Record "Measurement &  Payment Header";
        maincontractor: Text;
        contractsum: Decimal;
        ipcnumber: Integer;
        settedamount: Decimal;
        projectstartdate: Date;
        projectEndDate: Date;
    begin

        ContractorRequestTask.Reset;
        ContractorRequestTask.SetRange(ContractorRequestTask."Job No.", projectid);
        ContractorRequestTask.SetRange(ContractorRequestTask."Document No.", documentno);
        if not ContractorRequestTask.Find('-') then begin
            Error('No Bill Categories added');
        end;

        ContractorRequestPlanLine.Reset;
        ContractorRequestPlanLine.SetRange(ContractorRequestPlanLine."Job No.", projectid);
        ContractorRequestPlanLine.SetRange(ContractorRequestPlanLine."Document No.", documentno);
        if not ContractorRequestPlanLine.Find('-') then begin
            Error('No Bill Items added');
        end;

        MeasurementsPaymentsHeader.Reset;
        MeasurementsPaymentsHeader.SetRange(MeasurementsPaymentsHeader."Project ID", projectid);
        MeasurementsPaymentsHeader.SetRange(MeasurementsPaymentsHeader."Document No.", documentno);
        if MeasurementsPaymentsHeader.Find('-') then begin
            projectstartdate := MeasurementsPaymentsHeader."Project Start Date";
            projectEndDate := MeasurementsPaymentsHeader."Project End Date";
            contractperiod := projectEndDate - projectstartdate;

            maincontractor := MeasurementsPaymentsHeader."Contractor Name";
            contractsum := MeasurementsPaymentsHeader."Contract Sum";
            ipcnumber := MeasurementsPaymentsHeader."IPC Number";
            settedamount := MeasurementsPaymentsHeader."Settled Amount";
            //   settedamount := MeasurementsPaymentsHeader.Total;

        end;
        // ///  GenerateTemplateNew(documentno, projectid, documentno, maincontractor, contractsum, contractperiod, ipcnumber, settedamount, projectstartdate);

        TempFile.Open(FilePath + documentno + '.xlsx');
        TempFile.CreateInstream(NewStream);

        ToFile := ContractorRequestTask."Document No." + '.xlsx';

        ReturnValue := DownloadFromStream(
          NewStream,
          'Save File to RoleTailored Client',
          '',
          'Excel Files (*.xlsx;*.xls)|*.xlsx;*.xls',
          ToFile);

        TempFile.Close();
    end;

    procedure FnGeneratePreviousIPCTest(VendorNumber: Code[20]; documentno: Code[20]; projectid: Code[20]; projectname: Text) status: Text
    var
        ContractorRequestTask: Record "Contractor Request Task";
        Name: Text;
        ReturnValue: Boolean;
        TempFile: File;
        ToFile: Variant;
        NewStream: InStream;
        FilePath: label 'C:\QuickPay\ExcelTemplates\TempFiles\';
        Filepath2: label 'C:\inetpub\wwwroot\kerrarms\Downloads\';
        contractperiod: Integer;
        ContractorRequestPlanLine: Record "Contractor Request Plan Line";
        MeasurementsPaymentsHeader: Record "Measurement &  Payment Header";
        maincontractor: Text;
        contractsum: Decimal;
        ipcnumber: Integer;
        settedamount: Decimal;
        projectstartdate: Date;
        projectEndDate: Date;
    begin

        ContractorRequestTask.Reset;
        ContractorRequestTask.SetRange(ContractorRequestTask."Job No.", projectid);
        ContractorRequestTask.SetRange(ContractorRequestTask."Document No.", documentno);
        if not ContractorRequestTask.Find('-') then begin
            Error('No Bill Categories added');
        end;

        ContractorRequestPlanLine.Reset;
        ContractorRequestPlanLine.SetRange(ContractorRequestPlanLine."Job No.", projectid);
        ContractorRequestPlanLine.SetRange(ContractorRequestPlanLine."Document No.", documentno);
        if not ContractorRequestPlanLine.Find('-') then begin
            Error('No Bill Items added');
        end;

        MeasurementsPaymentsHeader.Reset;
        MeasurementsPaymentsHeader.SetRange(MeasurementsPaymentsHeader."Project ID", projectid);
        MeasurementsPaymentsHeader.SetRange(MeasurementsPaymentsHeader."Document No.", documentno);
        if MeasurementsPaymentsHeader.Find('-') then begin
            projectstartdate := MeasurementsPaymentsHeader."Project Start Date";
            projectEndDate := MeasurementsPaymentsHeader."Project End Date";
            contractperiod := projectEndDate - projectstartdate;

            maincontractor := MeasurementsPaymentsHeader."Contractor Name";
            contractsum := MeasurementsPaymentsHeader."Contract Sum";
            ipcnumber := MeasurementsPaymentsHeader."IPC Number";
            settedamount := MeasurementsPaymentsHeader."Settled Amount";
            //   settedamount := MeasurementsPaymentsHeader.Total;

        end;
        // GenerateTemplateNewTest(documentno, projectid, documentno, maincontractor, contractsum, contractperiod, ipcnumber, settedamount, projectstartdate);

        TempFile.Open(FilePath + documentno + '.xlsx');
        TempFile.CreateInstream(NewStream);

        ToFile := ContractorRequestTask."Document No." + '.xlsx';

        ReturnValue := DownloadFromStream(
          NewStream,
          'Save File to RoleTailored Client',
          '',
          'Excel Files (*.xlsx;*.xls)|*.xlsx;*.xls',
          ToFile);

        TempFile.Close();
    end;

    // procedure ImportIPCDocument(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]; vendorno: Code[20]; projectid: Code[50]; projectname: Text) status: Text
    // var
    //     ContractorRequestTask: Record "Contractor Request Task";
    //     InputFile: File;
    //     InPutStream: InStream;
    //     OutPutStream: OutStream;
    //     RecordIDNumber: RecordID;
    //     MeasurementPaymentHeader: Record "Measurement &  Payment Header";
    // begin
    //     MeasurementPaymentHeader.Reset;
    //     MeasurementPaymentHeader.SetRange("Document No.", applicationNo);
    //     if MeasurementPaymentHeader.FindFirst() then begin
    //         RecordIDNumber := MeasurementPaymentHeader.RecordId;
    //         ImportTemplate_(fileName, projectid, applicationNo);
    //         // UploadCPRExportedForImport(DMSDocuments."document type"::"Maintenance Requisition", applicationNo, 'Contractor Payment Request', RecordIDNumber, ContractorRequestTask."Region ID", path, fileName);
    //         MeasurementPaymentHeader.Import := true;
    //         MeasurementPaymentHeader.Modify();
    //     end;

    // end;
    procedure ImportIPCDocument(applicationNo: Code[20]; fileName: Text[100]; projectid: Code[50]) status: Text
    var
        MeasurementPaymentHeader: Record "Measurement &  Payment Header";
        RecordIDNumber: RecordID;
    begin
        MeasurementPaymentHeader.Reset;
        MeasurementPaymentHeader.SetRange("Document No.", applicationNo);
        if MeasurementPaymentHeader.FindFirst() then begin
            RecordIDNumber := MeasurementPaymentHeader.RecordId;
            //  ImportTemplate_(fileName, projectid, applicationNo);
            // UploadCPRExportedForImport(DMSDocuments."document type"::"Maintenance Requisition", applicationNo, 'Contractor Payment Request', RecordIDNumber, ContractorRequestTask."Region ID", path, fileName);
            MeasurementPaymentHeader.Import := true;
            MeasurementPaymentHeader.Modify();
            status := 'success*Your document uploaded successfully!';
        end;
    END;

    procedure ImportIPCDocumentTest(applicationNo: Code[20]; fileName: Text[100]; projectid: Code[50]) status: Text
    var
        MeasurementPaymentHeader: Record "Measurement &  Payment Header";
        RecordIDNumber: RecordID;
    begin
        MeasurementPaymentHeader.Reset;
        MeasurementPaymentHeader.SetRange("Document No.", applicationNo);
        if MeasurementPaymentHeader.FindFirst() then begin
            RecordIDNumber := MeasurementPaymentHeader.RecordId;
            ///   ImportTemplate_Test(fileName, projectid, applicationNo);
            // UploadCPRExportedForImport(DMSDocuments."document type"::"Maintenance Requisition", applicationNo, 'Contractor Payment Request', RecordIDNumber, ContractorRequestTask."Region ID", path, fileName);
            MeasurementPaymentHeader.Import := true;
            MeasurementPaymentHeader.Modify();
            status := 'success*Your document uploaded successfully!';
        end;
    END;


    procedure UploadCPRExportedForImport(DocumentType: Option; DocNo: Code[50]; DocDesc: Text; TabID: RecordID; region: Code[100]; filepath: Text; fname: Text): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record "DMS Document Lines";
        FileName: Text[250];
        //  xmlWriter: dotnet XmlTextWriter;
        EncodingText: dotnet Encoding;
        Docname: Text;
        Filer: Codeunit "File Management";
        FileName2: Text;
        DocLink: Record "Record Link";
        FileDesc: Text;
        FileWriter: OutStream;
        File1: File;
        XmlFileName: Text;
        CashManagementSetup: Record "Cash Management Setup";
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            // FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName := fname;
            FileName2 := filepath;
            FileDesc := Filer.GetFileName(FileName);
            // Filer.CopyClientFile(FileName,FileName2,TRUE);
            // Filer.MoveFile(FileName2,'C:\QuickPay\ExcelTemplates\TempFilesImport\'+FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            // DocLink.Init;
            // DocLink."Link ID":=0;
            // DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+region+'/'+CashManagementSetup."Imprest Surrender DMS Link"+'/'
            // +Docname+'/'+FileDesc;
            // DocLink.Description:=FileDesc;
            // DocLink.Type:=DocLink.Type::Link;
            // DocLink.Company:=COMPANYNAME;
            // DocLink."Base URL":='/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+region+'/'+CashManagementSetup."Imprest Surrender DMS Link";
            // DocLink."Document No":=DocNo;
            // DocLink.LocalUrl:=FileName2;
            // DocLink."User ID":=UserId;
            // DocLink."Fetch To Sharepoint":=true;
            // DocLink."Uploaded To SharePoint":=false;
            // DocLink."SP URL Returned":='';
            // DocLink.Created:=CreateDatetime(Today,Time);
            // DocLink."Record ID":=TabID;
            // DocLink.Insert(true);

            //Create Xml Document
            /* CashManagementSetup.RESET;
             CashManagementSetup.GET;
               IF DocLines.FIND('-') THEN BEGIN
                 XmlFileName:='C:\QuickPay\ExcelTemplates\TempFilesImport\'+FileDesc+'.xml';
                 FileName :='C:\QuickPay\ExcelTemplates\TempFilesImport'+FileDesc+'.xml';
                 //FileName :=Docname+'.xml';
                  IF ISNULL(xmlWriter) THEN
                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                 xmlWriter.WriteStartDocument();
                 //Create Parent element
                 xmlWriter.WriteStartElement('Columns');
                 xmlWriter.WriteStartElement('Params');
                 xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                 xmlWriter.WriteElementString('Region',region);
                 xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+region+'/'+CashManagementSetup."Staff Claims DMS Link"+'/'+Docname);
                 xmlWriter.WriteEndElement();
                 xmlWriter.WriteStartElement('Files');
                 xmlWriter.WriteElementString('Filename',FileDesc);
                 xmlWriter.WriteEndElement();
                  //Region Metadata
                 xmlWriter.WriteStartElement('Column');
                 // REPEAT
                 //Create Child elements
                 xmlWriter.WriteElementString('Title','Region');
                 xmlWriter.WriteElementString('Value',region);
                 //End writing top element and XML document
                 xmlWriter.WriteEndElement();
                //Constituency Metadata
                 xmlWriter.WriteStartElement('Column');
                 xmlWriter.WriteElementString('Title','Constituency');
                 xmlWriter.WriteElementString('Value','');
                 xmlWriter.WriteEndElement();
                 //Employee Metadata
                 xmlWriter.WriteStartElement('Column');
                 xmlWriter.WriteElementString('Title','Employee');
                 xmlWriter.WriteElementString('Value',USERID);
                 xmlWriter.WriteEndElement();
                 xmlWriter.WriteEndDocument();
                 xmlWriter.Close();
                 END;*/
            // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            //   Filer.MoveFiles(FileName2,'C:\QuickPay\ExcelTemplates\TempFilesImport\'+FileDesc+'.xml');
        end;


        Message('Documents Uploaded Successffully');


    end;

    procedure FnGetMaximumAdvanceAmount(contractid: Code[50]) amount: Decimal
    var
        PurchaseHeader: Record "Purchase Header";
        PurchaseContractSignatory: Record "Purchase Contract Signatory";
    begin
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange(PurchaseHeader."No.", contractid);
        if PurchaseHeader.FindSet then begin

        end;
        PurchaseContractSignatory.Reset;
        PurchaseContractSignatory.SetRange(PurchaseContractSignatory.No, contractid);
        if PurchaseContractSignatory.FindSet then begin

            amount := (PurchaseHeader."Advance Payment Rate" / 100) * (PurchaseHeader."Award Tender Sum Inc Taxes");
        end;
    end;

    procedure fnSubmitEquipmentRepair(documentNumber: Code[50]; vendorno: Code[20]; projectid: Code[50]) status: Text
    var
        EquipmentRepair: Record "Equipment Repair Tracking";
    begin
        EquipmentRepair.Reset;
        EquipmentRepair.SetRange("Document No", documentNumber);
        if EquipmentRepair.FindSet then begin
            EquipmentRepair."Document No" := documentNumber;
            EquipmentRepair."Document Type" := EquipmentRepair."document type"::"Repair and Maintainance";
            EquipmentRepair."Contractor No" := vendorno;
            EquipmentRepair."Project No" := projectid;


            if EquipmentRepair.Modify(true) then begin
                EquipmentRepair.Validate("Project No");
                status := 'success*' + EquipmentRepair."Document No" + '*Equipment Repair Tracking Details Was Successfully Modified!';
            end else begin
                status := 'danger*Equipment Repair Tracking Details Was Successfully Modified!';
            end;
        end else begin
            EquipmentRepair.Init;
            EquipmentRepair.Reset;
            EquipmentRepair."Project No" := projectid;
            EquipmentRepair."Contractor No" := vendorno;
            EquipmentRepair."Document Type" := EquipmentRepair."document type"::"Repair and Maintainance";

            if EquipmentRepair.Insert(true) then begin
                EquipmentRepair.Validate("Project No");
                EquipmentRepair.Modify;
                status := 'success*' + EquipmentRepair."Document No" + '*Equipment Repair Tracking Details Was Successfully Modified!';
            end else begin
                status := 'danger*Equipment Repair Tracking Details Was Successfully Modified!';


            end;
        end;
    end;

    procedure fnSubmitEquipmentRepairLine(documentNumber: Code[50]; vendorno: Code[20]; equipmentno: Code[50]; maintenancedate: Date; returndate: Date; additionalremarks: Text; entryno: Integer) status: Text
    var
        EquipmentRepairLine: Record "Equipment Repair Line";
    begin

        EquipmentRepairLine.Reset;
        EquipmentRepairLine.SetRange("Line No.", entryno);
        EquipmentRepairLine.SetRange("Document No.", documentNumber);
        if EquipmentRepairLine.FindSet then begin
            // EquipmentRepairLine."Document No.":=documentNumber;
            //  EquipmentRepairLine."Document Type":=EquipmentRepairLine."Document Type"::"Repair and Maintainance";
            //  EquipmentRepairLine."Equipment No.":=equipmentno;
            // EquipmentRepairLine."Maintenance Start Date":=maintenancedate;
            EquipmentRepairLine."Expected Return Date" := returndate;
            EquipmentRepairLine."Additional Remarks" := additionalremarks;

            if EquipmentRepairLine.Modify(true) then begin
                //EquipmentRepairLine.VALIDATE("Equipment No.");
                status := 'success*' + EquipmentRepairLine."Document No." + '*Equipment Repair Line Details Was Successfully Modified!';
            end else begin
                status := 'danger*Equipment Repair Line Details could not be Modified!';
            end;
        end else begin
            EquipmentRepairLine.Init;
            EquipmentRepairLine.Reset;
            EquipmentRepairLine."Document No." := documentNumber;
            EquipmentRepairLine."Document Type" := EquipmentRepairLine."document type"::"Repair and Maintainance";
            EquipmentRepairLine."Equipment No." := equipmentno;
            EquipmentRepairLine."Maintenance Start Date" := maintenancedate;
            EquipmentRepairLine."Expected Return Date" := returndate;
            EquipmentRepairLine."Additional Remarks" := additionalremarks;

            if EquipmentRepairLine.Insert(true) then begin
                EquipmentRepairLine.Validate("Equipment No.");
                EquipmentRepairLine.Modify;
                status := 'success*' + EquipmentRepairLine."Document No." + '*Equipment Repair Line Details Was Successfully Modified!';
            end else begin
                status := 'danger*Equipment Repair Line Details Was Successfully Modified!';


            end;
        end;
    end;

    procedure FnGetLoginType(vendorNo: Code[20]; authenticationemail: Text) status: Text
    var
        PortalUser: Record "Dynasoft Portal User";
    begin
        PortalUser.Reset;
        PortalUser.SetRange("Record ID", vendorNo);
        PortalUser.SetRange("Authentication Email", authenticationemail);
        if PortalUser.Find('-') then begin
            status := Format(PortalUser."Login Type");
        end;
    end;

    procedure FnGetReportSubmissions(var VarAll: BigText; vendorNo: Code[20]; projectno: Code[20]; documenttype: Integer)
    var
        ReportSubmissionHeader: Record "Report Submission Header";
    begin
        Clear(VarAll);
        ReportSubmissionHeader.Reset;
        ReportSubmissionHeader.SetRange(ReportSubmissionHeader."Consultant No.", vendorNo);
        ReportSubmissionHeader.SetRange(ReportSubmissionHeader.Status, ReportSubmissionHeader.Status::Open);
        if ReportSubmissionHeader.Find('-') then begin
            repeat

                VarAll.AddText('::::' + ReportSubmissionHeader."Document No." + '* ' + Format(ReportSubmissionHeader."Report Type") + '* ' +
                Format(ReportSubmissionHeader."Contract Sum") + '* ' + Format(ReportSubmissionHeader."Study/Survey Type") + '* ' +
                Format(ReportSubmissionHeader.Status) + '* ' + ReportSubmissionHeader."Committee No." + '* ' + ReportSubmissionHeader."Purchase Contract ID" + '* ' +
                Format(ReportSubmissionHeader."Document Date") + '* ' + ReportSubmissionHeader."Project ID" + '* ' + ReportSubmissionHeader."Project Name");
            until ReportSubmissionHeader.Next = 0;

        end;
    end;

    procedure FnGetReportSubmissionsDetails(var VarAll: BigText; vendorNo: Code[20]; documentno: Code[20])
    var
        ReportSubmissionHeader: Record "Report Submission Header";
    begin
        Clear(VarAll);
        ReportSubmissionHeader.Reset;
        ReportSubmissionHeader.SetRange(ReportSubmissionHeader."Consultant No.", vendorNo);
        ReportSubmissionHeader.SetRange(ReportSubmissionHeader."Document No.", documentno);
        if ReportSubmissionHeader.Find('-') then begin
            repeat

                VarAll.AddText('::::' + ReportSubmissionHeader."Document No." + '* ' + Format(ReportSubmissionHeader."Report Type") + '* ' +
                Format(ReportSubmissionHeader."Contract Sum") + '* ' + Format(ReportSubmissionHeader."Study/Survey Type") + '* ' +
                Format(ReportSubmissionHeader.Status) + '* ' + ReportSubmissionHeader."Committee No." + '* ' + ReportSubmissionHeader."Purchase Contract ID" + '* ' +
                Format(ReportSubmissionHeader."Document Date") + '* ' + ReportSubmissionHeader."Project ID" + '* ' + ReportSubmissionHeader."Project Name");
            until ReportSubmissionHeader.Next = 0;

        end;
    end;

    procedure fnSubmitReportSubmissions(documentNumber: Code[50]; vendorno: Code[20]; projectid: Code[50]; reporttype: Code[50]) status: Text
    var
        ReportSubmissionHeader: Record "Report Submission Header";
    begin
        ReportSubmissionHeader.Reset;
        ReportSubmissionHeader.SetRange("Document No.", documentNumber);
        if ReportSubmissionHeader.FindSet then begin
            ReportSubmissionHeader."Document No." := documentNumber;
            ReportSubmissionHeader."Report Type" := reporttype;
            ReportSubmissionHeader."Consultant No." := vendorno;
            ReportSubmissionHeader."Project ID" := projectid;


            if ReportSubmissionHeader.Modify(true) then begin
                ReportSubmissionHeader.Validate("Project ID");
                ReportSubmissionHeader.Validate("Consultant No.");
                status := 'success*' + ReportSubmissionHeader."Document No." + '*Report Submission Details Was Successfully Modified!';
            end else begin
                status := 'danger*Report Submission Details Was Successfully Modified!';
            end;
        end else begin
            ReportSubmissionHeader.Init;
            ReportSubmissionHeader.Reset;
            ReportSubmissionHeader."Project ID" := projectid;
            ReportSubmissionHeader."Report Type" := reporttype;
            ReportSubmissionHeader."Consultant No." := vendorno;


            if ReportSubmissionHeader.Insert(true) then begin
                ReportSubmissionHeader.Validate("Project ID");
                ReportSubmissionHeader.Validate("Consultant No.");
                ReportSubmissionHeader.Modify;
                status := 'success*' + ReportSubmissionHeader."Document No." + '*Report Submission Details Was Successfully Modified!';
            end else begin
                status := 'danger*Report Submission Details Was Successfully Modified!';


            end;
        end;
    end;

    procedure FnGetReportTypes(var VarAll: BigText; projecttype: Integer)
    var
        ReportTypes: Record "Studies/Surveys&Design Report";
    begin
        Clear(VarAll);
        ReportTypes.Reset;
        ReportTypes.SetRange(ReportTypes."Project Type", projecttype);
        if ReportTypes.Find('-') then begin
            repeat
                VarAll.AddText('::::' + ReportTypes."Report Type" + '* ' + ReportTypes.Description);
            until ReportTypes.Next = 0;

        end;
    end;

    procedure FnGetCostClaimLines(var VarAll: BigText; vendorNo: Code[20]; documentno: Code[20]; documenttype: Integer)
    var
        CostClaimLines: Record "Cost Claim Lines";
    begin
        Clear(VarAll);
        CostClaimLines.Reset;
        CostClaimLines.SetRange(CostClaimLines."Document No.", documentno);
        if CostClaimLines.Find('-') then begin
            repeat

                VarAll.AddText('::::' + CostClaimLines."Document No." + '* ' + Format(CostClaimLines."Document Type") + '* ' +
                Format(CostClaimLines."Line No") + '* ' + CostClaimLines."Cause of Overrun" + '* ' +
                Format(CostClaimLines."Cost Claim Requested Amount") + '* ' + Format(CostClaimLines."Cost Claim Approved Amount") + '* ' + Format(CostClaimLines.Status));
            until CostClaimLines.Next = 0;

        end;
    end;

    procedure FnGetQualityManagementPlans(var VarAll: BigText; vendorNo: Code[20]; projectno: Code[20]; documenttype: Integer)
    var
        ReportSubmissionHeader: Record "Report Submission Header";
    begin
        Clear(VarAll);
        ReportSubmissionHeader.Reset;
        ReportSubmissionHeader.SetRange(ReportSubmissionHeader."Consultant No.", vendorNo);
        ReportSubmissionHeader.SetRange(ReportSubmissionHeader.Status, ReportSubmissionHeader.Status::Open);
        if ReportSubmissionHeader.Find('-') then begin
            repeat

                VarAll.AddText('::::' + ReportSubmissionHeader."Document No." + '* ' + Format(ReportSubmissionHeader."Report Type") + '* ' +
                Format(ReportSubmissionHeader."Contract Sum") + '* ' + Format(ReportSubmissionHeader."Study/Survey Type") + '* ' +
                Format(ReportSubmissionHeader.Status) + '* ' + ReportSubmissionHeader."Committee No." + '* ' + ReportSubmissionHeader."Purchase Contract ID" + '* ' +
                Format(ReportSubmissionHeader."Document Date") + '* ' + ReportSubmissionHeader."Project ID" + '* ' + ReportSubmissionHeader."Project Name");
            until ReportSubmissionHeader.Next = 0;

        end;
    end;

    procedure fnSubmitQualityManagementPlan(documentNumber: Code[50]; vendorno: Code[20]; projectid: Code[50]) status: Text
    var
        EquipmentRepair: Record "Equipment Repair Tracking";
    begin
        EquipmentRepair.Reset;
        EquipmentRepair.SetRange("Document No", documentNumber);
        if EquipmentRepair.FindSet then begin
            EquipmentRepair."Document No" := documentNumber;
            EquipmentRepair."Document Type" := EquipmentRepair."document type"::"Repair and Maintainance";
            EquipmentRepair."Contractor No" := vendorno;
            EquipmentRepair."Project No" := projectid;


            if EquipmentRepair.Modify(true) then begin
                EquipmentRepair.Validate("Project No");
                status := 'success*' + EquipmentRepair."Document No" + '*Equipment Repair Tracking Details Was Successfully Modified!';
            end else begin
                status := 'danger*Equipment Repair Tracking Details Was Successfully Modified!';
            end;
        end else begin
            EquipmentRepair.Init;
            EquipmentRepair.Reset;
            EquipmentRepair."Project No" := projectid;
            EquipmentRepair."Contractor No" := vendorno;
            EquipmentRepair."Document Type" := EquipmentRepair."document type"::"Repair and Maintainance";

            if EquipmentRepair.Insert(true) then begin
                EquipmentRepair.Validate("Project No");
                EquipmentRepair.Modify;
                status := 'success*' + EquipmentRepair."Document No" + '*Equipment Repair Tracking Details Was Successfully Modified!';
            end else begin
                status := 'danger*Equipment Repair Tracking Details Was Successfully Modified!';


            end;
        end;
    end;

    procedure fnSubmitInsuranceForNotification(vendornumber: Code[20]; Documentno: Code[50]) status: Text
    var
        InsuranceGuaranteeHeader: Record "Insurance/Guarantee Header";
    begin

        InsuranceGuaranteeHeader.Init;
        InsuranceGuaranteeHeader.SetRange(InsuranceGuaranteeHeader."Document No.", Documentno);
        if InsuranceGuaranteeHeader.Find('-') then begin

            Rec := InsuranceGuaranteeHeader;
            ProcurementProcessing.FnSendInsurerNotification(Rec);
            status := 'success*' + InsuranceGuaranteeHeader."Document No." + '*Document Was Successfully Submitted!';
        end else begin
            status := 'danger*Error while Submitting the Document!';

        end
    end;

    procedure fnSubmitNotificationtoRERequestForTakingOver(vendornumber: Code[20]; Documentno: Code[50]) status: Text
    var
        MeasurementsPaymentsHeader: Record "Measurement &  Payment Header";
    begin

        MeasurementsPaymentsHeader.Init;
        MeasurementsPaymentsHeader.SetRange(MeasurementsPaymentsHeader."Document No.", Documentno);
        if MeasurementsPaymentsHeader.Find('-') then begin
            MeasurementsPaymentsHeader."Portal Status" := MeasurementsPaymentsHeader."portal status"::Submitted;
            MeasurementsPaymentsHeader.Modify();

            Rec := MeasurementsPaymentsHeader;
            //Notify The RE that the Contractor has submitted a request for completion
            ProcurementProcessing.FnNotifyRERequestForTakingOver(Rec);

            status := 'success*' + MeasurementsPaymentsHeader."Document No." + '*Document Was Successfully Submitted!';
        end else begin
            status := 'danger*Error while Submitting the Document!';

        end
    end;

    procedure fnSubmitNotificationtoREMaterialTestRecord(vendornumber: Code[20]; Documentno: Code[50]) status: Text
    var
        MaterialTestRecord: Record "Material Test Record";
    begin

        MaterialTestRecord.Init;
        MaterialTestRecord.SetRange(MaterialTestRecord.Code, Documentno);
        if MaterialTestRecord.Find('-') then begin
            MaterialTestRecord."Portal Status" := MaterialTestRecord."portal status"::Submitted;

            MaterialTestRecord.Modify();

            Rec := MaterialTestRecord;
            //Notify The RE that the Contractor has submitted a request for completion
            ProcurementProcessing.FnNotifyRETestMaterialCert(Rec);

            status := 'success*' + MaterialTestRecord.Code + '*Document Was Successfully Submitted!';
        end else begin
            status := 'danger*Error while Submitting the Document!';

        end
    end;

    procedure fnSubmitNotificationtoRESiteAgentNomination(vendornumber: Code[20]; Documentno: Code[50]) status: Text
    var
        WEPContractorSubmission: Record "WEP Contractor Submission";
    begin

        WEPContractorSubmission.Init;
        WEPContractorSubmission.SetRange(WEPContractorSubmission."Document No", Documentno);
        if WEPContractorSubmission.Find('-') then begin
            WEPContractorSubmission."Portal Status" := WEPContractorSubmission."portal status"::Submitted;

            WEPContractorSubmission.Modify();

            Rec := WEPContractorSubmission;
            //Notify The RE that the Contractor has submitted a request for completion
            ProcurementProcessing.FnNotifyRESiteAgentNomination(Rec);

            status := 'success*' + WEPContractorSubmission."Document No" + '*Document Was Successfully Submitted!';
        end else begin
            status := 'danger*Error while Submitting the Document!';

        end
    end;

    procedure fnSubmitNotificationtoREContractorPersonnelAppointment(vendornumber: Code[20]; Documentno: Code[50]) status: Text
    var
        WEPContractorSubmission: Record "WEP Contractor Submission";
    begin

        WEPContractorSubmission.Init;
        WEPContractorSubmission.SetRange(WEPContractorSubmission."Document No", Documentno);
        if WEPContractorSubmission.Find('-') then begin
            WEPContractorSubmission."Portal Status" := WEPContractorSubmission."portal status"::Submitted;

            WEPContractorSubmission.Modify();

            Rec := WEPContractorSubmission;
            //Notify The RE that the Contractor has submitted a request for completion
            ProcurementProcessing.FnNotifyREContractorPersonnelAppointment(Rec);

            status := 'success*' + WEPContractorSubmission."Document No" + '*Document Was Successfully Submitted!';
        end else begin
            status := 'danger*Error while Submitting the Document!';

        end
    end;

    procedure fnSubmitNotificationtoREPlanofEquipmentDeliverytoSite(vendornumber: Code[20]; Documentno: Code[50]) status: Text
    var
        WEPContractorSubmission: Record "WEP Contractor Submission";
    begin

        WEPContractorSubmission.Init;
        WEPContractorSubmission.SetRange(WEPContractorSubmission."Document No", Documentno);
        if WEPContractorSubmission.Find('-') then begin
            WEPContractorSubmission."Portal Status" := WEPContractorSubmission."portal status"::Submitted;
            WEPContractorSubmission.Modify();
            Rec := WEPContractorSubmission;

            //Notify The RE that the Contractor has submitted a request for completion
            ProcurementProcessing.FnNotifyREPlanOfEquipmentDeliveryToSite(Rec);

            status := 'success*' + WEPContractorSubmission."Document No" + '*Document Was Successfully Submitted!';
        end else begin
            status := 'danger*Error while Submitting the Document!';

        end
    end;

    procedure FnGetTakingOverSections(var VarAll: BigText; vendorNo: Code[20]; documentno: Code[30])
    var
        TakeOverSections: Record "Taking Over Section";
    begin
        Clear(VarAll);
        TakeOverSections.Reset;
        TakeOverSections.SetRange(TakeOverSections."Inspection No", documentno);
        if TakeOverSections.Find('-') then begin
            repeat

                VarAll.AddText('::::' + TakeOverSections."Inspection No" + '* ' + Format(TakeOverSections."Document Type") + '* ' +
                Format(TakeOverSections."Line No") + '* ' + TakeOverSections."Road Code" + '* ' + TakeOverSections."Road Section No" + '* ' +
                TakeOverSections."Link Name" + '* ' + TakeOverSections."Section Name" + '* ' + Format(TakeOverSections."Start Chainage") + '* ' +
                Format(TakeOverSections."End Chainage") + '* ' + Format(TakeOverSections."Workplannned Length"));

            until TakeOverSections.Next = 0;

        end;
    end;

    procedure FnGetTakingOverSectionsLines(var VarAll: BigText; vendorNo: Code[20]; documentno: Code[30]; lineno: Integer)
    var
        TakeOverSectionLines: Record "Taking Over Section Line";
    begin
        Clear(VarAll);
        TakeOverSectionLines.Reset;
        TakeOverSectionLines.SetRange(TakeOverSectionLines."Document No", documentno);
        TakeOverSectionLines.SetRange(TakeOverSectionLines."Line No", lineno);
        if TakeOverSectionLines.Find('-') then begin
            repeat

                VarAll.AddText('::::' + TakeOverSectionLines."Document No" + '* ' + Format(TakeOverSectionLines."Document Type") + '* ' +
                Format(TakeOverSectionLines."Line No") + '* ' + Format(TakeOverSectionLines."Taking Over Start Chainage") + '* ' +
                Format(TakeOverSectionLines."Taking Over End Chainage") + '* ' + Format(TakeOverSectionLines."Taking Over Length") + '* ' + TakeOverSectionLines.Comments);

            until TakeOverSectionLines.Next = 0;

        end;
    end;

    procedure fnSubmitTakingOverSection(documentNumber: Code[50]; lineno: Integer; entryno: Integer; startchainage: Decimal; endchainage: Decimal; comments: Text) status: Text
    var
        TakeOverSectionLines: Record "Taking Over Section Line";
    begin

        TakeOverSectionLines.Reset;
        TakeOverSectionLines.SetRange("Document No", documentNumber);
        TakeOverSectionLines.SetRange("Line No", lineno);
        TakeOverSectionLines.SetRange("Entry No.", entryno);
        if TakeOverSectionLines.FindSet then begin
            TakeOverSectionLines."Line No" := lineno;
            TakeOverSectionLines."Document No" := documentNumber;
            TakeOverSectionLines."Document Type" := TakeOverSectionLines."document type"::"Contractor Request for Taking Over";
            TakeOverSectionLines."Taking Over Start Chainage" := startchainage;
            TakeOverSectionLines."Taking Over End Chainage" := endchainage;
            TakeOverSectionLines.Comments := comments;


            if TakeOverSectionLines.Modify(true) then begin
                TakeOverSectionLines.Validate("Taking Over End Chainage");
                status := 'success*' + TakeOverSectionLines."Document No" + '*Taken Over Section Details Was Successfully Modified!';
            end else begin
                status := 'danger*Taken Over Section Details Was Successfully Modified!';
            end;
        end else begin
            TakeOverSectionLines.Init;
            TakeOverSectionLines.Reset;
            TakeOverSectionLines."Document No" := documentNumber;
            TakeOverSectionLines."Line No" := lineno;
            TakeOverSectionLines."Document Type" := TakeOverSectionLines."document type"::"Contractor Request for Taking Over";
            TakeOverSectionLines."Taking Over Start Chainage" := startchainage;
            TakeOverSectionLines."Taking Over End Chainage" := endchainage;
            // IF comments = '' THEN
            TakeOverSectionLines.Comments := comments;

            if TakeOverSectionLines.Insert(true) then begin
                TakeOverSectionLines.Validate("Taking Over End Chainage");
                TakeOverSectionLines.Modify;
                status := 'success*' + TakeOverSectionLines."Document No" + '*Taken Over Section Details Was Successfully Modified!';
            end else begin
                status := 'danger*Taken Over Section Details Was Successfully Modified!';


            end;
        end;
    end;

    procedure FnGetInspectionSnagList(var VarAll: BigText; vendorNo: Code[20]; documentno: Code[30])
    var
        InspectionSnagList: Record "Inspection Snag List";
    begin
        Clear(VarAll);
        InspectionSnagList.Reset;
        InspectionSnagList.SetRange(InspectionSnagList."Inspection No", documentno);
        if InspectionSnagList.Find('-') then begin
            repeat

                VarAll.AddText('::::' + InspectionSnagList."Inspection No" + '* ' + Format(InspectionSnagList."Inspection Type") + '* ' +
                Format(InspectionSnagList."Item No") + '* ' + InspectionSnagList."Bill Item Code" + '* ' + Format(InspectionSnagList."Plan Line No") + '* ' +
                InspectionSnagList."Bill No" + '* ' + InspectionSnagList."Bill Description" + '* ' + Format(InspectionSnagList."Works Start Chainage") + '* ' +
                Format(InspectionSnagList."Works End Chainage") + '* ' + Format(InspectionSnagList."Due Date") + '* ' + InspectionSnagList."Additional Comments" + '* ' +
                Format(InspectionSnagList.Status) + '* ' + InspectionSnagList."Contractor Comments" + '* ' + InspectionSnagList."Project ID");

            until InspectionSnagList.Next = 0;

        end;
    end;

    procedure GetDocumentAttachment(tableId: Integer; No: Code[20]; RecID: Integer) BaseImage: Text
    var
        IStream: InStream;
        Bytes: dotnet Array;
        Convert: dotnet Convert;
        MemoryStream: dotnet MemoryStream;
        TenantMedia: Record "Tenant Media";
        imageID: GUID;
        docAttachment: Record "Document Attachment";
    begin
        docAttachment.Reset();
        docAttachment.SetRange("Table ID", tableId);
        docAttachment.SetRange("No.", No);
        docAttachment.SetRange(ID, RecID);
        if docAttachment.find('-') then begin
            if docAttachment."Document Reference ID".Hasvalue then begin
                imageID := docAttachment."Document Reference ID".MediaId;
                IF TenantMedia.GET(imageID) THEN BEGIN
                    TenantMedia.CALCFIELDS(Content);
                    TenantMedia.Content.CreateInstream(IStream);
                    MemoryStream := MemoryStream.MemoryStream();
                    CopyStream(MemoryStream, IStream);
                    Bytes := MemoryStream.GetBuffer();
                    BaseImage := Convert.ToBase64String(Bytes);
                END;
            end;
        end;
    end;

    procedure DeleteDocumentAttachment(DocNo: Code[20]; TableID: Integer; DocID: Integer)
    var
        DocAttachment: Record "Document Attachment";
    begin
        DocAttachment.Reset();
        DocAttachment.SetRange("Table ID", TableID);
        DocAttachment.SetRange("No.", DocNo);
        DocAttachment.SetRange(ID, DocID);
        if DocAttachment.Find('-') then begin
            if DocAttachment."Document Reference ID".HasValue then begin
                Clear(DocAttachment."Document Reference ID");
                DocAttachment.Modify(true);
            end;
            DocAttachment.Delete(true);
        end;
    end;

    procedure fnSubmitInspectionSnagList(documentNumber: Code[50]; planlineno: Integer; itemno: Integer; billitemcode: Code[50]; startchainage: Decimal; endchainage: Decimal; contractorcomments: Text; additionalcomments: Text; duedate: Date; projectid: Code[50]) status: Text
    var
        InspectionSnagList: Record "Inspection Snag List";
    begin

        InspectionSnagList.Reset;
        InspectionSnagList.SetRange("Inspection No", documentNumber);
        InspectionSnagList.SetRange("Plan Line No", planlineno);
        if InspectionSnagList.FindSet then begin
            InspectionSnagList."Plan Line No" := planlineno;
            InspectionSnagList."Inspection No" := documentNumber;
            InspectionSnagList."Inspection Type" := InspectionSnagList."inspection type"::"End of DLP Inspection";
            InspectionSnagList."Works Start Chainage" := startchainage;
            InspectionSnagList."Works End Chainage" := endchainage;
            InspectionSnagList."Contractor Comments" := contractorcomments;
            InspectionSnagList."Additional Comments" := additionalcomments;
            InspectionSnagList."Due Date" := duedate;


            if InspectionSnagList.Modify(true) then begin
                InspectionSnagList.Validate("Plan Line No");
                status := 'success*' + InspectionSnagList."Inspection No" + '*Inspection Snag List Details Was Successfully Modified!';
            end else begin
                status := 'danger*Inspection Snag List Details Was Successfully Modified!';
            end;
        end else begin
            InspectionSnagList.Init;
            InspectionSnagList.Reset;
            InspectionSnagList."Plan Line No" := planlineno;
            InspectionSnagList."Inspection No" := documentNumber;
            InspectionSnagList."Inspection Type" := InspectionSnagList."inspection type"::"End of DLP Inspection";
            InspectionSnagList."Works Start Chainage" := startchainage;
            InspectionSnagList."Works End Chainage" := endchainage;
            InspectionSnagList."Contractor Comments" := contractorcomments;
            InspectionSnagList."Additional Comments" := additionalcomments;
            InspectionSnagList."Due Date" := duedate;

            if InspectionSnagList.Insert(true) then begin
                InspectionSnagList.Validate("Plan Line No");
                InspectionSnagList.Modify;
                status := 'success*' + InspectionSnagList."Inspection No" + '*Inspection Snag List Details Was Successfully Modified!';
            end else begin
                status := 'danger*Inspection Snag List Details Was Successfully Modified!';


            end;
        end;
    end;

    procedure FnGetProjectRoadLinks(var VarAll: BigText; vendorNo: Code[20]; projectid: Code[50])
    var
        ProjectRoadLinks: Record "Project Road Link";
    begin
        Clear(VarAll);
        ProjectRoadLinks.Reset;
        ProjectRoadLinks.SetRange(ProjectRoadLinks."KeRRA Budget Code", DelChr(projectid, '<>'));
        ProjectRoadLinks.SetRange(ProjectRoadLinks."Global Budget Book Code", projectid);
        if ProjectRoadLinks.Find('-') then begin
            repeat

                VarAll.AddText('::::' + ProjectRoadLinks."Road Code" + '* ' + ProjectRoadLinks."KeRRA Road Code" + '* ' + ProjectRoadLinks."Link Name" + '* ' +
                Format(ProjectRoadLinks."Start Chainage(KM)") + '* ' + Format(ProjectRoadLinks."End Chainage(KM)") + '* ' + Format(ProjectRoadLinks."Workplanned Length(KM)") + '* ' +
                Format(ProjectRoadLinks."Authentic Road Reserve Width") + '* ' + Format(ProjectRoadLinks."Actual Road Reserve Width") + '* ' + ProjectRoadLinks."Road Class" + '* ' +
                ProjectRoadLinks."Current Pavement Surface Type" + '* ' + ProjectRoadLinks."New Pavement Surface Type" + '* ' + ProjectRoadLinks."Global Budget Book Code" + '* ' + ProjectRoadLinks."KeRRA Budget Code");
            until ProjectRoadLinks.Next = 0;
        end;
    end;

    procedure FngetCPRProjectNumber(documentno: Code[20]; ProjectNumber: Text)
    var
        ContractorPaymentRequest: Record "Measurement &  Payment Header";
    begin
        ContractorPaymentRequest.RESET;
        ContractorPaymentRequest.SETRANGE("Document No.", documentno);
        IF ContractorPaymentRequest.FINDLAST THEN BEGIN
            ProjectNumber := ContractorPaymentRequest."Project ID" + '*' + ContractorPaymentRequest."Project Name" + '*' + FORMAT(ContractorPaymentRequest."IPC Number")
         + '*' + FORMAT(ContractorPaymentRequest."Settled Amount") + '*' + FORMAT(ContractorPaymentRequest."Project Start Date") + '*' + ContractorPaymentRequest."Contract ID";
        END ELSE BEGIN
            ProjectNumber := '';
        END;
    end;

    procedure fnSubmitSubContractorDocRequestDetails(vendorno: Code[20]; documentNumber: Code[50]) status: Text
    var
        SubContractingHeader: Record "Subcontracting Header";
    begin
        SubContractingHeader.RESET;
        SubContractingHeader.SETRANGE("Document No", documentNumber);
        if SubContractingHeader.FINDSET then begin
            //  SubContractingHeader."Portal Status":=SubContractingHeader."Portal Status"::Submitted;

            if SubContractingHeader.MODIFY(TRUE) then begin
                status := 'success*' + SubContractingHeader."Document No" + '*Sub Contractor Request Details Was Successfully Modified!';
            end else begin
                status := 'danger*Sub Contractor Request Details Was Not Submitted!';
            end;
        end else begin
            status := 'danger*Sub Contractor Request Details Was Not Submitted!';
        end;
    end;

    procedure fnSubmitWorkPlanDetails(vendornumber: Code[20]; documentno: Code[30]) status: Text
    var
        WorkPlanHeader: Record "Work Plan Header";
    begin

        WorkPlanHeader.RESET;
        WorkPlanHeader.SETRANGE("Document No.", documentno);
        IF WorkPlanHeader.FIND('-') then begin
            WorkPlanHeader."Portal Status" := WorkPlanHeader."Portal Status"::Submitted;
            IF WorkPlanHeader.MODIFY(TRUE) then begin
                status := 'success*' + WorkPlanHeader."Document No." + '*Work Plan Was Successfully submitted!';
            end else begin
                status := 'danger*Error while submitting the Work Plan!';
            end;
        end else begin
            status := 'danger*Error while submitting the Work Plan!';
        end

    end;

    procedure fnSubmitProjectVariationHeaderDocDetails(vendornumber: Code[20]; DocumentNo: Code[50]) status: Text
    var
        ProjectVariationHeader: Record "Project Variation Header";
    begin

        ProjectVariationHeader.RESET;
        ProjectVariationHeader.SETRANGE("Document No.", DocumentNo);
        IF ProjectVariationHeader.FIND('-') then begin
            // ProjectVariationHeader."Portal Status":=ProjectVariationHeader."Portal Status"::Submitted; 
            IF ProjectVariationHeader.MODIFY(TRUE) then begin
                status := 'success*' + ProjectVariationHeader."Document No." + '*Request Details Was Successfully submitted!';
            end else begin
                status := 'danger*Error while submitting Request Details!!';
            end;
        end else begin
            status := 'danger*Error while submitting Request Details!!';
        end

    end;

    procedure fnLogin(var VarAll: BigText; authenticationemail: Text; password: Text)
    var
        PortalUsers: Record "Dynasoft Portal User";
    begin
        Clear(VarAll);
        PortalUsers.Reset;
        PortalUsers.SetRange(PortalUsers."Authentication Email", authenticationemail);
        PortalUsers.SetRange(PortalUsers."Password Value", password);
        if PortalUsers.FindSet() then begin
            repeat
                VarAll.AddText('::::' + PortalUsers."Full Name" + '* ' + Format(PortalUsers."User Name") + '* ' + PortalUsers."Mobile Phone No." + '* ' +
                Format(PortalUsers.State) + '* ' + PortalUsers."Authentication Email" + '* ' + PortalUsers."Password Value" + '* ' + PortalUsers."Record ID");
            until PortalUsers.Next = 0;
        end;
    end;

    procedure fnGetJobs(var VarAll: BigText; vendorno: Code[30]);
    var
        jobs: Record Job;
    begin
        Clear(VarAll);
        jobs.Reset;
        jobs.SetRange(jobs."Contractor No.", vendorno);
        if jobs.FindSet() then begin
            repeat
                VarAll.AddText('::::' + jobs."No." + '* ' + jobs.Description + '* ' + jobs.Division + '* ' +
              jobs."Directorate Code" + '* ' + Format(jobs."Starting Date") + '* ' + Format(jobs."Ending Date") + '* ' + jobs."Funding Source" + '* ' + jobs."Region ID" + '* ' +
               jobs."Constituency ID" + '* ' + jobs."Purchase Contract ID" + '* ' + jobs."Work Execution Plan ID" + '* ' + jobs."Road Code" + '* ' +
               jobs."County ID" + '* ' + jobs."Awarded Bid No" + '* ' + jobs."Project Commencement Order" + '* ' + Format(jobs."Project Budget") + '* ' +
               jobs."Contractor No." + '* ' + jobs."Contractor Name" + '* ' + jobs."Person Responsible" + '* ' + jobs."Project No" + '* ' +
               Format(jobs.Status) + '* ' + Format(jobs."Study/Survey Type") + '*' + Format(jobs."Project Type") + '* ' + jobs."Road Section No" + '* ' + Format(jobs."Total Road Section Length (KM)"));
            until jobs.Next = 0;

        end;
    end;

    procedure fnGetRoadSections(var VarAll: BigText; roadcode: Code[30]);
    var
        roadsections: Record "Road Section";
    begin
        Clear(VarAll);
        roadsections.Reset;
        roadsections.SetRange(roadsections."Road Code", roadcode);
        if roadsections.FindSet() then begin
            repeat
                VarAll.AddText('::::' + roadsections."Road Code" + '* ' + roadsections."Road Section No." + '* ' + Format(roadsections."Road Category") + '* ' +
              Format(roadsections."Carriageway Type") + '* ' + roadsections."Primary Constituency ID" + '* ' + roadsections."Primary Region ID" + '* ' +
               Format(roadsections."Start Chainage(KM)") + '* ' + Format(roadsections."End Chainage(KM)") + '* ' + Format(roadsections."Total Road Length (KMs)") + '* ' +
                Format(roadsections."Start Point Longitude") + '* ' + Format(roadsections."Start Point Latitude") + '* ' + Format(roadsections."End Point Longitude") + '* ' +
                 Format(roadsections."End Point Latitude") + '* ' + Format(roadsections."Paved Road Length (Km)") + '* ' + Format(roadsections."UnPaved Road Length (Km)"));
            until roadsections.Next = 0;

        end;
    end;

    procedure fnGetPurchaseHeader(var VarAll: BigText; vendorno: Code[30]);
    var
        purchaseheader: Record "Purchase Header";
    begin
        Clear(VarAll);
        purchaseheader.Reset;
        purchaseheader.SetRange(purchaseheader."Pay-to Vendor No.", vendorno);
        if purchaseheader.FindSet() then begin
            repeat
                VarAll.AddText('::::' + purchaseheader."No." + '* ' + purchaseheader.Description + '* ' + Format(purchaseheader."Document Type") + '* ' +
                 Format(purchaseheader."Contract Status") + '* ' + purchaseheader."Pay-to Vendor No." + '* ' + purchaseheader."Pay-to Name" + '* ' +
                  purchaseheader."Pay-to Address" + '* ' + purchaseheader."Pay-to Address 2" + '* ' + purchaseheader."Pay-to Contact" + '* ' +
                  purchaseheader."Your Reference" + '* ' + Format(purchaseheader."Order Date") + '* ' + Format(purchaseheader."Posting Date") + '* ' +
               purchaseheader."Location Code" + '* ' + purchaseheader.Region + '* ' + purchaseheader."Invitation For Supply No" + '* ' + purchaseheader."Tender Name" + '* ' +
               purchaseheader."Contract Description" + '* ' + Format(purchaseheader."Works Length (Km)") + '* ' + Format(purchaseheader."Contract Start Date") + '* ' +
                Format(purchaseheader."Contract End Date") + '* ' + Format(purchaseheader."Approved Requisition Amount") + '* ' + purchaseheader."VAT Registration No." + '* ' +
                Format(purchaseheader."Contingency Rate") + '* ' + Format(purchaseheader."Variation of Price %") + '* ' + Format(purchaseheader.Balance) + '* ' +
                Format(purchaseheader."Variation of Works Amount") + '* ' + Format(purchaseheader."Total Invoiced") + '* ' + Format(purchaseheader."PBRM Works Contract Sum") + '* ' +
                Format(purchaseheader."Upgrading Works Contract Sum") + '* ' + Format(purchaseheader."Contract Sum") + '* ' + Format(purchaseheader."Advance Payment Rate") + '* ' + purchaseheader."Pay-to Post Code" + '* ' + purchaseheader."Pay-to City" + '* ' + Format(purchaseheader."Commencement Date"));
            until purchaseheader.Next = 0;
        end;
    end;

    procedure fnGetProjectMobilizationHeader(var VarAll: BigText; vendorno: Code[30]);
    var
        mobilizationheader: Record "Project Mobilization Header";
    begin
        Clear(VarAll);
        mobilizationheader.Reset;
        mobilizationheader.SetRange(mobilizationheader."Contractor No.", vendorno);
        if mobilizationheader.FindSet() then begin
            repeat
                VarAll.AddText('::::' + mobilizationheader."Document No." + '* ' + mobilizationheader.Description + '* ' + Format(mobilizationheader.Status) + '* ' + Format(mobilizationheader."Document Type") + '* ' +
                 Format(mobilizationheader.Posted) + '* ' + Format(mobilizationheader."Document Date") + '* ' + mobilizationheader."Purchase Contract ID" + '* ' +
                 mobilizationheader."Project ID" + '* ' + mobilizationheader."Staff Appointment Voucher No." + '* ' + mobilizationheader."Contractor No." + '* ' +
                 mobilizationheader."Contractor Name" + '* ' + mobilizationheader."Vendor Address" + '* ' + mobilizationheader."Vendor Address 2" + '* ' +
                 mobilizationheader."Vendor Post Code" + '* ' + mobilizationheader."Vendor City" + '* ' + mobilizationheader."Primary E-mail" + '* ' +
                mobilizationheader."IFS Code" + '* ' + mobilizationheader."Tender Name" + '* ' + mobilizationheader."Project Name" + '* ' + mobilizationheader."Road Code" + '* ' +
                mobilizationheader."Road Section No." + '* ' + mobilizationheader."Section Name" + '* ' + mobilizationheader."Region ID" + '* ' +
                mobilizationheader."Directorate ID" + '* ' + mobilizationheader."Constituency ID" + '* ' + Format(mobilizationheader."Project Start Date") + '* ' +
                Format(mobilizationheader."Project End  Date") + '* ' + mobilizationheader."Commencement Order ID" + '* ' + Format(mobilizationheader."Portal Status") + '* ' + Format(mobilizationheader."Representative ID") + '* ' + Format(mobilizationheader."Acknowledgement Date") + '* ' +
              Format(mobilizationheader."Acknowledgement Status") + '* ' + mobilizationheader.Email + '* ' + mobilizationheader."Contract Signing Role");
            until mobilizationheader.Next = 0;
        end;
    end;

    procedure fnGetMeasurements(var VarAll: BigText; contractorNumber: Code[20]);
    var
        tbl_measurements: Record "Measurement &  Payment Header";
    begin
        tbl_measurements.Reset();
        tbl_measurements.SetRange("Contractor No", contractorNumber);
        if tbl_measurements.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + Format(tbl_measurements."Document No.") + '*' + Format(tbl_measurements."Document Type") + '*' +
                 Format(tbl_measurements."Payment Certificate Type") + '*' + Format(tbl_measurements.status) + '*' + Format(tbl_measurements."Portal Status") + '*' +
                 Format(tbl_measurements."Document Date") + '*' + Format(tbl_measurements."Project ID") + '*' + Format(tbl_measurements.Description) + '*' +
                  Format(tbl_measurements."Works Start Chainage") + '*' + Format(tbl_measurements."Works End Chainage") + '*' + tbl_measurements."Contractor No" + '*' +
                  tbl_measurements."Contractor Name" + '*' + tbl_measurements."Project Name" + '*' + Format(tbl_measurements."Road Section No.") + '*' +
                  Format(tbl_measurements."Project Start Date") + '*' + Format(tbl_measurements."Project End Date") + '*' + Format(tbl_measurements."Region ID") + '*' +
                  Format(tbl_measurements."Department ID") + '*' + Format(tbl_measurements."Directorate ID") + '*' +
                   Format(tbl_measurements."Constituency ID") + '*' + Format(tbl_measurements."IPC Number") + '*' + Format(tbl_measurements."Total Contract Sum"));
            until tbl_measurements.Next = 0;
        end;
    end;

    procedure fngetBidContractSecurity(var VarAll: BigText; vendorno: Code[20]);
    var
        signatory: Record "Bid_Contract Security Register";
    begin
        signatory.Reset();
        signatory.SetRange(signatory."Vendor No.", vendorno);
        signatory.SetRange(signatory.Blocked, false);
        if signatory.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + signatory."No." + '*' + Format(signatory."Security Type") + '*' + Format(signatory."Security ID") + '*' +
                 Format(signatory.Description) + '*' + Format(signatory."Reference No") + '*' + Format(signatory."Issuer Institution Type") + '*' +
                  Format(signatory."Issuer/Guarantor Name") + '*' + Format(signatory."Issuer Registered Offices") + '*' + Format(signatory."Form of Security") + '*' +
                   Format(signatory."Security Amount (LCY)") + '*' + Format(signatory."Bid Security Validity Expiry") + '*' +
                    Format(signatory."Bid Security Effective Date"));
            until signatory.Next = 0;
        end;
    end;

    procedure fnGetContractorRequestTask(var VarAll: BigText; documentno: Code[20]);
    var
        tbl_measurements: Record "Contractor Request Task";
    begin
        tbl_measurements.Reset();
        tbl_measurements.SetRange("Document No.", documentno);
        if tbl_measurements.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + Format(tbl_measurements."Document No.") + '*' + Format(tbl_measurements."Document Type") + '*' +
                 Format(tbl_measurements."Job No.") + '*' + Format(tbl_measurements."Job Task No.") + '*' + Format(tbl_measurements.Description) + '*' +
                 Format(tbl_measurements."Schedule (Total Cost)") + '*' + Format(tbl_measurements."Schedule (Total Price)") + '*' +
                 Format(tbl_measurements."Contract (Total Cost)") + '*' +
                  Format(tbl_measurements."Contract (Invoiced Cost)") + '*' + Format(tbl_measurements."Remaining (Total Cost)") + '*' +
                    Format(tbl_measurements."This Certificate Amount"));
            until tbl_measurements.Next = 0;
        end;
    end;

    procedure fnGetContractSupervisionRequirements(var VarAll: BigText; vendorno: Code[20]);
    var
        supervision: Record "Temporary Supervision Requirem";
    begin
        supervision.Reset();
        supervision.SetRange("Contractor No", vendorno);
        if supervision.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + supervision."Document No" + '*' + Format(supervision."Document Type") + '*' + Format(supervision.Status) + '*' +
                 Format(supervision."Document Date") + '*' + Format(supervision."Project No") + '*' + Format(supervision."Project Name") + '*' +
                  Format(supervision."Contract ID") + '*' + supervision."Contractor No" + '*' +
                  supervision."Contractor Name" + '*' + supervision."Work Execution Plan" + '*' + Format(supervision."Created By") + '*' +
                  Format(supervision."Created DateTime") + '*' + supervision."Rejection Remarks");
            until supervision.Next = 0;
        end;
    end;

    procedure fnGetContractSupervisionLines(var VarAll: BigText; documentno: Code[20]);
    var
        supervision: Record "Temporary Supervision Line";
    begin
        supervision.Reset();
        supervision.SetRange(supervision."Document No", documentno);
        if supervision.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + supervision."Document No" + '*' + Format(supervision."Document Type") + '*' + Format(supervision.Description) + '*' +
                 Format(supervision.No) + '*' + Format(supervision."Project ID") + '*' + Format(supervision."Task No.") + '*' +
                  Format(supervision."Line No") + '*' + supervision."Unit of Measure" + '*' + supervision.Comments + '*' +
                   supervision.No + '*' + Format(supervision."Provision Type") + '*' + Format(supervision."Reversion Type") + '*' +
                   Format(supervision.Quantity) + '*' + Format(supervision."Scheduled Date of Delivery") + '*' + Format(supervision."Acknowledgement Date") + '*' +
                    Format(supervision."Acknowledgement Details") + '*' + Format(supervision."Acknowledgment By"));
            until supervision.Next = 0;
        end;
    end;


    procedure fnGetProjectVariationHeader(var VarAll: BigText; vendorno: Code[30]);
    var
        mobilizationheader: Record "Project Variation Header";
    begin
        Clear(VarAll);
        mobilizationheader.Reset;
        mobilizationheader.SetRange(mobilizationheader."Contractor No.", vendorno);
        if mobilizationheader.FindSet() then begin
            repeat
                VarAll.AddText('::::' + mobilizationheader."Document No." + '*' + mobilizationheader.Description + '* ' + Format(mobilizationheader.Status) + '* ' +
                Format(mobilizationheader."Document Type") + '* ' + Format(mobilizationheader."Document Date") + '* ' +
                 Format(mobilizationheader.Posted) + '*' + Format(mobilizationheader."Document Date") + '*' + mobilizationheader."Purchase Contract ID" + '*' +
                 mobilizationheader."Project ID" + '*' + mobilizationheader."Project Name" + '*' + mobilizationheader."Contractor No." + '*' +
                 mobilizationheader."Contractor Name" + '* ' + mobilizationheader."Contractor Representative" + '* ' + mobilizationheader."Contractor Rep Email" + '* ' +
                 mobilizationheader."Variation Reason Code" + '* ' + mobilizationheader."Executive Summary" + '* ' +
                mobilizationheader."External Contract Reference" + '* ' + Format(mobilizationheader."Variation Order No") + '* ' + Format(mobilizationheader."Review Status") + '* ' +
                mobilizationheader."Review Rejection Notes" + '* ' + mobilizationheader."Road Code" + '* ' +
                mobilizationheader."Road Section No." + '* ' + mobilizationheader."Region ID" + '* ' + mobilizationheader."Directorate ID" + '* ' +
                mobilizationheader."Department ID" + '* ' + Format(mobilizationheader."Award Tender Sum Inc Taxes") + '* ' +
                Format(mobilizationheader."Original Value of Work (LCY)") + '* ' + Format(mobilizationheader."Original Value of Work (LCY)") + '* ' +
                Format(mobilizationheader."Value of Work Omitted") + '* ' + Format(mobilizationheader."Value of Work Added") + '* ' +
                Format(mobilizationheader."Net Change Value of Work (LCY)") + '* ' +
              Format(mobilizationheader."New Varied Works Value (LCY)") + '* ' + Format(mobilizationheader."Contract Sum Variation %") + '* ' + Format(mobilizationheader."Original Project Starting Date") + '* ' + Format(mobilizationheader."Original Project Ending Date") + '* ' + Format(mobilizationheader."Extended Project End Date") + '* ' + Format(mobilizationheader."Requested Extension Period"));
            until mobilizationheader.Next = 0;
        end;
    end;

    procedure fnGetVariationLines(var VarAll: BigText; documentno: Code[20])
    var
        tbl_jobPlanningLines: Record "Project Variation Line";
    begin
        tbl_jobPlanningLines.Reset();
        tbl_jobPlanningLines.SetRange(tbl_jobPlanningLines."Document No.", documentno);
        if tbl_jobPlanningLines.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + tbl_jobPlanningLines."Document No." + '*' + tbl_jobPlanningLines.Description + '*' + Format(tbl_jobPlanningLines."Document Type") + '*' +
                 Format(tbl_jobPlanningLines."Job No.") + '*' + Format(tbl_jobPlanningLines."Job Task No.") + '*' +
                  Format(tbl_jobPlanningLines."No.") + '*' + Format(tbl_jobPlanningLines."Line No.") + '*' + Format(tbl_jobPlanningLines.Type) + '*' +
                  Format(tbl_jobPlanningLines."Unit of Measure Code") + '*' + Format(tbl_jobPlanningLines."Gen. Prod. Posting Group") + '*' +
                 Format(tbl_jobPlanningLines."Gen. Bus. Posting Group") + '*' + Format(tbl_jobPlanningLines."Contractor No.") + '*' +
                 Format(tbl_jobPlanningLines."Purchase Contract ID") + '*' + Format(tbl_jobPlanningLines."External Contract Reference") + '*' +
                   Format(tbl_jobPlanningLines."Bill Item Category Code") + '*' + Format(tbl_jobPlanningLines."Contract Start Date") + '*' +
                  Format(tbl_jobPlanningLines."Contract End Date") + '*' + Format(tbl_jobPlanningLines."Original Quantity") + '*' +
                  Format(tbl_jobPlanningLines."Unit Cost (LCY)") + '*' + Format(tbl_jobPlanningLines."Original Total Cost (LCY)") + '*' +
                  Format(tbl_jobPlanningLines."New Quantity") + '*' + Format(tbl_jobPlanningLines."New Total Cost (LCY)") + '*' +
                  Format(tbl_jobPlanningLines."Net Change (Quantity)") + '*' + Format(tbl_jobPlanningLines."Net Change (Total Cost LCY)"));
            until tbl_jobPlanningLines.Next = 0;
        end;

    end;


    procedure fnGetVariationSections(var VarAll: BigText; documentno: Code[20])
    var
        vsections: Record "Project Variation Section";
    begin
        vsections.Reset();
        vsections.SetRange(vsections."Document No.", documentno);
        if vsections.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + vsections."Document No." + '*' + vsections.Description + '*' + Format(vsections."Document Type") + '*' +
                 Format(vsections.Section) + '*' + Format(vsections."Line No."));
            until vsections.Next = 0;
        end;

    end;

    procedure fnGetExtensionofTimeReason(var VarAll: BigText; documentno: Code[20])
    var
        reason: Record "Extension of Time Reason";
    begin
        reason.Reset();
        reason.SetRange(reason."Document No.", documentno);
        if reason.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + reason."Document No." + '*' + reason.Description + '*' + Format(reason."Line No.") + '*' +
                 Format(reason."Job No.") + '*' + Format(reason."Job Task No.") + '*' + Format(reason."EOT Requested Days") + '*' + Format(reason."EOT Recommended Days") + '*' + Format(reason.Status));
            until reason.Next = 0;
        end;

    end;

    procedure fnGetvariationoftimelines(var VarAll: BigText; documentno: Code[20])
    var
        reason: Record "Extension of Time Line";
    begin
        reason.Reset();
        reason.SetRange(reason."Document No.", documentno);
        if reason.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + reason."Document No." + '*' + reason.Description + '*' + Format(reason."Line No.") + '*' +
                 Format(reason."Job No.") + '*' + Format(reason."Job Task No.") + '*' + Format(reason."No.") + '*' + Format(reason.Type) + '*' + Format(reason.Remarks) + '*' + Format(reason."Extension Period (Days)") + '*' + Format(reason."Original Planning Date") + '*' + Format(reason."Revised Planning Date"));
            until reason.Next = 0;
        end;

    end;

    procedure fnGetVariationCommittee(var VarAll: BigText; documentno: Code[20])
    var
        committee: Record "Project Variation Committee";
    begin
        committee.Reset();
        committee.SetRange(committee."Document No.", documentno);
        if committee.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + committee."Document No." + '*' + committee."Resource No." + '*' + Format(committee."Document Type") + '*' +
                 Format(committee.Name) + '*' + Format(committee.Email) + '*' + Format(committee.Role));
            until committee.Next = 0;
        end;

    end;

    procedure fnGetVariationReasoncode(var VarAll: BigText)
    var
        reason: Record "Variation Reason Code";
    begin
        reason.Reset();
        reason.SetRange(reason.Blocked, false);
        if reason.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + reason.Code + '*' + reason.Description);
            until reason.Next = 0;
        end;

    end;

    procedure fnGetPContractSignatory(var VarAll: BigText; contractno: Code[20]);
    var
        signatory: Record "Purchase Contract Signatory";
    begin
        signatory.Reset();
        signatory.SetRange(signatory.No, contractno);
        signatory.SetRange(signatory."Document Type", signatory."Document Type"::"Blanket Order");
        signatory.SetRange(signatory.No, contractno);
        if signatory.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + signatory.No + '*' + Format(signatory."Entry No") + '*' + Format(signatory."Representative Name") + '*' +
                 Format(signatory.Email) + '*' + Format(signatory."Contract Signing Role") + '*' + Format(signatory."Signatory Type"));
            until signatory.Next = 0;
        end;
    end;

    procedure fnGetWEPContractorSubmission(var VarAll: BigText; vendorno: Code[20]);
    var
        webcontractor: Record "WEP Contractor Submission";
    begin
        webcontractor.Reset();
        webcontractor.SetRange(webcontractor."Contractor No", vendorno);
        if webcontractor.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + webcontractor."Document No" + '*' + Format(webcontractor."Document Type") + '*' + Format(webcontractor.Status) + '*' +
                 Format(webcontractor."Document Date") + '*' + Format(webcontractor."Project No") + '*' + Format(webcontractor."Project Name") + '*' +
                  Format(webcontractor."Contract ID") + '*' + webcontractor."Contractor No" + '*' +
                  webcontractor."Contractor Name" + '*' + webcontractor."Work Execution Plan" + '*' + Format(webcontractor."Site Agent Staff No") + '*' +
                  Format(webcontractor."Site Agent Name") + '*' + webcontractor."Rejection Remarks" + '*' + webcontractor."Telephone No" + '*' +
                   webcontractor."E-mail" + '*' + webcontractor.City + '*' + webcontractor.Address + '*' + webcontractor."Address 2" + '*' +
                   webcontractor."Appointment Voucher No" + '*' + Format(webcontractor."Portal Status"));
            until webcontractor.Next = 0;
        end;
    end;

    procedure fnGetSiteInstructions(var VarAll: BigText; vendorno: Code[20]);
    var
        siteinstructions: Record "Site Instructions Header";
    begin
        siteinstructions.Reset();
        siteinstructions.SetRange(siteinstructions."Contractor No.", vendorno);
        if siteinstructions.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + siteinstructions."Document No." + '*' + Format(siteinstructions."Works Instructions(Descriptio)") + '*' + Format(siteinstructions.Status) + '*' +
                 Format(siteinstructions."Document Date") + '*' + Format(siteinstructions."Project ID") + '*' + Format(siteinstructions."Project Name") + '*' +
                  Format(siteinstructions."Contract No") + '*' + siteinstructions."Contractor No." + '*' +
                  siteinstructions."Contractor Name" + '*' + Format(siteinstructions."Site Agent No.") + '*' +
                  Format(siteinstructions."Site Agent Name") + '*' + siteinstructions."Rejection Remarks" + '*' + siteinstructions."Department ID" + '*' +
                   siteinstructions."Directorate ID" + '*' + siteinstructions."Region ID" + '*' + siteinstructions."Department Name" + '*'
                    + siteinstructions."Directorate Name" + '*' + siteinstructions."Region Name" + '*' + Format(siteinstructions."Portal Status") + '*' +
                    Format(siteinstructions."Start Chainage") + '*' + Format(siteinstructions."End Chainage") + '*' + Format(siteinstructions."Total Amount Exclusive VAT") + '*' +
                    Format(siteinstructions."Total Amount Inclusive VAT"));
            until siteinstructions.Next = 0;
        end;
    end;

    procedure fnGetSiteInstructionsLines(var VarAll: BigText; documentno: Code[20]);
    var
        siteinstructions: Record "Site Instructions Line";
    begin
        siteinstructions.Reset();
        siteinstructions.SetRange(siteinstructions."Document No.", documentno);
        if siteinstructions.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + siteinstructions."Document No." + '*' + Format(siteinstructions."Project ID") + '*' + Format(siteinstructions."BoQ Item Line No.") + '*' +
                 Format(siteinstructions.Amount) + '*' + Format(siteinstructions."BoQ Category Code") + '*' +
                  siteinstructions."BoQ Category Description" + '*' + Format(siteinstructions."Contract No") + '*' + siteinstructions."Contractor No." + '*' +
                  siteinstructions."Contractor Name" + '*' + Format(siteinstructions.Quantity) + '*' + Format(siteinstructions."BoQ Item Line No."));
            until siteinstructions.Next = 0;
        end;
    end;

    procedure fnGetEquipmentTracking(var VarAll: BigText; vendorno: Code[20]);
    var
        equipment: Record "Equipment Repair Tracking";
    begin
        equipment.Reset();
        equipment.SetRange(equipment."Contractor No", vendorno);
        if equipment.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + equipment."Document No" + '*' + Format(equipment."Document Type") + '*' + Format(equipment.Status) + '*' +
                 Format(equipment."Document Date") + '*' + Format(equipment."Project No") + '*' + Format(equipment."Project Name") + '*' +
                  Format(equipment."Contract ID") + '*' + equipment."Contractor No" + '*' +
                  equipment."Contractor Name" + '*' + equipment."Work Execution Plan" + '*' + Format(equipment."Resident Engineer No.") + '*' +
                  Format(equipment."Resident Engineer Name") + '*' + equipment."Rejection Remarks" + '*' + equipment."Resident Engineer Email" + '*' +
                   Format(equipment."No. Of Equipment On Repair") + '*' + equipment.Description);
            until equipment.Next = 0;
        end;
    end;

    procedure fnGetEquipmentRepairLines(var VarAll: BigText; vendorno: Code[20]);
    var
        equipment: Record "Equipment Repair Line";
    begin
        equipment.Reset();
        equipment.SetRange(equipment."Contractor No.", vendorno);
        if equipment.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + equipment."Document No." + '*' + Format(equipment."Document Type") + '*' + equipment."Contractor No." + '*' +
                 Format(equipment."Equipment No.") + '*' + equipment."Equipment Serial No." + '*' + equipment.Description + '*' +
                 Format(equipment."Line No.") + '*' + Format(equipment."Maintenance Start Date") + '*' + Format(equipment."Expected Return Date") + '*' +
                  Format(equipment."Additional Remarks"));
            until equipment.Next = 0;
        end;
    end;


    procedure fnGetJobTasks(var VarAll: BigText);
    var
        tbl_jobTasks: Record "Job Task";
    begin
        tbl_jobTasks.Reset();
        repeat
            VarAll.AddText('::::' + tbl_jobTasks."Job No." + '*' + tbl_jobTasks."Job Task No." + '*' + tbl_jobTasks.Description + '*' + tbl_jobTasks."Department Code" + '*' +
             tbl_jobTasks."Directorate Code" + '*' + tbl_jobTasks.Division + '*' + Format(tbl_jobTasks.Commitments) + '*' +
             Format(tbl_jobTasks."Start Point(Km)") + '*' + Format(tbl_jobTasks."End Point(Km)") + '*' + Format(tbl_jobTasks."Start Date") + '*' +
             Format(tbl_jobTasks."End Date") + '*' + Format(tbl_jobTasks."Procurement Method") + '*' + tbl_jobTasks."Funding Source" + '*' +
              tbl_jobTasks."Surface Types" + '*' + Format(tbl_jobTasks."Road Condition") + '*' + Format(tbl_jobTasks."Completed Length(Km)") + '*' +
              Format(tbl_jobTasks."Roads Category") + '*' + Format(tbl_jobTasks."Fund Type") + '*' + Format(tbl_jobTasks."Execution Method") + '*' +
              Format(tbl_jobTasks."Global Dimension 1 Code") + '*' + Format(tbl_jobTasks."Global Dimension 2 Code"));
        until tbl_jobTasks.Next = 0;

    end;

    procedure fnGetWEPContractorTeam(var VarAll: BigText; documentNumber: Code[20]; contractorNumber: Code[20]);
    var
        tbl_WEPContractorTeam: record "WEP Contractor Team";
    begin
        tbl_WEPContractorTeam.Reset();
        //tbl_WEPContractorTeam.SetRange("Document No", documentNumber);
        tbl_WEPContractorTeam.SetRange("Contractor No.", contractorNumber);
        if tbl_WEPContractorTeam.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + tbl_WEPContractorTeam."Document No" + '*' + Format(tbl_WEPContractorTeam."Document Type") + '*' +
                tbl_WEPContractorTeam.Name + '*' + tbl_WEPContractorTeam."Contractor No." + '*' + tbl_WEPContractorTeam.Address + '*' + Format(tbl_WEPContractorTeam."Address 2") + '*' +
                 tbl_WEPContractorTeam.City + '*' + tbl_WEPContractorTeam."Post Code" + '*' + tbl_WEPContractorTeam."Country/Region Code" + '*' +
                  tbl_WEPContractorTeam."Role Code" + '*' + tbl_WEPContractorTeam.Designation + '*' + Format(tbl_WEPContractorTeam."Effective Date") + '*' +
                  Format(tbl_WEPContractorTeam."Expiry Date") + '*' + Format(tbl_WEPContractorTeam."Staff Category") + '*' +
                   tbl_WEPContractorTeam."Contractor Staff No." + '*' + Format(tbl_WEPContractorTeam."ID Number"));
            until tbl_WEPContractorTeam.Next = 0;
        end;

    end;

    procedure fnGetWEPContractorEqquipment(var VarAll: BigText; documentNumber: Code[20]; contractorNumber: Code[20])
    var
        tbl_WEPContractorEquipment: Record "WEP Contractor Equipment";

    begin
        tbl_WEPContractorEquipment.Reset();
        tbl_WEPContractorEquipment.SetRange("Document No.", documentNumber);
        tbl_WEPContractorEquipment.SetRange("Contractor No.", contractorNumber);
        if tbl_WEPContractorEquipment.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + tbl_WEPContractorEquipment."Document No." + '*' + Format(tbl_WEPContractorEquipment."Document Type") + '*' +
               tbl_WEPContractorEquipment."Equipment Type Code" + '*' + tbl_WEPContractorEquipment."Equipment No." + '*' +
                tbl_WEPContractorEquipment.Description + '*' + Format(tbl_WEPContractorEquipment."Ownership Type") + '*' +
                 tbl_WEPContractorEquipment."Equipment Serial No." + '*' + Format(tbl_WEPContractorEquipment."Equipment Usability Code") + '*' +
                 Format(tbl_WEPContractorEquipment."Years of Previous Use") + '*' + Format(tbl_WEPContractorEquipment."Equipment Condition Code") + '*' +
                 tbl_WEPContractorEquipment."Equipment Availability" + '*' + tbl_WEPContractorEquipment."Project Phase" + '*' + Format(tbl_WEPContractorEquipment."Scheduled Date of Delivery"));
            until tbl_WEPContractorEquipment.Next = 0;
        end;
    end;

    procedure fnGetWEPExecutionSchedule(var VarAll: BigText; documentNumber: Code[20])
    var
        tbl_WEPExecutionSchedule: Record "WEP Execution Schedule";
    begin
        tbl_WEPExecutionSchedule.Reset();
        tbl_WEPExecutionSchedule.SetRange("Document No", documentNumber);
        if tbl_WEPExecutionSchedule.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + tbl_WEPExecutionSchedule."Document No" + '*' + tbl_WEPExecutionSchedule."Job No" + '*' + Format(tbl_WEPExecutionSchedule."Job Task No") + '*' +
                Format(tbl_WEPExecutionSchedule."Scheduled End Date") + '*' + Format(tbl_WEPExecutionSchedule."Scheduled Start Date") + '*' +
                tbl_WEPExecutionSchedule.Description + '*' + Format(tbl_WEPExecutionSchedule."Budget (Total Cost)") + '*' +
                Format(tbl_WEPExecutionSchedule."Job Task Type"));
            until tbl_WEPExecutionSchedule.Next = 0;
        end;

    end;

    procedure fnGetWEPMethodofWork(var VarAll: BigText; documentNumber: Code[20])
    var
        wepmethodofwork: Record "WEP Method of Work";
    begin
        wepmethodofwork.Reset();
        wepmethodofwork.SetRange("Document No", documentNumber);
        if wepmethodofwork.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + wepmethodofwork."Document No" + '*' + Format(wepmethodofwork."Document Type") + '*' +
                Format(wepmethodofwork.Description) + '*' + Format(wepmethodofwork."Entry No") + '*' +
                wepmethodofwork."Benefits Summary");
            until wepmethodofwork.Next = 0;
        end;

    end;

    procedure fnGetEquipmentTypes(var VarAll: BigText)
    var
        equipment: Record "Works Equipment Type";
    begin
        equipment.Reset();
        repeat
            VarAll.AddText('::::' + equipment.code + '*' +
            Format(equipment.Description));
        until equipment.Next = 0;


    end;


    procedure fnGetProjectStaffRoleCode(var VarAll: BigText)
    var
        tbl_staffRoleCode: Record "Project Staff Role Code";

    begin
        tbl_staffRoleCode.Reset();
        repeat
            VarAll.AddText('::::' + tbl_staffRoleCode."Staff Role Code" + '*' + tbl_staffRoleCode.Designation);
        until tbl_staffRoleCode.Next = 0;
    end;

    procedure fnGetPostCode(var VarAll: BigText)
    var
        postcode: Record "Post Code";

    begin
        postcode.Reset();
        repeat
            VarAll.AddText('::::' + postcode.Code + '*' + postcode.City + '*' + postcode."Country/Region Code");
        until postcode.Next = 0;
    end;

    procedure fnGetCountries(var VarAll: BigText)
    var
        country: Record "Country/Region";
    begin
        country.Reset();
        repeat
            VarAll.AddText('::::' + country.Code + '*' + country.Name);
        until country.Next = 0;

    end;




    procedure fnGetJobPlanningLines(var VarAll: BigText; jobNumber: Code[20])
    var
        tbl_jobPlanningLines: Record "Job Planning Line";
    begin
        tbl_jobPlanningLines.Reset();
        tbl_jobPlanningLines.SetRange("Job No.", jobNumber);
        if tbl_jobPlanningLines.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + tbl_jobPlanningLines."Document No." + '*' + tbl_jobPlanningLines.Description + '*' + Format(tbl_jobPlanningLines."Line Amount (LCY)") + '*' +
                 Format(tbl_jobPlanningLines."Unit Cost") + '*' + Format(tbl_jobPlanningLines."Total Cost") + '*' + Format(tbl_jobPlanningLines."Unit Price") + '*' +
                  Format(tbl_jobPlanningLines."Total Price") + '*' + Format(tbl_jobPlanningLines."Line No.") + '*' + Format(tbl_jobPlanningLines."Job No.") + '*' +
                 Format(tbl_jobPlanningLines."Job Task No.") + '*' + Format(tbl_jobPlanningLines."Planning Date") + '*' + Format(tbl_jobPlanningLines."Document Date") + '*' +
                   Format(tbl_jobPlanningLines.Type) + '*' + Format(tbl_jobPlanningLines.Quantity) + '*' +
                  Format(tbl_jobPlanningLines."Direct Unit Cost (LCY)") + '*' + Format(tbl_jobPlanningLines."Unit Cost (LCY)") + '*' +
                  Format(tbl_jobPlanningLines."Unit Cost (LCY)") + '*' + Format(tbl_jobPlanningLines."Line Amount") + '*' +
                  Format(tbl_jobPlanningLines."Line Discount Amount") + '*' + Format(tbl_jobPlanningLines."Line Discount Amount (LCY)"));
            until tbl_jobPlanningLines.Next = 0;
        end;
    end;

    procedure fnGetPurchaseLines(var VarAll: BigText; documentno: Code[20])
    var
        tbl_jobPlanningLines: Record "Purchase Line";
    begin
        tbl_jobPlanningLines.Reset();
        tbl_jobPlanningLines.SetRange(tbl_jobPlanningLines."Document No.", documentno);
        if tbl_jobPlanningLines.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + tbl_jobPlanningLines."Document No." + '*' + tbl_jobPlanningLines.Description + '*' + Format(tbl_jobPlanningLines.Quantity) + '*' +
                 Format(tbl_jobPlanningLines."Quantity Received") + '*' + Format(tbl_jobPlanningLines."Quantity Invoiced") + '*' + Format(tbl_jobPlanningLines."Outstanding Quantity") + '*' +
                  Format(tbl_jobPlanningLines."Line No.") + '*' + Format(tbl_jobPlanningLines."Direct Unit Cost") + '*' + Format(tbl_jobPlanningLines."Unit Cost (LCY)") + '*' +
                 Format(tbl_jobPlanningLines."Unit Price (LCY)") + '*' + Format(tbl_jobPlanningLines."Unit of Measure Code") + '*' + Format(tbl_jobPlanningLines."Location Code") + '*' +
                   Format(tbl_jobPlanningLines.Type) + '*' + Format(tbl_jobPlanningLines.Quantity) + '*' +
                  Format(tbl_jobPlanningLines."Unit Cost (LCY)") + '*' + Format(tbl_jobPlanningLines."Expected Receipt Date") + '*' +
                  Format(tbl_jobPlanningLines."Line Amount") + '*' + Format(tbl_jobPlanningLines."Line Discount Amount"));
            until tbl_jobPlanningLines.Next = 0;
        end;

    end;

    procedure fnGetPCORequiredDocument(var VarAll: BigText; noticeNumber: Code[20])
    var
        tbl_pcoRequiredDocument: Record "PCO Required Document";

    begin
        tbl_pcoRequiredDocument.Reset();
        tbl_pcoRequiredDocument.SetRange("Notice No.", noticeNumber);
        if tbl_pcoRequiredDocument.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + tbl_pcoRequiredDocument."Notice No." + '*' + tbl_pcoRequiredDocument.Description + '*' +
                 Format(tbl_pcoRequiredDocument."Document Type") + '*' + Format(tbl_pcoRequiredDocument."Requirement Type") + '*' +
                  Format(tbl_pcoRequiredDocument."Guidelines/Instructions") + '*' + Format(tbl_pcoRequiredDocument."Due Date"));
            until tbl_pcoRequiredDocument.Next = 0;
        end;
    end;

    procedure fnGetPCOPlannedMeeting(var VarAll: BigText; noticeNumber: Code[20])
    var
        tbl_pcoPlannedMeeting: Record "PCO Planned Meeting";

    begin
        tbl_pcoPlannedMeeting.Reset();
        tbl_pcoPlannedMeeting.SetRange("Notice No.", noticeNumber);
        if tbl_pcoPlannedMeeting.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + Format(tbl_pcoPlannedMeeting."Notice No.") + '*' + Format(tbl_pcoPlannedMeeting."Meeting Type") + '*' + tbl_pcoPlannedMeeting.Description + '*' +
                Format(tbl_pcoPlannedMeeting."Start Date") + '*' + Format(tbl_pcoPlannedMeeting."Start Time") + '*' + Format(tbl_pcoPlannedMeeting."End Date") + '*' +
                Format(tbl_pcoPlannedMeeting."End Time") + '*' + tbl_pcoPlannedMeeting."Venue/Location");
            until tbl_pcoPlannedMeeting.Next = 0;
        end;
    end;

    procedure fnGetPCOInternalProjectTeam(var VarAll: BigText; orderNumber: Code[20])
    var
        tbl_pcoInternalProjectTeam: Record "PCO Internal Project Team";
    begin
        tbl_pcoInternalProjectTeam.Reset();
        tbl_pcoInternalProjectTeam.SetRange("Commencement Order No.", orderNumber);
        if tbl_pcoInternalProjectTeam.FindSet(true) then begin
            repeat
                VarAll.AddText('::::' + Format(tbl_pcoInternalProjectTeam."Commencement Order No.") + '*' + Format(tbl_pcoInternalProjectTeam."Resource No.") + '*' +
                tbl_pcoInternalProjectTeam.Name + '*' +
                tbl_pcoInternalProjectTeam.Email + '*' + tbl_pcoInternalProjectTeam.Address + '*' + Format(tbl_pcoInternalProjectTeam."Address 2") + '*' +
                tbl_pcoInternalProjectTeam.City + '*' + Format(tbl_pcoInternalProjectTeam."Post Code") + '*' +
                Format(tbl_pcoInternalProjectTeam."Country/Region Code") + '*' + tbl_pcoInternalProjectTeam."Phone No." + '*' +
                Format(tbl_pcoInternalProjectTeam."Role Code") + '*' + Format(tbl_pcoInternalProjectTeam.Designation));
            until tbl_pcoInternalProjectTeam.Next = 0;
        end;
    end;


    // add purchase requisition file link
    procedure addFileLinks(recordType: Text[100]; recordNo: Code[50]; filename: Text; fileLink: Text; extensionType: Text) status: Text
    var
        tbl_purchaseHeader: Record "Purchase Header";
        tbl_documentAttachments: Record "Document Attachment";
    begin
        if recordType = 'Purchase Requisition' then begin
            status := fnConvertFile(fileLink, extensionType, 38, filename, recordNo, 1);
        end else
            if recordType = 'Imprest Surrender' then begin
                status := fnConvertFile(fileLink, extensionType, 57000, filename, recordNo, 2);


            end else
                if recordType = 'Imprest Memo' then begin
                    status := fnConvertFile(fileLink, extensionType, 57008, filename, recordNo, 3);

                end else
                    if recordType = 'Leave' then begin
                        status := fnConvertFile(fileLink, extensionType, 69205, filename, recordNo, 3);
                    end else
                        if recordType = 'ICTHelpDesk' then begin
                            status := fnConvertFile(fileLink, extensionType, 56050, filename, recordNo, 3);

                        end else
                            if recordType = 'Imprest Requisition' then begin
                                status := fnConvertFile(fileLink, extensionType, 57000, filename, recordNo, 3);
                            end
                            else
                                if recordType = 'CPR' then begin
                                    status := fnConvertFile(fileLink, extensionType, 72188, filename, recordNo, 3);
                                end
                                else
                                    if recordType = 'Fleet' then begin
                                        status := fnConvertFile(fileLink, extensionType, 59003, filename, recordNo, 3);
                                    end
                                    else
                                        if recordType = 'WEP' then begin
                                            status := fnConvertFile(fileLink, extensionType, 72157, filename, recordNo, 3);
                                        end
                                        else
                                            if recordType = 'Site Agent' then begin
                                                status := fnConvertFile(fileLink, extensionType, 72280, filename, recordNo, 3);
                                            end
                                            else
                                                if recordType = 'Personnel' then begin
                                                    status := fnConvertFile(fileLink, extensionType, 72280, filename, recordNo, 3);
                                                end
                                                else
                                                    if recordType = 'Insurance' then begin
                                                        status := fnConvertFile(fileLink, extensionType, 72311, filename, recordNo, 3);
                                                    end

    end;


    procedure fnConvertFile(fileLink: Text; extensionType: Text; tableId: Integer; fileName: Text; recordNo: Code[30]; documentType: Integer) status: Text
    var
        tbl_documentAttachments: Record "Document Attachment";
        PurchaseHeader: Record "Purchase Header";
        importFile: File;
        fileInstream: InStream;
        fileId: Guid;

    begin
        tbl_documentAttachments.Reset();
        tbl_documentAttachments.Init();
        tbl_documentAttachments."Table ID" := tableId;
        tbl_documentAttachments."File Name" := fileName;
        if documentType = 1 then begin
            tbl_documentAttachments."Document Type" := PurchaseHeader."Document Type"::"Purchase Requisition";
        end;
        //  else if documentType = 2 then begin
        //                 tbl_documentAttachments."Document Type" := PurchaseHeader."Document Type"::"Purchase Requisition"

        // end else if documentType = 3 then begin
        //                 tbl_documentAttachments."Document Type" := PurchaseHeader."Document Type"::"Purchase Requisition";

        // end
        tbl_documentAttachments."Line No." := 10000;
        tbl_documentAttachments."No." := recordNo;
        tbl_documentAttachments."File Extension" := extensionType;
        if (extensionType.ToLower() = 'pdf') then begin
            tbl_documentAttachments."File Type" := tbl_documentAttachments."File Type"::PDF;
        end else
            if (extensionType.ToLower() = 'docx') then begin
                tbl_documentAttachments."File Type" := tbl_documentAttachments."File Type"::Word;
            end
            else
                if (extensionType.ToLower() = 'xlsx') then begin
                    tbl_documentAttachments."File Type" := tbl_documentAttachments."File Type"::Excel;
                end else
                    if ((extensionType.ToLower() = 'png') OR (extensionType.ToLower() = 'jpeg') OR (extensionType.ToLower() = 'jpg')) then begin
                        tbl_documentAttachments."File Type" := tbl_documentAttachments."File Type"::Image;
                    end;
        importFile.Open(fileLink);
        importFile.CreateInstream(fileInstream);
        fileId := tbl_documentAttachments."Document Reference ID".ImportStream(fileInstream, fileName);
        if tbl_documentAttachments.Insert(true) then begin
            status := 'success*The document was successfully attached';
        end else begin
            status := 'error*An error occured during the process of creating a document link. kindly contact the administrator if this error persists';
        end;
        importFile.Close;

    end;


    // doing this because some documents may not exist in a folder, for example,the documents attached directly from Business central. 
    // process --> Export the file from the database and save the document in the server and then read the file from the server.
    procedure fnDownloadFile(fileName: Text; recordNo: Code[30]) status: Text
    var
        tbl_documentAttachments: Record "Document Attachment";
        exportFile: File;
        fileOutstream: OutStream;

    begin
        tbl_documentAttachments.Reset();
        tbl_documentAttachments.SetRange("No.", recordNo);
        tbl_documentAttachments.Setrange("File Name", fileName);
        if tbl_documentAttachments.findset then begin
            exportFile.Create(DOWNLOADFILEPATH + tbl_documentAttachments."File Name" + '.' + Format(tbl_documentAttachments."File Extension"));
            exportFile.CreateOUTSTREAM(fileOutstream);
            exportFile.Close();
            status := 'success*' + DOWNLOADFILEPATH + tbl_documentAttachments."File Name" + '.' + Format(tbl_documentAttachments."File Extension");
        end;
    end;
    // delete document
    procedure deleteFile(fileName: Text; recordNo: Code[30])
    var
        tbl_documentAttachments: Record "Document Attachment";

    begin
        tbl_documentAttachments.Reset();
        tbl_documentAttachments.SetRange("No.", recordNo);
        tbl_documentAttachments.Setrange("File Name", fileName);
        if tbl_documentAttachments.findset then begin
            tbl_documentAttachments.Delete(true);
        end;
    end;

    procedure GenerateOrderToCommenceLetter(documentNumber: Code[20]) BaseImage: Text
    var
        projectHeader: Record "Project Mobilization Header";

    begin
        TempBlob_lRec.CreateOutStream(OutStr, TEXTENCODING::UTF8);
        projectHeader.Reset;
        projectHeader.SetRange(projectHeader."Document Type", ProjectMobilizationHeader."document type"::"Order-To-Commence");
        projectHeader.SetRange(projectHeader."Document No.", documentNumber);
        if projectHeader.FindSet then begin
            RecRef.GetTable(projectHeader);
            Report.SaveAs(Report::"Orders to Commence Letter", '', ReportFormat::Pdf, OutStr, RecRef);
            FileManagement_lCdu.BLOBExport(TempBlob_lRec, STRSUBSTNO('OrderToCommence_%1.Pdf', projectHeader."Document No."), TRUE);
            TempBlob_lRec.CreateInstream(InStr, TEXTENCODING::UTF8);
            BaseImage := Base64Convert.ToBase64(InStr);
        end;
    end;

    procedure FnSubmitNewUserAccount(vendorno: Code[10]; registeredBusinessName: Code[100]; phoneNumber: Code[100]; emailAddress: Text; contactName: Code[100]) status: Text
    var
        PortalUSer: Record "Dynasoft Portal User";
        RandomDigit: Text[50];
    begin
        Contact.Reset;
        Contact.SetRange("E-Mail", emailAddress);
        if Contact.FindSet then begin
            status := 'danger*Another vendor with the given email address exists!';
        end else begin
            objProcsetup.Get;
            Contact.Init;
            Contact."No." := objNoSeriesManagement.GetNextNo(objProcsetup."Request For Registration Nos", Today, true);
            Contact."Company No." := Contact."No.";
            Contact.Validate("No.");
            Contact."Portal Request" := true;
            Contact.Name := registeredBusinessName;
            Contact."Name 2" := contactName;
            Contact."Phone No." := phoneNumber;
            Contact."E-Mail" := emailAddress;
            //  Contact."VAT Registration No.":= taxRegkraPin;
            Contact.Type := Contact.Type::Company;
            Contact."Last Date Modified" := Today;
            Contact."Last Time Modified" := Time;

            if Contact.Insert() then begin

                //send  email notif to procurement department //get code here
                //  FnCreateApplicantAccountRequest(emailAddress);
                //   Contact.RESET;
                //    Contact.SETRANGE("E-Mail",emailaddress);
                //    IF Contact.FINDSET THEN BEGIN
                //    VendorSetup.GET;
                //   ApplicantProfile.RESET;
                //   ApplicantProfile.SETRANGE("E-Mail",emailaddress);
                //   IF NOT ApplicantProfile.FINDSET THEN BEGIN
                //    ApplicantProfile.INIT;
                //    ApplicantProfile."No.":=NoSeriesMgt.GetNextNo(VendorSetup."Vendor Nos.",TODAY,TRUE);
                //    ApplicantProfile.Name:=Contact.Name;
                //    ApplicantProfile.Registered:=ApplicantProfile.Registered::No;
                //    ApplicantProfile."E-Mail":=Contact."E-Mail";
                //    ApplicantProfile."Post Code":=Contact."Post Code";
                //    ApplicantProfile."VAT Registration No.":=Contact."VAT Registration No.";
                //    ApplicantProfile.City:=Contact.City;
                //    ApplicantProfile.Address:=Contact.Address;
                //    ApplicantProfile."Phone No.":=Contact."Phone No.";
                //    IF ApplicantProfile.INSERT(TRUE) THEN BEGIN

                // Update Dynasoft Portal user;
                PortalUSer.Reset;
                PortalUSer.SetRange("Authentication Email", emailAddress);
                if not PortalUSer.FindSet then begin
                    PortalUSer.Init;
                    PortalUSer."User Name" := contactName;
                    PortalUSer."Full Name" := Contact.Name;
                    PortalUSer."Authentication Email" := Contact."E-Mail";
                    PortalUSer."Mobile Phone No." := Contact."Phone No.";
                    PortalUSer.State := PortalUSer.State::Enabled;
                    PortalUSer."Record Type" := PortalUSer."record type"::Vendor;
                    PortalUSer."Record ID" := vendorno;
                    RandomDigit := CreateGuid;
                    RandomDigit := DelChr(RandomDigit, '=', '{}-01');
                    RandomDigit := CopyStr(RandomDigit, 1, 8);
                    PortalUSer."Password Value" := RandomDigit;
                    PortalUSer."Last Modified Date" := Today;
                    if PortalUSer.Insert(true) then begin
                        ;
                    end;
                end;
                // END;
                //  END;

                //success insert into contact
                status := 'success*Your vendor account was successfully created. Please log in to complete your profile!';

                // objEmailsendCodeunit.FnSendEmaiNotificationOnSupplierRegRequest(Contact);
                //         //objEmailsendCodeunit.FnSendEmaiNotificationOnSupplierRegRequestAcknowledge(Contact);
                // FnSendEmaiNotificationOnApplicantAccountActivation(Contact);
            end else begin
                status := 'danger*Error!,unknown error occured while saving, contact main office';
            end
        end;

        exit(status);
    end;

    // procedure fnGetAttachedDocuments(docNo: Code[20]) data: Text
    // var
    //     attach: Record "Document Attachment";
    // begin
    //     attach.Reset;
    //     attach.SetRange("No.", docNo);
    //     if attach.findset(true) then begin
    //         repeat
    //             data += attach."No." + '*' + attach."File Name" + '*' + attach."File Extension" + '::::';
    //         until attach.next = 0;
    //     end

    // end;

}

