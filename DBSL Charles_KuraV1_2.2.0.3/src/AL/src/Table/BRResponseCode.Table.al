#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80211 "BR Response Code"
{

    fields
    {
        field(1;"Response Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BR Option Text Response Type".Code;

            trigger OnValidate()
            begin
                if BROptionTextResponseType.Get("Response Type") then begin
                  "Response Code":=BROptionTextResponseType.Code;
                  Description:=BROptionTextResponseType.Description;
                  "Rating Type":=BROptionTextResponseType."Rating Type";
                end;
            end;
        }
        field(2;"Response Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Rating Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Number,Yes/No,Options Text';
            OptionMembers = Number,"Yes/No","Options Text";
        }
        field(5;"Score (%)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Response Type","Response Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        BROptionTextResponseType: Record "BR Option Text Response Type";
}

