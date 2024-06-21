#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95210 "Audit ACN Auditor Team"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Audit Commencement Notice,Auditee Notice Response,Audit Entrace Meeting,Pre-Audit Survey Invitation,Pre-Audit Survey Response';
            OptionMembers = " ","Audit Commencement Notice","Auditee Notice Response","Audit Entrace Meeting","Pre-Audit Survey Invitation","Pre-Audit Survey Response";
        }
        field(2; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Engagement ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Resource No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false));

            trigger OnValidate()
            begin
                if Resource.Get("Resource No.") then begin
                    //  Resource.TestField("E-Mail");
                    Name := Resource.Name;
                    "Phone No." := Resource.Address;
                    "Job Title" := Resource."Job Title";
                end;
            end;
        }
        field(5; Name; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Engagement Role"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Management Role".Code where(Blocked = filter(false));
        }
        field(7; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Job Title"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Phone No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Email; Text[200])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Engagement ID", "Resource No.")
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

