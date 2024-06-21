// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
// TableExtension 90092 tableextension90002 extends "HSE Plan"
// {
//     fields
//     {
//         modify("Risk Management Plan ID")
//         {
//             TableRelation = if ("Plan Type" = const(Corporate)) "Risk Management Plan"."Document No" where("Document Type" = const(Corporate))
//             else
//             if ("Plan Type" = const("Functional (Directorate)")) "Risk Management Plan"."Document No" where("Document Type" = const("Functional (Directorate)"))
//             else
//             if ("Plan Type" = const("Functional (Department)")) "Risk Management Plan"."Document No" where("Document Type" = const("Functional (Department)"))
//             else
//             if ("Plan Type" = const("Functional (Region)")) "Risk Management Plan"."Document No" where("Document Type" = const("Functional (Region)"));
//         }

//         //Unsupported feature: Property Modification (Data type) on "Description(Field 5)".

//         modify("Safety Rules&Regulations Temp")
//         {
//             TableRelation = "OSH Rule Template"."Template ID" where(Blocked = const(false));
//         }

//         //Unsupported feature: Property Modification (Data type) on ""Primary Mission"(Field 10)".

//         modify(Status)
//         {

//             //Unsupported feature: Property Modification (OptionString) on "Status(Field 16)".

//             OptionCaption = 'Open,Pending Approval,Released';
//         }

//         //Unsupported feature: Deletion on ""Risk Management Plan ID"(Field 4).OnValidate".


//         //Unsupported feature: Deletion on ""Safety Rules&Regulations Temp"(Field 6).OnValidate".


//         //Unsupported feature: Property Deletion (Editable) on "Status(Field 16)".


//         //Unsupported feature: Property Deletion (Editable) on ""Created By"(Field 17)".


//         //Unsupported feature: Property Deletion (Editable) on ""Created Date/Time"(Field 18)".


//         //Unsupported feature: Deletion (FieldCollection) on ""Project ID"(Field 36)".


//         //Unsupported feature: Deletion (FieldCollection) on ""Assigned To:"(Field 37)".

//     }

//     //Unsupported feature: Code Modification on "OnInsert".

//     //trigger OnInsert()
//     //>>>> ORIGINAL CODE:
//     //begin
//     /*
//     "Document Date":=TODAY;
//     Status:=Status::Open;
//     "Created By":=USERID;
//     "Created Date/Time":=CREATEDATETIME(TODAY,TIME);

//     IF "Plan ID"='' THEN BEGIN
//     HealthSafetySetup.GET;
//     HealthSafetySetup.TESTFIELD("OSH Management Plan Nos.");
//     NoSeriesManagement.InitSeries(HealthSafetySetup."OSH Management Plan Nos.",xRec."No. Series",0D,"Plan ID",Rec."No. Series");
//     END;
//     */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//     /*
//     #6..8
//     NoSeriesManagement.InitSeries(HealthSafetySetup."OSH Management Plan Nos.",xRec."No. Series",0D,"Plan ID","No. Series");
//     END;
//     "Document Date":=TODAY;
//     "Created By":=USERID;
//     "Created Date/Time":=CREATEDATETIME(TODAY,TIME);
//     */
//     //end;

//     //Unsupported feature: Property Deletion (LookupPageID).


//     //Unsupported feature: Property Deletion (DrillDownPageID).


//     var
//         RiskManagement: Record "Risk Management Plan";
// }
