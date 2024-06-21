#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69196 "Training Plan Lines"
{
    PageType = ListPart;
    SourceTable = "Training Plan Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                        //insert objectives from the needs that each course addresses
                        //loop training needs
                        TrainingCoursesNeeds.Reset;
                        TrainingCoursesNeeds.SetRange("Course Code", Rec."Course Title");
                        if TrainingCoursesNeeds.FindSet then begin
                            repeat
                                TrainingLinesObjectives.Reset;
                                TrainingLinesObjectives.SetRange(Code, TrainingCoursesNeeds."Training Need Code");
                                if TrainingLinesObjectives.FindSet then begin
                                    repeat

                                        //insert the objectives
                                        TrainingLinesObjectives1.Reset;
                                        if TrainingLinesObjectives1.FindLast then begin
                                            EntryNo := TrainingLinesObjectives1."Entry No";
                                        end;

                                        TrainingLinesObjectives1.Init;
                                        TrainingLinesObjectives1."Entry No" := EntryNo + 1;
                                        TrainingLinesObjectives1.Code := Format(Rec."Task No");
                                        TrainingLinesObjectives1.Type := TrainingLinesObjectives1.Type::Plan;
                                        TrainingLinesObjectives1."Objective Id" := TrainingLinesObjectives."Objective Id";
                                        TrainingLinesObjectives1.Objective := TrainingLinesObjectives.Objective;
                                        TrainingLinesObjectives1.Insert;

                                    until TrainingLinesObjectives.Next = 0;
                                end;
                            until TrainingCoursesNeeds.Next = 0;
                        end
                    end;
                }
                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = Basic;
                }
                field("Field"; Rec.Field)
                {
                    ApplicationArea = Basic;
                }
                field("Target Group"; Rec."Target Group")
                {
                    ApplicationArea = Basic;
                }
                field("Target Group Code"; Rec."Target Group Code")
                {
                    ApplicationArea = Basic;
                }
                field("Course Duration"; Rec."Course Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Planned No. of Staff"; Rec."Planned No. of Staff")
                {
                    ApplicationArea = Basic;
                }
                field("Proposed Course Provider"; Rec."Proposed Course Provider")
                {
                    ApplicationArea = Basic;
                }
                field("Proposed Course Provider Name"; Rec."Proposed Course Provider Name")
                {
                    ApplicationArea = Basic;
                }
                field("Estimated Cost"; Rec."Estimated Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Spent"; Rec."Actual Spent")
                {
                    ApplicationArea = Basic;
                }
                field("Actual No. of Staff"; Rec."Actual No. of Staff")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Objectives & Needs")
            {
                action("Course Objectives")
                {
                    ApplicationArea = Basic;
                    Image = OpportunitiesList;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Training Objectives";
                    // RunPageLink = Type=const(Plan),
                    //               Code=field("Task No");
                    RunPageMode = View;
                }
                action("Training Needs")
                {
                    ApplicationArea = Basic;
                    Image = AllocatedCapacity;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Training Courses Needs";
                    RunPageLink = "Course Code" = field("Course Title");
                    RunPageMode = View;
                }
            }
            action("Course Training Entries")
            {
                ApplicationArea = Basic;
                Image = Entries;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = Page "Course Budget Allocation";
                RunPageLink = "Course ID" = field("Course Title"),
                              "Training Plan Id" = field("Training Plan Code");
            }
        }
    }

    var
        TrainingCoursesSetup: Record "Training Courses Setup";
        TrainingNeedsLines: Record "Training Needs Lines";
        TrainingLinesObjectives: Record "Training Lines Objectives";
        TrainingCoursesNeeds: Record "Training Courses Needs";
        TrainingLinesObjectives1: Record "Training Lines Objectives";
        EntryNo: Integer;
}

#pragma implicitwith restore

