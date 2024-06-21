table 99611 "Casual Bracket table lines"
{
    Caption = 'Casual Bracket table lines';
    
    
    fields
    {
        field(1; "Table Code"; Code[10])
        {
            Caption = 'Table Code';
        }
        field(2; Category;Enum "Urban Area Categories")
        {
            Caption = 'Category';
        }
        field(3; Grade; Code[20])
        {
            Caption = 'Grade';
           // TableRelation = "Salary Scales";
            TableRelation = "Salary Scales".Scale where("Temporary Scale" = const(true));
        }
        field(4; "Daily Rate"; Decimal)
        {
            Caption = 'Daily Rate';
        }
        field(5; "Hourly Rate"; Decimal)
        {
            Caption = 'Hourly Rate';
        }
        field(6; "Monthly Contract Rate"; Decimal)
        {
            Caption = 'Monthly Contract Rate';
        }
    }
    keys
    {
        key(PK; "Table Code",Category,Grade)
        {
            Clustered = true;
        }
    }
}
