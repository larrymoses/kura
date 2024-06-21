#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95215 "Entrance Meeting Summary"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Audit Commencement Notice,Auditee Notice Response,Audit Entrace Meeting,Pre-Audit Survey Invitation,Pre-Audit Survey Response,Audit Fieldwork Voucher,Audit Exit Conference,Draft Audit Report,Final Audit Report';
            OptionMembers = " ","Audit Commencement Notice","Auditee Notice Response","Audit Entrace Meeting","Pre-Audit Survey Invitation","Pre-Audit Survey Response","Audit Fieldwork Voucher","Audit Exit Conference","Draft Audit Report","Final Audit Report";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Engagement ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Agenda Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(6;"Item Discussed";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Summary Notes";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Engagement ID","Agenda Code","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        AuditMobilizationHeader.Reset;
        AuditMobilizationHeader.SetRange(AuditMobilizationHeader."Document No.","Document No.");
        if AuditMobilizationHeader.FindSet then begin
          "Engagement ID":=AuditMobilizationHeader."Engagement ID";

          end;
    end;

    var
        AuditMobilizationHeader: Record "Audit Mobilization Header";
}

