#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95207 "Audit ProjectLocation"
{
    DrillDownPageID = "Audit Project Locations";
    LookupPageID = "Audit Project Locations";

    fields
    {
        field(1;"Engagement ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Audit Location ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Location".Code;

            trigger OnValidate()
            begin
                AuditLocation.Reset;
                AuditLocation.SetRange(Code,"Audit Location ID");
                if AuditLocation.FindSet then
                  Description:=AuditLocation.Description;
            end;
        }
        field(3;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Responsibility Center ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;
        }
        field(5;"Audit Site Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Within Organization,External to Organization';
            OptionMembers = " ","Within Organization","External to Organization";
        }
        field(6;"Contact Person";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange("No.","Contact Person");
                if Resource.FindSet then
                  begin
                  "Primary Email":=Resource."Company E-Mail";
                   "Telephone No.":=Resource."Mobile Phone No.";
                       end;
            end;
        }
        field(7;"Primary Email";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Telephone No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Engagement ID","Audit Location ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resource: Record Employee;
        Employee: Record Employee;
        AuditLocation: Record "Audit Location";
}

