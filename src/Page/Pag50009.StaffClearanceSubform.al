page 50009 "Staff Clearance Subform"
{
    Caption = 'Staff Clearance Subform';
    PageType = ListPart;
    SourceTable = "Staff Clearance";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Staff Clearance Code";"Staff Clearance Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Staff Clearance Code field.';
                }
                field("Item Code";"Item Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Item Code field.';
                }
                field("Item Description";"Item Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Item Description field.';
                }
                field(Cleared;Cleared)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Item Description field.';
                }
            }
        }
    }
}
