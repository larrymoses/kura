#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75343 "Prequalification Evaluation"
{
    ApplicationArea = Basic;
    CardPageID = "Evaluation Vouchers";
    Editable = false;
    PageType = List;
    SourceTable = "Prequalification Score Header";
    SourceTableView = where(Type=const(Multiple),
                            "Process Type"=const(Prequalification));
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
                field(Description;Description)
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
                field("Primary Responsibility Center";"Primary Responsibility Center")
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

