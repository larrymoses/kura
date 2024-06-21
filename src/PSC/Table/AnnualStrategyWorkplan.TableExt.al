#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
// TableExtension 70102 AnnualWorkPlanExtension extends "Annual Strategy Workplan"
// {
//     //  LookupPageID = 80462;
//     // DrillDownPageID = 80462;
//     fields
//     {

//         //Unsupported feature: Property Modification (CalcFormula) on ""No. of Directors PCs"(Field 39)".


//         //Unsupported feature: Property Modification (CalcFormula) on ""No. of Department Pcs"(Field 40)".


//         //Unsupported feature: Property Modification (CalcFormula) on ""No. of Staff PCs"(Field 41)".


//         //Unsupported feature: Code Modification on "No(Field 1).OnValidate".

//         //trigger OnValidate()
//         //Parameters and return type have not been exported.
//         //>>>> ORIGINAL CODE:
//         //begin
//         /*
//         IF No <> xRec.No THEN BEGIN
//            SPMSetup.GET;
//             NoSeriesMgt.TestManual(SPMSetup."Work Plan Nos");
//            "No. Series" := '';
//         END;
//         */
//         //end;
//         //>>>> MODIFIED CODE:
//         //begin
//         /*
//         {IF No <> xRec.No THEN BEGIN
//         #2..4
//         END;}
//         */
//         //end;
//         field(42; "Annual Strategy Type"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionCaption = 'Organizational,Functional,Functional PC,Organizational PC';
//             OptionMembers = Organizational,Functional,"Functional PC","Organizational PC";
//         }
//         field(43; "Annual Workplan"; Code[30])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Annual Strategy Workplan".No where("Annual Strategy Type" = const(Organizational));
//         }
//         field(44; Department; Code[30])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));

//             trigger OnValidate()
//             begin
//                 AnnualStrategyWorkplan.Reset;
//                 AnnualStrategyWorkplan.SetRange("Annual Strategy Type", AnnualStrategyWorkplan."annual strategy type"::"Functional PC");
//                 //  AnnualStrategyWorkplan.SetRange(Department,Department);
//                 AnnualStrategyWorkplan.SetRange("Strategy Plan ID", "Strategy Plan ID");
//                 AnnualStrategyWorkplan.SetRange("Year Reporting Code", "Year Reporting Code");
//                 AnnualStrategyWorkplan.SetRange("Approval Status", AnnualStrategyWorkplan."approval status"::Open);
//                 if AnnualStrategyWorkplan.FindSet then begin
//                     Error('You have already an ongoing Departmental Workplan No %1 for Department %2, Please proceed and Edit it',
//                     AnnualStrategyWorkplan.No, AnnualStrategyWorkplan."Department Name");
//                 end;

