#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 59013 "Fuel Card"
{

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; "Receipt No"; Code[20])
        {
        }
        field(3; "Registration No."; Code[20])
        {
            TableRelation = "Fleet Vehicles."."FA Serial No";

            trigger OnValidate()
            begin


                Vehicles.Reset;
                Vehicles.SetRange(Vehicles."FA Serial No", "Registration No.");
                if Vehicles.Find('-') then begin

                    Make := Vehicles.Make;
                    Model := Vehicles.Model;
                    "Fuel Card No." := Vehicles."Fuel Card No";
                    "Fuel Card Pin" := Vehicles."Fuel Card Pin";
                    "Allocated Vehicle Limit" := Vehicles."Vehicle Limit";
                end;
                //"Total Allocated Limit":=AllocatedAmount."Document No.";
            end;
        }
        field(4; Make; Text[30])
        {
        }
        field(5; Model; Text[30])
        {
        }
        field(6; "Fuel Card No."; Code[20])
        {
        }
        field(7; "Fuel Card Pin"; Code[20])
        {
        }
        field(8; "Vehicle Limit"; Decimal)
        {
        }
        field(11; "Total Allocated Limit"; Decimal)
        {
            CalcFormula = lookup("Limit Types"."Upper Limit" where(Code = field("Card Type")));
            FieldClass = FlowField;
        }
        field(12; "Total Balance"; Decimal)
        {
        }
        field(13; "Allocated Vehicle Limit"; Decimal)
        {

            trigger OnValidate()
            begin
                CalcFields("Total Amt Spend per Vehicle");
                "Vehicle Balance" := "Allocated Vehicle Limit" - "Total Amt Spend per Vehicle";
            end;
        }
        field(14; "Vehicle Balance"; Decimal)
        {
        }
        field(16; "No. Series"; Code[20])
        {
        }
        field(17; "Total Amount Spend"; Decimal)
        {
            CalcFormula = sum("Fuel Card Entries".Amount where(RegNo = field("Registration No.")));
            FieldClass = FlowField;
        }
        field(18; "Total Amt Spend per Vehicle"; Decimal)
        {
            CalcFormula = sum("Fuel Card Entries".Amount where(RegNo = field("Registration No.")));
            FieldClass = FlowField;
        }
        field(19; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved,Rejected,Posting;
        }
        field(20; Posted; Boolean)
        {
        }
        field(21; check; Decimal)
        {
            CalcFormula = sum("Vehicle Fuel Card Lines".Amount where("No." = field(No)));
            FieldClass = FlowField;
        }
        field(22; lowerlimit; Decimal)
        {
            CalcFormula = lookup("Limit Types"."Lower Limit" where(Code = field("Card Type")));
            FieldClass = FlowField;
        }
        field(23; "Card Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Limit Types".Code;

            trigger OnValidate()
            begin
                LimitType.Reset;
                LimitType.SetRange(Code, "Card Type");
                if LimitType.Find('-') then begin
                    "Requisition Interval" := LimitType."Request Duration";
                end;
            end;
        }
        field(24; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "End Date" := CalcDate("Requisition Interval", "Start Date");
            end;
        }
        field(25; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26; "Requisition Interval"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(27; closed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Fuel Type"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Vehicle Number"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fleet Vehicles."."No.";
        }
        field(30; "Driver Details"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Total Expenses"; Blob)
        {
            DataClassification = ToBeClassified;

        }
        field(32; "Total Top Up Amount"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Fuel Topup Request".Amount where("Card No." = field(No),
                                                            Status = filter(Approved)));
            trigger OnValidate()
            begin
                CalcFields("Total Amount Spend");
                CalcFields("Total Top Up Amount");
                CalcFields("Total Allocated Amount");
                "Total Balance" := (Rec."Total Allocated Amount" + Rec."Total Top Up Amount") - Rec."Total Amount Spend";
            end;
        }
        field(33; "Total Allocated Amount"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Fuel Allocation Lines".Amount where("Card No." = field(No),
                                                                Closed = const(true)));
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if No = '' then begin
            FltMgtSetup.Get;
            FltMgtSetup.TestField(FltMgtSetup."Fuel Card No");
            NoSeriesMgt.InitSeries(FltMgtSetup."Fuel Card No", xRec."No. Series", 0D, No, "No. Series");
        end;
    end;

    var
        FltMgtSetup: Record "Fleet Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Vehicles: Record "Fleet Vehicles.";
        AllocatedAmount: Record "Limit Types";
        LimitType: Record "Limit Types";
}

