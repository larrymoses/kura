#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72267 "Variation Reason Code"
{
    Caption = 'Tender Cancel Reason Code';
    DataCaptionFields = "Code",Description;
    DrillDownPageID = "Variation Reason Codes";
    LookupPageID = "Variation Reason Code";

    fields
    {
        field(1;"Code";Code[50])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2;Description;Text[250])
        {
            Caption = 'Description';
        }
        field(3;"No. of Variation Requests";Integer)
        {
            CalcFormula = count("Project Variation Header" where ("Variation Reason Code"=field(Code),
                                                                  "Document Type"=filter("Contractor Variation Request")));
            Caption = 'No. of Variation Requests';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Code",Description,Blocked)
        {
        }
    }
}

