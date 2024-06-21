#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72156 "PCO Internal Project Team"
{

    fields
    {
        field(1;"Commencement Order No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Resource No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=filter(Person),
                                                  Blocked=filter(false));
        }
        field(3;Name;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Email;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Address;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Address 2";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;City;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Post Code";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Country/Region Code";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Phone No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Role Code";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Staff Role Code"."Staff Role Code" where (Blocked=filter(false));

            trigger OnValidate()
            begin
                ProjectStaffRoleCode.Reset;
                ProjectStaffRoleCode.SetRange(ProjectStaffRoleCode."Staff Role Code","Role Code");
                if ProjectStaffRoleCode.FindSet then begin
                  Designation:=ProjectStaffRoleCode.Designation;
                  end;
            end;
        }
        field(12;Designation;Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Commencement Order No.","Resource No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProjectStaffRoleCode: Record "Project Staff Role Code";
}

