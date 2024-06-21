#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80403 "Evaluation Training Needs"
{
    PageType = ListPart;
    SourceTable = "Evaluation Training needs";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Course;Rec.Course)
                {
                    ApplicationArea = Basic;
                }
                field("Training Need Number"; "Training Need Number")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Training Need Category"; "Training Need Category")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Training Duration"; "Training Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Appraisee's Comments"; "Appraisee's Comments")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor's Comments";"Supervisor's Comments")
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

