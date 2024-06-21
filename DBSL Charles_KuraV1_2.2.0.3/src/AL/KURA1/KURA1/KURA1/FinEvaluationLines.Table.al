#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70240 "Fin Evaluation Lines"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Bid No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange("No.","Bid No");
                if PurchaseHeader.FindSet then begin
                  PurchaseHeader.CalcFields("Amount Including VAT");
                  "Evaluated Tender Sum":=PurchaseHeader."Amount Including VAT";
                 PurchaseLine.Reset;
                 PurchaseLine.SetRange("Document No.","Bid No");
                 PurchaseLine.SetRange("Document Type",PurchaseLine."document type"::Quote);
                 PurchaseLine.SetRange(Escalated,true);
                 if PurchaseLine.FindSet then begin
                  PurchaseLine.CalcSums(Amount);
                  PurchaseLine.CalcSums("Escalaleted Amount");
                  "Escalated Tender Sum":=(("Evaluated Tender Sum"-PurchaseLine.Amount)+PurchaseLine."Escalaleted Amount");
                  "Escalation %":=(("Escalated Tender Sum"/"Evaluated Tender Sum")*100)-100;
                  //MODIFY(TRUE);
                  //  VALIDATE("Escalated Tender Sum");
                   // END;
                 end;




                  end;
            end;
        }
        field(4;"Bidder Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Evaluated Tender Sum";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Escalated Tender Sum";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // IF "Escalated Tender Sum"<"Evaluated Tender Sum" THEN BEGIN
                //  ERROR('ERROR!, Escalated tender sum must be higher');
                //    END;
                // "Escalation %":=(("Escalated Tender Sum"/"Evaluated Tender Sum")*100)-100;
            end;
        }
        field(7;"Escalation %";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // IF "Escalation %"<0 THEN BEGIN
                //    ERROR('ERROR!, Escalation percentage must be greater than 0');
                //  END;
                // IF "Escalation %"=0 THEN BEGIN
                //    "Escalated Tender Sum":=0;
                //  END ELSE BEGIN
                // "Escalated Tender Sum":="Evaluated Tender Sum"+(("Escalation %"*"Evaluated Tender Sum")/100);
                //    END;
            end;
        }
        field(8;Remarks;Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Sensitivity,Rates,Other';
            OptionMembers = " ",Sensitivity,Rates,Other;
        }
        field(10;"Bidder No";Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Vendors.Reset;
                Vendors.SetRange("No.","Bidder No");
                if Vendors.FindSet then begin
                  "Bidder Name":=Vendors.Name;
                end;
            end;
        }
        field(11;"Bill Item No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Bill Item Market  Rate";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Bidder Bill Item Rate";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Bid No",Type,"Bidder No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
         Validate("Bidder No");
         Validate("Bid No");
    end;

    var
        Vendors: Record Vendor;
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
}

