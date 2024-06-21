#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 57030 "Bill Discounting Header"
{
    DrillDownPageID = "Bill Discounting Requests";
    LookupPageID = "Bill Discounting Requests";

    fields
    {
        field(1;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Created By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Created Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Crearted Time";Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;"Region Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Region));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(Code,"Region Code");
                if ResponsibilityCenter.FindSet then
                  "Region Name":=ResponsibilityCenter.Name;
            end;
        }
        field(8;"Project Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No." where ("Contractor No."=field("Contractor No"));

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange("No.","Project Code");
                if Job.FindSet then
                  "Project Name":=Job.Description;
            end;
        }
        field(9;"Region Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"Project Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;"Approval  Status";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Approved,Rejected';
            OptionMembers = " ",Open,"Pending Approval",Approved,Rejected;
        }
        field(12;"Contractor No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange("No.","Contractor No");
                if Vendor.FindSet then
                  "Contractor Name":=Vendor.Name;
            end;
        }
        field(13;"Contractor Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14;"No. Series";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(15;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16;"Posted By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17;"Posted DateTime";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18;"Total Discounted Amount";Decimal)
        {
            CalcFormula = sum("Bill Discounting Line"."Discounted Amount" where ("Document No"=field("Document No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(19;"Total Discountable Amount";Decimal)
        {
            CalcFormula = sum("Bill Discounting Line"."Discountable Amount" where ("Document No"=field("Document No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(20;"Bank No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Bank Account".Code;
        }
        field(21;"Bank Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Bank Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Bank AccountX".Code;

            trigger OnValidate()
            begin
                 EmployeeBankAccountX.Reset;
                 EmployeeBankAccountX.SetRange(Code,"Bank Code");
                 if EmployeeBankAccountX.FindSet then begin
                  "Bank Account Name":=EmployeeBankAccountX."Bank Name";
                   "Bank Name":=EmployeeBankAccountX."Bank Name";
                   end;

                // VendorBankAccount.RESET;
                // VendorBankAccount.SETRANGE("Vendor No.","Contractor No");
                // VendorBankAccount.SETRANGE("Bank Code","Bank Code");
                // IF VendorBankAccount.FINDSET THEN BEGIN
                //  "Bank Name":=VendorBankAccount."Bank Account Name";
                //  "Bank Account Name":=VendorBankAccount."Bank Account Name";
                //  "Bank Branch No":=VendorBankAccount."Bank Branch No.";
                //  "Bank Branch Name":=VendorBankAccount."Bank Branch Name";
                //  "Bank Account Number":=VendorBankAccount."Bank Account No.";
                //  END;
            end;
        }
        field(23;"Bank Branch No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Bank AccountX"."Bank Branch No." where (Code=field("Bank Code"));

            trigger OnValidate()
            begin
                 EmployeeBankAccountX.Reset;
                 EmployeeBankAccountX.SetRange("Bank Branch No.","Bank Branch No");
                 if EmployeeBankAccountX.FindSet then
                  "Bank Branch Name":=EmployeeBankAccountX."Branch Name";
            end;
        }
        field(24;"Bank Branch Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Bank Account Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Bank Account Number";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(89;"Total VAT Amount";Decimal)
        {
            CalcFormula = sum("Bill Discounting Line"."VAT Amount" where ("Document No"=field("Document No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(90;"Total Witholding Tax Amount";Decimal)
        {
            CalcFormula = sum("Bill Discounting Line"."W/Tax Amount" where ("Document No"=field("Document No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(91;"Total Net Amount";Decimal)
        {
            CalcFormula = sum("Bill Discounting Line"."Net Amount" where ("Document No"=field("Document No")));
            Editable = false;
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                //"Total Net Pay":="Total Net Amount"-"Advance Recovery";
            end;
        }
        field(92;"VAT Wthheld six %";Decimal)
        {
            CalcFormula = sum("Bill Discounting Line"."VAT Withheld Amount" where ("Document No"=field("Document No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(93;"Total Retention";Decimal)
        {
            CalcFormula = sum("Bill Discounting Line"."Retention  Amount" where ("Document No"=field("Document No")));
            FieldClass = FlowField;
        }
        field(94;"Total Advance Recovery";Decimal)
        {
            CalcFormula = sum("Bill Discounting Line"."Advance Recovery" where ("Document No"=field("Document No")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Created By":=UserId;
        "Created Date":=Today;
        "Document Date":=Today;
        "Approval  Status":="approval  status"::Open;
        "Crearted Time":=Time;


        if "Document No" ='' then begin
          CMSetup.Get;
          CMSetup.TestField("Bill Discounting Nos");
          NoSeriesMgt.InitSeries(CMSetup."Bill Discounting Nos",xRec."No. Series",Today,"Document No","No. Series");
          end;
    end;

    var
        Job: Record Job;
        CMSetup: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Vendor: Record Vendor;
        ResponsibilityCenter: Record "Responsibility Center";
        VendorBankAccount: Record "Vendor Bank Account";
        EmployeeBankAccountX: Record "Employee Bank AccountX";
}

