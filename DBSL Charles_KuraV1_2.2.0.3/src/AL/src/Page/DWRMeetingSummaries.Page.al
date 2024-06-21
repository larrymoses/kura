#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72461 "DWR Meeting Summaries"
{
    CardPageID = "DWR Meeting Summary";
    PageType = List;
    SourceTable = "DWR Meeting Summary";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Agenda Code";"Agenda Code")
                {
                    ApplicationArea = Basic;
                }
                field("Agenda Item No.";"Agenda Item No.")
                {
                    ApplicationArea = Basic;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Item Discussed";"Item Discussed")
                {
                    ApplicationArea = Basic;
                }
                field("Contributor No";"Contributor No")
                {
                    ApplicationArea = Basic;
                }
                field("Summary Notes";"Summary Notes")
                {
                    ApplicationArea = Basic;
                }
                field("Task Description";"Task Description")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Category";"Responsibility Category")
                {
                    ApplicationArea = Basic;
                }
                field("Task Owner ID";"Task Owner ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("Due Date";"Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No";"Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Project No";"Project No")
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
        DailyWorkRecord.Reset;
         DailyWorkRecord.SetRange(DailyWorkRecord."Document No.","Document No.");
         if DailyWorkRecord.FindSet then
          begin
           "Project No":=DailyWorkRecord."Project ID";
            "Contractor No":=DailyWorkRecord."Contractor No.";

            end;
    end;

    var
        DailyWorkRecord: Record "Daily Work Record";
}

