#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57089 "Div Schedule  Per Amount List"
{
    ApplicationArea = Basic;
    Caption = 'Div Schedule  Per Amount List';
    CardPageID = "Div Schedule Per Amount";
    Editable = false;
    PageType = List;
    SourceTable = "Budget Commitment";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No.";"Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account No.";"Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name";"Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Budgeted Amount";"Budgeted Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Commited Amount PRN";"Commited Amount PRN")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Start Date";"Budget Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Commited Amount Orders";"Commited Amount Orders")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Name";"Budget Name")
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

