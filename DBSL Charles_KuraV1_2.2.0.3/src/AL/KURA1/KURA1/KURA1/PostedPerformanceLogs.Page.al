#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80200 "Posted Performance Logs"
{
    ApplicationArea = Basic;
    CardPageID = "Posted Performance Logs Card";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Performance Diary Log";
    SourceTableView = where(Posted=const(true));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field("Employee No.";"Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Incidence Date";"Incidence Date")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Entry Type";"Performance Entry Type")
                {
                    ApplicationArea = Basic;
                }
                field("Diary Source";"Diary Source")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Personal Scorecard ID";"Personal Scorecard ID")
                {
                    ApplicationArea = Basic;
                }
                field("Goal ID";"Goal ID")
                {
                    ApplicationArea = Basic;
                }
                field("Objective ID";"Objective ID")
                {
                    ApplicationArea = Basic;
                }
                field("Disciplinary Case ID";"Disciplinary Case ID")
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

