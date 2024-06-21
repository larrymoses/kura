#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
// TableExtension 90003 tableextension50003 extends "HSE Plan Line"
// {
//     fields
//     {
//         modify("Hazard Type")
//         {
//             TableRelation = "Hazard Type".Code;
//         }

//         //Unsupported feature: Property Modification (Data type) on "Description(Field 4)".

//         modify("Risk Management Plan ID")
//         {
//             TableRelation = "Risk Management Plan"."Document No";
//         }

//         //Unsupported feature: Code Modification on ""Hazard Type"(Field 3).OnValidate".

//         //trigger OnValidate()
//         //Parameters and return type have not been exported.
//         //>>>> ORIGINAL CODE:
//         //begin
//         /*
//         HazardType.RESET;
//         HazardType.SETRANGE(HazardType.Code,"Hazard Type");
//         IF HazardType.FINDSET THEN
//           BEGIN
//             Description:=HazardType.Description;

//           "Hazard Category":=HazardType."Hazard Category";

//             END;

//         //Auto populate to HSE Plan Line Hazard Control Measures
//         HazardControlMeasure.RESET;
//         HazardControlMeasure.SETRANGE(HazardControlMeasure."Hazard Type","Hazard Type");
//         IF HazardControlMeasure.FINDSET THEN

//           BEGIN
//             REPEAT
//               HSEPlanLineHazardControl.INIT;
//               HSEPlanLineHazardControl."Plan ID":="Plan ID";
//               HSEPlanLineHazardControl."Hazard ID":="Hazard ID";
//               HSEPlanLineHazardControl."Hazard Type":="Hazard Type";
//               HSEPlanLineHazardControl."Control ID":=HSEPlanLineHazardControl.COUNT+1;
//               HSEPlanLineHazardControl.Description:=HazardControlMeasure."Recommended Preventive Action";
//               IF NOT HSEPlanLineHazardControl.INSERT(TRUE) THEN
//                 HSEPlanLineHazardControl.MODIFY(TRUE);
//             UNTIL HazardControlMeasure.NEXT=0;

//             END;
//         */
//         //end;
//         //>>>> MODIFIED CODE:
//         //begin
//         /*
//         HazardTypes.RESET;
//         HazardTypes.SETRANGE(Code,"Hazard Type");
//         IF HazardTypes.FINDSET THEN
//           Description:=HazardTypes.Description;
//         "Hazard Category":=HazardTypes."Hazard Category";
//         */
//         //end;

//         //Unsupported feature: Property Deletion (Editable) on ""No. of Planned Hazard Controls"(Field 7)".


//         //Unsupported feature: Deletion (FieldCollection) on ""Risk ID"(Field 10)".

//         field(24; "Risk ID"; Integer)
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Risk Management Plan Line"."Risk ID" where("Document No" = field("Risk Management Plan ID"));

//             trigger OnValidate()
//             begin
//                 RiskManagementPlanLine.Reset;
//                 RiskManagementPlanLine.SetRange("Document No", Rec."Risk Management Plan ID");
//                 RiskManagementPlanLine.SetRange(Rec."Risk ID", Rec."Risk ID");
//                 if RiskManagementPlanLine.FindSet then begin
//                     Rec."Risk Appetite Rating Scale ID" := RiskManagementPlanLine."Risk Appetite Rating Scale ID";
//                     Rec."Risk Impact Code" := RiskManagementPlanLine."Risk Impact Code";
//                     Rec."Risk Impact Rating" := RiskManagementPlanLine."Risk Impact Rating";
//                     Rec."Risk Impact Rating Scale ID" := RiskManagementPlanLine."Risk Impact Rating Scale ID";
//                     Rec."Risk Impact Type" := RiskManagementPlanLine."Risk Impact Type";
//                     Rec."Risk Likelihood Code" := RiskManagementPlanLine."Risk Likelihood Code";
//                     Rec."Risk Likelihood Rating" := RiskManagementPlanLine."Risk Likelihood Rating";
//                     Rec."Risk Likelihood Rating ScaleID" := RiskManagementPlanLine."Risk Likelihood Rate Scale ID";
//                     Rec."Overall Risk Level Code" := RiskManagementPlanLine."Overall Risk Level Code";
//                     Rec."Overall Risk Rating" := RiskManagementPlanLine."Overal Risk Rating";
//                     Rec."Overall Risk Rating Scale ID" := RiskManagementPlanLine."Overall Risk Rating Scale ID";

//                 end;
//             end;
//         }
//     }
//     keys
//     {
//         // Unsupported feature: Key containing base fields
//         // 
//         // //Unsupported feature: Deletion (KeyCollection) on ""Plan ID","Hazard ID"(Key)".
//         // 
//         // key(Key1;"Plan ID","Hazard ID","Risk Management Plan ID")
//         // {
//         // Clustered = true;
//         // }
//     }


//     //Unsupported feature: Property Modification (Id) on "RiskManagementPlanLine(Variable 1003)".

//     //var
//     //>>>> ORIGINAL VALUE:
//     //RiskManagementPlanLine : 1003;
//     //Variable type has not been exported.
//     //>>>> MODIFIED VALUE:
//     //RiskManagementPlanLine : 1002;
//     //Variable type has not been exported.

//     var
//         HazardTypes: Record "Hazard Type";
// }
