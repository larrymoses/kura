#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50111 "pageextension50111" extends "Service Item List" 
{
    layout
    {

        //Unsupported feature: Property Modification (SourceExpr) on ""Item No."(Control 12)".


        //Unsupported feature: Property Modification (Name) on ""Item No."(Control 12)".


        //Unsupported feature: Property Modification (SourceExpr) on ""Warranty Starting Date (Labor)"(Control 6)".


        //Unsupported feature: Property Modification (Name) on ""Warranty Starting Date (Labor)"(Control 6)".

        addafter("Warranty Starting Date (Labor)")
        {
            field("Copyright Work Category";"Copyright Work Category")
            {
                ApplicationArea = Basic;
            }
            field("Copyright Work SubCategory";"Copyright Work SubCategory")
            {
                ApplicationArea = Basic;
            }
            field("Copyright Category Description";"Copyright Category Description")
            {
                ApplicationArea = Basic;
            }
        }
        moveafter("Customer No.";"Warranty Starting Date (Labor)")
    }
}

