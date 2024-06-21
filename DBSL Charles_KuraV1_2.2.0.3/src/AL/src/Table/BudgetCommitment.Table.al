#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 57021 "Budget Commitment"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Editable = false;
        }
        field(2; "Account No."; Code[10])
        {
            Editable = false;
            TableRelation = "G/L Account"."No.";
        }
        field(3; "Account Name"; Text[100])
        {
            Editable = false;
        }
        field(4; "Budgeted Amount"; Decimal)
        {
            Editable = false;
        }
        field(5; "Commited Amount PRN"; Decimal)
        {
            // CalcFormula = sum("Purchase Line".Amount where ("Document Type"=const("Purchase Requisition"),
            //                                                 "Vote Item"=field("Account No."),
            //                                                 Status=const(Released),
            //                                                 Ordered=const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Commited Amount Imprest"; Decimal)
        {
            CalcFormula = sum("Imprest Lines".Amount where("Account No." = field("Account No."),
                                                            Status = const(Released),
                                                            "Payment Type" = filter(<> "Imprest Surrender")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Commited Amount Orders"; Decimal)
        {
            // CalcFormula = sum("Purchase Line"."Line Amount" where ("Document Type"=const(Order),
            //                                                        "Vote Item"=field("Account No."),
            //                                                        Status=const(Released)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Budget Name"; Code[10])
        {
            Editable = false;
        }
        field(9; "Budget Start Date"; Date)
        {
            Editable = false;
        }
        field(10; "Actual Amount"; Decimal)
        {
        }
        field(11; "Committed Invoices"; Decimal)
        {
            // CalcFormula = sum("Purchase Line"."Line Amount" where ("Document Type"=const(Invoice),
            //                                                        Status=const(Released),
            //                                                        "Vote Item"=field("Account No.")));
            FieldClass = FlowField;
        }
        field(14; Test; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No.", "Account No.", "Budget Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        GLSetupRetrieved: Boolean;
        GLSetup: Record "General Ledger Setup";
        DimVal: Record "Dimension Value";
        DimMgt: Codeunit DimensionManagement;
        Text000: label 'The dimension value %1 has not been set up for dimension %2.';

    local procedure GetGLSetup()
    begin
        if not GLSetupRetrieved then begin
            GLSetup.Get;
            GLSetupRetrieved := true;
        end;
    end;

    local procedure ValidateDimValue(DimCode: Code[20]; var DimValueCode: Code[20])
    var
        DimValue: Record "Dimension Value";
    begin
        if DimValueCode = '' then
            exit;

        DimValue."Dimension Code" := DimCode;
        DimValue.Code := DimValueCode;
        DimValue.Find('=><');
        if DimValueCode <> CopyStr(DimValue.Code, 1, StrLen(DimValueCode)) then
            Error(Text000, DimValueCode, DimCode);
        DimValueCode := DimValue.Code;
    end;


    procedure UpdateDimSet(var TempDimSetEntry: Record "Dimension Set Entry" temporary; DimCode: Code[20]; DimValueCode: Code[20])
    begin
        // /
    end;
}

