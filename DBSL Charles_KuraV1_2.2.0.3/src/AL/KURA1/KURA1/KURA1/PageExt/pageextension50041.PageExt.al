#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50041 "pageextension50041" extends "Work Types"
{
    layout
    {
        addafter("Unit of Measure Code")
        {
            field(Rate; Rec.Rate)
            {
                ApplicationArea = Basic;
            }
            field("Responsibility Center Code"; Rec."Responsibility Center Code")
            {
                ApplicationArea = Basic;
            }
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = Basic;
            }
            field(Category; Rec.Category)
            {
                ApplicationArea = Basic;
            }
            field("G/L Account"; Rec."G/L Account")
            {
                ApplicationArea = Basic;
            }
            field("Local Travel"; Rec."Local Travel")
            {
                ApplicationArea = Basic;
            }
            field("International Travel"; Rec."International Travel")
            {
                ApplicationArea = Basic;
            }
            field(Blocked; rec.Blocked)
            {
                ApplicationArea = Basic;
            }
        }
    }
}

#pragma implicitwith restore

