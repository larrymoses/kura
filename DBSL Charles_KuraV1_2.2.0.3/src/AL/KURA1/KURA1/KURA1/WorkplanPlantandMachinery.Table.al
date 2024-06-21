#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72321 "Workplan Plant and Machinery"
{

    fields
    {
        field(1;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                WorkPlanHeader.Reset;
                WorkPlanHeader.SetRange(WorkPlanHeader."Document No.","Document No");
                if WorkPlanHeader.FindSet then begin
                  "Project ID":=WorkPlanHeader."Project ID";
                  end;
            end;
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Daily,Weekly,Monthly;
        }
        field(3;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Activity No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Line No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(7;"Equipment No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "WEP Contractor Equipment"."Equipment No." where ("Project No"=field("Project ID"));

            trigger OnValidate()
            begin
                WEPContractorEquipment.Reset;
                WEPContractorEquipment.SetRange(WEPContractorEquipment."Equipment No.",Rec."Equipment No");
                if WEPContractorEquipment.FindSet then begin
                  "Equipment Type Code":=WEPContractorEquipment."Equipment Type Code";
                  Description:=WEPContractorEquipment.Description;
                  end;
            end;
        }
        field(8;"Equipment Type Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Description;Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Quantity;Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Document Type","Activity No","Line No","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        WorkPlanHeader: Record "Work Plan Header";
        WEPContractorEquipment: Record "WEP Contractor Equipment";
}

