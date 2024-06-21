#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69076 "Payroll LinesT"
{

    fields
    {
        field(1;"Line No";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Personal No.";Code[20])
        {
        }
        field(3;"Employee Name";Text[60])
        {
        }
        field(4;"Basic Salary";Decimal)
        {
        }
        field(5;"Basic Arrears";Decimal)
        {
        }
        field(6;"Gross Pay";Decimal)
        {
        }
        field(7;"Total Deduction";Decimal)
        {
        }
        field(8;Netpay;Decimal)
        {
        }
        field(9;"Payroll Header";Code[20])
        {
        }
        field(10;"Payroll Period";Date)
        {
        }
        field(11;"Payroll Group";Text[30])
        {
        }
        field(57006;"Responsibility Center";Code[30])
        {
            Caption = 'Responsibility Center';
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
           field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                //ShowDimensions;

               // ShowDocDim;
            end;
        }
        field(12; "Shortcut Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
         field(13; "Shortcut Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No","Payroll Header")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        UserSetup.Get(UserId);
        "Responsibility Center":=UserSetup."Responsibility Center";
    end;

    trigger OnInsert()
    begin
        UserSetup.Get(UserId);
        "Responsibility Center":=UserSetup."Responsibility Center";
    end;

    trigger OnModify()
    begin
        UserSetup.Get(UserId);
        "Responsibility Center":=UserSetup."Responsibility Center";
    end;

    var
        UserSetup: Record "User Setup";
}

