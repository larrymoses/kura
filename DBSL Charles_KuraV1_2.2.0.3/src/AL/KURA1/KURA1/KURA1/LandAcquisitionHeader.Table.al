#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72400 "Land Acquisition Header"
{

    fields
    {
        field(1;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Land Acquisition Workorder,Gazetted Acquisition Voucher';
            OptionMembers = " ","Land Acquisition Workorder","Gazetted Acquisition Voucher";
        }
        field(3;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Land Acquisition Workorder No";Code[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Land Ownership Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Private Land,Public Land';
            OptionMembers = " ","Private Land","Public Land";
        }
        field(6;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Road Code";Code[30])
        {
            DataClassification = ToBeClassified;
           // TableRelation = "Road Inventory"."Road Code";
        }
        field(8;"Link Name";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Section No";Code[30])
        {
            DataClassification = ToBeClassified;
           // TableRelation = "Road Section"."Road Code" where ("Road Code"=field("Road Code"));
        }
        field(10;"Section Name";Code[255])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Chainage Description";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Start Chainage (KM)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"End Chainage(KM)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Workorder Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(15;"Start Longitude";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"End Longitude";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Start Latitude";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"End Latitude";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Land Valuation";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Lead Surveyor";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Lead Surveyor Name";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Created Date/Time";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(24;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Total Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(26;"No of Enc. Stop W.O Issued";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27;"No of Gazetted Acq Vouchers";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(28;"Posted Purchase Invoice Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Paid Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(30;"No of Affected Parties";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(31;"No of Interactions Posted";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(32;"No. Series";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
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
        "Created By":=UserId;
        "Created Date/Time":=CurrentDatetime;

        if ("Document Type"="document type"::"Land Acquisition Workorder") then begin
        if "Document No" ='' then begin
          RMSetup.Get();
          RMSetup.TestField("Land Acquisition Workorder Nos");
          NSMgt.InitSeries(RMSetup."Land Acquisition Workorder Nos",xRec."No. Series",Today,"Document No","No. Series");
          end;
        end;

        if ("Document Type"="document type"::"Gazetted Acquisition Voucher") then begin
        if "Document No" ='' then begin
          RMSetup.Get();
          RMSetup.TestField("GazettAcquisitionWorkorder Nos");
          NSMgt.InitSeries(RMSetup."GazettAcquisitionWorkorder Nos",xRec."No. Series",Today,"Document No","No. Series");
          end;
        end;
    end;

    var
        RMSetup: Record "Road Management Setup";
        NSMgt: Codeunit NoSeriesManagement;
        ResCenter: Record "Responsibility Center";
}

