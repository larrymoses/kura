#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72293 "Inspection Plan Line"
{

    fields
    {
        field(1;"Inspection No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Inspection Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Daily Works Inspection,Taking Over Inspection,End of DLP Inspection';
            OptionMembers = "Daily Works Inspection","Taking Over Inspection","End of DLP Inspection";
        }
        field(3;"Line No";Integer)
        {
            AutoIncrement = false;
            DataClassification = ToBeClassified;
        }
        field(4;"Category ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Supervision Template Category"."Category ID";
        }
        field(5;"Requirement ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(6;"Project ID";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(7;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Maximum Weight";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;"Response Type";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            InitValue = 'YES/NO';
            TableRelation = "Supervision Response Type".Code where (Blocked=filter(false));
        }
        field(10;"Actual Score";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = true;

            trigger OnValidate()
            begin
                SupervisionResponseOption.Reset;
                SupervisionResponseOption.SetRange(SupervisionResponseOption."Response Type ID","Response Type");
                if SupervisionResponseOption.FindSet then
                  repeat
                    if (("Actual Score">=SupervisionResponseOption."Minimum % Score") and("Actual Score"<=SupervisionResponseOption."Maximum % Score")) then
                      Grade:=SupervisionResponseOption."Option Code";
                  until SupervisionResponseOption.Next=0;
            end;
        }
        field(11;Grade;Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Supervision Response Option"."Option Code" where ("Response Type ID"=field("Response Type"));
        }
        field(12;"Issue Corrective Order";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Response Option";Option)
        {
            DataClassification = ToBeClassified;
            InitValue = Yes;
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;

            trigger OnValidate()
            begin
                if "Response Option"="response option"::No then begin
                  "Issue Corrective Order":=true;
                  end
                  else if "Response Option"="response option"::Yes then begin
                  "Issue Corrective Order":=false;
                    end;
            end;
        }
    }

    keys
    {
        key(Key1;"Inspection No","Inspection Type","Category ID","Line No","Requirement ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        SupervisionResponseOption: Record "Supervision Response Option";
}

