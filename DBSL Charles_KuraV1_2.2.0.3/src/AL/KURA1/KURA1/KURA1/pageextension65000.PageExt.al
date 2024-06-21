#pragma implicitwith disable
PageExtension 65000 "pageextension65000" extends "Purchase Lines"
{
    layout

    {
        addafter("Line Amount")
        {

            field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
            {
                ApplicationArea = Basic;


            }
            field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
            {
                ApplicationArea = basic;
            }
            field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = basic;
                Visible = true;
            }

        }
        addafter(Description)
        {
            field(Description3; Rec.Description3)
            {
                ApplicationArea = BASIC;
                Visible = TRUE;
            }
        }
    }

    var
        PurchaseLine: Record "Purchase Line";
}

#pragma implicitwith restore
