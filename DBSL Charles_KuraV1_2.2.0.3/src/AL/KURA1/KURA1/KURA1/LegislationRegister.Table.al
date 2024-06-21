#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72103 "Legislation Register"
{
    DrillDownPageID = "Legislation Registers";
    LookupPageID = "Legislation Registers";

    fields
    {
        field(1;"Legislation ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3;Category;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Bill,Act';
            OptionMembers = " ",Bill,Act;
        }
        field(4;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Overview;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Functional Classification";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Core Mandate,Finance,Procurement,Human Resources,ICT,Legal,Risk & Audit,Other';
            OptionMembers = " ","Core Mandate",Finance,Procurement,"Human Resources",ICT,Legal,"Risk & Audit",Other;
        }
        field(7;"Gazette Supplement No.";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"National Assembly Bill No.";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"No. of Amendments";Integer)
        {
            CalcFormula = count("Legislation Amendment" where ("Amendment ID"=field("Legislation ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10;"No. of Clauses/Sections";Integer)
        {
            CalcFormula = count("Legislation Part" where ("Legislation ID"=field("Legislation ID"),
                                                          "Part Type"=filter("Section/Clause")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11;"No. of Subsections";Integer)
        {
            CalcFormula = count("Legislation Subsection" where ("Legislation ID"=field("Legislation ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12;"No. of Schedules";Integer)
        {
            CalcFormula = count("Legislation Part" where ("Legislation ID"=field("Legislation ID"),
                                                          "Part Type"=filter(Schedule)));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Legislation ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

