#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 72038 "Possession Of Site"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PossessionOfSite.rdl';

    dataset
    {
        dataitem("Project Mobilization Header"; "Project Mobilization Header")
        {
            RequestFilterFields = "Commencement Order ID", "Purchase Contract ID", "Project ID", "Contractor No.", "IFS Code";
            column(CompanyPicture; CompanyInfo.Picture)
            {

            }
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyAddress7; CompanyAddr[7])
            {
            }
            column(CompanyAddress8; CompanyAddr[8])
            {
            }
            column(ReportForNavId_1; 1)
            {
            }
            column(CAddress; ObjCInfo.Address)
            {
            }
            column(CName; ObjCInfo.Name)
            {
            }
            column(Address2; ObjCInfo."Address 2")
            {
            }
            column(CPic; ObjCInfo.Picture)
            {
            }
            column(CPhone; ObjCInfo."Phone No.")
            {
            }
            column(CEmail; ObjCInfo."E-Mail")
            {
            }
            column(CWebsite; ObjCInfo."Home Page")
            {
            }
            Column(CompanyMotto; ObjCInfo.Motto)
            {

            }
            column(DirectorateName; DirectorateName)
            {
            }
            column(DocumentType_ProjectMobilizationHeader; "Project Mobilization Header"."Document Type")
            {
            }
            column(DocumentNo_ProjectMobilizationHeader; "Project Mobilization Header"."Document No.")
            {
            }
            column(DocumentDate_ProjectMobilizationHeader; Format("Project Mobilization Header"."Document Date"))
            {
            }
            column(CommencementOrderID_ProjectMobilizationHeader; "Project Mobilization Header"."Commencement Order ID")
            {
            }
            column(PurchaseContractID_ProjectMobilizationHeader; "Project Mobilization Header"."Purchase Contract ID")
            {
            }
            column(ProjectID_ProjectMobilizationHeader; "Project Mobilization Header"."Project ID")
            {
            }
            column(Description_ProjectMobilizationHeader; "Project Mobilization Header".Description)
            {
            }
            column(ProjectMission_ProjectMobilizationHeader; "Project Mobilization Header"."Project Mission")
            {
            }
            column(StaffAppointmentVoucherNo_ProjectMobilizationHeader; "Project Mobilization Header"."Staff Appointment Voucher No.")
            {
            }
            column(ContractorNo_ProjectMobilizationHeader; "Project Mobilization Header"."Contractor No.")
            {
            }
            column(ContractorName_ProjectMobilizationHeader; "Project Mobilization Header"."Contractor Name")
            {
            }
            column(VendorAddress_ProjectMobilizationHeader; "Project Mobilization Header"."Vendor Address")
            {
            }
            column(VendorAddress2_ProjectMobilizationHeader; "Project Mobilization Header"."Vendor Address 2")
            {
            }
            column(VendorPostCode_ProjectMobilizationHeader; "Project Mobilization Header"."Vendor Post Code")
            {
            }
            column(PrimaryEmail_ProjectMobilizationHeader; "Project Mobilization Header"."Primary E-mail")
            {
            }
            column(VendorCity_ProjectMobilizationHeader; "Project Mobilization Header"."Vendor City")
            {
            }
            column(ProjectDeliveryStrategy_ProjectMobilizationHeader; "Project Mobilization Header"."Project Delivery Strategy")
            {
            }
            column(IFSCode_ProjectMobilizationHeader; "Project Mobilization Header"."IFS Code")
            {
            }
            column(ProjectName_ProjectMobilizationHeader; "Project Mobilization Header"."Project Name")
            {
            }
            column(ProjectStartDate_ProjectMobilizationHeader; Format("Project Mobilization Header"."Project Start Date"))
            {
            }
            column(ProjectEndDate_ProjectMobilizationHeader; Format("Project Mobilization Header"."Project End  Date"))
            {
            }
            column(ProjectEngineerNo_ProjectMobilizationHeader; "Project Mobilization Header"."Project Engineer No.")
            {
            }
            column(ProjectManager_ProjectMobilizationHeader; "Project Mobilization Header"."Project Manager")
            {
            }
            column(ProjectEngineerName_ProjectMobilizationHeader; "Project Mobilization Header"."Project Engineer Name")
            {
            }
            column(EngineerRepresentativeNo_ProjectMobilizationHeader; "Project Mobilization Header"."Engineer Representative No.")
            {
            }
            column(EngineerRepresentativeName_ProjectMobilizationHeader; "Project Mobilization Header"."Engineer Representative Name")
            {
            }
            column(RegionID_ProjectMobilizationHeader; "Project Mobilization Header"."Region ID")
            {
            }
            column(DirectorateID_ProjectMobilizationHeader; "Project Mobilization Header"."Directorate ID")
            {
            }
            column(DepartmentID_ProjectMobilizationHeader; "Project Mobilization Header"."Department ID")
            {
            }
            column(ConstituencyID_ProjectMobilizationHeader; "Project Mobilization Header"."Constituency ID")
            {
            }
            column(CountyID_ProjectMobilizationHeader; "Project Mobilization Header"."County ID")
            {
            }
            column(ProjectSiteDescription_ProjectMobilizationHeader; "Project Mobilization Header"."Project Site Description")
            {
            }
            column(StartChainage_ProjectMobilizationHeader; "Project Mobilization Header"."Start Chainage")
            {
            }
            column(EndChainage_ProjectMobilizationHeader; "Project Mobilization Header"."End  Chainage")
            {
            }
            column(OrdertoCommenceReference_ProjectMobilizationHeader; "Project Mobilization Header"."Order to Commence Reference")
            {
            }
            column(PossessionofSiteReference_ProjectMobilizationHeader; "Project Mobilization Header"."Possession of Site Reference")
            {
            }
            column(PossessionofSiteDate_ProjectMobilizationHeader; Format("Project Mobilization Header"."Possession of Site Date"))
            {
            }
            column(PreparedBy; UserSetup."Employee Name")
            {
            }
            column(DatePrepared; ApproverDate[1])
            {
            }
            column(PreparedBy_Signature; UserSetup.Picture)
            {
            }
            column(ExaminedBy; UserSetup1."Employee Name")
            {
            }
            column(DateApproved; Format(ApproverDate[2]))
            {
            }
            column(ExaminedBy_Signature; UserSetup1.Picture)
            {
            }
            column(VBC; UserSetup2."Employee Name")
            {
            }
            column(VBCDate; ApproverDate[3])
            {
            }
            column(VBC_Signature; UserSetup2.Picture)
            {
            }
            column(Authorizer; UserSetup3."Employee Name")
            {
            }
            column(DateAuthorized; ApproverDate[4])
            {
            }
            column(Authorizer_Signature; UserSetup3.Picture)
            {
            }
            dataitem("PCO Project Road Link"; "PCO Project Road Link")
            {
                DataItemLink = "Document No" = field("Document No.");
                DataItemLinkReference = "Project Mobilization Header";
                column(Road_Code; "Road Code")
                {

                }
                column(Road_Name; "Road Name")
                {

                }
                column(Start_Chainage; "Start Chainage")
                {

                }
                column(End_Chainage; "End Chainage")
                {

                }
                column(Workplanned_Length; "Workplanned Length")
                {

                }
                column(Possession_of_Site_Issued; "Possession of Site Issued")
                {

                }
                column(Effective_Date; "Effective Date")
                {

                }
            }
            dataitem("Internal Project Resource"; "Internal Project Resource")
            {
                DataItemLinkReference = "Project Mobilization Header";
                DataItemLink = "Project ID" = field("Project ID");
                DataItemTableView = where("Resident Engineer" = const(true));
                column(REName;Name)
                {

                }
                dataitem("User Setup"; "User Setup")
                {
                    DataItemLink = "User ID" = field("User ID");
                    DataItemLinkReference = "Internal Project Resource";
                    column(RESignature; Picture)
                    {

                    }
                    trigger OnAfterGetRecord()
                    begin
                        CalcFields(Picture);
                    end;
                }
            }
            dataitem("Contract Sub Clause";"Contract Sub Clause")
            {
                DataItemLink="Contract No" = field("Purchase Contract ID");
                DataItemTableView = where("Document Type" = filter("Possession of Site"));
                column(ClauseCode;Code)
                {

                }
                column(ClauseDescription;Description)
                {

                }

            }

            trigger OnAfterGetRecord()
            begin
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 72157);
                ApprovalEntries.SetRange("Document No.", "Project Mobilization Header"."Document No.");
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            Approver[1] := ApprovalEntries."Sender ID";

                            ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
                            if UserSetup.Get(Approver[1]) then
                                UserSetup.CalcFields(Picture);

                            Approver[2] := ApprovalEntries."Approver ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup1.Get(Approver[2]) then
                                UserSetup1.CalcFields(Picture);
                        end;
                        if i = 2 then begin
                            Approver[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver[3]) then
                                UserSetup2.CalcFields(Picture);
                        end;
                        if i = 3 then begin
                            Approver[4] := ApprovalEntries."Approver ID";
                            ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup3.Get(Approver[4]) then
                                UserSetup3.CalcFields(Picture);
                        end;
                    until
                   ApprovalEntries.Next = 0;

                end;

                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Project Mobilization Header"."Directorate ID");
                if ResponsibilityCenter.FindSet then
                    DirectorateName := ResponsibilityCenter.Name;

                CompanyInfo.Get();
                CompanyInfo.CalcFields(Picture);
                FormatAddr.GetCompanyAddr("Region ID", RespCenter, CompanyInfo, CompanyAddr);
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        ObjCInfo.Get;
        ObjCInfo.CalcFields(Picture);
    end;

    trigger OnPostReport()
    begin
        //MESSAGE('You have successfully generated Work Execution Plan for Project No:'+' '+"Project Mobilization Header"."Project ID");
    end;

    trigger OnPreReport()
    begin
        ObjCInfo.Get;
        ObjCInfo.CalcFields(Picture);
    end;

    var
        ObjCInfo: Record "Company Information";
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
        DirectorateName: Text[250];
        ResponsibilityCenter: Record "Responsibility Center";
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        RespCenter: Record "Responsibility Center";

}

