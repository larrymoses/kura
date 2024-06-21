#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72124 "RICS New Road Section"
{

    fields
    {
        field(1; "RICS No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Road Section No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Road Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No.";
        }
        field(4; "Section Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Road Class ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = Table50001.Field1;
        }
        field(6; "Road Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Primary National,Secondary National,County Road';
            OptionMembers = " ","Primary National","Secondary National","County Road";
        }
        field(7; "Carriageway Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Single,Dual';
            OptionMembers = " ",Single,Dual;
        }
        field(8; "Primary Constituency ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code;
        }
        field(9; "Primary County ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = County1.Code;
        }
        field(10; "Primary Region ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(11; "Start Chainage(KM)"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 999999999;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Start Chainage(KM)" < 0 then begin
                    Error('Value cannot be negative');
                end;
            end;
        }
        field(12; "End Chainage(KM)"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 99999999;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "End Chainage(KM)" < 0 then begin
                    Error('Value cannot be negative');
                end;

                if "End Chainage(KM)" < "Start Chainage(KM)" then
                    Error('End Chainage cannot be less than start chainage');

                if "End Chainage(KM)" > 0 then begin
                    "Total Road Length (KMs)" := "End Chainage(KM)" - "Start Chainage(KM)";
                end;
            end;
        }
        field(13; "Total Road Length (KMs)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Start Point Longitude"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(15; "Start Point Latitude"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(16; "End Point Longitude"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(17; "End Point Latitude"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(18; "Paved Road Length (Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(19; "Paved Road Length %"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(20; "Unpaved Road Length %"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(21; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Last Road Condition Survey ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Last Road Cond. Survey Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Last Road Condition Survey Date';
        }
        field(24; "No. of Awarded Contracts"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter("Blanket Order"),
                                                         "Contract Status" = filter(" ")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(25; "No. of Planned Road Projects"; Integer)
        {
            // CalcFormula = count(Job where ("Road Code"=field("Road Code"),
            //                                Status=filter(Planned)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(26; "No. of Ongoing Road Projects"; Integer)
        {
            // CalcFormula = count(Job where ("Road Code"=field("Road Code"),
            //                                Status=filter("Completed/Under DLP")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(27; "No. of Completed Road Projects"; Integer)
        {
            // CalcFormula = count(Job where ("Road Code"=field("Road Code"),
            //                                Status=filter("Under PBRM")));
            // Editable = false;
            FieldClass = FlowField;
        }
        field(28; "Budget (Total Cost)"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where("Line Type" = filter(Budget)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; "Actual (Total Cost)"; Decimal)
        {
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("Entry Type" = filter(Usage)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(31; "No. of Res. Land Acq. W_orders"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Res. Land Acq. W_orders';
        }
        field(32; "No. of Roadside Devpt Apps"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Roadside Devpt Apps';
        }
        field(33; "No. of Enchmt Stop W_orders"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Enchmt Stop W_orders';
        }
        field(34; "No. of Axle Load Inspections"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "No. of Axle Load Exempt Prmts"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Axle Load Exempt Prmts';
        }
        field(36; "No. of Filed Road Misuse Inc."; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Filed Road Misuse Inc.';
        }
        field(37; "Total No. of Fatalities"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Paved Road Length %", "RICS No", "Road Section No.")
        {
            Clustered = true;
        }

    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        // IF "Road Section No." ='' THEN BEGIN
        //  RMSSetup.GET();
        // RMSSetup.TESTFIELD("Section Nos");
        // NoSeriesMgt.InitSeries(RMSSetup."Section Nos",xRec."Unpaved Road Length %",TODAY,"Road Section No.","Unpaved Road Length %");
        // END;
    end;

    var
        RMSSetup: Record "Roads Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

