#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72066 "Defect Detection & Rectificati"
{

    fields
    {
        field(1;"Road Authority";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Contractor No";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Project Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Project Code";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Contractor Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Road Authority Code";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Service Level";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Service Level Category";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Service Scope";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Service Creteria";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Road Code";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Road Link Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Defect No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Defect No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Defect No"='' then begin
          RMSSetup.Get();
          RMSSetup.TestField("Defect Detection Nos");
          NoSeriesMgt.InitSeries(RMSSetup."Defect Detection Nos",xRec."No. Series",Today,"Defect No","No. Series");
          end;
    end;

    var
        RoadAsset: Record "Fixed Asset";
        RMSSetup: Record "Roads Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

