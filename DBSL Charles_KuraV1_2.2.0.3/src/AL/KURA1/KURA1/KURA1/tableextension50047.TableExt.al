#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50047 "tableextension50047" extends "Bank Account" 
{
    fields
    {
        modify(Name)
        {

            //Unsupported feature: Property Modification (Data type) on "Name(Field 2)".

            Caption = 'Account Name';
        }

        //Unsupported feature: Property Modification (Data type) on ""Search Name"(Field 3)".


        //Unsupported feature: Property Modification (Data type) on ""Name 2"(Field 4)".


        //Unsupported feature: Property Modification (CalcFormula) on "Balance(Field 58)".

        modify("Bank Branch No.")
        {
            Caption = 'Branch No.';
            TableRelation = "Employee Bank AccountX"."Bank Branch No." where (Code=field("Bank Code"));
        }

        //Unsupported feature: Code Insertion on ""Bank Branch No."(Field 101)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
            /*
            EmployeeBankAccountX.RESET;
            EmployeeBankAccountX.SETRANGE(EmployeeBankAccountX."Bank Branch No.","Bank Branch No.");
            IF EmployeeBankAccountX.FINDSET THEN BEGIN
            "Bank Branch Name":=EmployeeBankAccountX."Branch Name";
            END;
            */
        //end;
        field(50000;Test;Code[30])
        {
        }
        field(53000;test1;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(57000;Type;Option)
        {
            OptionCaption = 'Bank,Petty Cash';
            OptionMembers = Bank,"Petty Cash";
        }
        field(57001;"Bank Type";Option)
        {
            OptionMembers = Normal,Cash,"Fixed Deposit",SMPA,"Chq Collection";

            trigger OnValidate()
            begin

                //TestNoEntriesExist(FIELDCAPTION("Bank Type"));
            end;
        }
        field(57002;"Pending Voucher Amount";Decimal)
        {
        }
        field(57003;"Responsibility Center";Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center".Code;

            trigger OnValidate()
            begin
                /*
                IF NOT UserMgt.CheckRespCenter(1,"Responsibility Center") THEN
                  ERROR(
                    Text005,
                    RespCenter.TABLECAPTION,UserMgt.GetPurchasesFilter);
                
                */

            end;
        }
        field(57004;"Bank Branch Name";Text[250])
        {
            Caption = 'Branch Name';
        }
        field(57005;"Cheque Numbers";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(57006;"AIE Email Address";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(57007;Select;Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Select = true then begin
                  InterBankTransferLine.Init;
                  InterBankTransferLine."Bank Account No":=Rec."No.";
                  InterBankTransferLine.Insert;

                  end;
            end;
        }
        field(57008;"AIE Receivables Account";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(57009;"Branch Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(57010;"Bank Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Bank AccountX".Code;

            trigger OnValidate()
            begin
                EmployeeBankAccountX.Reset;
                EmployeeBankAccountX.SetRange(EmployeeBankAccountX.Code,"Bank Code");
                if EmployeeBankAccountX.FindSet then
                  "Bank Account  Name":=EmployeeBankAccountX."Bank Name";
            end;
        }
        field(57011;"Bank Account  Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(57012;"Retention Bank Account";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(57013;"Retention Donor";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Dimension Code"=filter('DONOR'));
        }
    }

    //Unsupported feature: Property Modification (Fields) on "Brick(FieldGroup 2)".


    var
        InterBankTransferLine: Record "Inter Bank Transfer Line";
        InterBankTransfer: Record "Inter Bank Transfer";
        EmployeeBankAccountX: Record "Employee Bank AccountX";
}

