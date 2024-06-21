#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 92533 "SPP Staff Specifications"
{
    Caption = 'SPP Equipment Specifications';
    PageType = List;
    SourceTable = "Schedule of PP Requirements";
    SourceTableView = where("Requirement Type" = filter("Personnel Specifications"));

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
                field("Staff Role Code"; Rec."Staff Role Code")
                {
                    ApplicationArea = Basic;
                }
                field("Title/Designation"; Rec."Title/Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Min No of Recommended Staff"; Rec."Min No of Recommended Staff")
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
        Rec."Requirement Type" := Rec."requirement type"::"Personnel Specifications";
    end;
}
