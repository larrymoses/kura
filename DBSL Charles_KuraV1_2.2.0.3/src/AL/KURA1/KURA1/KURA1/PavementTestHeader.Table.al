#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72352 "Pavement Test Header"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Project ID";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                ObjJob.Reset;
                ObjJob.SetRange(ObjJob."No.","Project ID");
                if ObjJob.FindSet then begin
                  "Project Name":=ObjJob.Description;
                  "Contract ID":=ObjJob."Purchase Contract ID";
                  Validate("Contract ID");
                  "Contractor No.":=ObjJob."Contractor No.";
                  Validate("Contractor No.");
                  "Project Engineer ID":=ObjJob."Project Manager";
                  Validate("Project Engineer ID");
                  end;
            end;
        }
        field(4;"Project Name";Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Contract ID";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where ("Document Type"=filter("Blanket Order"));

            trigger OnValidate()
            begin
                ObjPurch.Reset;
                ObjPurch.SetRange(ObjPurch."No.","Contract ID");
                if ObjPurch.FindSet then
                  begin
                    "Contractor No.":=ObjPurch."Buy-from Vendor No.";
                     Validate("Contractor No.");
                    end;
            end;
        }
        field(6;"Contractor No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                ObjVendor.Reset;
                ObjVendor.SetRange(ObjVendor."No.","Contractor No.");
                if ObjVendor.FindSet then
                  begin
                     "Contractor Name":=ObjVendor.Name;
                    end;
            end;
        }
        field(7;"Contractor Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;"Created By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;"Created DateTime";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"Authority ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Authority"."Road Authority Code";

            trigger OnValidate()
            begin
                ObjRoadAuthority.Reset;
                ObjRoadAuthority.SetRange(ObjRoadAuthority."Road Authority Code","Authority ID");
                if ObjRoadAuthority.FindSet then
                  begin
                    "Authority Name":=ObjRoadAuthority.Name;
                    end;
            end;
        }
        field(11;"Authority Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12;Status;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(13;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14;"Project Engineer ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No.";
        }
        field(15;"Project Engineer Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16;"No. Series";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        Status:=Status::Open;
        "Created By":=UserId;
        "Created DateTime":=CreateDatetime(Today,Time);
        "Document Date":=Today;

        if "Document No."='' then begin
           RMSetup.Get();
           RMSetup.TestField("Pavement Test Nos");
           NSMgt.InitSeries(RMSetup."Pavement Test Nos",xRec."No. Series",Today,"Document No.",xRec."No. Series");
          end;
    end;

    var
        ObjJob: Record Job;
        ObjVendor: Record Vendor;
        ObjResource: Record Resource;
        ObjPurch: Record "Purchase Header";
        ObjRoadAuthority: Record "Road Authority";
        RMSetup: Record "Road Management Setup";
        NSMgt: Codeunit NoSeriesManagement;
}

