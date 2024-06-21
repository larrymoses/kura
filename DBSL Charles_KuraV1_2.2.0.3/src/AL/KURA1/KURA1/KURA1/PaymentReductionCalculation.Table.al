#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72072 "Payment Reduction Calculation"
{

    fields
    {
        field(1;"Project No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(2;No;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Project Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Road Authority Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Source".Code;

            trigger OnValidate()
            begin
                if FundingSource.Get("Road Authority Code") then
                  "Road Authority Name":=FundingSource.Description;
            end;
        }
        field(5;"Road Authority Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Road Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No." where ("Record Type"=filter("Road Asset"));

            trigger OnValidate()
            begin
                if FixedAsset.Get("Road Code") then
                  "Road/Link Name":=FixedAsset.Description;
            end;
        }
        field(7;"Road/Link Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Road Class";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Class";
        }
        field(9;"Chainage(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Length(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Statement Month";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(12;Year;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Elapse Of Month";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Standard Service Level";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Contract Period(M)";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Contractor No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(17;"Contractor Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Due Amount Of the Month";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = '//Contract due amount of the month of x';
        }
    }

    keys
    {
        key(Key1;No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        FundingSource: Record "Funding Source";
        FixedAsset: Record "Fixed Asset";
        Vendor: Record Vendor;
        RMSSetup: Record "Roads Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

