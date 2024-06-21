table 50043 "Welfare Members"
{
    Caption = 'Welfare Members';
    DataClassification = ToBeClassified;
    LookupPageID = "Welfare Members";

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Member Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Employee,Resource,Board,Field';
            OptionMembers = Employee,Resource,Board,"Field";
        }
        field(3;"Member No.";Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                IF "Member Type"="Member Type"::Employee THEN
                  BEGIN
                    IF Employee.GET("Member No.") THEN
                      "Member Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
                  END;
                IF "Member Type"="Member Type"::Board THEN
                  BEGIN
                    IF Vendor.GET("Member No.") THEN
                  "Member Name":=Vendor.Name;
                  END;

                IF "Member Type"="Member Type"::Resource THEN
                  BEGIN
                    IF Resource.GET("Member No.") THEN
                      "Member Name":=Resource.Name;
                  END;
                  IF "Member Type"="Member Type"::Field THEN
                    BEGIN
                      IF SalespersonPurchaser.GET("Member No.") THEN
                        "Member Name":=SalespersonPurchaser.Name;
                    END;
            end;
        }
        field(4;"Member Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Designation;Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Customer: Record 18;
        Employee: Record 5200;
        SalespersonPurchaser: Record 13;
        Vendor: Record 23;
        Resource: Record 156;
}

