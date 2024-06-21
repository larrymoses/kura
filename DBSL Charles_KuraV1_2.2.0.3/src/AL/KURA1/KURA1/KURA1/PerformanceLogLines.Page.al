#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80199 "Performance Log Lines"
{
    PageType = ListPart;
    SourceTable = "Plog Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Activity Type";"Activity Type")
                {
                    ApplicationArea = Basic;
                }
                field("Initiative No.";"Initiative No.")
                {
                    ApplicationArea = Basic;
                }
                field("Sub Intiative No";"Sub Intiative No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Key Performance Indicator";"Key Performance Indicator")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Date";"Planned Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Planned Start Date';
                    Editable = false;
                    Visible = false;
                }
                field("Due Date";"Due Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Planned Due Date';
                    Editable = false;
                }
                field("Achieved Date";"Achieved Date")
                {
                    ApplicationArea = Basic;
                }
                field("Target Qty";"Target Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Weight %";"Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Achieved Target";"Achieved Target")
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
                {
                    ApplicationArea = Basic;
                }
                field("Q1 Achieved Target";"Q1 Achieved Target")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Q2 Achieved Target";"Q2 Achieved Target")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Q3 AchievedTarget";"Q3 AchievedTarget")
                {
                    ApplicationArea = Basic;
                    Caption = 'Q3 Achieved Target';
                    Editable = false;
                }
                field("Q4 Achieved Target";"Q4 Achieved Target")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Remaining Targets";"Remaining Targets")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Achieved Weight(%)";"Achieved Weight(%)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Sub Plog Lines")
            {
                ApplicationArea = Basic;
                RunObject = Page "Sub Plog Lines";
                RunPageLink = "PLog No."=field("PLog No."),
                              "Initiative No."=field("Initiative No."),
                              "Personal Scorecard ID"=field("Personal Scorecard ID");
            }
            action("Update Activity Achievements")
            {
                ApplicationArea = Basic;
                Image = AllocatedCapacity;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if not Confirm('Are you sure you want to update Sub-activity achievement?',true) then
                      Error('Sub-activity achievement not update');

                    //
                    // SubPlogLines.RESET;
                    // SubPlogLines.SETRANGE("PLog No.","PLog No.");
                    // SubPlogLines.SETRANGE("Employee No.","Employee No.");
                    // SubPlogLines.SETRANGE("Personal Scorecard ID","Personal Scorecard ID");
                    // SubPlogLines.SETRANGE("Strategy Plan ID","Strategy Plan ID");
                    // SubPlogLines.SETRANGE("Initiative No.","Initiative No.");
                    // SubPlogLines.CALCSUMS("Target Qty");
                    // IF SubPlogLines."Target Qty">"Target Qty" THEN
                       //ERROR('Total Sub Activity Targets %1 should be equal to Activity Target %2 ',
                      //       SubPlogLines."Target Qty","Target Qty");


                    SubPlogLines.Reset;
                    SubPlogLines.SetRange("PLog No.","PLog No.");
                    SubPlogLines.SetRange("Employee No.","Employee No.");
                    SubPlogLines.SetRange("Personal Scorecard ID","Personal Scorecard ID");
                    SubPlogLines.SetRange("Strategy Plan ID","Strategy Plan ID");
                    SubPlogLines.SetRange("Initiative No.","Initiative No.");
                    SubPlogLines.CalcSums("Achieved Target");

                    "Achieved Target":=SubPlogLines."Achieved Target";
                       TotalWeight:=(("Achieved Target"/"Target Qty")*100)*("Weight %"/100);
                    if TotalWeight>"Weight %" then
                       TotalWeight:="Weight %";

                       "Achieved Weight(%)":=TotalWeight;
                    Modify;
                    Message('Updated Successfully');
                end;
            }
        }
    }

    var
        SubPlogLines: Record "Sub Plog Lines";
        TotalWeight: Decimal;
}

