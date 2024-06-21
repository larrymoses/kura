#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72012 "Road Study_Survey"
{

    fields
    {
        field(1; "Study ID"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Study/Survey Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Feasibility Study,Environmental Study,Topographic Survey,Traffic  Census,Road Safety Audit,Other Study';
            OptionMembers = " ","Feasibility Study","Environmental Study","Topographic Survey","Traffic  Census","Road Safety Audit","Other Study";
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Road Asset ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Road Inventory"."Road Code";
        }
        field(5; "All Road Sections"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Primary Execution Approach"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Outsource Services,Inhouse Operations';
            OptionMembers = " ","Outsource Services","Inhouse Operations";
        }
        field(7; "Study Abstract"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Primary Funding Agency ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = "Funding Agency".Code;
        }
        field(9; "Funding Source Type"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Funding Agency Contacts"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Funding Agency Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Person Responsible"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Project Manager"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Planned Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Planned End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Total Distance (KM)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Global Dimension 1"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(19; "Global Dimension 2"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(20; "Primary Directorate ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Primary Department ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Region ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "External Document No."; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Study Admin Officer ID"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;
        }
        field(25; "Admin Officer Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Study Finance Officer ID"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;
        }
        field(27; "Study Finance Officer Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Regional Director ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;
        }
        field(29; "Regional Director Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(30; " Authorized Official ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;
        }
        field(31; " Authorized Official Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Total Approved Budget (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Road Works Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(34; "Actual Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Actual End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Total Actual Cost (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(37; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(38; "NEMA Registration/Licence No"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(39; Location; Code[250])
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Geographical Position"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(41; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Ongoing,Completed,Stalled';
            OptionMembers = " ",Ongoing,Completed,Stalled;
        }
        field(42; "Completion Percentage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Start Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(44; "End Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Study ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Study ID" = '' then begin
            if "Study/Survey Type" = "study/survey type"::"Feasibility Study" then begin
                RMSetup.Get;
                RMSetup.TestField(RMSetup."Road Feasibility Study  Nos");
                NSeriesMgt.InitSeries(RMSetup."Road Feasibility Study  Nos", xRec."No. Series", 0D, "Study ID", "No. Series");
            end;
        end;

        if "Study ID" = '' then begin
            if "Study/Survey Type" = "study/survey type"::"Environmental Study" then begin
                RMSetup.Get;
                RMSetup.TestField(RMSetup."Environmental Studies Nos");
                NSeriesMgt.InitSeries(RMSetup."Environmental Studies Nos", xRec."No. Series", 0D, "Study ID", "No. Series");
            end;
        end;

        if "Study ID" = '' then begin
            if "Study/Survey Type" = "study/survey type"::"Topographic Survey" then begin
                RMSetup.Get;
                RMSetup.TestField(RMSetup."Topographic Surveys Nos");
                NSeriesMgt.InitSeries(RMSetup."Topographic Surveys Nos", xRec."No. Series", 0D, "Study ID", "No. Series");
            end;
        end;

        if "Study ID" = '' then begin
            if "Study/Survey Type" = "study/survey type"::"Traffic  Census" then begin
                RMSetup.Get;
                RMSetup.TestField(RMSetup."Traffic Census Nos");
                NSeriesMgt.InitSeries(RMSetup."Traffic Census Nos", xRec."No. Series", 0D, "Study ID", "No. Series");
            end;
        end;

        if "Study ID" = '' then begin
            if "Study/Survey Type" = "study/survey type"::"Road Safety Audit" then begin
                RMSetup.Get;
                RMSetup.TestField(RMSetup."Road Safety Audit Nos");
                NSeriesMgt.InitSeries(RMSetup."Road Safety Audit Nos", xRec."No. Series", 0D, "Study ID", "No. Series");
            end;
        end;
    end;

    var
        NSeriesMgt: Codeunit NoSeriesManagement;
        RMSetup: Record "Roads Management Setups";
}
