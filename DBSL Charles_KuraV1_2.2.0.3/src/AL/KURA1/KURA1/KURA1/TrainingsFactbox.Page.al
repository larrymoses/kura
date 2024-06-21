#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69222 "Trainings Factbox"
{
    PageType = CardPart;
    SourceTable = "Training Requests";

    layout
    {
        area(content)
        {
            group(Control1102755018)
            {
                label(Control1102755019)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text1;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field("Requires Flight"; "Requires Flight")
                {
                    ApplicationArea = Basic;
                }
                field("Course Title"; "Course Title")
                {
                    ApplicationArea = Basic;
                }
                field(Location; Location)
                {
                    ApplicationArea = Basic;
                }
                field("Planned Budget"; "Planned Budget")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Start DateTime"; "Start DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("End DateTime"; "End DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("Duration Units"; "Duration Units")
                {
                    ApplicationArea = Basic;
                }
                field(Duration; Duration)
                {
                    ApplicationArea = Basic;
                }
                field(Cost; Cost)
                {
                    ApplicationArea = Basic;
                }
                field("Budget Name"; "Budget Name")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        Text1: label 'Training Details';

}

