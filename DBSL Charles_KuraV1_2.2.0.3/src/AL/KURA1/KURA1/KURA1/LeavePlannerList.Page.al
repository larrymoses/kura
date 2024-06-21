
Page 69232 "Leave Planner List"
{
    ApplicationArea = Basic;
    CardPageID = "Leave Planner Card";
    PageType = List;
    SourceTable = "HR Leave Planner Header";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field(Names; Rec.Names)
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Job Tittle"; Rec."Job Tittle")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Shortcut Dimension 3 Code";Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Period";Rec."Leave Period")
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


