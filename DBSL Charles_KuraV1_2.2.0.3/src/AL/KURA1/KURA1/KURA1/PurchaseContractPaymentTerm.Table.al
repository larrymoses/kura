#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70219 "Purchase Contract Payment Term"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2;"No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where ("Document Type"=const("Blanket Order"));
        }
        field(3;"Instalment Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Payment Certificate Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Advance,Interim,Final,Interest,Retention';
            OptionMembers = ,Advance,Interim,Final,Interest,Retention;
        }
        field(5;Payee;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Main Contractor,SubContractor,Assignee';
            OptionMembers = " ","Main Contractor",SubContractor,Assignee;
        }
        field(6;"Payment %";Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange("No.","No.");
                if PurchaseHeader.FindSet then begin
                  "Planned Amount":=ROUND(PurchaseHeader."Contract Sum"*("Payment %"/100),0.01,'>');
                  end;
                //IF "Currency Code"='' THEN
                  //"Planned Amount (LCY)":="Planned Amount";
            end;
        }
        field(7;"Currency Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(8;"Planned Amount";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange("No.","No.");
                if PurchaseHeader.FindSet then begin
                  "Payment %":=ROUND(("Planned Amount"/PurchaseHeader."Contract Sum"*100),0.01,'>');
                  end;
            end;
        }
        field(9;"Planned Amount (LCY)";Decimal)
        {
            CalcFormula = sum("Purchase Contract Payment Term"."Planned Amount" where ("No."=field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10;"Paid Amount";Decimal)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(11;"Paid Amount (LCY)";Decimal)
        {
            CalcFormula = sum("Purchase Contract Payment Term"."Paid Amount" where ("No."=field("No.")));
            FieldClass = FlowField;
        }
        field(12;"Outstanding Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Cumulative Outstanding Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Contract Sum";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15;"Gross IPC Amount(FCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Cumulative Gross IPC Amount(FC";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","No.","Instalment Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("No.","No.");
        if PurchaseHeader.FindSet then begin
          "Contract Sum":=PurchaseHeader."Contract Sum";
          end;
    end;

    var
        PurchaseHeader: Record "Purchase Header";
}

