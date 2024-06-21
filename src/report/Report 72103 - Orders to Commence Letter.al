report 72103 "Orders to Commence Letter"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Orders to Commence Letter.rdlc';

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
            column(CAddress; ObjCInfo.Address)
            {
            }
            column(CName; ObjCInfo.Name)
            {
            }
            column(Commencement_Period; "Commencement Period")
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
            column(CMotto; ObjCInfo.Motto)
            {
            }
            column(DirectorateName; DirectorateName)
            {
            }
            column(DirectorUserID; DirectorUserID)
            {
            }
            column(DirectorName; DirectorName)
            {
            }
            column(DirectorSignature; UserSetup.Picture)
            {
            }
            column(DocumentType_ProjectMobilizationHeader; "Project Mobilization Header"."Document Type")
            {
            }
            column(DocumentNo_ProjectMobilizationHeader; "Project Mobilization Header"."Document No.")
            {
            }
            column(DocumentDate_ProjectMobilizationHeader; FORMAT("Project Mobilization Header"."Document Date"))
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
            column(ProjectStartDate_ProjectMobilizationHeader; FORMAT("Project Mobilization Header"."Project Start Date"))
            {
            }
            column(ProjectEndDate_ProjectMobilizationHeader; FORMAT("Project Mobilization Header"."Project End  Date"))
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
            column(PossessionofSiteDate_ProjectMobilizationHeader; FORMAT("Project Mobilization Header"."Possession of Site Date"))
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
            column(DateApproved; FORMAT(ApproverDate[2]))
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
            dataitem("Program of worksRequired Document"; "PCO Required Document")
            {
                DataItemLink = "Notice No." = field("Document No.");
                DataItemLinkReference = "Project Mobilization Header";
                DataItemTableView = where("Document Class" = const("Program of Works"), "Program of Works" = const(true));
                column(Program_of_WorksDocuments; Description)
                {

                }
            }
            dataitem("Mobilization Required Document"; "PCO Required Document")
            {
                DataItemLink = "Notice No." = field("Document No.");
                DataItemLinkReference = "Project Mobilization Header";
                DataItemTableView = where("Document Class" = const(Mobilization), "Mobilization Document" = const(true));
                column(MobilizationDocuments; Description)
                {

                }
            }
            dataitem("Contract Sub Clause"; "Contract Sub Clause")
            {
                DataItemLink = "Contract No" = field("Purchase Contract ID");
                DataItemTableView = where("Document Type" = const(PCO));
                DataItemLinkReference = "Project Mobilization Header";
                column(Code; Code)
                {

                }
                column(Description; Description)
                {

                }
            }

            trigger OnAfterGetRecord()
            begin
                // ApprovalEntries.RESET;
                // ApprovalEntries.SETRANGE("Table ID",72157);
                // ApprovalEntries.SETRANGE("Document No.","Project Mobilization Header"."Document No.");
                // ApprovalEntries.SETRANGE(Status,ApprovalEntries.Status::Approved);
                // IF ApprovalEntries.FIND('-') THEN BEGIN
                //   i:=0;
                // REPEAT
                // i:=i+1;
                // IF i=1 THEN BEGIN
                // Approver[1]:=ApprovalEntries."Sender ID";
                //
                // ApproverDate[1]:=ApprovalEntries."Date-Time Sent for Approval";
                // IF UserSetup.GET(Approver[1]) THEN
                //    UserSetup.CALCFIELDS(Picture);
                //
                // Approver[2]:=ApprovalEntries."Approver ID";
                // ApproverDate[2]:=ApprovalEntries."Last Date-Time Modified";
                // IF UserSetup1.GET(Approver[2]) THEN
                //    UserSetup1.CALCFIELDS(Picture);
                // END;
                // IF i=2 THEN
                // BEGIN
                // Approver[3]:=ApprovalEntries."Approver ID";
                // ApproverDate[3]:=ApprovalEntries."Last Date-Time Modified";
                // IF UserSetup2.GET(Approver[3]) THEN
                //    UserSetup2.CALCFIELDS(Picture);
                // END;
                // IF i=3 THEN
                // BEGIN
                // Approver[4]:=ApprovalEntries."Approver ID";
                // ApproverDate[4]:=ApprovalEntries."Last Date-Time Modified";
                // IF UserSetup3.GET(Approver[4]) THEN
                //    UserSetup3.CALCFIELDS(Picture);
                // END;
                // UNTIL
                // ApprovalEntries.NEXT=0;
                //
                // END;

                ResponsibilityCenter.RESET;
                ResponsibilityCenter.SETRANGE(ResponsibilityCenter.Code, "Project Mobilization Header"."Directorate ID");
                IF ResponsibilityCenter.FINDSET THEN BEGIN
                    DirectorateName := ResponsibilityCenter.Name;
                END;
                Employee.RESET;
                Employee.SETRANGE(Employee."Directorate Code", "Project Mobilization Header"."Directorate ID");
                Employee.SETRANGE(Employee."Directorate Head", TRUE);
                IF Employee.FINDSET THEN BEGIN
                    DirectorName := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    DirectorUserID := Employee."User ID";
                END;

                if UserSetup.GET(DirectorUserID) then
                    UserSetup.CALCFIELDS(Picture);

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
        ObjCInfo.GET;
        ObjCInfo.CALCFIELDS(Picture);
    end;

    trigger OnPostReport()
    begin
        //MESSAGE('You have successfully generated Work Execution Plan for Project No:'+' '+"Project Mobilization Header"."Project ID");
    end;

    trigger OnPreReport()
    begin
        ObjCInfo.GET;
        ObjCInfo.CALCFIELDS(Picture);
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
        DirectorName: Text[250];
        DirectorUserID: Code[200];
        Employee: Record Employee;
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        RespCenter: Record "Responsibility Center";
}

