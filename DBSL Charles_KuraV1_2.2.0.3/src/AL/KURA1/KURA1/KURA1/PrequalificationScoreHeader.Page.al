#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75186 "Prequalification Score Header"
{
    ApplicationArea = Basic;
    CardPageID = "Prequalification Score Card";
    Editable = false;
    PageType = List;
    SourceTable = "Prequalification Score Header";
    SourceTableView = where(Type=filter(<>Multiple));
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Prequalification Evaluation Te";"Prequalification Evaluation Te")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Lead";"Evaluation Lead")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Lead Name";"Evaluation Lead Name")
                {
                    ApplicationArea = Basic;
                }
                field("Prequalification Response No.";"Prequalification Response No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No.";"Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Name";"Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("IFP No.";"IFP No.")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Category";"Procurement Category")
                {
                    ApplicationArea = Basic;
                }
                field("Category Name";"Category Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Responsibility Center";"Primary Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("System Evaluation Score %";"System Evaluation Score %")
                {
                    ApplicationArea = Basic;
                }
                field("Final Evaluation Score %";"Final Evaluation Score %")
                {
                    ApplicationArea = Basic;
                }
                field("Final Evaluation Decision";"Final Evaluation Decision")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Committee Remarks";"Evaluation Committee Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series";"No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date";"Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time";"Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

