
Page 72414 "Contract Sub Clauses"
{
    CardPageID = "Contract Sub Clause";
    PageType = List;
    SourceTable = "Contract Sub Clause";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
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
            }
        }
    }

    
}



