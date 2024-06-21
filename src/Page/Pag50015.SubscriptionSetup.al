/// <summary>
/// Page SubscriptionSetup (ID 50015).
/// </summary>
page 50015 SubscriptionSetup
{
    // ApplicationArea = BasicHR;
    Caption = 'Subscription & Cont. Development Setup';
    PageType = Card;
    SourceTable = SubscriptionSetup;
    // UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Professional Body No."; Rec."Professional Body No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Professional Body No. field.';
                }
                field("Membership No."; Rec."Membership No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Membership No. field.';
                }
                field("Membership Fees Req. No.";Rec."Membership Fees Req. No.")
                {
                    ApplicationArea = All;
                }
                field("Admin E-Mail";Rec."Admin E-Mail")
                {
                    ApplicationArea = All;
                }
                field("Conference Nos";Rec."Conference Nos")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
