#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70238 "Variation Of Price Index"
{
    Caption = 'IFS Key Staff';
    LookupPageId = "Variation of Price Indices";
    DRILLDOWNPAGEID = "Variation of Price Indices";

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2; "No."; Code[20])
        {
            Caption = 'Response No';
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No.";

            trigger OnValidate()

            var
                ifs: Record "Standard Purchase Code";
            begin

                IFS.RESET;
                IFS.SETRANGE(IFS."PRN No.", "No.");
                IF IFS.FINDSET THEN BEGIN
                    "IFS Code" := IFS.Code;
                END;
            end;

        }
        field(3; "Index Code"; Code[40])
        {
            Caption = 'Staff No.';
            DataClassification = ToBeClassified;
            TableRelation = "Variation Of Price SetUp".Code;

            trigger OnValidate()
            begin
                VariationOfPriceSetUp.Reset;
                VariationOfPriceSetUp.SetRange(VariationOfPriceSetUp.Code, "Index Code");
                if VariationOfPriceSetUp.FindSet then begin
                    "Index Description" := VariationOfPriceSetUp."Item Description";
                end;
            end;
        }
        field(4; "Index Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Contract Weight"; Decimal)
        {
            Caption = 'Contract Weight';
            DataClassification = ToBeClassified;
        }
        field(6; "Index Source"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Base Index"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Adjustment Factor"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(10; "Range of Weighting"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "IFS Code"; Code[20])
        {
            CalcFormula = lookup("Standard Purchase Code".Code where("PRN No." = field("No.")));
            FieldClass = FlowField;
        }
        field(12; "Project No."; Code[20])
        {
            CalcFormula = lookup("Standard Purchase Code"."Project ID" where(Code = field("IFS Code")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Index Code", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
        VariationOfPriceSetUp: Record "Variation Of Price SetUp";
}

