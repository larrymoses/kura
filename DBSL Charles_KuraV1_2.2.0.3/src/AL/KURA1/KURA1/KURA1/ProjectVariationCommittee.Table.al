#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72261 "Project Variation Committee"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Extension of Time Request,Contractor Variation Request,Project Variation Order,Budget Reallocation Voucher,Engineer Variation Request,Cost Claim';
            OptionMembers = " ","Extension of Time Request","Contractor Variation Request","Project Variation Order","Budget Reallocation Voucher","Engineer Variation Request","Cost Claim";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Resource No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=filter(Person),
                                                  Blocked=filter(false));

            trigger OnValidate()
            begin
                if Resource.Get("Resource No.") then begin
                  Name:=Resource.Name;
                  Resource.CalcFields("Employee No");
                  if Employee.Get(Resource."Employee No") then begin
                       Email:=Employee."E-Mail";
                  end;
                  end;
            end;
        }
        field(4;Name;Text[500])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;Email;Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            ExtendedDatatype = EMail;
        }
        field(6;Role;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Member,Chairperson,Secretary,Consultant';
            OptionMembers = " ",Member,Chairperson,Secretary,Consultant;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Resource No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resource: Record Resource;
        Employee: Record Employee;
}

