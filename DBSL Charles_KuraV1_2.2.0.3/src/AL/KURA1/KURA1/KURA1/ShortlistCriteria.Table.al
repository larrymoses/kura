#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69116 "Shortlist Criteria"
{

    fields
    {
        field(1;"Requisition No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Shortlist Criteria";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Criteria Setup";

            trigger OnValidate()
            begin
                if CriteriaSetup.Get("Shortlist Criteria") then
                  "General Category":=Format(CriteriaSetup."General Categories");
            end;
        }
        field(3;"Shortlist Description";Text[50])
        {
            CalcFormula = lookup("Criteria Setup".Description where (Code=field("Shortlist Criteria")));
            FieldClass = FlowField;
        }
        field(4;Requirement;Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Shortlist Criteria"=filter('002')) Qualification where (Type=const(Educational))
                            else if ("Shortlist Criteria"=filter('004')) Qualification where (Type=const(Professional))
                            else if ("Shortlist Criteria"=filter('007')) Qualification where (Type=const(Body));
        }
        field(5;"Entry No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Code";Integer)
        {
            AutoIncrement = true;
        }
        field(7;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Education,"Professional Body",Training,"Professional Qualification",Accomplishment,Employment,General;
        }
        field(8;"General Category";Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Requisition No.","Entry No.","Shortlist Criteria","Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        CriteriaSetup: Record "Criteria Setup";
}

