#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57091 "institutions Action List"
{
    PageType = ListPart;
    SourceTable = "Institutional Actns Amount";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Investment Code";"Investment Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("Fund Code";"Fund Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Custodian Code";"Custodian Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Books Closure Date";"Books Closure Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule Date';
                }
                field("Payment Date";"Payment Date")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Payment posted";"Payment posted")
                {
                    ApplicationArea = Basic;
                }
                field("Check to Post";"Check to Post")
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

