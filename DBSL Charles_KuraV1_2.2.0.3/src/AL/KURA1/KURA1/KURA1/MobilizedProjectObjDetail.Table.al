#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72230 "Mobilized Project Obj Detail"
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
        field(3;"Objective ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Entry Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Project Assumption,Project Constraint,Critical Success Factor';
            OptionMembers = " ","Project Assumption","Project Constraint","Critical Success Factor";
        }
        field(5;"Entry No.";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "WEP Assumption_Constraint_CSF"."Entry No." where ("Document Type"=field("Document Type"),
                                                                               "Document No."=field("Document No."),
                                                                               "Entry Type"=field("Entry Type"));

            trigger OnValidate()
            begin
                WEPAssumption_Constraint_CSF.Reset;
                WEPAssumption_Constraint_CSF.SetRange(WEPAssumption_Constraint_CSF."Document Type","Document Type");
                WEPAssumption_Constraint_CSF.SetRange(WEPAssumption_Constraint_CSF."Document No.","Document No.");
                WEPAssumption_Constraint_CSF.SetRange(WEPAssumption_Constraint_CSF."Entry Type","Entry Type");
                WEPAssumption_Constraint_CSF.SetRange(WEPAssumption_Constraint_CSF."Entry No.","Entry No.");
                if WEPAssumption_Constraint_CSF.FindSet then begin
                  Description:=WEPAssumption_Constraint_CSF.Description;
                  end;
            end;
        }
        field(6;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Objective ID","Entry Type","Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        WEPAssumption_Constraint_CSF: Record "WEP Assumption_Constraint_CSF";
}

