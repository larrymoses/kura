#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80415 "Sub Objectives/Intiatives-Dir"
{
    PageType = ListPart;
    SourceTable = "Sub PC Objective";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Initiative No."; Rec."Initiative No.")
                {
                    ApplicationArea = Basic;
                }
                field("Sub-Initiative"; Rec."Objective/Initiative")
                {
                    ApplicationArea = Basic;
                }
                field("Sub-Indicator"; Rec."Sub Initiative No.")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(Target; Rec."Imported Annual Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Target';
                }
                field("Assigned Weight (%)"; Rec."Assigned Weight (%)")
                {
                    ApplicationArea = Basic;
                }
                field("Directors Achieved Targets"; Rec."Directors Achieved Targets")
                {
                    ApplicationArea = Basic;
                }
                FIELD("Q1 Target Qty"; Rec."Q1 Target Qty") { ApplicationArea = BASIC; }
                FIELD("Q2 Target Qty"; Rec."Q2 Target Qty") { ApplicationArea = BASIC; }
                FIELD("Q3 Target Qty"; Rec."Q3 Target Qty") { ApplicationArea = BASIC; }
                FIELD("Q4 Target Qty"; Rec."Q4 Target Qty") { ApplicationArea = BASIC; }
                field("Completion Date"; Rec."Due Date")
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

