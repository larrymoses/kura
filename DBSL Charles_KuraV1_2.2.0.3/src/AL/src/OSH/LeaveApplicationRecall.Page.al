

Page 69530 "Leave Application Recall"
{
    CardPageID = "Leave Application Recall Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Leave Recall";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable =false;
                field("Recall No"; Rec."Recall No")
                {
                    ApplicationArea = Basic;
                }
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Code"; Rec."Leave Code")
                {
                    ApplicationArea = Basic;
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Days"; Rec."Approved Days")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Start Date"; Rec."Approved Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Days Recalled"; Rec."Days Recalled")
                {
                    ApplicationArea = Basic;
                }
                field("Recall Date From"; Rec."Recall Date From")
                {
                    ApplicationArea = Basic;
                }
                field("Recall Date To"; Rec."Recall Date To")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Reason for Recall"; Rec."Reason for Recall")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
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


