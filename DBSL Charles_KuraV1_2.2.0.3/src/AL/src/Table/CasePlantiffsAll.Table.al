#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69515 "Case Plantiffs All"
{
    DrillDownPageID = "Plaintiffs All";
    LookupPageID = "Plaintiffs All";

    fields
    {
        field(1;No;Code[100])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                  HumanResourcesSetup.Get;
                  NoSeriesManagement.TestManual(HumanResourcesSetup."Plaintiff Nos");
                  "No. Series" := '';
                end;
            end;
        }
        field(2;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Plaintiff,Defendant';
            OptionMembers = " ",Plaintiff,Defendant;
        }
        field(3;Names;Code[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Contacts;Code[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. Series";Code[40])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;No,Names)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        Type:=Type::Plaintiff;

        if No ='' then begin
          HumanResourcesSetup.Get;
          HumanResourcesSetup.TestField("Plaintiff Nos");
          NoSeriesManagement.InitSeries(HumanResourcesSetup."Plaintiff Nos",xRec."No. Series",0D,No,"No. Series");
          end;
    end;

    var
        Plantiff: Record "Plaintive-Defentants";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        HumanResourcesSetup: Record "Human Resources Setup";
}

