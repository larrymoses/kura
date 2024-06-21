#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54022 "Call Deposit List"
{
    ApplicationArea = Basic;
    CardPageID = "Call Deposit Card";
    Editable = false;
    PageType = List;
    SourceTable = "Investment Asset";
    SourceTableView = where("Asset Type"=const("Money Market"),
                            "Investment Type"=const('04'),
                            "Deposit Type"=const(Call));
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
                field("FDR Number";"FDR Number")
                {
                    ApplicationArea = Basic;
                }
                field("Investment Type";"Investment Type")
                {
                    ApplicationArea = Basic;
                }
                field("Deposit Type";"Deposit Type")
                {
                    ApplicationArea = Basic;
                }
                field("No.Of Units";"No.Of Units")
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
            }
        }
    }

    actions
    {
    }
}

