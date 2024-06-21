page 99546 "Leave Plan Detailed Lines"
{
    Caption = 'Leave Plan Detailed Lines';
    PageType = List;
    SourceTable = "Leave Plan Detailed Lines";
    UsageCategory = None;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    Visible =false;
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Start Date";Rec."Start Date")
                {
                     ApplicationArea = Basic;
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Days Applied field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Leave Period"; Rec."Leave Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Period field.';
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Type field.';
                }
                field(Reliever;Rec.Reliever)
                {
ApplicationArea = Basic;
                }
                field("Reliever Name";Rec."Reliever Name")
                {
ApplicationArea = Basic;
                }
            }
        }
    }
}
