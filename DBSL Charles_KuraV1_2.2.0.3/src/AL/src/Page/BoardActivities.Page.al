// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
// #pragma implicitwith disable
// Page 80117 "Board Activities"
// {
//     PageType = List;
//     SourceTable = "Board Activities";

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field("Strategy Framework"; Rec."Strategy Framework")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Framework Perspective"; Rec."Framework Perspective")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("AWP No"; Rec."AWP No")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = false;
//                 }
//                 field("Board Activity Code"; Rec."Board Activity Code")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Board Activity Description"; Rec."Board Activity Description")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Activity Code"; Rec."Activity Code")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Activity Description"; Rec."Activity Description")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Key Performance Indicator"; Rec."Key Performance Indicator")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Outcome Performance Indicator"; Rec."Outcome Performance Indicator")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Unit of Measure"; Rec."Unit of Measure")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("WT(%)"; Rec."WT(%)")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Previous Annual Target Qty"; Rec."Previous Annual Target Qty")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Target; Rec.Target)
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(navigation)
//         {
//             action("Board Sub-Activities")
//             {
//                 ApplicationArea = Basic;
//                 Image = AllLines;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 RunObject = Page "Board SUb Activities";
//                 RunPageLink = "Workplan No."=field("AWP No"),
//                               "Initiative No."=field("Board Activity Code"),
//                               "Activity Id"=field("Activity Code");
//             }
//         }
//     }
// }

// #pragma implicitwith restore

