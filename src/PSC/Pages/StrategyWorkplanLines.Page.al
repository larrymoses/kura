#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
// Page 80035 "Strategy Workplan Lines"
// {
//     PageType = ListPart;
//     SourceTable = "Strategy Workplan Lines";

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field("Activity ID";"Activity ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Description;Description)
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field("Strategy Framework";"Strategy Framework")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = false;
//                 }
//                 field("Framework Perspective";"Framework Perspective")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = false;
//                 }
//                 field("Perfomance Indicator";"Perfomance Indicator")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'KPI';
//                     Editable = true;
//                 }
//                 field("Key Performance Indicator";"Key Performance Indicator")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Performance Indicator';
//                     Editable = false;
//                     Visible = false;

//                     trigger OnValidate()
//                     begin
//                         KeyPerformanceIndicator.Reset;
//                         KeyPerformanceIndicator.SetRange(KPI,"Key Performance Indicator","Key Performance Indicator");
//                         if KeyPerformanceIndicator.FindFirst then begin
//                             "Unit of Measure":=KeyPerformanceIndicator."Unit of Measure";
//                           end;
//                     end;
//                 }
//                 field("Unit of Measure";"Unit of Measure")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field("Desired Perfomance Direction";"Desired Perfomance Direction")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field("Departmental Activity Weight";"Departmental Activity Weight")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Assigned Weight(%)";"Assigned Weight(%)")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field("Imported Annual Target Qty";"Imported Annual Target Qty")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Imported CSP Annual Target';
//                     Editable = false;
//                 }
//                 field("Total Subactivity budget";"Total Subactivity budget")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field("Sub Activity Budget Sum";"Sub Activity Budget Sum")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Imported Annual Budget Est.";"Imported Annual Budget Est.")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Csp Annual Workplan Budget Estimate';
//                     Editable = false;
//                 }
//                 field("Primary Directorate";"Primary Directorate")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Primary Division';
//                 }
//                 field("Primary Directorate Name";"Primary Directorate Name")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                     Visible = false;
//                 }
//                 field("Primary Department";"Primary Department")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Primary Department Name";"Primary Department Name")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                     Visible = false;
//                 }
//                 field("Q1 Target";"Q1 Target")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Q2 Target";"Q2 Target")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Q3 Target";"Q3 Target")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Q4 Target";"Q4 Target")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Annual Target";"Annual Target")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Annual Budget";"Annual Budget")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Allocated Budget';
//                 }
//                 field("AnnualWorkplan Achieved Target";"AnnualWorkplan Achieved Target")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field("Entry Type";"Entry Type")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = false;
//                 }
//                 field("Achieved Performance Level";"Achieved Performance Level")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Weighted Performance Level';
//                     Editable = true;
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             group("Line Functions ")
//             {
//                 Caption = 'Annual Workplan Sub-Activities';
//                 Image = AnalysisView;
//                 action("Sub-Activities ")
//                 {
//                     ApplicationArea = Basic;
//                     Image = Notes;
//                     RunObject = Page "Sub Workplan Activity";
//                     RunPageLink = "Strategy Plan ID"=field("Strategy Plan ID"),
//                                   "Workplan No."=field(No),
//                                   "Activity Id"=field("Activity ID");
//                 }
//             }
//             action("Update Activity Achievements")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'UPDATE';
//                 Image = AllocatedCapacity;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     if not Confirm('Are you sure you want to update Activitiy  Total Assigned Weight?',true) then
//                       Error('Activity achievement not update');

//                     SubWorkplanActivity.Reset;
//                     SubWorkplanActivity.SetRange("Workplan No.",No);
//                     SubWorkplanActivity.SetRange("Activity Id","Activity ID");
//                     SubWorkplanActivity.CalcSums(Weight);
//                     SubWorkplanActivity.CalcSums("Total Budget");

//                     if SubWorkplanActivity.Weight=100 then begin
//                        "Assigned Weight(%)":=SubWorkplanActivity.Weight;
//                         "Total Subactivity budget":=SubWorkplanActivity."Total Budget";

//                        Modify;
//                     end else
//                        Error('Total Assigned Weight for sub-sctivities should be equals to 100%');
//                 end;
//             }
//         }
//     }

//     var
//         SubWorkplanActivity: Record "Sub Workplan Activity";
//         KeyPerformanceIndicator: Record UnknownRecord80244;
// }

