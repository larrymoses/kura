#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72173 "Project Equipment Register"
{

    fields
    {
        field(1;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Job.No.';
        }
        field(2;"Contractor ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Vendor.No.';
        }
        field(3;"Equipment No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Equipment Type Code";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Works Equipment Type".Code';
        }
        field(5;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Equipment Category";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Works Equipment Category".Code';
        }
        field(7;"Ownership Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Owned,Leased,Purchase Proposal';
            OptionMembers = " ",Owned,Leased,"Purchase Proposal";
        }
        field(8;"Equipment Registration No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Equipment Registration No.';
        }
        field(9;"Equipment Usability Code";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Excellent,Good,Fair,Beyond Useful Life';
            OptionMembers = " ",Excellent,Good,Fair,"Beyond Useful Life";
        }
        field(10;"Years of Previous Use";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Equipment Condition Code";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,New Eqpm,Reconditioned Eqpm,Serviced Eqpm';
            OptionMembers = " ","New Eqpm","Reconditioned Eqpm","Serviced Eqpm";
        }
        field(12;"Work Execution Programme ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Project ID","Contractor ID","Equipment No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

