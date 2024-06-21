#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72320 "Workplan Material on Site"
{

    fields
    {
        field(1;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
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
        field(4;"Material Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Material"."Material Code" where (Blocked=filter(false));

            trigger OnValidate()
            begin
                 RoadMaterial.Reset;
                 RoadMaterial.SetRange(RoadMaterial."Material Code","Material Code");
                 if RoadMaterial.FindSet then begin
                  "Material Description":=RoadMaterial.Description;
                   "Unit of Measure":=RoadMaterial."Base Unit Of Measure";
                   end;
            end;
        }
        field(5;"Material Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Unit of Measure";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".Code;
        }
        field(7;Quantity;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Activity No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Line No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Material Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(11;"Approved?";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
    }

    keys
    {
        key(Key1;"Document No","Document Type","Material Line No","Line No","Activity No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        WorkPlanHeader.Reset;
        WorkPlanHeader.SetRange(WorkPlanHeader."Document No.","Document No");
        if WorkPlanHeader.FindSet then begin
          "Project ID":=WorkPlanHeader."Project ID";
          end;
    end;

    var
        WorkPlanHeader: Record "Work Plan Header";
        RoadMaterial: Record "Road Material";
}

