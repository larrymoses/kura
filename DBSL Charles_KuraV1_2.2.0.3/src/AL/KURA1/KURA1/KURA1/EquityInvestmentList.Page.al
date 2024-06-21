#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54000 "Equity Investment List"
{
    ApplicationArea = Basic;
    CardPageID = "Equity Card";
    Editable = false;
    PageType = List;
    SourceTable = "Investment Asset";
    SourceTableView = where("Asset Type"=const(Equity),
                            UnitTrust=const(false),
                            Offshore=const(false));
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
                field("Fund Code";"Fund Code")
                {
                    ApplicationArea = Basic;
                }
                field("Custodian Code";"Custodian Code")
                {
                    ApplicationArea = Basic;
                }
                field("Investment Type";"Investment Type")
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
                field("Dividend Receivable";"Dividend Receivable")
                {
                    ApplicationArea = Basic;
                }
                field("Revaluations (FCY)";"Revaluations (FCY)")
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

