#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72266 "Extension Reason Code"
{
    Caption = 'Extension Reason Code';
    DataCaptionFields = "Code",Description;
    DrillDownPageID = "Extension Reason Codes";
    LookupPageID = "Extension Reason Codes";

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
        field(3;"No. of EOT Requests";Integer)
        {
            CalcFormula = count("Project Variation Header" where ("Extension Reason Code"=field(Code),
                                                                  "Document Type"=filter("Extension of Time Request")));
            Caption = 'No. of EOT Requests';
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

