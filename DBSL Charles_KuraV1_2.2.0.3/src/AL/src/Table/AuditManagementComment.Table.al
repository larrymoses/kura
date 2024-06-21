#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95227 "Audit Management Comment"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Audit Fieldwork Voucher,Audit Exit Conference,Draft Audit Report,Final Audit Report';
            OptionMembers = " ","Audit Fieldwork Voucher","Audit Exit Conference","Draft Audit Report","Final Audit Report";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Engagement ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Execution Finding"."Engagement ID";
        }
        field(4;"Checklist ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Execution Finding"."Checklist ID";
        }
        field(5;"Finding ID";Integer)
        {
            AutoIncrement = false;
            DataClassification = ToBeClassified;
            TableRelation = "Audit Execution Finding"."Finding ID";
        }
        field(6;"Management Comment ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(7;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Action Owner ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=filter(Person),
                                                  Blocked=filter(false));
        }
        field(9;"Action Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;

            trigger OnValidate()
            begin
                if (("Action Status"="action status"::Planned) or ("Action Status"="action status"::Ongoing)) then
                  "% Complete":=0
                else
                  if "Action Status"="action status"::Completed then
                  "% Complete":=100;
            end;
        }
        field(10;"% Complete";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "% Complete" = 100 then
                  "Actual Date Done":=Today;
            end;
        }
        field(11;"Actual Date Done";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Task Priority";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Normal,Low,High';
            OptionMembers = " ",Normal,Low,High;
        }
        field(13;"Planned Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Planned End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Action Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corrective,Preventive';
            OptionMembers = " ",Corrective,Preventive;
        }
        field(16;"Audit Objective ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project Objective"."Audit Objective ID" where ("Engagement ID"=field("Engagement ID"));
        }
        field(17;"Dimension Set ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Engagement ID","Checklist ID","Finding ID","Management Comment ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

