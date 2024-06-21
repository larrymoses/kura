// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
// TableExtension 70102 StrategyWorkplanLinesExtn1 extends "Strategy Workplan Lines"
// {
//     //  LookupPageID = 80507;
//     // DrillDownPageID = 80507;
//     fields
//     {


//         //Unsupported feature: Property Modification (Data type) on ""Perfomance Indicator"(Field 19)".

//         modify("Assigned Weight(%)")
//         {
//             Caption = 'Summation of Subactivity Weight(%)';
//         }

//         //Unsupported feature: Code Modification on ""Activity ID"(Field 3).OnValidate".

//         //trigger OnValidate()
//         //Parameters and return type have not been exported.
//         //>>>> ORIGINAL CODE:
//         //begin
//         /*
//         StrategicInt.RESET;
//         StrategicInt.SETRANGE(Code,"Activity ID");
//         IF StrategicInt.FIND('-') THEN BEGIN
//           Description:=StrategicInt.Description;
//           END;
//         */
//         //end;
//         //>>>> MODIFIED CODE:
//         //begin
//         /*
//         IF "Cross Cutting"=FALSE THEN BEGIN
//           StrategicInt.RESET;
//           StrategicInt.SETRANGE(Code,"Activity ID");
//           IF StrategicInt.FIND('-') THEN BEGIN
//             Description:=StrategicInt.Description;
//             "Primary Directorate":=StrategicInt."Primary Directorate";
//              VALIDATE("Primary Directorate");
//             "Primary Department":=StrategicInt."Primary Department";
//             VALIDATE("Primary Department Name");
//             "Perfomance Indicator":=StrategicInt."Perfomance Indicator";
//             VALIDATE("Perfomance Indicator");
//             "Imported Annual Target Qty":=StrategicInt."CSP Planned Target";
//             VALIDATE("Imported Annual Target Qty");
//             "Imported Annual Budget Est.":=StrategicInt."Collective Budget";
//             VALIDATE("Imported Annual Budget Est.");
//             END;
//         END;

//         IF "Cross Cutting"=TRUE THEN BEGIN
//           CrossCutting.RESET;
//           CrossCutting.SETRANGE("Entry No","Activity ID");
//           IF CrossCutting.FIND('-') THEN BEGIN
//             Description:=CrossCutting.Description;
//             END;
//         END;
//         */
//         //end;


//         //Unsupported feature: Code Modification on ""Imported Annual Budget Est."(Field 6).OnValidate".

//         //trigger "(Field 6)()
//         //Parameters and return type have not been exported.
//         //>>>> ORIGINAL CODE:
//         //begin
//         /*
//          IF ("Imported Annual Budget Est."<>0) THEN BEGIN
//           "Q1 Budget":=ROUND("Imported Annual Budget Est."*("Q1 Target"/"Imported Annual Target Qty"),0.01,'=');
//           "Q2 Budget":=ROUND("Imported Annual Budget Est."*("Q2 Target"/"Imported Annual Target Qty"),0.01,'=');
//           "Q3 Budget":=ROUND("Imported Annual Budget Est."*("Q3 Target"/"Imported Annual Target Qty"),0.01,'=');
//           "Q4 Budget":=ROUND("Imported Annual Budget Est."*("Q4 Target"/"Imported Annual Target Qty"),0.01,'=');
//         END;
//         */
//         //end;
//         //>>>> MODIFIED CODE:
//         //begin
//         /*
//         // IF ("Imported Annual Budget Est."<>0) THEN BEGIN
//         //  "Q1 Budget":=ROUND("Imported Annual Budget Est."*("Q1 Target"/"Imported Annual Target Qty"),0.01,'=');
//         //  "Q2 Budget":=ROUND("Imported Annual Budget Est."*("Q2 Target"/"Imported Annual Target Qty"),0.01,'=');
//         //  "Q3 Budget":=ROUND("Imported Annual Budget Est."*("Q3 Target"/"Imported Annual Target Qty"),0.01,'=');
//         //  "Q4 Budget":=ROUND("Imported Annual Budget Est."*("Q4 Target"/"Imported Annual Target Qty"),0.01,'=');
//         // END;
//         */
//         //end;


//         //Unsupported feature: Code Insertion on ""Perfomance Indicator"(Field 19)".

//         //trigger OnValidate()
//         //Parameters and return type have not been exported.
//         //begin
//         /*
//         PerformanceIndicator.RESET;
//         PerformanceIndicator.SETFILTER(KPI,"Perfomance Indicator");
//         IF PerformanceIndicator.FINDSET THEN BEGIN
//              "Unit of Measure":=PerformanceIndicator."Unit of Measure";
//           END;
//         */
//         //end;

//     }

//     var
//     // CrossCutting: Record 80270;
// }

