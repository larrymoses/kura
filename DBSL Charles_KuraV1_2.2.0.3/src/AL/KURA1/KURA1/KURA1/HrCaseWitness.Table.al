#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69199 "Hr Case Witness"
{
    DrillDownPageID = "Hr Case Witness";
    LookupPageID = "Hr Case Witness";

    fields
    {
        field(1; "Employee No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(2; "Case Number"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Witness Number"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Witness is Staff" = const(true)) Employee."No.";

            trigger OnValidate()
            begin
                if "Witness is Staff" = true then begin
                    Emp.Reset;
                    Emp.SetRange("No.", "Witness Number");
                    if Emp.FindSet then begin
                        "Witness Name" := Emp."First Name" + ' ' + Emp."Last Name";
                    end;
                end;


                //Validate Not  To Have 2 same witnesses
            end;
        }
        field(4; "Witness Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Witness Statement"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Witness is Staff"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Employee No", "Case Number", "Witness Number")
        {
            Clustered = true;
        }
        // key(Key2;'')
        // {
        //     Enabled = false;
        // }
    }

    fieldgroups
    {
    }

    var
        Emp: Record Employee;
}

