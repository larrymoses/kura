#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 57029 "Cash Request Lines"
{

    fields
    {
        field(1; "IFMIS CODE"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Contractor ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange("No.", "Contractor ID");
                if Vendor.FindSet then
                    "Contractor Name" := Vendor.Name;
            end;
        }
        field(3; "Project Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Reference No. (Cert No.)"; Code[50])
        {
            DataClassification = ToBeClassified;

            trigger OnLookup()
            begin
                "Reference No. (Cert No.)" := '';
                Amt := 0;


                VendLedger.Reset;
                VendLedger.SetCurrentkey(VendLedger."Vendor No.", Open, "Document No.");
                VendLedger.SetRange(VendLedger."Vendor No.", "Contractor ID");
                VendLedger.SetRange(Open, true);
                VendLedger.CalcFields("Remaining Amount");
                VendLedger.CalcFields("Remaining Amt. (LCY)");
                if Page.RunModal(29, VendLedger) = Action::LookupOK then begin

                    if VendLedger."Applies-to ID" <> '' then begin
                        VendLedger1.Reset;
                        VendLedger1.SetCurrentkey(VendLedger1."Vendor No.", Open, "Applies-to ID");
                        VendLedger1.SetRange(VendLedger1."Vendor No.", "Contractor ID");
                        VendLedger1.SetRange(Open, true);
                        VendLedger1.SetRange(VendLedger1."Applies-to ID", VendLedger."Applies-to ID");
                        if VendLedger1.Find('-') then begin
                            repeat
                                VendLedger1.CalcFields(VendLedger1."Remaining Amount");
                                VendLedger1.CalcFields("Remaining Amt. (LCY)");
                            //NetAmount:=NetAmount+ABS(VendLedger1."Remaining Amount");

                            until VendLedger1.Next = 0;
                        end;


                        if "Cert Amount" = 0 then
                            "Cert Amount" := "Cert Amount";

                        Validate("Cert Amount");
                        "Reference No. (Cert No.)" := VendLedger."Document No.";
                        //"External Document No.":=VendLedger."External Document No.";

                    end else begin
                        if "Cert Amount" <> Abs(VendLedger."Remaining Amount") then
                            VendLedger.CalcFields(VendLedger."Remaining Amount");
                        VendLedger.CalcFields(VendLedger."Remaining Amt. (LCY)");
                        if "Cert Amount" = 0 then begin
                            "Cert Amount" := Abs(VendLedger."Remaining Amount");
                        end;

                        //VALIDATE(Amount);
                        "Reference No. (Cert No.)" := VendLedger."Document No.";
                        //"External Document No.":=VendLedger."External Document No.";


                    end;
                end;
                "Amount Outstanding" := Abs(VendLedger."Remaining Amount");
                "Cert Amount" := Abs(VendLedger."Original Amt. (LCY)");

                Validate("Cert Amount");
                //END;
                //END;
            end;
        }
        field(5; "Cert Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Amount Outstanding"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; Budget; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Previous Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "This Request"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Contractor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Project Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange("No.", "Project Code");
                if Job.FindSet then begin
                    "Project Name" := Job.Description;
                    Job.CalcFields("Total Approved Budget");
                    Budget := Job."Total Approved Budget";
                end;
            end;
        }
        field(12; "Document No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Net GoK Budgeted Amount"; Decimal)
        {
            CalcFormula = sum("G/L Budget Entry".Amount where("Budget Type" = filter(Approved),
                                                               "Project Code" = field("Project Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Supplementary Budget Amount"; Decimal)
        {
            CalcFormula = sum("G/L Budget Entry".Amount where("Budget Type" = filter(Suplimentary),
                                                               "Project Code" = field("Project Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Net Exchequer Issued to Date"; Decimal)
        {
            // CalcFormula = sum("Receipt Lines1".Amount where (Field69025=field("Project Code"),
            //                                                  Posted=filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "Net GoK Budget Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Net GoK Current Request"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Net GoK Current Request" > "Net GoK Budgeted Amount" then
                    Error('The Net Request Amount %1 cannot be greater than Net Budgeted Amount %2', "Net GoK Current Request", "Net GoK Budgeted Amount");
            end;
        }
        field(19; "Shortcut Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));
        }
        field(20; "Shortcut Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2));
        }
        field(21; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document No", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        CalcFields("Net Exchequer Issued to Date", "Net GoK Budgeted Amount", "Supplementary Budget Amount");
        if "Net GoK Budgeted Amount" <> 0 then
            "Net GoK Budget Balance" := "Net GoK Budgeted Amount" - "Net Exchequer Issued to Date";
        if "Supplementary Budget Amount" <> 0 then
            "Net GoK Budget Balance" := "Supplementary Budget Amount" - "Net Exchequer Issued to Date";
    end;

    var
        Vendor: Record Vendor;
        Job: Record Job;
        Amt: Decimal;
        VendLedger: Record "Vendor Ledger Entry";
        VendLedger1: Record "Vendor Ledger Entry";
}

