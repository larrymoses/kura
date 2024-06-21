#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69308 "TrainingL Needs"
{
    CardPageID = "Training Courses Needs";
    PageType = List;
    SourceTable = "Training Courses Needs";
    // SourceTableView = where(Field6=filter(0));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; "Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Course Code"; "Course Code")
                {
                    ApplicationArea = Basic;
                }
                field("Course Description"; "Course Description")
                {
                    ApplicationArea = Basic;
                }
                field("Training Need Code"; "Training Need Code")
                {
                    ApplicationArea = Basic;
                }
                // field(Status;Status)
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Blocked;Blocked)
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Created By";"Created By")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Created On";"Created On")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("No. of Needs";"No. of Needs")
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
    }

    actions
    {
    }
}

