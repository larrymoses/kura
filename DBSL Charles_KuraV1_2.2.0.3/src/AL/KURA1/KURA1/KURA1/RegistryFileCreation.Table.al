#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 59075 "Registry File Creation"
{

    fields
    {
        field(1;"File No";Code[50])
        {
            Caption = 'Registry No';

        }
        field(2;"File Name";Text[250])
        {

        }
        field(3;"File Type";Text[250])
        {

            TableRelation = "File Types SetUp";
        }
        field(4;Description;Text[250])
        {

        }
        field(5;"Creation Date";Date)
        {

        }
        field(6;"Created By";Code[50])
        {

        }
        field(7;Location;Text[50])
        {

        }
        field(8;"System No";Code[50])
        {

        }
        field(9; "Entry No."; Integer)
        {

        }
    }

    keys
    {
        key(Key1; "File No", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        "No.": Code[50];
        registry: Record "Registry File Creation";
    begin
    
    end;
}

