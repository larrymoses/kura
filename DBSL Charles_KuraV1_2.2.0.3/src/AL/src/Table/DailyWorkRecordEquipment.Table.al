#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72241 "Daily Work Record Equipment"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Equipment No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "WEP Contractor Equipment"."Equipment No." where("Document No." = field("Work Execution Programme ID"));

            trigger OnValidate()
            begin
                WEPContractorEquipment.Reset;
                WEPContractorEquipment.SetRange(WEPContractorEquipment."Document Type", WEPContractorEquipment."document type"::"Contractor Personnel Appointment");
                WEPContractorEquipment.SetRange(WEPContractorEquipment."Document No.", "Work Execution Programme ID");
                WEPContractorEquipment.SetRange(WEPContractorEquipment."Equipment No.", "Equipment No.");
                if WEPContractorEquipment.FindSet then begin
                    "Equipment Type Code" := WEPContractorEquipment."Equipment Type Code";
                    Validate("Equipment Type Code");
                    "Serial/Registration No." := WEPContractorEquipment."Equipment Serial No.";
                end;
            end;
        }
        field(4; "Equipment Type Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Equipment Type".Code where(Blocked = filter(false));

            trigger OnValidate()
            begin
                WorksEquipmentType.Reset;
                WorksEquipmentType.SetRange(WorksEquipmentType.Code, "Equipment Type Code");
                if WorksEquipmentType.FindSet then begin
                    Description := WorksEquipmentType.Description;
                end;
            end;
        }
        field(5; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Serial/Registration No."; Code[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Equipment Serial/Registration No.';
        }
        field(7; "Photo No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Photo Record"."Photo ID" where("Project ID" = field("Job No."));
        }
        field(8; "Equipment Utilization"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Working,Idle,Service/Maintenance';
            OptionMembers = " ",Working,Idle,"Service/Maintenance";
        }
        field(9; Remarks; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Work Execution Programme ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Mobilization Header"."Document No." where("Document Type" = filter("Work Execution Programme"));
        }
        field(11; "Job No."; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Project ID";
        }
        field(12; "Equipment Usage Hours"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Equipment Idle Hours"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Usage From DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Usage To DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        DailyWorkRecord.Reset;
        DailyWorkRecord.SetRange(DailyWorkRecord."Document No.", Rec."Document No.");
        if DailyWorkRecord.FindSet then begin
            "Job No." := DailyWorkRecord."Project ID";
            "Document Date" := DailyWorkRecord."Document Date";
            "Work Execution Programme ID" := DailyWorkRecord."Work Execution Programme ID";
        end;
    end;

    var
        WorksEquipmentType: Record "Works Equipment Type";
        DailyWorkRecord: Record "Daily Work Record";
        WEPContractorEquipment: Record "WEP Contractor Equipment";
}

