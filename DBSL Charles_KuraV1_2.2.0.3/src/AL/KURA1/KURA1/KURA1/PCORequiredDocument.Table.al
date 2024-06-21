#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72158 "PCO Required Document"
{

    fields
    {
        field(1; "Notice No."; Code[20])
        {

        }
        field(2; "Document Type"; Code[20])
        {

        }
        field(3; Description; Text[250])
        {

        }
        field(4; "Requirement Type"; Option)
        {

            OptionCaption = ' ,Mandatory,Optional';
            OptionMembers = " ",Mandatory,Optional;
        }
        field(5; "Guidelines/Instructions"; Text[250])
        {

        }
        field(6; "Due Date"; Date)
        {

        }
        field(7; "Due Date Calculation(Days)"; DateFormula)
        {

        }
         field(8; "Program of Works"; Boolean)
        {
           
        }
        field(9; "Mobilization Document"; Boolean)
        {
          
        }
        field(10; "Document Class"; Enum "Project Document Class")
        {
            
        }
    }

    keys
    {
        key(Key1; "Notice No.", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

