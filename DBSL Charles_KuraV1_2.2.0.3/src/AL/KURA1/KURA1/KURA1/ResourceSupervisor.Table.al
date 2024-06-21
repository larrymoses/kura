#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72364 "Resource Supervisor"
{

    fields
    {
        field(1;"Resouce No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Employee No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                ObjEmployee.Reset;
                ObjEmployee.SetRange(ObjEmployee."No.","Employee No");
                if ObjEmployee.FindSet then
                  begin
                    ObjEmployee.TestField("E-Mail");
                    "Employee Name":=ObjEmployee."First Name"+' '+ObjEmployee."Middle Name"+' '+ObjEmployee."Last Name";
                    "Employee Email":=ObjEmployee."E-Mail";
                    end;
            end;
        }
        field(3;"Employee Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Employee Email";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Resouce No","Employee No","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ObjEmployee: Record Employee;
}

