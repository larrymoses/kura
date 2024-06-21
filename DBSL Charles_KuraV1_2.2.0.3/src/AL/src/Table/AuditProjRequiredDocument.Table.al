#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95204 "Audit Proj Required Document"
{
    DrillDownPageID = "Audit Proj Required Documents";
    LookupPageID = "Audit Proj Required Documents";

    fields
    {
        field(1;"Engagement ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Document No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Audit Procedure ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project Procedure"."Audit Procedure ID" where ("Engagement ID"=field("Engagement ID"));

            trigger OnValidate()
            begin
                AuditProjectProcedure.Reset;
                AuditProjectProcedure.SetRange(AuditProjectProcedure."Engagement ID","Engagement ID");
                AuditProjectProcedure.SetRange(AuditProjectProcedure."Audit Procedure ID","Audit Procedure ID");
                if AuditProjectProcedure.FindSet then
                  "Procedure Description":=AuditProjectProcedure.Description;
            end;
        }
        field(5;"Preferred Format";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Any Format,Soft Copy,Hard Copy';
            OptionMembers = " ","Any Format","Soft Copy","Hard Copy";
        }
        field(6;"Submission Deadline";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Requirement Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Mandatory,Optional';
            OptionMembers = " ",Mandatory,Optional;
        }
        field(8;"Lead Auditor ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project Team"."Resource No." where ("Engagement ID"=field("Engagement ID"),
                                                                       "Audit Team Type"=const("Auditor Team"));
        }
        field(9;"Lead Auditee Representative ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project Team"."Resource No." where ("Engagement ID"=field("Engagement ID"),
                                                                       "Audit Team Type"=const("Auditee Team"));
        }
        field(10;"Date Requested";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Date Submitted";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Submission Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Planned,Pending,Submitted,Cancelled,Partially Submitted';
            OptionMembers = " ",Planned,Pending,Submitted,Cancelled,"Partially Submitted";
        }
        field(13;"No. of Filed Audit Papers";Integer)
        {
            Description = 'No. of Filed Audit Working Papers';
            Editable = false;
        }
        field(14;"Procedure Description";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Engagement ID","Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditProjectProcedure: Record "Audit Project Procedure";
}

