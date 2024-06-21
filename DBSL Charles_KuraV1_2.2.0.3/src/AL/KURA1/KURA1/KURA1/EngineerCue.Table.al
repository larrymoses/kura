// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
// Table 9064 "Engineer Cue"
// {
//     Caption = 'Engineer Cue';

//     fields
//     {
//         field(1; "Primary Key"; Code[10])
//         {
//             Caption = 'Primary Key';
//         }
//         field(2; "Requests to Approve"; Integer)
//         {
//             CalcFormula = count("Approval Entry" where("Approver ID" = field("User ID Filter"),
//                                                         Status = filter(Open)));
//             Caption = 'Requests to Approve';
//             FieldClass = FlowField;
//         }
//         field(3; "Requests Sent for Approval"; Integer)
//         {
//             CalcFormula = count("Approval Entry" where("Sender ID" = field("User ID Filter"),
//                                                         Status = filter(Open)));
//             Caption = 'Requests Sent for Approval';
//             FieldClass = FlowField;
//         }
//         field(4; "Projects Requests to Approve"; Integer)
//         {
//             CalcFormula = count("Custom Approval Entry" where("Approver ID" = field("User ID Filter"),
//                                                                Status = filter(Open)));
//             FieldClass = FlowField;
//         }
//         field(5; "Assigned PCOs"; Integer)
//         {
//             CalcFormula = count("Project Mobilization Header" where("Document Type" = filter("Order-To-Commence"),
//                                                                      "Assigned To:" = field("User ID Filter"),
//                                                                      Posted = const(false)));
//             FieldClass = FlowField;
//         }
//         field(6; "Assigned Payment Certs"; Integer)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(7; "User ID Filter"; Code[50])
//         {
//             Caption = 'User ID Filter';
//             FieldClass = FlowFilter;
//         }
//         field(8; "Planned Projects"; Integer)
//         {
//             CalcFormula = count(Job where(Status = filter(Planned)));
//             FieldClass = FlowField;
//         }
//         field(9; "Ongoing Projects"; Integer)
//         {
//             CalcFormula = count(Job where(Status = filter(Ongoing)));
//             FieldClass = FlowField;
//         }
//         field(10; "Projects Under DLP"; Integer)
//         {
//             CalcFormula = count(Job where(Status = filter("Completed/Under DLP")));
//             FieldClass = FlowField;
//         }
//         field(11; "Projects Under PBRM"; Integer)
//         {
//             CalcFormula = count(Job where(Status = filter("Under PBRM")));
//             FieldClass = FlowField;
//         }
//         field(12; "Issued Orders to Commence"; Integer)
//         {
//             CalcFormula = count("Project Mobilization Header" where(Posted = const(true)));
//             FieldClass = FlowField;
//         }
//         field(13; "Approved Advance Certs"; Integer)
//         {
//             CalcFormula = count("Measurement &  Payment Header" where("Payment Certificate Type" = filter("Advance Payment"),
//                                                                        Status = filter(Released)));
//             FieldClass = FlowField;
//         }
//         field(14; "Expired Insurances"; Integer)
//         {
//             CalcFormula = count("Insurance/Guarantee Header" where("Document Type" = filter("Insurance Of Works"),
//                                                                     Expired = const(true)));
//             FieldClass = FlowField;
//         }
//         field(15; "Expired Advance Guarantees"; Integer)
//         {
//             CalcFormula = count("Insurance/Guarantee Header" where("Document Type" = filter("Advance Payment Guarantee"),
//                                                                     Expired = const(true)));
//             FieldClass = FlowField;
//         }
//         field(16; "Expired Performance Guarantee"; Integer)
//         {
//             CalcFormula = count("Insurance/Guarantee Header" where("Document Type" = filter("Performance Guarantee"),
//                                                                     Expired = const(true)));
//             FieldClass = FlowField;
//         }
//         field(17; "Expired Prof Indemnities"; Integer)
//         {
//             CalcFormula = count("Insurance/Guarantee Header" where("Document Type" = filter("Professional Indemnity")));
//             FieldClass = FlowField;
//         }
//         field(18; "Issued Notice of Award - Month"; Integer)
//         {
//             CalcFormula = count("Bid Tabulation Header" where("Document Type" = filter("Notice of Award")));
//             FieldClass = FlowField;
//         }
//         field(19; "Awarded Contracts this Month"; Integer)
//         {
//             CalcFormula = count("Purchase Header" where("Document Type" = filter("Blanket Order")));
//             FieldClass = FlowField;
//         }
//         field(20; "Approved EoTs"; Integer)
//         {
//             CalcFormula = count("Project Variation Header" where("Document Type" = filter("Extension of Time Request"),
//                                                                   Status = filter(Released)));
//             FieldClass = FlowField;
//         }
//         field(21; "Approved Scope Variations"; Integer)
//         {
//             CalcFormula = count("Project Variation Header" where("Document Type" = filter("Contractor Variation Request" | "Engineer Variation Request"),
//                                                                   Status = filter(Released)));
//             FieldClass = FlowField;
//         }
//         field(22; "Approved Cost Claims"; Integer)
//         {
//             CalcFormula = count("Project Variation Header" where("Document Type" = filter("Cost Claim"),
//                                                                   Status = filter(Released)));
//             FieldClass = FlowField;
//         }
//         field(23; "Approved Parties Variations"; Integer)
//         {
//             CalcFormula = count("Subcontracting Header" where(Status = filter(Released)));
//             FieldClass = FlowField;
//         }
//         field(24; "Approved Interim Certs"; Integer)
//         {
//             CalcFormula = count("Measurement &  Payment Header" where("Payment Certificate Type" = filter("Interim Payment"),
//                                                                        Status = filter(Released)));
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(25; "Approved Interest Certs"; Integer)
//         {
//             CalcFormula = count("Measurement &  Payment Header" where("Payment Certificate Type" = filter(Interest),
//                                                                        Status = filter(Released)));
//             FieldClass = FlowField;
//         }
//         field(26; "Approved Final Certs"; Integer)
//         {
//             CalcFormula = count("Measurement &  Payment Header" where("Payment Certificate Type" = filter("Final Payment"),
//                                                                        Status = filter(Released)));
//             FieldClass = FlowField;
//         }
//         field(27; "Approved Retention Certs"; Integer)
//         {
//             CalcFormula = count("Measurement &  Payment Header" where(Status = filter(Released),
//                                                                        "Payment Certificate Type" = filter("Retention Payment")));
//             FieldClass = FlowField;
//         }
//         field(28; "Approved Fee Notes"; Integer)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(29; "Taking Over Inspections"; Integer)
//         {
//             CalcFormula = count("Inspection Headersss" where("Inspection Type" = filter("Taking Over Inspection"),
//                                                               Status = filter(Released),
//                                                               Posted = const(false)));
//             FieldClass = FlowField;
//         }
//         field(30; "End of DLP Inspections"; Integer)
//         {
//             CalcFormula = count("Inspection Headersss" where("Inspection Type" = filter("End of DLP Inspection"),
//                                                               Status = filter(Released),
//                                                               Posted = const(false)));
//             FieldClass = FlowField;
//         }
//         field(31; "Competed Projects"; Integer)
//         {
//             CalcFormula = count(Job where(Status = filter(Completed)));
//             FieldClass = FlowField;
//         }
//     }

//     keys
//     {
//         key(Key1; "Primary Key")
//         {
//             Clustered = true;
//         }
//     }

//     fieldgroups
//     {
//     }
// }

