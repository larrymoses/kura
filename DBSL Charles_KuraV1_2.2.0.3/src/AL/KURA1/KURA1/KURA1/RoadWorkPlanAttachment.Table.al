// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
// Table 72303 "Road WorkPlan Attachment"
// {
//     // DrillDownPageID = "Project Funding Sources";
//     // LookupPageID = "Project Funding Sources";

//     fields
//     {
//         field(1; "Road Work Program ID"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(2; "Road Code"; Code[10])
//         {
//             DataClassification = ToBeClassified;

//             trigger OnValidate()
//             begin
//                 //  RoadInventory.RESET;
//                 //  RoadInventory.SETRANGE(RoadInventory."Road Code","Road Code");
//                 //  IF RoadInventory.FINDSET THEN BEGIN
//                 //   Description:=RoadInventory."Link Name";
//                 //   END;
//             end;
//         }
//         field(3; Description; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(4; "Road Project Category"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionCaption = ',Studies and Surveys,Construction Works,Maintenance Works';
//             OptionMembers = ,"Studies and Surveys","Construction Works","Maintenance Works";
//         }
//         field(5; "Road Works Category"; Code[50])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Works Category".Code where("Road Project Category" = field("Road Project Category"));
//         }
//         field(6; "Total Budget Cost"; Decimal)
//         {
//             AutoFormatType = 1;
//             BlankZero = true;
//             CalcFormula = sum("G/L Budget Entry".Amount where("KeRRA Budget Code" = field("KeRRA Budget Code"),
//                                                                "Budget Type 1" = filter(Original),
//                                                                "Global Dimension 2 Code" = field("Funding Source ID")));
//             Caption = 'Total Budget Cost';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(7; "Total Project Cost"; Decimal)
//         {
//             CalcFormula = sum("Detailed Multi_Year Line"."Annual Projection" where("Road Work Program ID" = field("Road Work Program ID"),
//                                                                                     "KeRRA Budget Code" = field("KeRRA Budget Code")));
//             FieldClass = FlowField;
//         }
//         field(8; "Global Dimension Code 2"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2));
//         }
//         field(9; "KeRRA Budget Code"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(10; "Line No"; Integer)
//         {
//             DataClassification = ToBeClassified;
//             Editable = false;
//         }
//         field(11; "Funding Source ID"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Funding Source".Code where(Blocked = filter(false));

//             trigger OnValidate()
//             begin
//                 FundingSource.Reset;
//                 FundingSource.SetRange(FundingSource.Code, "Funding Source ID");
//                 FundingSource.SetRange(FundingSource.Blocked, false);
//                 if FundingSource.FindSet then
//                     "Funding Source Name" := FundingSource.Description;
//             end;
//         }
//         field(12; "Funding Source Name"; Text[250])
//         {
//             DataClassification = ToBeClassified;
//             Editable = false;
//         }
//         field(13; "Document Link"; Text[2048])
//         {
//             DataClassification = ToBeClassified;
//             ExtendedDatatype = URL;
//         }
//     }

//     keys
//     {
//         key(Key1; "Road Work Program ID", "KeRRA Budget Code", "Funding Source ID")
//         {
//             Clustered = true;
//         }
//     }

//     fieldgroups
//     {
//     }

//     var
//         RoadSection: Record "Road Section";
//         RoadWorkProgram: Record "Road Work Program";
//         Constituency: Record Constituency;
//         WorksCategory: Record "Works Category";
//         FundingSource: Record "Funding Source";
//         VATProductPostingGroup: Record "VAT Product Posting Group";
//         VATPostingSetup: Record "VAT Posting Setup";
//         NewRoadWorkProgramPackage: Record "New Road Work Program Package";
//         TotalBudgetLines: Decimal;
//         RoadInventory: Record "Road Inventory";
// }

