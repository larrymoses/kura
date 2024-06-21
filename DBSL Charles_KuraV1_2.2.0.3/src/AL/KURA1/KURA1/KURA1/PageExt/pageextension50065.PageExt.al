
PageExtension 50065 "pageextension50065" extends "Job Task Lines"
{
    layout
    {

        addafter("End Date")
        {
            field("Global Dimension 1 Code1"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = all;
                Visible = true;
            }
        }



    }
}



