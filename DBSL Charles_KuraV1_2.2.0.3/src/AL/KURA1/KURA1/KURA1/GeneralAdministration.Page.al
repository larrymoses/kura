#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72423 "General Administration"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Project Document Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Template ID";"Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Document Class";"Document Class")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type";"Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Guidelines/Instructions";"Guidelines/Instructions")
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

