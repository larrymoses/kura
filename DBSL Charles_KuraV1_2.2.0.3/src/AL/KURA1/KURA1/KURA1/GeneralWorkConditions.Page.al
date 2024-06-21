#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69638 "General Work Conditions"
{
    PageType = List;
    SourceTable = "Position Work Condition";
    Editable = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Work Condition Category"; Rec."Work Condition Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control8; Outlook)
            {
            }
            systempart(Control9; Notes)
            {
            }
            systempart(Control10; MyNotes)
            {
            }
            systempart(Control11; Links)
            {
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

