#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69105 "Staff Establishment Task Lines"
{
    PageType = ListPart;
    SourceTable = "Staff Establishment Task Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job ID";"Job ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title";"Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Posts";"No. of Posts")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Established";"Staff Established")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Active";"Actual Active")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Terminated";"Actual Terminated")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Suspended";"Actual Suspended")
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
            action("Planning Lines")
            {
                ApplicationArea = Basic;
                Image = JobLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    StaffEstablishmentPlanLines.FilterGroup(2);
                    StaffEstablishmentPlanLines.SetRange("Task No","Entry No.");
                    StaffEstablishmentPlanLines.SetRange("Job ID","Job ID");
                    StaffEstablishmentPlanLines.FilterGroup(0);
                    StaffEstablishmentPlanLine.SetTableview(StaffEstablishmentPlanLines);
                    StaffEstablishmentPlanLine.Editable := true;
                    StaffEstablishmentPlanLine.Run;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        TotalEstablished:=0;
        PlanLines.Reset;
        PlanLines.SetRange("Job ID","Job ID");
        PlanLines.SetRange("Task No","Entry No.");
        if PlanLines.FindSet then begin
          repeat
            TotalEstablished:=TotalEstablished+PlanLines."Approved Establishment";
            until PlanLines.Next=0;
            end;
        "No. of Posts":=TotalEstablished;
    end;

    var
        StaffEstablishmentPlanLines: Record "Staff Est Plan Lines";
        StaffEstablishmentPlanLine: Page "Staff Establishment Plan Lines";
        PlanLines: Record "Staff Est Plan Lines";
        TotalEstablished: Integer;
}

