#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72344 "Project Transition Header"
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
        field(3;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange(Job."No.","Project ID");
                if Job.FindSet then begin
                  "Project Name":=Job.Description;
                  "Purchase Contract ID":=Job."Purchase Contract ID";
                  Validate("Purchase Contract ID");
                  "Contractor No.":=Job."Contractor No.";
                  Validate("Contractor No.");

                  end;
            end;
        }
        field(4;"Project Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Purchase Contract ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where ("Document Type"=filter("Blanket Order"));

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange(PurchaseHeader."No.","Purchase Contract ID");
                if PurchaseHeader.FindSet then begin
                  "Contractor No.":=PurchaseHeader."Buy-from Vendor No.";
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
                Vendor.Reset;
                Vendor.SetRange(Vendor."No.","Contractor No.");
                if Vendor.FindSet then begin
                  "Contractor Name":=Vendor.Name;
                  "Contractor Address":=Vendor.Address;
                  "Contractor Email":=Vendor."E-Mail";
                  end;
            end;
        }
        field(7;"Contractor Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;"Contractor Email";Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Contractor Address";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Created By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;"Created DateTime";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12;Status;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Approved,Rejected';
            OptionMembers = " ",Open,"Pending Approval",Approved,Rejected;
        }
        field(13;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14;"No. Series";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15;"PBRM BoQ Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Requisition Template".Code where (Blocked=filter(false));
        }
        field(16;"Shortcut Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(17;"Shortcut Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
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
        if "Document No."='' then begin
          RoadManagementSetup.Get();
          RoadManagementSetup.TestField("Project Transition Nos");
          NoSeriesManagement.InitSeries(RoadManagementSetup."Project Transition Nos",xRec."No. Series",Today,"Document No.","No. Series");
          end;

        Status:=Status::Open;
        "Document Date":=Today;
        "Created By":=UserId;
        "Created DateTime":=CreateDatetime(Today,Time);
    end;

    var
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        Job: Record Job;
        Vendor: Record Vendor;
        PurchaseHeader: Record "Purchase Header";
}

