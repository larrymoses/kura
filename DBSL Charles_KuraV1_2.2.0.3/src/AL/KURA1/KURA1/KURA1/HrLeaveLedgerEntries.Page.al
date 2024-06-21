#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69223 "Hr Leave Ledger Entries"
{
    PageType = List;
    SourceTable = "HR Leave Ledger Entries";
    //  Editable =false;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Leave Period"; Rec."Leave Period")
                {
                    ApplicationArea = Basic;
                }
                field("Staff No."; Rec."Staff No.")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Approval Date"; Rec."Leave Approval Date")
                {
                    ApplicationArea = Basic;
                }
                field("No. of days"; Rec."No. of days")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Start Date"; Rec."Leave Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Posting Description"; Rec."Leave Posting Description")
                {
                    ApplicationArea = Basic;
                }
                field("Leave End Date"; Rec."Leave End Date")
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

#pragma implicitwith restore

