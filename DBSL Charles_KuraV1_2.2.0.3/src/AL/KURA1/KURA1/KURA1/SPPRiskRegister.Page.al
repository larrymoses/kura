#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 92554 "SPP Risk Register"
{
    Caption = 'SPP Risk Register';
    PageType = List;
    SourceTable = "Schedule of PP Requirements";
    SourceTableView = where("Requirement Type" = filter("Risk Register"));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Category"; Rec."Risk Category")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Title"; Rec."Risk Title")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Allocation"; Rec."Risk Allocation")
                {
                    ApplicationArea = Basic;
                }
                field("Contractual Reference Clause"; Rec."Contractual Reference Clause")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Requirement Type" := Rec."requirement type"::"Risk Register";
    end;
}
