#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72359 "Equipment Repair Line"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Repair and Maintainance,Delivered To Site';
            OptionMembers = ,"Repair and Maintainance","Delivered To Site";
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
            TableRelation = "WEP Contractor Equipment"."Equipment No." where ("Project No"=field("Project No"));

            trigger OnValidate()
            begin
                WEPContractorEquipment.Reset;
                WEPContractorEquipment.SetRange(WEPContractorEquipment."Equipment No.","Equipment No.");
                if WEPContractorEquipment.FindSet then begin
                  "Equipment Type Code":=WEPContractorEquipment."Equipment Type Code";
                  "Equipment Condition Code":=WEPContractorEquipment."Equipment Condition Code";
                  "Equipment Serial No.":=WEPContractorEquipment."Equipment Serial No.";
                  "Equipment Usability Code":=WEPContractorEquipment."Equipment Usability Code";
                  "Years of Previous Use":=WEPContractorEquipment."Years of Previous Use";
                  Description:=WEPContractorEquipment.Description;
                  end;

                  EquipmentRepairLine.Reset;
                  EquipmentRepairLine.SetRange(EquipmentRepairLine."Document Type",Rec."Document Type");
                  EquipmentRepairLine.SetRange(EquipmentRepairLine."Document No.","Document No.");
                  EquipmentRepairLine.SetRange(EquipmentRepairLine."Equipment No.","Equipment No.");

                  if EquipmentRepairLine.FindSet then begin
                      Error('The equipment %1 is already selected. Please select another one.',"Equipment No.");
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
        field(15;"Expected Return Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Maintenance Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Additional Remarks";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(19;"Equipment Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Vehicle,RE Office,Survey Equipment,Lab Equipment';
            OptionMembers = " ",Vehicle,"RE Office","Survey Equipment","Lab Equipment";
        }
        field(20;"Contractor Comments";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        EquipmentRepairTracking.Reset;
        EquipmentRepairTracking.SetRange(EquipmentRepairTracking."Document No","Document No.");
        if EquipmentRepairTracking.FindSet then begin
          "Project No":=EquipmentRepairTracking."Project No";
          "Contractor No.":=EquipmentRepairTracking."Contractor No";
          end;
    end;

    var
        VendorEquipment: Record "Vendor Equipment";
        WorksEquipmentType: Record "Works Equipment Type";
        WEPContractorSubmission: Record "WEP Contractor Submission";
        EquipmentRepairTracking: Record "Equipment Repair Tracking";
        WEPContractorEquipment: Record "WEP Contractor Equipment";
        EquipmentRepairLine: Record "Equipment Repair Line";
}

