#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72233 "WEP Project Stakeholder Grid"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Order-To-Commence,Work Execution Programme';
            OptionMembers = " ","Order-To-Commence","Work Execution Programme";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Stakeholder ID";Code[20])
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
        field(4;"Line Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Power/Influence,Interest & Expectations,Rights,Key Initiatives';
            OptionMembers = " ","Power/Influence","Interest & Expectations",Rights,"Key Initiatives";
        }
        field(5;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(6;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Stakeholder ID","Line Type","Line No.")
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

