#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75455 "Variation of Price Indices"
{
    PageType = List;
    SourceTable = "Variation Of Price Index";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Index Code"; Rec."Index Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Index Code';
                }
                field("Index Description"; Rec."Index Description")
                {
                    ApplicationArea = Basic;
                }
                field("Range of Weighting"; Rec."Range of Weighting")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Weight"; Rec."Contract Weight")
                {
                    ApplicationArea = Basic;
                }
                field("Index Source"; Rec."Index Source")
                {
                    ApplicationArea = Basic;
                }
                field("Base Index"; Rec."Base Index")
                {
                    ApplicationArea = Basic;
                }
                field("Adjustment Factor"; Rec."Adjustment Factor")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

