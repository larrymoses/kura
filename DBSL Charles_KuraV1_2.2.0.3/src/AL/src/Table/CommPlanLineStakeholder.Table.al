#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95005 "Comm Plan Line Stakeholder"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corporate,Functional,Project';
            OptionMembers = " ",Corporate,Functional,Project;
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Category;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Meeting,Status Report';
            OptionMembers = " ",Meeting,"Status Report";
        }
        field(4;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;"Stakeholder ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Stakeholder.Code where (Blocked=filter(false));

            trigger OnValidate()
            begin
                Stakeholder.Reset;
                Stakeholder.SetRange(Stakeholder.Code,"Stakeholder ID");
                if Stakeholder.FindSet then
                  Description:=Stakeholder.Description;
            end;
        }
        field(6;Description;Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;Name;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Email Address";Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No",Category,"Stakeholder ID","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Stakeholder: Record Stakeholder;
}

