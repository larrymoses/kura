#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50063 "pageextension50063" extends "Approval User Setup"
{
    layout
    {
        addafter("Approval Administrator")
        {
            field("Employee No."; Rec."Employee No.")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        addafter("&Approval User Setup Test")
        {
            action("User Signature")
            {
                ApplicationArea = Basic;
                Caption = 'User Signature';
                Image = Picture;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "User Signature";
                RunPageLink = "User ID" = field("User ID");
            }
        }
    }
}

#pragma implicitwith restore

