// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
// Page 72162 "Road Condition Surveys(Existin"
// {
//     ApplicationArea = Basic;
//     CardPageID = "Road Condition Survey(Existing";
//     PageType = List;
//     SourceTable = "RICS Existing Road Link";
//     SourceTableView = where(Posted=filter(false));
//     UsageCategory = Tasks;

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field("RICS No.";"RICS No.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Description;Description)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Service Type";"Service Type")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Contract No";"Contract No")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Project ID";"Project ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Contractor Name";"Contractor Name")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Approval Status";"Approval Status")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//         }
//     }

//     actions
//     {
//     }

//     trigger OnInsertRecord(BelowxRec: Boolean): Boolean
//     begin
//         "Approval Status":="approval status"::Open;
//         "Service Type":="service type"::Outsourced;
//     end;
// }

