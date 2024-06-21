#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50133 "tableextension50133" extends "Insurance Journal Line"
{
    fields
    {

        //Unsupported feature: Code Insertion on "Amount(Field 13)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        SumInsured:=0;
        Insurance.RESET;
        Insurance.SETRANGE(Insurance."No.","Insurance No.");
        IF Insurance.FINDSET THEN BEGIN
          SumInsured:=SumInsured+Insurance."Policy Coverage";
        END;

        AllreadyConumed:=0;
        InsCoverageLedgerEntry.RESET;
        InsCoverageLedgerEntry.SETRANGE(InsCoverageLedgerEntry."Insurance No.","Insurance No.");
        IF InsCoverageLedgerEntry.FINDSET THEN
          REPEAT
        AllreadyConumed+=InsCoverageLedgerEntry.Amount;
          UNTIL InsCoverageLedgerEntry.NEXT = 0;


        IF AllreadyConumed+Amount > SumInsured THEN
         ERROR('You cannot insure over the limit');
        */
        //end;
        field(50020; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
    }

    var
        SumInsured: Decimal;
        InsCoverageLedgerEntry: Record "Ins. Coverage Ledger Entry";
        AllreadyConumed: Decimal;
}