//                 ResponsibilityCenter.Reset;
//                 ResponsibilityCenter.SetRange(Code, Department);
//                 if ResponsibilityCenter.Find('-') then begin
//                     "Primary Directorate" := ResponsibilityCenter."Direct Reports To";
//                 end;
//             end;
//         }
//         field(45; "Department Name"; Text[250])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(46; Posted; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(47; "Total Assigned Weight(%)"; Decimal)
//         {
//             //CalcFormula = sum("Strategy Workplan Lines"."Departmental Activity Weight" where (No=field(No)));
//             FieldClass = FlowField;
//         }
//         field(48; "Total  Departments Count"; Integer)
//         {
//             CalcFormula = count("Responsibility Center" where("Operating Unit Type" = const("Department/Center")));
//             FieldClass = FlowField;
//         }
//         field(49; "Total Weight(%)"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50; "Primary Directorate"; Code[50])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
//         }
//         field(51; "Created By"; Code[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(52; "Created at"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(53; "Functional Procurment Plan No"; Code[30])
//         {
//             DataClassification = ToBeClassified;
//             //TableRelation = "Procurement Plan".Code where (Department=field(Department),
//             //                                              "Plan Type"=const(Functional),
//             //                                              "Revision Voucher"=const(false));
//         }
//         field(54; "Division Filter"; Code[30])
//         {
//             FieldClass = FlowFilter;
//             TableRelation = "Responsibility Center".Code;
//         }
//         field(55; "Department Filter"; Code[30])
//         {
//             FieldClass = FlowFilter;
//             TableRelation = "Responsibility Center".Code;
//         }
//         field(56; "Total Budget"; Decimal)
//         {
//             //  CalcFormula = sum("Strategy Workplan Lines"."Total Subactivity budget" where (No=field(No),
//             //                                                                                      "Primary //Directorate"=field("Division Filter"),
//             //                                                                               "Primary ////Department"=field("Department Filter")));
//             //        FieldClass = FlowField;
//         }
//         field(57; "Organiztional PC"; Code[30])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Annual Strategy Workplan".No where("Annual Strategy Type" = const("Organizational PC"));
//         }
//         field(58; "Total Assigned PC Weight(%)"; Decimal)
//         {
//             CalcFormula = sum("Board Activities"."WT(%)" where("AWP No" = field(No)));
//             FieldClass = FlowField;
//         }
//         field(59; Archived; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(60; "Archived On"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(61; "Archived By"; Code[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(62; "Workplan No"; Code[30])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Annual Strategy Workplan".No where("Annual Strategy Type" = const(Organizational),
//                                                                  "Strategy Plan ID" = field("Strategy Plan ID"),
//                                                                  "Year Reporting Code" = field("Year Reporting Code"));
//         }
//         field(63; "Approved Budget"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//     }


//     //Unsupported feature: Code Modification on "OnInsert".

//     //trigger OnInsert()
//     //>>>> ORIGINAL CODE:
//     //begin
//     /*
//     IF No = '' THEN BEGIN
//       SPMSetup.GET;
//       SPMSetup.TESTFIELD("Work Plan Nos");
//       NoSeriesMgt.InitSeries(SPMSetup."Work Plan Nos",xRec."No. Series",0D,No,"No. Series");
//     END;
//     */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//     /*
//     {IF No = '' THEN BEGIN
//     #2..4
//     END;}

//     //Get Strategy Type No. Series..
//      IF "Annual Strategy Type"="Annual Strategy Type"::Organizational THEN BEGIN
//       IF No = '' THEN BEGIN
//         SPMSetup.GET;
//         SPMSetup.TESTFIELD("Work Plan Nos");
//         NoSeriesMgt.InitSeries(SPMSetup."Work Plan Nos",xRec."No. Series",0D,No,"No. Series");
//       END;
//      END;

//     IF "Annual Strategy Type"="Annual Strategy Type"::Functional THEN BEGIN
//       IF No = '' THEN BEGIN
//         SPMSetup.GET;
//         SPMSetup.TESTFIELD("Functional Annual Workplan Nos");
//         NoSeriesMgt.InitSeries(SPMSetup."Functional Annual Workplan Nos",xRec."No. Series",0D,No,"No. Series");
//       END;
//     END;

//     IF "Annual Strategy Type"="Annual Strategy Type"::"Functional PC" THEN BEGIN
//       IF No = '' THEN BEGIN
//         SPMSetup.GET;
//         SPMSetup.TESTFIELD("Functional P.C No. Series");
//         NoSeriesMgt.InitSeries(SPMSetup."Functional P.C No. Series",xRec."No. Series",0D,No,"No. Series");
//       END;
//     END;

//     IF "Annual Strategy Type"="Annual Strategy Type"::"Organizational PC" THEN BEGIN
//       IF No = '' THEN BEGIN
//         SPMSetup.GET;
//         SPMSetup.TESTFIELD("Organizational P.C No. Series");
//         NoSeriesMgt.InitSeries(SPMSetup."Organizational P.C No. Series",xRec."No. Series",0D,No,"No. Series");
//       END;
//     END;



//     "Created By":=USERID;
//     "Created at":=TODAY;
//     */
//     //end;

//     var
//         AnnualStrategyWorkplan: Record "Annual Strategy Workplan";
//         ResponsibilityCenter: Record "Responsibility Center";
// }

