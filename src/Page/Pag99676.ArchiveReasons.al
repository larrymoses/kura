/// <summary>
/// Page Archive Reasons (ID 99676).
/// </summary>
page 99676 "Archive Reasons"
{
    ApplicationArea = All;
    Caption = 'Archive Reasons';
    PageType = List;
    SourceTable = "Archive Reasons";
    UsageCategory = Lists;
    PopulateAllFields=true;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Action Type"; Rec."Action Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Action Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    Editable=false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
            }
        }
    }
}
