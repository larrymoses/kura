#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95130 "Risk Status Rpt Resp. Action"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(2; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Risk Register Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(4; "Risk Management Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Risk Management Plan"."Document No" where ("Document Type"=field("Document No"));
        }
        field(5; "Risk ID"; Integer)
        {
            AutoIncrement = false;
            DataClassification = ToBeClassified;
        }
        field(6; "Action ID"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(7; "Activity Description"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Responsible Officer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No.";
        }
        field(9; "Action Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;
        }
        field(10; "Percentage Complete"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Task Priority"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Normal,Low,High';
            OptionMembers = " ",Normal,Low,High;
        }
        field(12; "Planned Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Planned Due Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Actual Date Done"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Action Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corrective,Preventive';
            OptionMembers = " ",Corrective,Preventive;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Risk Register Type", "Risk Management Plan ID", "Risk ID", "Action ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

