#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70037 "Inspection Lines1"
{

    fields
    {
        field(1;"Inspection No";Code[20])
        {
        }
        field(2;"Line No";Integer)
        {
        }
        field(3;Description;Text[250])
        {
        }
        field(4;"Unit of Measure";Code[20])
        {
        }
        field(5;"Quantity Ordered";Decimal)
        {
            Editable = true;
        }
        field(6;"Quantity Received";Decimal)
        {
            MinValue = 0;

            trigger OnValidate()
            begin
                if (("Quantity Received"+ "Received Qty"= "Quantity Ordered") or ("Quantity Received"+"Received Qty"<"Quantity Ordered"))
                  then begin
                Validate("Rejected Quantity");
                    end;
                if not(("Quantity Received"+ "Received Qty"= "Quantity Ordered") or ("Quantity Received"+"Received Qty"<"Quantity Ordered"))
                  then begin
                Error('Total Quantity to received should be less or equal to Quantity requested')
                    end;
                
                /*IF (("Quantity Received"= "Quantity Ordered") OR ("Quantity Received"<"Quantity Ordered"))
                  THEN BEGIN
                VALIDATE("Rejected Quantity");
                    END;
                IF NOT(("Quantity Received"= "Quantity Ordered") OR ("Quantity Received"<"Quantity Ordered"))
                  THEN BEGIN
                ERROR('Quantity received should be less or equal to Quantity requested')
                    END;*/

            end;
        }
        field(7;"Inspection Decision";Option)
        {
            OptionMembers = " ",Accept,Reject;
        }
        field(8;"Reasons for Rejection";Text[250])
        {
        }
        field(9;"Return Reasons";Code[10])
        {
            TableRelation = "Return Reason";
        }
        field(10;"Item No";Code[20])
        {
        }
        field(11;"Rejected Quantity";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Rejected Quantity":="Quantity Ordered"-("Quantity Received"+"Received Qty");
            end;
        }
        field(12;"Received Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Inspection No","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

