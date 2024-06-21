#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72185 "BoQ Template Line"
{
    PageType = ListPart;
    SourceTable = "Requisition Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("BOQ Type"; Rec."BOQ Type")
                {
                    ApplicationArea = Basic;
                    Visible = TRUE;
                }
                field("BoQ No"; Rec."BoQ No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                }
                field("Technology Type"; Rec."Technology Type")
                {
                    ApplicationArea = Basic;
                }
                field("Labour %"; Rec."Labour %")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Amount Excl. VAT"; Rec."Unit Amount Excl. VAT")
                {
                    ApplicationArea = Basic;
                    Caption = 'Planned Rate';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Reversion Type"; Rec."Reversion Type")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = Basic;
                    trigger onvalidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Default Contingency %"; Rec."Default Contingency %")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Default Job Task No."; Rec."Default Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Begin-Total Job Task No."; Rec."Begin-Total Job Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("End-Total Job Task No."; Rec."End-Total Job Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                group("F&unctions")
                {
                    Caption = 'F&unctions';
                    Image = "Action";
                    action("Regional Rates")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Planned Regional Rate Template";
                        RunPageLink = "Requisition Template ID" = field("Requisition Template ID"),
                                      "Line No" = field("Line No.");
                    }
                }
            }
        }
    }

}

#pragma implicitwith restore

