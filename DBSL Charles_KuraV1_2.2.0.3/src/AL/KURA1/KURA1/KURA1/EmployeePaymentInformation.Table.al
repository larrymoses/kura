#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 57027 "Employee Payment Information"
{

    fields
    {
        field(1; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Employee No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where(Status = filter(Active));

            trigger OnValidate()
            begin
                if Employee.Get("Employee No") then begin
                    "Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                end;
            end;
        }
        field(3; "Employee Bank Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Bank AccountX".Code;

            trigger OnValidate()
            begin
                EmployeeBankAccountX.Reset;
                EmployeeBankAccountX.SetRange(EmployeeBankAccountX.Code, "Employee Bank Code");
                if EmployeeBankAccountX.FindSet then begin
                    "Employee Bank Name" := EmployeeBankAccountX."Bank Name";
                end;
            end;
        }
        field(4; "Employee Bank Branch Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Bank AccountX"."Bank Branch No." where(Code = field("Employee Bank Code"));

            trigger OnValidate()
            begin
                EmployeeBankAccountX.Reset;
                EmployeeBankAccountX.SetRange(EmployeeBankAccountX."Bank Branch No.", "Employee Bank Branch Code");
                if EmployeeBankAccountX.FindSet then begin
                    "Employee Bank Branch Name" := EmployeeBankAccountX."Branch Name";
                end;
            end;
        }
        field(5; "Employee Bank Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Employee Bank Branch Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Employee Mobile No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Employee Bank Account Number"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Employee Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Account Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No", "Employee No", "Employee Mobile No", "Employee Bank Code", "Employee Bank Branch Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Amend Bank Account Details" = false then begin
                Error('You do not have the permissions to edit bank accounts. Please contact your system admin.');
            end;
        end;
    end;

    trigger OnInsert()
    begin
        if "Document No" = '' then begin
            HumanResourcesSetup.Get;
            HumanResourcesSetup.TestField("Employee Payment Info Nos");
            NoSeriesManagement.InitSeries(HumanResourcesSetup."Employee Payment Info Nos", xRec."No Series", Today, "Document No", "No Series");
        end;

        if UserSetup.Get(UserId) then begin
            if UserSetup."Amend Bank Account Details" = false then begin
                Error('You do not have the permissions to edit bank accounts. Please contact your system admin.');
            end;
        end;
    end;

    trigger OnModify()
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Amend Bank Account Details" = false then begin
                Error('You do not have the permissions to edit bank accounts. Please contact your system admin.');
            end;
        end;
    end;

    trigger OnRename()
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Amend Bank Account Details" = false then begin
                Error('You do not have the permissions to edit bank accounts. Please contact your system admin.');
            end;
        end;
    end;

    var
        Employee: Record Employee;
        EmployeeBankAccountX: Record "Employee Bank AccountX";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        HumanResourcesSetup: Record "Human Resources Setup";
        UserSetup: Record "User Setup";
}

