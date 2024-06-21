#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72272 "Project Inspection Section"
{

    fields
    {
        field(1;"Inpection Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Daily Works Inspection,Taking Over Inspection, End of DLP Inspection';
            OptionMembers = " ","Daily Works Inspection","Taking Over Inspection"," End of DLP Inspection";
        }
        field(2;"Inspection No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Section Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Recommendation,Corrective Order';
            OptionMembers = " ",Recommendation,"Corrective Order";
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Responsibility;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Resident Engineer, Project Engineer, Contractor, Regional Director, Authority';
            OptionMembers = " ","Resident Engineer"," Project Engineer"," Contractor"," Regional Director"," Authority";
        }
        field(6;Date;Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Inpection Type","Inspection No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

