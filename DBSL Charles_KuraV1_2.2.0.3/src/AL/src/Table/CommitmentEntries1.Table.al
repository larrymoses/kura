#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70013 "Commitment Entries1"
{
    DrillDownPageID = "Commitment Entries";
    LookupPageID = "Commitment Entries";

    fields
    {
        field(1;"Entry No";Integer)
        {
            //AutoIncrement = true;
        }
        field(2;"Commitment Date";Date)
        {
        }
        field(3;"Document No.";Code[20])
        {
        }
        field(4;Amount;Decimal)
        {
        }
        field(5;"Budget Line";Code[10])
        {
        }
        field(6;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Department';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(7;"Commitment Type";Enum "Commitment Document Type")
        {
            Caption ='Commitment Document Type';
           // OptionMembers = " ",LPO,LSO,IMPREST,PAYROLL,PRN;
        }
        field(8;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Department';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(9;"Budget Year";Code[10])
        {
            TableRelation = "G/L Budget Name";
        }
        field(10;"User ID";Code[50])
        {
        }
        field(11;"Time Stamp";Time)
        {
        }
        field(12;Description;Text[2048])
        {
        }
        field(13;"Commitment No";Code[20])
        {
        }
        field(15;Type;Enum "Commitment Type")
        {
            //OptionMembers = Committed,Reversal;
        }
        field(16;GLAccount;Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(18;InvoiceNo;Code[20])
        {
        }
        field(19;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(20;No;Code[20])
        {
        }
        field(24;"Line No.";Integer)
        {
        }
        field(25;"Account No.";Code[20])
        {
            TableRelation = if ("Account Type"=const("G/L Account")) "G/L Account"
                            else if ("Account Type"=const(Customer)) Customer
                            else if ("Account Type"=const(Vendor)) Vendor
                            else if ("Account Type"=const("Fixed Asset")) "Fixed Asset"
                            else if ("Account Type"=const(Employee)) Employee;
            trigger OnValidate()
            var
                GLAcc: Record "G/L Account";
                Item: Record Item;
                FA: Record "Fixed Asset";
                Res: Record Resource;
                Cust: Record Customer;
                Vend: Record Vendor;
                Bank: Record "Bank Account";
                Emp: Record Employee;
            begin
                case "Account Type" of

                    "Account Type"::"G/L Account":
                        begin
                            if GLAcc.Get("Account No.") then begin
                                "Account Name" := GLAcc.Name;
                            end;
                        end;
                    "Account Type"::Customer:
                        begin
                            if Cust.Get("Account No.") then begin
                                "Account Name" := Cust.Name;
                            end;
                        end;
                    "Account Type"::Vendor:
                        begin
                            if Vend.Get("Account No.") then begin
                                "Account Name" := Vend.Name;
                            end;
                        end;
                    "Account Type"::"Fixed Asset":
                        begin
                            if FA.Get("Account No.") then begin
                                "Account Name" := FA.Description;
                            end;
                        end;
                    "Account Type"::"Bank Account":
                        begin
                            if Bank.Get("Account No.") then begin
                                "Account Name" := Bank.Name;
                            end;
                        end;
                    "Account Type"::Employee:
                        begin
                            if Emp.Get("Account No.") then begin
                                "Account Name" := Emp.FullName();
                            end;
                        end;

                end;
            end;
        }
        field(26;"Account Name";Text[100])
        {
        }
        field(28; "Account Type"; Enum "Gen. Journal Account Type")
        {
            // OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Employee';
            // OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee;
        }
        field(29;"Uncommittment Date";Date)
        {
        }
        field(30;"Vote Item";Integer)
        {
        }
        field(31;"PE Admin Code";Code[50])
        {
        }
        field(32;"Procurement Plan";Code[50])
        {
        }
        field(33;Created;Boolean)
        {
        }
        field(34;"Source Type";Enum "Commitment Document Type")
        {
            Caption = 'Type';
            // OptionCaption = ' ,G/L Account,Item,,Fixed Asset,Charge (Item)';
            // OptionMembers = " ","G/L Account",Item,,"Fixed Asset","Charge (Item)";
        }
        field(35;"Unit Cost";Decimal)
        {
        }
        field(36;Quantity;Decimal)
        {
        }
        field(37;"Remaining Quanity";Integer)
        {
        }
        field(38;"Item Budget Entry";Boolean)
        {
        }
        field(39;"BD Test280617";Boolean)
        {
        }
        field(40;"Last Entry";Boolean)
        {
        }
        field(41;"Remaining in Batch";Integer)
        {
        }
        field(50001;Quantity_;Decimal)
        {
        }
        field(50002;"Posted?";Boolean)
        {
            CalcFormula = exist("Item Ledger Entry" where ("Item No."=field("Procurement Plan"),
                                                           "Posting Date"=field("Commitment Date"),
                                                           Positive=const(true),
                                                           "Invoiced Quantity"=field(Quantity_)));
            FieldClass = FlowField;
        }
        field(50003;"Purchase Posted";Boolean)
        {
        }
        field(50004;Job;Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(50005;"Job Task No";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where ("Job No."=field(Job));
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
            Clustered = true;
        }
        key(Key2;"Budget Line","Global Dimension 1 Code","Global Dimension 2 Code","Commitment Date","Budget Year")
        {
            SumIndexFields = Amount;
        }
        key(Key3;"Procurement Plan","Commitment Date")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Entry No","Document No.","Remaining in Batch")
        {
        }
    }
}

