#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72145 "Project Staff Appointments"
{

    fields
    {
        field(1;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Project Staff Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Job.No.';

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange(Job."No.","Project ID");
                if Job.FindSet then begin
                  "Project Name":=Job.Description;
                  "Road Code":=Job."Road Code";
                  "Road Section No":=Job."Road Section No";
                  "Region ID":=Job."Region ID";
                  "Directorate ID":=Job."Directorate Code";
                  //"Department ID":=Job.prim
                  end;
            end;
        }
        field(5;"Project Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Road Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Inventory"."Road Code";

            trigger OnValidate()
            begin
                RoadInventory.Reset;
                RoadInventory.SetRange(RoadInventory."Road Code","Road Code");
                if RoadInventory.FindSet then begin

                  end;
            end;
        }
        field(7;"Road Section No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Section"."Road Section No." where ("Road Code"=field("Road Code"));

            trigger OnValidate()
            begin
                RoadSection.Reset;
                RoadSection.SetRange(RoadSection."Road Section No.","Road Section No");
                if RoadSection.FindSet then begin
                  "Section Name":=RoadSection."Section Name";

                  end;
            end;
        }
        field(8;"Section Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Appointing Authority";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Project Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Project End  Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Region ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Directorate ID";Code[30])
        {
            DataClassification = ToBeClassified;
            Description = '20';
        }
        field(15;"Department ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Create By";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"No. Of Staff";Integer)
        {
            FieldClass = Normal;
        }
        field(18;"Created DateTime";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(19;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
    }

    keys
    {
        key(Key1;"Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Create By":=UserId;
        "Created DateTime":=CreateDatetime(Today,Time);
        "Document Date":=Today;
    end;

    var
        Job: Record Job;
        RoadInventory: Record "Road Inventory";
        RoadSection: Record "Road Section";
}

