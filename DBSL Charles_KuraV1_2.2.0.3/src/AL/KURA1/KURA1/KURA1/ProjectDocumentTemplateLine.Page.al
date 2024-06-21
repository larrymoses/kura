#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings

Page 72248 "Project Document Template Line"
{
    PageType = ListPart;
    SourceTable = "Project Document Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Document Class"; Rec."Document Class")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Guidelines/Instructions"; Rec."Guidelines/Instructions")
                {
                    ApplicationArea = Basic;
                }
                field("Program of Works"; Rec."Program of Works")
                {
                    ApplicationArea = Basic;
                }
                field("Mobilization Document"; Rec."Mobilization Document")
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



