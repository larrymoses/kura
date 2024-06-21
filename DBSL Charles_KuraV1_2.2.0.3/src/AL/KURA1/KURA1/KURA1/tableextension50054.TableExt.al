#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50054 "tableextension50054" extends "Vendor Bank Account" 
{
    fields
    {

        //Unsupported feature: Property Insertion (DataClassification) on ""Vendor No."(Field 1)".


        //Unsupported feature: Property Insertion (DataClassification) on "Code(Field 2)".


        //Unsupported feature: Property Insertion (DataClassification) on "Name(Field 3)".


        //Unsupported feature: Property Insertion (DataClassification) on ""Name 2"(Field 5)".


        //Unsupported feature: Property Insertion (DataClassification) on "Address(Field 6)".


        //Unsupported feature: Property Insertion (DataClassification) on ""Address 2"(Field 7)".


        //Unsupported feature: Property Insertion (DataClassification) on "City(Field 8)".


        //Unsupported feature: Property Insertion (DataClassification) on ""Post Code"(Field 9)".


        //Unsupported feature: Property Insertion (DataClassification) on "Contact(Field 10)".


        //Unsupported feature: Property Insertion (DataClassification) on ""Phone No."(Field 11)".


        //Unsupported feature: Property Insertion (DataClassification) on ""Telex No."(Field 12)".

        modify("Bank Branch No.")
        {
            TableRelation = "Employee Bank AccountX"."Bank Branch No." where (Code=field("Bank Code"));

            //Unsupported feature: Property Insertion (DataClassification) on ""Bank Branch No."(Field 13)".

        }

        //Unsupported feature: Property Insertion (DataClassification) on ""Bank Account No."(Field 14)".


        //Unsupported feature: Property Insertion (DataClassification) on ""Transit No."(Field 15)".


        //Unsupported feature: Property Insertion (DataClassification) on ""Currency Code"(Field 16)".


        //Unsupported feature: Property Insertion (DataClassification) on ""Country/Region Code"(Field 17)".


        //Unsupported feature: Property Insertion (DataClassification) on "County(Field 18)".


        //Unsupported feature: Property Insertion (DataClassification) on ""Fax No."(Field 19)".


        //Unsupported feature: Property Insertion (DataClassification) on ""Telex Answer Back"(Field 20)".


        //Unsupported feature: Property Insertion (DataClassification) on ""Language Code"(Field 21)".


        //Unsupported feature: Property Insertion (DataClassification) on ""E-Mail"(Field 22)".


        //Unsupported feature: Property Insertion (DataClassification) on ""Home Page"(Field 23)".


        //Unsupported feature: Property Insertion (DataClassification) on "IBAN(Field 24)".


        //Unsupported feature: Property Insertion (DataClassification) on ""SWIFT Code"(Field 25)".


        //Unsupported feature: Property Insertion (DataClassification) on ""Bank Clearing Code"(Field 1211)".


        //Unsupported feature: Property Insertion (DataClassification) on ""Bank Clearing Standard"(Field 1212)".


        //Unsupported feature: Code Insertion on ""Bank Branch No."(Field 13)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
            /*
            EmployeeBankAccountX.RESET;
            EmployeeBankAccountX.SETRANGE("Bank Branch No.","Bank Branch No.");
            IF EmployeeBankAccountX.FINDSET THEN
              "Bank Branch Name":=EmployeeBankAccountX."Branch Name";
            */
        //end;
        field(70000;"Available Credit Line Valu";Decimal)
        {
            Caption = 'Available Credit Line Value (LCY)';
            DataClassification = ToBeClassified;
            Description = 'Customized field used to track the available credit line value for each bank (e.g. OD value). It is vital during bid assessment for Work IFSs where financiing is a factor to consider when evaluating the vendor''s financial capacity';
        }
        field(70001;"Bank Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Bank AccountX".Code;

            trigger OnValidate()
            begin
                EmployeeBankAccountX.Reset;
                EmployeeBankAccountX.SetRange(Code,"Bank Code");
                if EmployeeBankAccountX.FindSet then
                  "Bank Account Name":=EmployeeBankAccountX."Bank Name";
            end;
        }
        field(70002;"Bank Branch Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70003;"Bank Account Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70004;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        EmployeeBankAccountX: Record "Employee Bank AccountX";
}

