#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70216 "Bid Evaluation Score Guide"
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
        }
        field(4;"Requirement ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(6;"Target Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Rating Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Number,Yes/No,Options Text,Date';
            OptionMembers = Number,"Yes/No","Options Text",Date;
        }
        field(8;"Evaluation Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Preliminary Evaluation,Technical Evaluation,Financial Evaluation,Vendor Due Diligence,Prequalification,Registration,Post Qualification';
            OptionMembers = "Preliminary Evaluation","Technical Evaluation","Financial Evaluation","Vendor Due Diligence",Prequalification,Registration,"Post Qualification";
        }
        field(9;"Desired Perfomance Direction";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(10;"Response Value";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Min Bid Value";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Max Bid Value";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Min Date Value";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Max Date Value";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Score %";Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(16;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Evaluation Register".Code;
        }
    }

    keys
    {
        key(Key1;"Template ID","Criteria Group ID","Requirement ID","Entry No","Response Value","Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

