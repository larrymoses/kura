#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50107 "pageextension50107" extends "Responsibility Center List" 
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Responsibility Center List"(Page 5715)".

    layout
    {
        addafter("Location Code")
        {
            field("Operating Unit Type";"Operating Unit Type")
            {
                ApplicationArea = Basic;
            }
            field("Direct Reports To";"Direct Reports To")
            {
                ApplicationArea = Basic;
            }
            field("Indirect Reports To";"Indirect Reports To")
            {
                ApplicationArea = Basic;
            }
            field("Hierarchical  Level ID";"Hierarchical  Level ID")
            {
                ApplicationArea = Basic;
            }
            field("Headed By (Title)";"Headed By (Title)")
            {
                ApplicationArea = Basic;
            }
            field("Current Head";"Current Head")
            {
                ApplicationArea = Basic;
            }
            field(HQ;Rec.HQ)
            {
               ApplicationArea = Basic; 
            }
        }
    }

    //Unsupported feature: Property Deletion (Editable).

}

