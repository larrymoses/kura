#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72371 "Variation Of Price"
{

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Item Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Symbol;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Contract Weight";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Index Source";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Base Index";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Current Index";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Adjustment Factor";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Measurement Sheet,Contractor Notice of Works,Works Inspection,Payment Certificate,Contractor Payment Request,New Job Voucher,Contractor Request for Taking Over,Contractor Request for End of DLP Inspection';
            OptionMembers = " ","Measurement Sheet","Contractor Notice of Works","Works Inspection","Payment Certificate","Contractor Payment Request","New Job Voucher","Contractor Request for Taking Over","Contractor Request for End of DLP Inspection";
        }
        field(10;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

