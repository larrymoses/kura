/// <summary>
/// Page Prof.BodyMembeshipCategories (ID 50024).
/// </summary>
page 50024 "Prof.BodyMembeshipCategories"
{
    ApplicationArea = BasicHR;
    Caption = 'Prof. Body Membeship Categories';
    PageType = List;
    SourceTable = ProfBodyMembershipCategories;
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
            }
        }
    }
}
