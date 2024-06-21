#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69674 "Candidate Shortlist Scoring"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Candidate Shortlisting,Interview Invitation';
            OptionMembers = "Candidate Shortlisting","Interview Invitation";
        }
        field(2;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Vacancy ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Requiement ID.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Qualification Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity,Physical Attributes';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity","Physical Attributes";
        }
        field(7;"Qualification Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Description;Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Requirement Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Mandatory,Added Advantage';
            OptionMembers = Mandatory,"Added Advantage";
        }
        field(10;"Candidate's Response";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Does Not Meet Requirement,Meets Requirement,Exceeds Requirement';
            OptionMembers = " ","Does Not Meet Requirement","Meets Requirement","Exceeds Requirement";
        }
        field(11;"Panel Response";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Does Not Meet Requirement,Meets Requirement,Exceeds Requirement';
            OptionMembers = " ","Does Not Meet Requirement","Meets Requirement","Exceeds Requirement";
        }
    }

    keys
    {
        key(Key1;"Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        HRSetup.Get();
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRSetup: Record "Human Resources Setup";
        RecruitmentHeader: Record "Recruitment Requisition Header";
}

