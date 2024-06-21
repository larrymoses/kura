#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54024 "Treasury Bill List"
{
    ApplicationArea = Basic;
    CardPageID = "Treasury Bill Card";
    Editable = false;
    PageType = List;
    SourceTable = "Investment Asset";
    SourceTableView = where("Asset Type"=const("Money Market"),
                            "Investment Type"=const('05'));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Deposit Type";"Deposit Type")
                {
                    ApplicationArea = Basic;
                }
                field("Investment Date";"Investment Date")
                {
                    ApplicationArea = Basic;
                }
                field("Maturity Date";"Maturity Date")
                {
                    ApplicationArea = Basic;
                }
                field("Acquisition Cost";"Acquisition Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Current Value";"Current Value")
                {
                    ApplicationArea = Basic;
                }
                field("Accrued Interest";"Accrued Interest")
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

