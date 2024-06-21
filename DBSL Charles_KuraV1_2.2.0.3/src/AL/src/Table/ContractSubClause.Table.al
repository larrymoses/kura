
Table 72220 "Contract Sub Clause"
{
    DrillDownPageID = "Contract Sub Clauses";
    LookupPageID = "Contract Sub Clauses";

    fields
    {
        field(1;"Code";Code[20])
        {
            
        }
        field(2;Description;Text[250])
        {
            
        }
        field(3;"Document No";Code[20])
        {
            
            Editable = false;
        }
        field(4;"Line No";Integer)
        {
            AutoIncrement = true;
            
            Editable = false;
        }
        field(5;"Document Type";Option)
        {
            
            OptionCaption = ' ,Site Agent Nomination,PCO,WEP,Contratcor Equipemt Register,Contractor Personnel Appointment,Possession of Site';
            OptionMembers = " ","Site Agent Nomination",PCO,WEP,"Contratcor Equipemt Register","Contractor Personnel Appointment","Possession of Site";
        }
        field(6;"Contract No";Code[20])
        {
            
        }
    }

    keys
    {
        key(Key1;"Code","Contract No","Document Type","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

