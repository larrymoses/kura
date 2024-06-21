#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69082 "Casuals PGroup Accounts"
{


    fields
    {
        field(1; "Employee PGroup"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Posting GroupX Temp";
        }
        field(2; "Account Type"; Option)
        {
            Caption = 'Account Type';
            DataClassification = ToBeClassified;
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(3; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            DataClassification = ToBeClassified;
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else
            if ("Account Type" = const(Customer)) Customer
            else
            if ("Account Type" = const(Vendor)) Vendor
            else
            if ("Account Type" = const("Bank Account")) "Bank Account"
            else
            if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Account Type" = const("IC Partner")) "IC Partner";
        }
        field(4; "Responsibility Center"; Code[30])
        {
            Caption = 'Responsibility Center';
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
    }

    keys
    {
        key(Key1; "Employee PGroup", "Responsibility Center")
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
        "Responsibility Center" := UserSetup."Responsibility Center";
    end;

    trigger OnModify()
    begin
        UserSetup.Get(UserId);
        "Responsibility Center" := UserSetup."Responsibility Center";
    end;

    trigger OnRename()
    begin
        UserSetup.Get(UserId);
        "Responsibility Center" := UserSetup."Responsibility Center";
    end;

    var
        UserSetup: Record "User Setup";
}

