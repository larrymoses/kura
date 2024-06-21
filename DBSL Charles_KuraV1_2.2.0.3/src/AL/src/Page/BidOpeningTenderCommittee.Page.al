#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75158 "Bid Opening Tender Committee"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Bid Opening Tender Committee";
    ApplicationArea = BASIC;
    UsageCategory = Tasks;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Appointed Bid Opening Com"; "Appointed Bid Opening Com")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Member No."; "Member No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Member Name"; "Member Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Role Type"; "Role Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Nominated Bid Opening"; "Nominated Bid Opening")
                {
                    ApplicationArea = Basic;
                    Caption = 'Nominate for  Bid Opening Process';
                }
                field(Email; Email)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Designation; Designation)
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

