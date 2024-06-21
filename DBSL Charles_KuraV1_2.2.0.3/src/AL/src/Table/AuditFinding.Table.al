#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95219 "Audit Finding"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Audit Fieldwork Voucher,Audit Exit Conference,Draft Audit Report,Final Audit Report';
            OptionMembers = " ","Audit Fieldwork Voucher","Audit Exit Conference","Draft Audit Report","Final Audit Report";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Implications;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Finding Rating Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Finding Rating Code".Code where (Blocked=filter(false));
        }
        field(7;Recommendations;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Applicable To All Locations";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Engagement  ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project"."Engagement ID" where (Status=filter(<>Completed));
        }
        field(10;"Checklist ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project Checklist"."Checklist ID";
        }
        field(11;"Management Response";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Response Submission Deadline";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Responsible Person";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=filter(Person),
                                                  Blocked=filter(false));

            trigger OnValidate()
            begin
                if Resource.Get("Responsible Person") then begin
                  "Responsible Person Name":=Resource.Name;
                  end;
            end;
        }
        field(15;"Verdict/Opinion";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Agree,Disagree';
            OptionMembers = " ",Agree,Disagree;
        }
        field(16;"Date Requested";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Responsible Person Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Action Plan";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Action Plan Deadline";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Line No","Checklist ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resource: Record Resource;
}

