#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72383 "Certificate Instruction"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            Description = ' Measurement Sheet,Contractor Notice of Works,Works Inspection,Payment Certificate,Contractor Payment Request,New Job Voucher,Contractor Request for Close-Out,Contractor Request for Post DLP Inspection';
            OptionCaption = ' ,Measurement Sheet,Contractor Notice of Works,Works Inspection,Payment Certificate,Contractor Payment Request,New Job Voucher,Contractor Request for Taking Over,Contractor Request for End of DLP Inspection';
            OptionMembers = " ","Measurement Sheet","Contractor Notice of Works","Works Inspection","Payment Certificate","Contractor Payment Request","New Job Voucher","Contractor Request for Taking Over","Contractor Request for End of DLP Inspection";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Instruction Description";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Line No.";Integer)
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

    var
        MaterialOnSiteSetup: Record "Material On Site Setup";
}

