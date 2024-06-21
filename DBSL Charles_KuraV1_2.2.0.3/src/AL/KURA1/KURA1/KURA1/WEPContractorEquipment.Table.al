#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72186 "WEP Contractor Equipment"
{
    DrillDownPageID = "WEP Contractor Equipment";
    LookupPageID = "WEP Contractor Equipment";

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Site Agent Nomination,Contractor Personnel Appointment,Contractor Equipment Register';
            OptionMembers = " ","Site Agent Nomination","Contractor Personnel Appointment","Contractor Equipment Register";
        }
        field(2;"Document No.";Code[20])
        {
            Caption = 'code';
            DataClassification = ToBeClassified;
        }
        field(3;"Contractor No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(4;"Equipment No.";Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                VendorEquipment.Reset;
                VendorEquipment.SetRange(VendorEquipment."Equipment No.","Equipment No.");
                if VendorEquipment.FindSet then begin
                  "Equipment Type Code":=VendorEquipment."Equipment Type Code";
                  "Equipment Condition Code":=VendorEquipment."Equipment Condition Code";
                  "Equipment Serial No.":=VendorEquipment."Equipment Registration No.";
                  "Equipment Usability Code":=VendorEquipment."Equipment Usability Code";
                  "Years of Previous Use":=VendorEquipment."Years of Previous Use";
                  Description:=VendorEquipment.Description;
                  end;
                  Validate("Equipment Type Code");
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
        field(6;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Ownership Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Owned,Leased,Purchase Proposal';
            OptionMembers = " ",Owned,Leased,"Purchase Proposal";
        }
        field(8;"Equipment Serial No.";Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Equipment Serial No.';
        }
        field(9;"Equipment Usability Code";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Excellent,Good,Fair,Beyond Useful Life';
            OptionMembers = " ",Excellent,Good,Fair,"Beyond Useful Life";
        }
        field(10;"Years of Previous Use";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Equipment Condition Code";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Working,Not Working';
            OptionMembers = " ",Working,"Not Working";
        }
        field(12;"No of Planned Maintenance";Integer)
        {
            CalcFormula = count("WEP Equipment Repair Plan" where ("Equipment No."=field("Equipment No.")));
            FieldClass = FlowField;
        }
        field(13;"Project No";Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Equipment Availability";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Scheduled Date of Delivery";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Project Phase";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Equipment Condition Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Working,Under Maintenance';
            OptionMembers = Working,"Under Maintenance";
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Contractor No.","Equipment No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        WEPContractorSubmission.Reset;
        WEPContractorSubmission.SetRange(WEPContractorSubmission."Document No","Document No.");
        if WEPContractorSubmission.FindSet then begin
          "Project No":=WEPContractorSubmission."Project No";
          "Contractor No.":=WEPContractorSubmission."Contractor No";
          end;
    end;

    var
        VendorEquipment: Record "Vendor Equipment";
        WorksEquipmentType: Record "Works Equipment Type";
        WEPContractorSubmission: Record "WEP Contractor Submission";
}

