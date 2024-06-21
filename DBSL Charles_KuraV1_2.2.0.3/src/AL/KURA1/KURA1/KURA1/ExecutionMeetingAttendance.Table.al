#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95230 "Execution Meeting Attendance"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Audit Fieldwork Voucher,Audit Exit Conference,Draft Audit Report,Final Audit Report';
            OptionMembers = " ","Audit Fieldwork Voucher","Audit Exit Conference","Draft Audit Report","Final Audit Report";
        }
        field(2; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Engagement ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Resource No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false));

            // trigger OnValidate()
            // begin
            //     if Resource.Get("Resource No.") then begin
            //       Resource.TestField("E-Mail");
            //       Name:=Resource.Name;
            //       "Job Title":=Resource."Job Title";
            //       Email:=Resource."E-Mail";
            //       "Phone No.":='';//Not found in Resource table
            //       end;
            // end;
        }
        field(5; Name; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Job Title"; Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Phone No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Email; Text[200])
        {
            DataClassification = ToBeClassified;
            Editable = false;
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

