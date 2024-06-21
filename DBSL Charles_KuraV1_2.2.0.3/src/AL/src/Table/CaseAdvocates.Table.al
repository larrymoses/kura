#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69513 "Case Advocates"
{
    DrillDownPageID = "Case Advocates";
    LookupPageID = "Case Advocates";

    fields
    {
        field(1;"Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Names;Code[255])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Contacts;Code[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Email;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Postal Address";Text[250])
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
        key(Key2;Names)
        {
        }
        key(Key3;Contacts)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Code",Names,Contacts)
        {
        }
        fieldgroup(Brick;"Code",Names,Contacts)
        {
        }
    }
}

