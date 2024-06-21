#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69079 "Temp Employee PGroups"
{

    fields
    {
        field(1;"Posting Group";Code[10])
        {
            TableRelation = "Employee Posting GroupX Temp";
        }
        field(2;"Code";Code[10])
        {
            TableRelation = if (Type=const(Earning)) "EarningsX Temp-E"
                            else if (Type=const(Deduction)) "DeductionsX Temp-E";

            trigger OnValidate()
            begin
                  if Type=Type::Earning then
                  begin
                  if EarningRec.Get(Code) then
                  begin
                  Description:=EarningRec.Description;
                  end;
                  end;

                  if Type=Type::Deduction then
                  begin
                  if Deduction.Get(Code) then
                  begin
                  Description:=Deduction.Description;
                  end;
                  end;
                UserSetup.Get(UserId);
                "Responsibility Center":=UserSetup."Responsibility Center";
            end;
        }
        field(3;"G/L Account";Code[20])
        {
            TableRelation = if ("Account Type"=const("G/L Account")) "G/L Account"
                            else if ("Account Type"=const("Fixed Asset")) "Fixed Asset"
                            else if ("Account Type"=const(Customer)) Customer
                            else if ("Account Type"=const("Bank Account")) "Bank Account Ledger Entry"
                            else if ("Account Type"=const(Vendor)) Vendor;
        }
        field(4;Description;Text[50])
        {
        }
        field(5;Type;Option)
        {
            OptionMembers = Earning,Deduction;
        }
        field(6;"GL Account Employer";Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(7;"Account Type";Option)
        {
            Editable = true;
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        }
        field(8;"Account No.";Code[20])
        {
            TableRelation = if ("Account Type"=const("G/L Account")) "G/L Account"
                            else if ("Account Type"=const("Fixed Asset")) "Fixed Asset"
                            else if ("Account Type"=const(Customer)) Customer
                            else if ("Account Type"=const("Bank Account")) "Bank Account Ledger Entry"
                            else if ("Account Type"=const(Vendor)) Vendor;

            trigger OnValidate()
            begin

                // CASE "Account Type" OF
                //  "Account Type":::
                //    BEGIN
                //     IF Customer.GET("Account No.") THEN
                //       BEGIN
                //         "Account Name":=Customer.Name;
                //         Payee:=Customer.Name;
                //         END;
                //    END;
                // END;
            end;
        }
        field(57006;"Responsibility Center";Code[30])
        {
            Caption = 'Responsibility Center';
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
    }

    keys
    {
        key(Key1;"Posting Group","Code",Type,"Responsibility Center")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

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

    trigger OnRename()
    begin
        UserSetup.Get(UserId);
        "Responsibility Center":=UserSetup."Responsibility Center";
    end;

    var
        EarningRec: Record "EarningsX Temp-E";
        Deduction: Record "DeductionsX Temp-E";
        UserSetup: Record "User Setup";
}

