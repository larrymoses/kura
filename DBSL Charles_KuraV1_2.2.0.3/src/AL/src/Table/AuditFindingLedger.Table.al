#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95234 "Audit Finding Ledger"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Audit Fieldwork Voucher,Audit Exit Conference,Draft Audit Report,Final Audit Report';
            OptionMembers = " ","Audit Fieldwork Voucher","Audit Exit Conference","Draft Audit Report","Final Audit Report";
        }
        field(3;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Engagement ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Execution Header"."Engagement ID";
        }
        field(5;"Checklist ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Execution Finding"."Checklist ID" where ("Document Type"=field("Document Type"),
                                                                            "Document No."=field("Document No."),
                                                                            "Engagement ID"=field("Engagement ID"));
        }
        field(6;"Finding ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Execution Finding"."Finding ID" where ("Document Type"=field("Document Type"),
                                                                          "Document No."=field("Document No."),
                                                                          "Engagement ID"=field("Engagement ID"),
                                                                          "Checklist ID"=field("Checklist ID"));

            trigger OnValidate()
            begin
                AuditExecutionFinding.Reset;
                AuditExecutionFinding.SetRange(AuditExecutionFinding."Document Type","Document Type");
                AuditExecutionFinding.SetRange(AuditExecutionFinding."Document No.","Document No.");
                AuditExecutionFinding.SetRange(AuditExecutionFinding."Checklist ID","Checklist ID");
                AuditExecutionFinding.SetRange(AuditExecutionFinding."Finding ID","Finding ID");
                if AuditExecutionFinding.FindSet then
                  begin
                    Description:=AuditExecutionFinding.Description;
                    "Compliance Status":=AuditExecutionFinding."Compliance Status";
                     "Risk Rating":=AuditExecutionFinding."Risk Rating Code";
                     Implication:=AuditExecutionFinding.Implication;
                     "Affects All Audit Locations":=AuditExecutionFinding."Affects All Audit Locations";
                     Validate("Affects All Audit Locations");
                     "Audit Objective ID":=AuditExecutionFinding."Audit Objective ID";
                     "Audit Procedure ID":=AuditExecutionFinding."Audit Procedure ID";
                     "Management Response Type":="management response type"::" ";
                     "Mgt Comment Received Date":=AuditExecutionFinding."Mgt Comment Received Date";
                     "Ganeral Management Comments":='';
                   end;
            end;
        }
        field(7;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Compliance Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Non-Compliant,Partially Compliant,Substantially Compliant,Fully Compliant,Not Applicable';
            OptionMembers = " ","Non-Compliant","Partially Compliant","Substantially Compliant","Fully Compliant","Not Applicable";
        }
        field(9;"Risk Rating";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Finding Rating Code".Code where (Blocked=filter(false));
        }
        field(10;Implication;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Affects All Audit Locations";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Audit Procedure ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Audit Objective ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Dimension Set ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Mgt Comment Received Date";Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Management Comment Received Date';
        }
        field(16;"Management Response Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Agrees with Finding,Disagrees with Findings,Unresponsive';
            OptionMembers = " ","Agrees with Finding","Disagrees with Findings",Unresponsive;
        }
        field(17;"Ganeral Management Comments";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"No. Of Posted Audit Recomms";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Posted Audit Recommendations';
        }
        field(19;"No. Of Posted Implement Action";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Posted Implementation Actions';
        }
        field(20;"No. Of Open Implement Actions";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Open Implementation Actions';
        }
        field(21;"No. Of Closed Implement Action";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Closed Implementation Actions';
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        AuditExecutionHeader.Reset;
        AuditExecutionHeader.SetRange(AuditExecutionHeader."Document Type","Document Type");
        AuditExecutionHeader.SetRange(AuditExecutionHeader."Document No.","Document No.");
        if AuditExecutionHeader.FindSet then
          begin
            "Engagement ID":=AuditExecutionHeader."Engagement ID";
          end;
    end;

    var
        AuditExecutionHeader: Record "Audit Execution Header";
        AuditExecutionFinding: Record "Audit Execution Finding";
        "Field": Record "Field";
}

