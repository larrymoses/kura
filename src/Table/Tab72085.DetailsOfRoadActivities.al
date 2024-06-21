#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72085 "Details Of Road Activities"
{

    fields
    {
        field(1;"Item Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BoQ Template Line"."No." where ("BoQ Template ID"=field("Bill No"));

            trigger OnValidate()
            begin
                FnPopulateBOQItemAttributes;
            end;
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Unit Of Measure";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".Code;
        }
        field(4;Quantity;Integer)
        {
            DataClassification = ToBeClassified;
            InitValue = 1;
            MaxValue = 99999999;
            MinValue = 1;
            NotBlank = true;

            trigger OnValidate()
            begin
                if Quantity<> 0 then
                "Bill Item Amount(LCY)":="Rate(LCY)"*Quantity;
            end;
        }
        field(5;"Rate(LCY)";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Validate(Quantity);
            end;
        }
        field(6;"Bill Item Amount(LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Start Chainage(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"End Chainage(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;Technology;Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Technology".Code where (Blocked=const(false));

            trigger OnValidate()
            begin
                RoadTechnology.Reset;
                RoadTechnology.SetRange(Code,Technology);
                if RoadTechnology.FindSet then
                  "Labour(%)":=RoadTechnology."Labour Percentage";
            end;
        }
        field(10;"Labour(%)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"WorkPlan No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(13;"Bill No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BoQ Template"."Bill No";
        }
        field(14;"Section Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No.";
        }
        field(15;"Section Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Road Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset" where ("Record Type"=filter("Road Asset"));

            trigger OnValidate()
            begin
                RoadAsset.Reset;
                RoadAsset.SetRange("No.","Road Code");
                if RoadAsset.FindSet then
                  "Road Link Name":=RoadAsset.Description;
            end;
        }
        field(17;"Road Link Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Project No";Code[50])
        {
            DataClassification = ToBeClassified;
            Description = '//Pick Job number';
        }
        field(19;"Section Line No";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Job Planning Line';
        }
    }

    keys
    {
        key(Key1;"Section Line No","WorkPlan No","Road Code","Section Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
         PFVLine.Reset;
         PFVLine.SetRange("Document No","WorkPlan No");
         if PFVLine.Find('-') then
          begin
           "Start Chainage(Km)":=PFVLine."Start Chainage(Km)";
           "End Chainage(Km)":=PFVLine."End Chainage(Km)";
         end;
    end;

    var
        BoQTemplateLine1: Record "BoQ Template Line1";
        RoadTechnology: Record "Road Technology";
        PFVLine: Record "Project Funding Voucher Line";
        RoadAsset: Record "Fixed Asset";
        RoadSection: Record "Road Section";

    local procedure FnPopulateBOQItemAttributes()
    begin
        BoQTemplateLine1.Reset;
        BoQTemplateLine1.SetRange(BoQTemplateLine1."No.","Item Code");
        if BoQTemplateLine1.FindSet then begin
          Description:=BoQTemplateLine1.Description;
          "Unit Of Measure":=BoQTemplateLine1."Unit of Measure Code";
          "Labour(%)":=BoQTemplateLine1."Labour(%)";
          "Rate(LCY)":=BoQTemplateLine1."Amount Excl. VAT";
          end;
    end;
}

