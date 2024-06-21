#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72068 "Detail Self Inspection Result"
{

    fields
    {
        field(1;"Project No";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(2;No;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Project Name";Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Road Authority Code";Code[100])
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
        field(6;"Road Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No." where ("Record Type"=filter("Road Asset"));

            trigger OnValidate()
            begin
                if RoadAsset.Get("Road Code") then
                  "Road Link Name":=RoadAsset.Description;
            end;
        }
        field(7;"Road Link Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Road Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Standard Service Level";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Month;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11;Year;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Contract Month";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Contractor No";Code[200])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Contractor Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Road Class";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Class";
        }
        field(16;"Inspected Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"No. Of Subsection";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Inspection No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Inspection No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Inspection No"='' then begin
          RMSSetup.Get();
          RMSSetup.TestField("Defect Detection Nos");
          NoSeriesMgt.InitSeries(RMSSetup."Self Inspection Result Nos",xRec."No. Series",Today,"Inspection No","No. Series");
          end;
    end;

    var
        FundingSource: Record "Funding Source";
        RoadAsset: Record "Fixed Asset";
        RMSSetup: Record "Roads Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

