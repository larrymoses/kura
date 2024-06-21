#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70091 "Bid Score Requirement"
{

    fields
    {
        field(1;"Template ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Criteria Group ID";Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'This refers to the Criteria Group applicable in the Template. A simple scoring sheet may have 1 Group of all General criteria, generally adding upto 100%. Some score sheets may be split into different Criteria Groups e.g. Technical proposal at 80% and Financial proposal at 20%';
            TableRelation = "Bid Score Criteria Group"."Criteria Group ID" where ("Template ID"=field("Template ID"),
                                                                                  "Evaluation Type"=field("Evaluation Type"));
        }
        field(4;"Requirement ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;"Evaluation Requirement";Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Bidder Response";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Required,Optional,Display Only';
            OptionMembers = Required,Optional,"Display Only";
        }
        field(7;"Rating Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Number,Yes/No,Options Text,Date';
            OptionMembers = Number,"Yes/No","Options Text",Date;
        }
        field(8;"Target Value";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Assigned Weight %";Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(10;"Evaluation Type";Enum "Evaluation Type")
        {
            // DataClassification = ToBeClassified;
            // OptionCaption = 'Preliminary Evaluation,Technical Evaluation,Financial Evaluation,Vendor Due Diligence,Prequalification,Registration,Post Qualification,Vendor Appraisal';
            // OptionMembers = "Preliminary Evaluation","Technical Evaluation","Financial Evaluation","Vendor Due Diligence",Prequalification,Registration,"Post Qualification","Vendor Appraisal";
        }
        field(11;"Equipment Type";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Unit of Measure";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Target Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Desired Perfomance Direction";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(15;"Performance Indicator/Proof";Code[150])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Requirement Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Mandatory,Optional,NA';
            OptionMembers = Mandatory,Optional,NA;
        }
        field(17;Priority;Option)
        {
            DataClassification = ToBeClassified;
            InitValue = High;
            OptionCaption = 'High,Medium,Low';
            OptionMembers = High,Medium,Low;
        }
        field(18;"Contract Ref Clause";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Criteria Group Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Template ID","Criteria Group ID","Requirement ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

