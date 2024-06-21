#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69113 "Applicant Background"
{

    fields
    {
        field(1;"Application No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Application Table";
        }
        field(2;"From Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"To Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;Institution;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Attainment;Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Attainment Table Setup".Attainment;
        }
        field(6;Specialization;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Grade;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Date of renewal";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Education,"Professional Body",Training,"Professional Qualification",Accomplishment,Employment;
        }
        field(10;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(12;Amount;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;Level;Text[50])
        {
            CalcFormula = lookup("Attainment Table Setup".Level where (Attainment=field(Attainment)));
            FieldClass = FlowField;
        }
        field(14;"Gross Salary";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Terms of Employment";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Full-time","Part-time",Internship,Casual,"Temporary";
        }
        field(16;Email;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Course Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Membership Type";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Membership No";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Job Title";Text[300])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Application No","No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

