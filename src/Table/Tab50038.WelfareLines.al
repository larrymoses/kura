/// <summary>
/// Table Welfare Lines (ID 50038).
/// </summary>
table 50038 "Welfare Lines"
{
    Caption = 'Welfare Lines';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"Welfare Header No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;LineNo;Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Employee No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Employee.RESET;
                Employee.SETRANGE("No.","Employee No.");
                IF Employee.FINDSET THEN BEGIN
                  "Employee Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";

                END
            end;
        }
        field(4;"Employee Name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Month;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Date;Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Month := FORMAT(Date,0,'<Month Text>');
            end;
        }
        field(7;Amount;Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Welfare Header No.",LineNo)
        {
        }
    }

    fieldgroups
    {
    }

    var
        Employee: Record 5200;
}

