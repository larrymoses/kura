#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72253 "Daily Equipment Ledger"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Daily Work Record ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Document No.";

            trigger OnValidate()
            begin
                DailyWorkRecord.Reset;
                DailyWorkRecord.SetRange(DailyWorkRecord."Document No.","Daily Work Record ID");
                if DailyWorkRecord.FindSet then begin
                  "Posting Date":=DailyWorkRecord."Document Date";
                  end;
            end;
        }
        field(3;"Job No.";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Project ID" where ("Document No."=field("Daily Work Record ID"));
        }
        field(4;"Equipment No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "WEP Contractor Equipment"."Equipment No." where ("Document No."=field("Work Execution Programme ID"));

            trigger OnValidate()
            begin
                WEPContractorEquipment.Reset;
                WEPContractorEquipment.SetRange(WEPContractorEquipment."Document No.","Work Execution Programme ID");
                WEPContractorEquipment.SetRange(WEPContractorEquipment."Document Type",WEPContractorEquipment."document type"::"Contractor Personnel Appointment");
                if WEPContractorEquipment.FindSet then begin
                  "Equipment Type Code":=WEPContractorEquipment."Equipment Type Code";
                  Description:=WEPContractorEquipment.Description;
                  "Serial/Registration No.":=WEPContractorEquipment."Equipment Serial No.";
                  end;
            end;
        }
        field(5;"Equipment Type Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Equipment Type".Code where (Blocked=filter(false));

            trigger OnValidate()
            begin
                WorksEquipmentType.Reset;
                WorksEquipmentType.SetRange(WorksEquipmentType.Code,"Equipment Type Code");
                if WorksEquipmentType.FindSet then begin
                   Description:=WorksEquipmentType.Description;

                  end;
            end;
        }
        field(6;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Serial/Registration No.";Code[100])
        {
            Caption = 'Equipment Serial/Registration No.';
            DataClassification = ToBeClassified;
        }
        field(8;"Photo No.";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Photo Record"."Photo ID" where ("Project ID"=field("Job No."));
        }
        field(9;"Equipment Utilization";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Working,Idle,Service/Maintenance';
            OptionMembers = " ",Working,Idle,"Service/Maintenance";
        }
        field(10;"Equipment Usage Hours";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11;Remarks;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Work Execution Programme ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Mobilization Header"."Document No." where ("Document Type"=filter("Work Execution Programme"),
                                                                                "Project ID"=field("Job No."));
        }
        field(13;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Document Date";
        }
        field(14;"Equipment Idle Hours";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        WEPContractorEquipment: Record "WEP Contractor Equipment";
        WorksEquipmentType: Record "Works Equipment Type";
        DailyWorkRecord: Record "Daily Work Record";
}

