pageextension 50146 DimensionsExt extends Dimensions
{
    layout
    {
        addbefore(Blocked)
        {
            field("Affects Budget";Rec."Affects Budget")
            {
                ApplicationArea=All;
            }
        }
    }
    
   
    
    var
        myInt: Integer;
}