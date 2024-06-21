/// <summary>
/// Page Attachments Setup (ID 50111).
/// </summary>
page 50111 "Attachments Setup"
{
    Caption = 'Attachments Setup';
    PageType = List;
    SourceTable = "Attachment Setup";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Code;Rec.Code)
                {
                }
                field("Attachment Description";Rec."Attachment Description")
                {
                }
                field(Blocked;Rec.Blocked)
                {
                }
            }
        }
    }
}
