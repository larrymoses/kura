#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 56009 "Commitment Entries"
{

    fields
    {
        field(1;"Commitment No";Code[20])
        {

            trigger OnValidate()
            begin


            end;
        }
        field(2;"Commitment Date";Date)
        {
        }
        field(3; "Commitment Type"; enum "Commitment Type")
        {
            // OptionMembers = Committed,Reversal;
        }
        field(4;Account;Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(5;"Committed Amount";Decimal)
        {
        }
        field(6;User;Code[50])
        {
        }
        field(7;"Document No";Code[20])
        {
        }
        field(8;InvoiceNo;Code[20])
        {
        }
        field(9;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(10;No;Code[20])
        {
        }
        field(11;"Entry No";Integer)
        {
            AutoIncrement = false;
        }
        field(12;"Global Dimension 1";Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(13;"Global Dimension 2";Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(14;"Line No.";Integer)
        {
        }
        field(15;"Account No.";Code[20])
        {
            TableRelation = if ("Account Type"=const("G/L Account")) "G/L Account"
            else
            if ("Account Type" = const(Item)) Item
            else
            if ("Account Type" = const(Resource)) Resource
                            else if ("Account Type"=const("Fixed Asset")) "Fixed Asset";
            trigger OnValidate()
            var
            GLAcc: Record "G/L Account";
            Item: Record Item;
            FA: Record "Fixed Asset";
            Res: Record Resource;
            begin
                case "Account Type" of
                    "Account Type"::" ":
                        begin

                        end;
                    "Account Type"::"G/L Account":
                        begin
                            if  GLAcc.Get("Account No.") then begin
                                "Account Name" :=GLAcc.Name;
                            end;
                        end;
                    "Account Type"::Item:
                    begin
                         if  Item.Get("Account No.") then begin
                                "Account Name" :=Item.Description;
                            end;
                        end;
                    "Account Type"::Resource:
                        begin
 if  Res.Get("Account No.") then begin
                                "Account Name" :=Res.Name;
                            end;
                        end;
                    "Account Type"::"Fixed Asset":
                        begin
 if  FA.Get("Account No.") then begin
                                "Account Name" :=FA.Description;
                            end;
                        end;
                    "Account Type"::"Charge (Item)":
                        begin

                        end;
                end;
            end;
        }
        field(16;"Account Name";Text[100])
        {
        }
        field(17;Description;Text[250])
        {
        }
        field(18; "Account Type"; Enum "Purchase Line Type")
        {
            // OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset';
            // OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        }
        field(19;"Uncommittment Date";Date)
        {
        }
        field(20; "Time Stamp"; DateTime)
        {

        }
        field(21; "Budget Year"; Code[30])
        {

        }
        field(22; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Department';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(23; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Department';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(24; "Shortcut Dimension 3 Code"; Code[20])
        {

            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(25; "Source Type"; Enum "Commitment Document Type")
        {

        }
    }

    keys
    {
        key(Key1;"Commitment No","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

