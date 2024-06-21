#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50010 "tableextension50010" extends "Sales Header" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Bill-to Customer No."(Field 4).OnValidate".

        //trigger "(Field 4)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TestStatusOpen;
            BilltoCustomerNoChanged := xRec."Bill-to Customer No." <> "Bill-to Customer No.";
            IF BilltoCustomerNoChanged THEN
            #4..40
              DATABASE::"Responsibility Center","Responsibility Center",
              DATABASE::"Customer Template","Bill-to Customer Template Code");

            VALIDATE("Payment Terms Code");
            VALIDATE("Prepmt. Payment Terms Code");
            VALIDATE("Payment Method Code");
            #47..60

            IF (xRec."Bill-to Customer No." <> '') AND (xRec."Bill-to Customer No." <> "Bill-to Customer No.") THEN
              RecallModifyAddressNotification(GetModifyBillToCustomerAddressNotificationId);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..43

            IF UserSetup.GET(USERID) THEN
            "Responsibility Center":=UserSetup."Purchase Resp. Ctr. Filter";


            #44..63
            */
        //end;

        //Unsupported feature: Property Deletion (Editable) on "Status(Field 120)".

        field(50020;"Shortcut Dimension 3 Code";Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021;"Shortcut Dimension 4 Code";Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022;"Shortcut Dimension 5 Code";Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
        field(50023;Cancelled;Boolean)
        {
        }
        field(50024;"Cancelled By";Code[20])
        {
        }
        field(50025;"Cancelled Date";Date)
        {
        }
        field(50026;"Created By";Code[20])
        {
        }
        field(50027;"Created Date Time";DateTime)
        {
        }
        field(50028;Type;Option)
        {
            OptionCaption = 'Normal,Authentication Device';
            OptionMembers = Normal,"Authentication Device";
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        InitInsert;
        InsertMode := TRUE;

        #4..15

        // Remove view filters so that the cards does not show filtered view notification
        SETVIEW('');
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..18

        IF UserSetup.GET(USERID) THEN BEGIN
        "Responsibility Center":=UserSetup."Purchase Resp. Ctr. Filter";
        END;
        */
    //end;


    //Unsupported feature: Code Modification on "InitRecord(PROCEDURE 10)".

    //procedure InitRecord();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SalesSetup.GET;
        IsHandled := FALSE;
        OnBeforeInitRecord(Rec,IsHandled);
        #4..71

        UpdateOutboundWhseHandlingTime;

        "Responsibility Center" := UserSetupMgt.GetRespCenter(0,"Responsibility Center");
        "Doc. No. Occurrence" := ArchiveManagement.GetNextOccurrenceNo(DATABASE::"Sales Header","Document Type","No.");

        OnAfterInitRecord(Rec);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..74
        //"Responsibility Center" := UserSetupMgt.GetRespCenter(0,"Responsibility Center");
        #76..78
        */
    //end;

    var
        UserSetup: Record "User Setup";
}

