#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72165 "Project Meeting Agenda Temp"
{

    fields
    {
        field(1;"Project Meeting Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Meeting Type".Code;
        }
        field(2;"Agenda Code";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Project Meeting Agenda Temp';
        }
        field(3;"Agenda Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Owner;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,All,Client,Contractor';
            OptionMembers = " ",All,Client,Contractor;
        }
        field(5;"Estimate Time (Minutes)";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"No. of Agenda Items";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Project Meeting Type","Agenda Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

