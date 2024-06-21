#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
// Page 80419 "Sub Workplan Activity"
// {
//     Caption = 'Sub Workplan Activities';
//     PageType = List;
//     SourceTable = 80262;

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field("Sub-Intiative No"; "Sub Initiative No.")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Sub-Activity No';
//                 }
//                 field("Sub-Initiative"; "Objective/Initiative")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Sub-Activity';
//                 }
//                 field("Unit of Measure"; "Unit of Measure")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = true;
//                 }
//                 field(Target; "Imported Annual Target Qty")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Target';
//                 }
//                 field("Total Budget"; "Total Budget")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                 }
//                 field("Total Autocalculated Amount"; "Total Autocalculated Amount")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Expense Amount"; "Expense Amount")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Completion Date"; "Due Date")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = false;
//                 }
//                 field(Weight; Weight)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Q1 Target Qty"; "Q1 Target Qty")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Q1 Target';
//                 }
//                 field("Q2 Target Qty"; "Q2 Target Qty")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Q2 Target';
//                 }
//                 field("Q3 Target Qty"; "Q3 Target Qty")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Q3 Target';
//                 }
//                 field("Q4 Target Qty"; "Q4 Target Qty")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Q4 Target';
//                 }
//                 field("Elements Count"; "Elements Count")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
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
//                 action("Workplan Cost Items")
//                 {
//                     ApplicationArea = Basic;
//                     Image = Notes;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     RunObject = Page "Workplan Cost Elements";
//                     RunPageLink = "Workplan No." = field("Workplan No."),
//                                   "Activity Id" = field("Activity Id"),
//                                   "Sub Activity No" = field("Sub Initiative No.");
//                 }
//                 action("Update Total SubActivity Budget")
//                 {
//                     ApplicationArea = Basic;
//                     Image = UpdateUnitCost;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     PromotedIsBig = true;

//                     trigger OnAction()
//                     begin
//                         WorkplanCostElements.Reset;
//                         WorkplanCostElements.SetRange("Workplan No.", "Workplan No.");
//                         WorkplanCostElements.SetRange("Activity Id", "Activity Id");
//                         WorkplanCostElements.SetRange("Sub Activity No", "Sub Initiative No.");
//                         WorkplanCostElements.CalcSums(Amount);
//                         "Total Budget" := WorkplanCostElements.Amount;
//                         Modify;

//                         Message('Total Sub Activity Budget Updated successfully');
//                     end;
//                 }
//             }
//         }
//     }

//     var
//         WorkplanCostElements: Record "Workplan Cost Elements";
// }

