// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
// Page 72024 "Road Study Alternative Options"
// {
//     PageType = List;
//     SourceTable = "Study Alternative Option";

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field("Study ID";"Study ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Option ID";"Option ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Cost Value";"Cost Value")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Description;Description)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Benefit Value";"Benefit Value")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Recommended Option";"Recommended Option")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(creation)
//         {
//             action(Findings)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Findings';
//                 Image = Find;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//                 PromotedOnly = true;
//                 RunObject = Page "Road Study Findings";
//                 RunPageLink = "Study ID"=field("Study ID");
//             }
//             action(Coclusions)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Coclusions';
//                 Image = Confirm;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//                 PromotedOnly = true;
//                 RunObject = Page "Road Study Conclusions";
//                 RunPageLink = "Study ID"=field("Study ID");
//             }
//             action(Recommendations)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Recommendations';
//                 Image = Register;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//                 PromotedOnly = true;
//                 RunObject = Page "Road Study Recommendations";
//                 RunPageLink = "Study ID"=field("Study ID");
//             }
//         }
//     }
// }

