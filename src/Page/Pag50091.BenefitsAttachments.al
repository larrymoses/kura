/// <summary>
/// Page Benefits Attachments (ID 50091).
/// </summary>
page 50091 "Benefits Attachments"
{
    Caption = 'Benefits Attachments';
    PageType = List;
    SourceTable = "Benefits Attachments";
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Benefit Category";Rec."Benefit Category")
                {
                }
                field("Benefit Description";Rec."Benefit Description")
                {
                }
                field("Attachment Code";Rec."Attachment Code")
                {
                }
                field("Attachment Description";Rec."Attachment Description")
                {
                }
                field("Attachment Type";Rec."Attachment Type")
                {
                }
            }
        }
    }

    actions
    {
    }
}

