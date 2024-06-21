// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
// Page 72016 "Road Study Task Line"
// {
//     PageType = ListPart;
//     SourceTable = "Road Study Task";

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field("Study ID";"Study ID")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = false;
//                 }
//                 field("Code";Code)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Description;Description)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Start Date";"Start Date")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Due Date";"Due Date")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("No.  of Final Findings";"No.  of Final Findings")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("No. of Final Conclusions";"No. of Final Conclusions")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("No. of Final Recommendations";"No. of Final Recommendations")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("No. of Interim Results";"No. of Interim Results")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             group("&Line Functions")
//             {
//                 Caption = '&Line Functions';
//                 action(Initiatives)
//                 {
//                     ApplicationArea = Basic,Suite;
//                     Caption = 'Initiatives';
//                     Image = View;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     PromotedOnly = true;
//                     RunObject = Page "Road Study Initiatives";
//                     ShortCutKey = 'Shift+F7';
//                     ToolTip = 'Open the document that the selected line exists on.';

//                     trigger OnAction()
//                     var
//                         PageManagement: Codeunit "Page Management";
//                     begin
//                     end;
//                 }
//                 action(Findings)
//                 {
//                     AccessByPermission = TableData Item=R;
//                     ApplicationArea = Reservation;
//                     Caption = 'Findings';
//                     Image = ReservationLedger;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     PromotedOnly = true;
//                     RunObject = Page "Road Study Findings";
//                     ToolTip = 'View the entries for every reservation that is made, either manually or automatically.';
//                 }
//                 action(Conclusions)
//                 {
//                     ApplicationArea = ItemTracking;
//                     Caption = 'Conclusions';
//                     Image = ItemTrackingLines;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     PromotedOnly = true;
//                     RunObject = Page "Road Study Conclusions";
//                     ShortCutKey = 'Shift+Ctrl+I';
//                     ToolTip = 'View or edit serial numbers and lot numbers that are assigned to the item on the document or journal line.';
//                 }
//                 action(Recommendations)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Recommendations';
//                     Image = Calculate;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     PromotedOnly = true;
//                     RunObject = Page "Road Study Recommendations";
//                 }
//                 action(Sections)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Sections';
//                     Image = Segment;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     PromotedOnly = true;
//                     RunObject = Page "Road Study Sections";
//                 }
//                 action(Risks)
//                 {
//                     ApplicationArea = Basic;
//                     Image = Reserve;
//                     Promoted = true;
//                     PromotedIsBig = true;
//                     PromotedOnly = true;
//                     RunObject = Page "Feasibility Study Risks";
//                     RunPageLink = "Feasibility Study No"=field("Study ID");
//                 }
//                 action("Study Team")
//                 {
//                     ApplicationArea = Basic;
//                     Image = TransferOrder;
//                     Promoted = true;
//                     PromotedIsBig = true;
//                     PromotedOnly = true;
//                     RunObject = Page "Safari Team";
//                     RunPageLink = "Imprest Memo No."=field("Study ID");
//                 }
//             }
//         }
//     }
// }

