#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50022 "tableextension50022" extends "General Ledger Setup" 
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Global Dimension 1 Code"(Field 79)".


        //Unsupported feature: Property Modification (Data type) on ""Global Dimension 2 Code"(Field 80)".


        //Unsupported feature: Property Modification (Data type) on ""Shortcut Dimension 1 Code"(Field 81)".


        //Unsupported feature: Property Modification (Data type) on ""Shortcut Dimension 2 Code"(Field 82)".


        //Unsupported feature: Property Modification (Data type) on ""Shortcut Dimension 3 Code"(Field 83)".


        //Unsupported feature: Property Modification (Data type) on ""Shortcut Dimension 4 Code"(Field 84)".


        //Unsupported feature: Property Modification (Data type) on ""Shortcut Dimension 5 Code"(Field 85)".


        //Unsupported feature: Property Modification (Data type) on ""Shortcut Dimension 6 Code"(Field 86)".


        //Unsupported feature: Property Modification (Data type) on ""Shortcut Dimension 7 Code"(Field 87)".


        //Unsupported feature: Property Modification (Data type) on ""Shortcut Dimension 8 Code"(Field 88)".

        field(50009;"Posted Receipts No";Code[20])
        {
            Caption = 'Receipts No';
            DataClassification = ToBeClassified;
        }
        field(50146;"Bank Balances";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Bank Account Ledger Entry"."Amount (LCY)" where ("Global Dimension 1 Code"=field("Global Dimension 1 Filter"),
                                                                                "Global Dimension 2 Code"=field("Global Dimension 2 Filter"),
                                                                                "Posting Date"=field("Date Filter")));
            Caption = 'Bank Balances';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50147;"Pending L.O.P";Decimal)
        {
            CalcFormula = sum("Purchase Line"."Outstanding Amount (LCY)" where ("Shortcut Dimension 1 Code"=field("Global Dimension 1 Filter"),
                                                                                "Shortcut Dimension 2 Code"=field("Global Dimension 2 Filter"),
                                                                                "Expected Receipt Date"=field("Date Filter"),
                                                                                Amount=filter(<>0),
                                                                                "Document Type"=filter(<>Quote)));
            FieldClass = FlowField;
        }
        field(50148;"Current Budget";Code[20])
        {
            TableRelation = "G/L Budget Name".Name;
        }
        field(59002;"Service Nos.";Code[10])
        {
            Caption = 'Service Nos.';
            TableRelation = "No. Series";
        }
        field(59003;"File Movement Nos";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(59004;"DMS Link";Text[70])
        {
            DataClassification = ToBeClassified;
        }
    }


    //Unsupported feature: Code Insertion on "OnDelete".

    //trigger OnDelete()
    //begin
        /*
        IF UserSetup.GET(USERID) THEN BEGIN
          IF NOT UserSetup."View Appraisals"=TRUE THEN
            ERROR(Text026);
        END;
        */
    //end;


    //Unsupported feature: Code Insertion on "OnModify".

    //trigger OnModify()
    //begin
        /*
        IF UserSetup.GET(USERID) THEN BEGIN
          IF NOT UserSetup."View Appraisals"=TRUE THEN
            ERROR(Text026);
        END;
        */
    //end;

    var
        UserSetup: Record "User Setup";
        Text026: label 'You do not have permission to change the general ledger setup. Please contact the system administrator.';
}

