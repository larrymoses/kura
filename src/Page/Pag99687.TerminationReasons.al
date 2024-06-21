page 99687 "Termination Reasons"
{
    Caption = 'Termination Reasons';
    PageType = ListPart;
    SourceTable = "Contract Termination Reasons";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Reason;Rec.Reason)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}
