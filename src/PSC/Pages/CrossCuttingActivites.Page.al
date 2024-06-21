#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 90448 "Cross Cutting Activites"
{
    Caption = 'Cross Cutting Activities';
    PageType = ListPart;
    SourceTable = "Strategy Workplan Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Activity ID"; Rec."Activity ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    Caption = 'Primary Division';
                }
                field("Primary Directorate Name"; Rec."Primary Directorate Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department Name"; Rec."Primary Department Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Strategy Framework"; Rec."Strategy Framework")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Framework Perspective"; Rec."Framework Perspective")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Perfomance Indicator"; Rec."Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    Caption = 'KPI';
                }
                field("Key Performance Indicator"; Rec."Key Performance Indicator")
                {
                    ApplicationArea = Basic;
                    Caption = 'Perfromance Indicator';
                    Editable = false;
                    Visible = false;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                }
                // field("Departmental Activity Weight";"Departmental Activity Weight")
                // {
                //    ApplicationArea = Basic;
                //     Enabled = true;
            }
            field("Assigned Weight(%)"; Rec."Assigned Weight(%)")
            {
                ApplicationArea = Basic;
                Enabled = false;
            }
            field("Imported Annual Target Qty"; Rec."Imported Annual Target Qty")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            // field("Total Subactivity budget";"Total Subactivity budget")
            // {
            //     ApplicationArea = Basic;
            //     Editable = false;
            // }
            field("Q1 Target"; Rec."Q1 Target")
            {
                ApplicationArea = Basic;
            }
            field("Q2 Target"; Rec."Q2 Target")
            {
                ApplicationArea = Basic;
            }
            field("Q3 Target"; Rec."Q3 Target")
            {
                ApplicationArea = Basic;
            }
            field("Q4 Target"; Rec."Q4 Target")
            {
                ApplicationArea = Basic;
            }
            // field("Annual Target";"Annual Target")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Annual Budget";"Annual Budget")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Allocated Budget';
            // }
            field("AnnualWorkplan Achieved Target"; Rec."AnnualWorkplan Achieved Target")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            field("Entry Type"; Rec."Entry Type")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            // field("Achieved Performance Level";"Achieved Performance Level")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Weighted Performance Level';
            // }
        }
    }


    actions
    {
        area(processing)
        {
            group("Line Functions ")
            {
                Caption = 'Annual Workplan Sub-Activities';
                Image = AnalysisView;
                action("Sub-Activities ")
                {
                    ApplicationArea = Basic;
                    Image = Notes;
                    RunObject = Page "Sub Workplan Activity";
                    RunPageLink = "Workplan No." = field(No),
                                  "Activity Id" = field("Activity ID");
                }
            }
            action("Update Activity Achievements")
            {
                ApplicationArea = Basic;
                Caption = 'UPDATE';
                Image = AllocatedCapacity;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if not Confirm('Are you sure you want to update Activitiy  Total Assigned Weight?', true) then
                        Error('Activity achievement not update');

                    SubWorkplanActivity.Reset;
                    SubWorkplanActivity.SetRange("Workplan No.", Rec.No);
                    SubWorkplanActivity.SetRange("Activity Id", Rec."Activity ID");
                    SubWorkplanActivity.CalcSums(Weight);
                    SubWorkplanActivity.CalcSums("Total Budget");

                    if SubWorkplanActivity.Weight = 100 then begin
                        Rec."Assigned Weight(%)" := SubWorkplanActivity.Weight;
                        //   "Total Subactivity budget":=SubWorkplanActivity."Total Budget";
                        Rec.Modify;
                    end else
                        Error('Total Assigned Weight for sub-sctivities should be equals to 100%');
                end;
            }
        }
    }

    // trigger OnAfterGetRecord()
    // begin
    //     "Cross Cutting":=true;
    // end;

    // trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    // begin
    //     "Cross Cutting":=true;
    // end;

    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     "Cross Cutting":=true;
    // end;

    // trigger OnOpenPage()
    // begin
    //     "Cross Cutting":=true;
    // end;

    var
        SubWorkplanActivity: Record "Sub Workplan Activity";
}

#pragma implicitwith restore

