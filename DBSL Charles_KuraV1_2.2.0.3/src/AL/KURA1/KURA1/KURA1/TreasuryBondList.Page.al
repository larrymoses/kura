#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54008 "Treasury Bond List"
{
    ApplicationArea = Basic;
    CardPageID = "Treasury Bond Card";
    PageType = List;
    SourceTable = "Investment Asset";
    SourceTableView = where("Asset Type"=const("Money Market"),
                            "Investment Type"=const('06'),
                            "Deposit Type"=const(Treasury));
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
                field("Description 2";"Description 2")
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
                field("Custodian Code";"Custodian Code")
                {
                    ApplicationArea = Basic;
                }
                field("Fund Code";"Fund Code")
                {
                    ApplicationArea = Basic;
                }
                field("Maturity Period";"Maturity Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tenure (Years)';
                }
                field("Investment Date";"Investment Date")
                {
                    ApplicationArea = Basic;
                }
                field("Maturity Date";"Maturity Date")
                {
                    ApplicationArea = Basic;
                }
                field("Face Value";"Face Value")
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
                field(Institution;Institution)
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

