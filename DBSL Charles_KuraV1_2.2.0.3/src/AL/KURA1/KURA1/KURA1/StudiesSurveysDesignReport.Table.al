#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72369 "Studies/Surveys&Design Report"
{

    fields
    {
        field(1;"Project Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,ESIA Study,Topographic Survey,Traffic Census,Road Safety Audit,Design Works,Environmental Audits';
            OptionMembers = " ","ESIA Study","Topographic Survey","Traffic Census","Road Safety Audit","Design Works","Environmental Audits";
        }
        field(2;"Report Type";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[300])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Project Type","Report Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

