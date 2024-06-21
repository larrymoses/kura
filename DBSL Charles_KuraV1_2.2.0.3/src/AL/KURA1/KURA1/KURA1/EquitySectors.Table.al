#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 54015 "Equity Sectors"
{
    DrillDownPageID = "Equity Sectors List";
    LookupPageID = "Equity Sectors List";

    fields
    {
        field(1;"Sector Code";Code[10])
        {
        }
        field(2;Description;Text[100])
        {
        }
        field(3;"No. Series";Code[10])
        {
            TableRelation = "No. Series";
        }
        field(4;Type;Option)
        {
            OptionCaption = 'Equity,MMarket';
            OptionMembers = Equity,MMarket;
        }
    }

    keys
    {
        key(Key1;"Sector Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

