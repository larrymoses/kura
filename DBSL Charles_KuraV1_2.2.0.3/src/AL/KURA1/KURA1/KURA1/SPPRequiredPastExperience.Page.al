#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 92528 "SPP Required Past Experience"
{
    PageType = List;
    SourceTable = "Schedule of PP Requirements";
    SourceTableView = where("Requirement Type" = filter("Past Experience"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Project Scope Summary"; Rec."Project Scope Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Type of Engagement"; Rec."Type of Engagement")
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
        Rec."Requirement Type" := Rec."requirement type"::"Past Experience";
    end;
}