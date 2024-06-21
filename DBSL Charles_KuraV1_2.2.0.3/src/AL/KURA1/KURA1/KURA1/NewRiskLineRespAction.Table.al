#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95127 "New Risk Line Resp. Action"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Risk ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Action ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Risk ID":=Rec.Count+50000;
            end;
        }
        field(5;"Activity Description";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Responsible Officer No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No.";
        }
        field(7;"Action Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;
        }
        field(8;"Percentage Complete";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Task Priority";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Normal,Low,High';
            OptionMembers = " ",Normal,Low,High;
        }
        field(10;"Planned Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Planned Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Actual Date Done";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Action Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corrective,Preventive';
            OptionMembers = " ",Corrective,Preventive;
        }
        field(14;"Risk Register Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(15;"Risk Management Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Management Plan"."Document No" where ("Document Type"=field("Risk Register Type"));
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No","Risk Register Type","Risk Management Plan ID","Risk ID","Action ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

