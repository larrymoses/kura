#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 92532 "SPP Equipment Specifications"
{
    Caption = 'SPP Equipment Specifications';
    PageType = List;
    SourceTable = "Schedule of PP Requirements";
    SourceTableView = where("Requirement Type" = filter("Equipment Specifications"));

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
                field("Equipment Type"; Rec."Equipment Type")
                {
                    ApplicationArea = Basic;
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Description"; Rec."Equipment Description")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Required Qty (Equip)"; Rec."Minimum Required Qty (Equip)")
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
        Rec."Requirement Type" := Rec."requirement type"::"Equipment Specifications";
    end;
}
