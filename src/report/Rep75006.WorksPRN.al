#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 75006 "Works PRN"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Works PRN.rdlc';

    dataset
    {
        dataitem("Purchase Header";"Purchase Header")
        {
            DataItemTableView = where("Document Type"=filter("Purchase Requisition"));
            column(ReportForNavId_1; 1)
            {
            }
            column(CIName;CompanyInformation.Name)
            {
            }
            column(CInAddress;CompanyInformation.Address)
            {
            }
            column(CIAddress2;CompanyInformation."Address 2")
            {
            }
            column(CICity;CompanyInformation.City)
            {
            }
            column(CIPicture;CompanyInformation.Picture)
            {
            }
            column(OrderDate_PurchaseHeader;Format("Purchase Header"."Order Date"))
            {
            }
            column(PostingDate_PurchaseHeader;Format("Purchase Header"."Posting Date"))
            {
            }
            column(ExpectedReceiptDate_PurchaseHeader;Format("Purchase Header"."Expected Receipt Date"))
            {
            }
            column(LocationCode_PurchaseHeader;"Purchase Header"."Location Code")
            {
            }
            column(ShortcutDimension1Code_PurchaseHeader;"Purchase Header"."Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code_PurchaseHeader;"Purchase Header"."Shortcut Dimension 2 Code")
            {
            }
            column(Amount_PurchaseHeader;"Purchase Header".Amount)
            {
            }
            column(AmountIncludingVAT_PurchaseHeader;"Purchase Header"."Amount Including VAT")
            {
            }
            column(DocumentType_PurchaseHeader;"Purchase Header"."Document Type")
            {
            }
            column(Status_PurchaseHeader;"Purchase Header".Status)
            {
            }
            column(No_PurchaseHeader;"Purchase Header"."No.")
            {
            }
            column(YourReference_PurchaseHeader;"Purchase Header"."Your Reference")
            {
            }
            column(PRNOrderDateTime_PurchaseHeader;"Purchase Header"."PRN Order Date/Time")
            {
            }
            column(Description_PurchaseHeader;"Purchase Header".Description)
            {
            }
            column(RequisitionType_PurchaseHeader;"Purchase Header"."Requisition Type")
            {
            }
            column(DepartmentName_PurchaseHeader;"Purchase Header"."Department Name")
            {
            }
            column(ProjectName_PurchaseHeader;"Purchase Header"."Project Name")
            {
            }
            column(RequestByNo_PurchaseHeader;"Purchase Header"."Request-By No.")
            {
            }
            column(RequestByName_PurchaseHeader;"Purchase Header"."Request-By Name")
            {
            }
            column(RequesterID_PurchaseHeader;"Purchase Header"."Requester ID")
            {
            }
            column(VoteItem_PurchaseHeader;"Purchase Header"."Vote Item")
            {
            }
            column(VoteAmount_PurchaseHeader;"Purchase Header"."Vote Amount")
            {
            }
            column(BudgetCommitments_PurchaseHeader;"Purchase Header"."Budget Commitments")
            {
            }
            column(JobTaskNo_PurchaseHeader;"Purchase Header"."Job Task No.")
            {
            }
            column(BudgetItem_PurchaseHeader;"Purchase Header"."Budget Item")
            {
            }
            column(BugetDesc_PurchaseHeader;"Purchase Header"."Buget Desc")
            {
            }
            column(BudgetedAmount_PurchaseHeader;"Purchase Header"."Budgeted Amount")
            {
            }
            column(ActualBudgetCosts_PurchaseHeader;"Purchase Header"."Actual Budget Costs")
            {
            }
            column(RequisitionAmount_PurchaseHeader;"Purchase Header"."Requisition Amount")
            {
            }
            column(RemainingBudget_PurchaseHeader;"Purchase Header"."Remaining Budget")
            {
            }
            column(FunctionName_PurchaseHeader;"Purchase Header"."Function Name")
            {
            }
            column(BudgetCenterName_PurchaseHeader;"Purchase Header"."Budget Center Name")
            {
            }
            column(ShortcutDimension3Code_PurchaseHeader;"Purchase Header"."Shortcut Dimension 3 Code")
            {
            }
            column(UnitName_PurchaseHeader;"Purchase Header"."Unit  Name")
            {
            }
            column(TotalProjectCost_PurchaseHeader;"Purchase Header"."Total Project Cost")
            {
            }
            column(ProcurementType_PurchaseHeader;"Purchase Header"."Procurement Type")
            {
            }
            column(ApprovedRequisitionAmount_PurchaseHeader;"Purchase Header"."Approved Requisition Amount")
            {
            }
            column(ProcurementPlan_PurchaseHeader;"Purchase Header"."Procurement Plan")
            {
            }
            column(ProcurementPlanItem_PurchaseHeader;"Purchase Header"."Procurement Plan Item")
            {
            }
            column(RequisitionNo_PurchaseHeader;"Purchase Header"."Requisition No")
            {
            }
            column(DepartmentCode_PurchaseHeader;"Purchase Header"."Department Code")
            {
            }
            column(DirectorateCode_PurchaseHeader;"Purchase Header"."Directorate Code")
            {
            }
            column(Division_PurchaseHeader;"Purchase Header".Division)
            {
            }
            column(Job_PurchaseHeader;"Purchase Header".Job)
            {
            }
            column(JobName_PurchaseHeader;"Purchase Header"."Job Name")
            {
            }
            column(RegionName;RegionName)
            {
            }
            column(DepartmentName;DepartmentName)
            {
            }
            column(DirectorateName;DirectorateName)
            {
            }
            column(Region_PurchaseHeader;"Purchase Header".Region)
            {
            }
            column(FundingSource_PurchaseHeader;"Purchase Header"."Funding Source")
            {
            }
            column(SolicitationType_PurchaseHeader;"Purchase Header"."Solicitation Type")
            {
            }
            column(PRNType_PurchaseHeader;"Purchase Header"."PRN Type")
            {
            }
            column(ProjectStaffingTemplateID_PurchaseHeader;"Purchase Header"."Project Staffing Template ID")
            {
            }
            column(WorksEquipmentTemplateID_PurchaseHeader;"Purchase Header"."Works Equipment Template ID")
            {
            }
            column(ProcurementPlanID_PurchaseHeader;"Purchase Header"."Procurement Plan ID")
            {
            }
            column(ProcurementPlanEntryNo_PurchaseHeader;"Purchase Header"."Procurement Plan Entry No")
            {
            }
            column(PPPlanningCategory_PurchaseHeader;"Purchase Header"."PP Planning Category")
            {
            }
            column(PPFundingSourceID_PurchaseHeader;"Purchase Header"."PP Funding Source ID")
            {
            }
            column(PPTotalBudget_PurchaseHeader;"Purchase Header"."PP Total Budget")
            {
            }
            column(PPTotalActualCosts_PurchaseHeader;"Purchase Header"."PP Total Actual Costs")
            {
            }
            column(PPTotalCommitments_PurchaseHeader;"Purchase Header"."PP Total Commitments")
            {
            }
            column(PPTotalAvailableBudget_PurchaseHeader;"Purchase Header"."PP Total Available Budget")
            {
            }
            column(PPSolicitationType_PurchaseHeader;"Purchase Header"."PP Solicitation Type")
            {
            }
            column(PPProcurementMethod_PurchaseHeader;"Purchase Header"."PP Procurement Method")
            {
            }
            column(WorksCategory_PurchaseHeader;"Purchase Header"."Works Category")
            {
            }
            column(WorksDescription_PurchaseHeader;"Purchase Header"."Works Description")
            {
            }
            column(TotalPRNAmount_PurchaseHeader;"Purchase Header"."Total PRN Amount")
            {
            }
            column(TotalPRNAmountLCY_PurchaseHeader;"Purchase Header"."Total PRN Amount (LCY)")
            {
            }
            column(PPInvitationNoticeType_PurchaseHeader;"Purchase Header"."PP  Invitation Notice Type")
            {
            }
            column(PPBidSelectionMethod_PurchaseHeader;"Purchase Header"."PP Bid Selection Method")
            {
            }
            column(PreparedBy;UserSetup."Employee Name")
            {
            }
            column(DatePrepared;ApproverDate[1])
            {
            }
            column(PreparedBy_Signature;UserSetup.Picture)
            {
            }
            column(ExaminedBy;UserSetup1."Employee Name")
            {
            }
            column(DateApproved;Format(ApproverDate[2]))
            {
            }
            column(ExaminedBy_Signature;UserSetup1.Picture)
            {
            }
            column(VBC;UserSetup2."Employee Name")
            {
            }
            column(VBCDate;ApproverDate[3])
            {
            }
            column(VBC_Signature;UserSetup2.Picture)
            {
            }
            column(Authorizer;UserSetup3."Employee Name")
            {
            }
            column(DateAuthorized;ApproverDate[4])
            {
            }
            column(Authorizer_Signature;UserSetup3.Picture)
            {
            }
            dataitem("Purchase Line";"Purchase Line")
            {
                DataItemLink = "Document No."=field("No.");
                column(ReportForNavId_68; 68)
                {
                }
                column(ItemCategoryCode_PurchaseLine;"Purchase Line"."Item Category Code")
                {
                }
                column(DocumentType_PurchaseLine;"Purchase Line"."Document Type")
                {
                }
                column(DocumentNo_PurchaseLine;"Purchase Line"."Document No.")
                {
                }
                column(Type_PurchaseLine;"Purchase Line".Type)
                {
                }
                column(No_PurchaseLine;"Purchase Line"."No.")
                {
                }
                column(Description_PurchaseLine;"Purchase Line".Description)
                {
                }
                column(Description2_PurchaseLine;"Purchase Line"."Description 2")
                {
                }
                column(UnitofMeasure_PurchaseLine;"Purchase Line"."Unit of Measure")
                {
                }
                column(Quantity_PurchaseLine;"Purchase Line".Quantity)
                {
                }
                column(DirectUnitCost_PurchaseLine;"Purchase Line"."Direct Unit Cost")
                {
                }
                column(VAT_PurchaseLine;"Purchase Line"."VAT %")
                {
                }
                column(Amount_PurchaseLine;"Purchase Line".Amount)
                {
                }
                column(AmountIncludingVAT_PurchaseLine;"Purchase Line"."Amount Including VAT")
                {
                }
            }
            dataitem("PRN Personnel Specification";"PRN Personnel Specification")
            {
                DataItemLink = "Document No."=field("No.");
                column(ReportForNavId_81; 81)
                {
                }
                column(DocumentType_PRNPersonnelSpecification;"PRN Personnel Specification"."Document Type")
                {
                }
                column(DocumentNo_PRNPersonnelSpecification;"PRN Personnel Specification"."Document No.")
                {
                }
                column(StaffRoleCode_PRNPersonnelSpecification;"PRN Personnel Specification"."Staff Role Code")
                {
                }
                column(TitleDesignationDescription_PRNPersonnelSpecification;"PRN Personnel Specification"."Title/Designation Description")
                {
                }
                column(StaffCategory_PRNPersonnelSpecification;"PRN Personnel Specification"."Staff Category")
                {
                }
                column(MinNoofRecommStaff_PRNPersonnelSpecification;"PRN Personnel Specification"."Min No. of Recomm Staff")
                {
                }
                column(EntryNo_PRNPersonnelSpecification;"PRN Personnel Specification"."Entry No")
                {
                }
            }
            dataitem("PRN Equipment Specification";"PRN Equipment Specification")
            {
                DataItemLink = "Document No."=field("No.");
                column(ReportForNavId_89; 89)
                {
                }
                column(DocumentType_PRNEquipmentSpecification;"PRN Equipment Specification"."Document Type")
                {
                }
                column(DocumentNo_PRNEquipmentSpecification;"PRN Equipment Specification"."Document No.")
                {
                }
                column(EquipmentType_PRNEquipmentSpecification;"PRN Equipment Specification"."Equipment Type")
                {
                }
                column(Category_PRNEquipmentSpecification;"PRN Equipment Specification".Category)
                {
                }
                column(Description_PRNEquipmentSpecification;"PRN Equipment Specification".Description)
                {
                }
                column(MinimumRequiredQty_PRNEquipmentSpecification;"PRN Equipment Specification"."Minimum Required Qty")
                {
                }
                column(Blocked_PRNEquipmentSpecification;"PRN Equipment Specification".Blocked)
                {
                }
                column(Id_PRNEquipmentSpecification;"PRN Equipment Specification".Id)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                CompanyInformation.Get;
                CompanyInformation.CalcFields(CompanyInformation.Picture);

                 ApprovalEntries.Reset;
                 ApprovalEntries.SetRange("Table ID",38);
                 ApprovalEntries.SetRange("Document No.","Purchase Header"."No.");
                 //ApprovalEntries.SETRANGE(Approval."Document Type","Purchase Header"."Document Type"::"Purchase Requisition");
                 ApprovalEntries.SetRange(Status,ApprovalEntries.Status::Approved);
                 if ApprovalEntries.Find('-') then begin
                   //i:=0;
                 repeat
                 //i:=i+1;
                 //IF i=2 THEN BEGIN
                 if ApprovalEntries."Sequence No."=1 then begin
                 Approver1[1]:=ApprovalEntries."Sender ID";

                 ApproverDate[1]:=ApprovalEntries."Date-Time Sent for Approval";
                 if UserSetup.Get(Approver1[1]) then
                    UserSetup.CalcFields(Picture);
                 Approver1[2]:=ApprovalEntries."Last Modified By User ID";

                 ApproverDate[2]:=ApprovalEntries."Last Date-Time Modified";
                 if UserSetup1.Get(Approver1[2]) then
                    UserSetup1.CalcFields(Picture);
                 end;



                 // IF i=3 THEN
                 // BEGIN
                 if ApprovalEntries."Sequence No."=2 then begin
                 Approver1[3]:=ApprovalEntries."Last Modified By User ID";

                 ApproverDate[3]:=ApprovalEntries."Last Date-Time Modified";
                 if UserSetup2.Get(Approver1[3]) then
                    UserSetup2.CalcFields(Picture);
                 end;

                 //IF i= 4 THEN
                 if ApprovalEntries."Sequence No."=3 then
                 begin
                 Approver1[4]:=ApprovalEntries."Last Modified By User ID";

                 ApproverDate[4]:=ApprovalEntries."Last Date-Time Modified";
                 if UserSetup3.Get(Approver1[4]) then
                    UserSetup3.CalcFields(Picture);
                 end;

                 //IF i=5 THEN
                 if ApprovalEntries."Sequence No."=4 then
                 begin
                 Approver1[5]:=ApprovalEntries."Last Modified By User ID";

                 ApproverDate[5]:=ApprovalEntries."Last Date-Time Modified";
                 if usersetup4.Get(Approver1[5]) then
                    usersetup4.CalcFields(Picture);
                 end;

                 //IF i=6 THEN
                 begin
                 Approver1[6]:=ApprovalEntries."Last Modified By User ID";
                 ApproverDate[6]:=ApprovalEntries."Last Date-Time Modified";
                 if UserSetup5.Get(Approver1[6]) then
                    UserSetup5.CalcFields(Picture);
                 end;
                until
                ApprovalEntries.Next=0;

                end;
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"Purchase Header"."Shortcut Dimension 1 Code");
                if ResponsibilityCenter.FindSet then
                  RegionName:=ResponsibilityCenter.Name;
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"Purchase Header"."Directorate Code");
                if ResponsibilityCenter.FindSet then
                  DirectorateName:=ResponsibilityCenter.Name;
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"Purchase Header"."Department Code");
                if ResponsibilityCenter.FindSet then
                  DepartmentName:=ResponsibilityCenter.Name;
            end;

            trigger OnPostDataItem()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"Purchase Header"."Shortcut Dimension 1 Code");
                if ResponsibilityCenter.FindSet then
                  RegionName:=ResponsibilityCenter.Name;
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"Purchase Header"."Directorate Code");
                if ResponsibilityCenter.FindSet then
                  DirectorateName:=ResponsibilityCenter.Name;
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"Purchase Header"."Department Code");
                if ResponsibilityCenter.FindSet then
                  DepartmentName:=ResponsibilityCenter.Name;
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

    var
        CompanyInformation: Record "Company Information";
        ApprovalEntries: Record "Approval Entry";
        Approver: array [10] of Code[50];
        ApproverDate: array [10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
        Approval1: Record "Approval Entry";
        Approval2: Record "Approval Entry";
        Approver1: array [10] of Code[50];
        usersetup4: Record "User Setup";
        UserSetup5: Record "User Setup";
        RegionName: Text[250];
        ResponsibilityCenter: Record "Responsibility Center";
        DepartmentName: Text[250];
        DirectorateName: Text[250];
}

