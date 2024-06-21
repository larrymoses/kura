#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50017 "tableextension50017" extends "Item Journal Line" 
{
    fields
    {
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
        field(70000;"Procurement Plan";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Header".No;
        }
        field(70001;"Procurement Plan Item";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan1"."Plan Item No" where ("Plan Year"=field("Procurement Plan"));

            trigger OnValidate()
            begin
                
                  /* ProcurementPlan.RESET;
                  ProcurementPlan.SETRANGE(ProcurementPlan."Plan Item No","Procurement Plan Item");
                 IF ProcurementPlan.FIND('-') THEN BEGIN
                 IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Goods THEN BEGIN
                   Type:=Type::Item;
                   No:=ProcurementPlan."No.";
                 END;
                 IF ProcurementPlan."Procurement Type"<>ProcurementPlan."Procurement Type"::Service THEN BEGIN
                  Type:=Type::"Non Stock";
                  No:=ProcurementPlan."Source of Funds";
                 END;
                   "Budget Line":=ProcurementPlan."Source of Funds";
                    Description:=ProcurementPlan."Item Description";
                   "Unit of Measure":=ProcurementPlan."Unit of Measure";
                   "Unit Price":=ProcurementPlan."Unit Price";
                 END;
                */

            end;
        }
        field(70002;"Responsibility Center";Code[10])
        {
            Caption = 'Responsibility Center';
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(70087;"Primary Region";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const(Region));
        }
        field(70088;"Primary Directorate";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const(Directorate));
        }
        field(70089;"Primary Department";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=const("Department/Center"),
                                                                "Direct Reports To"=field("Primary Directorate"));
        }
        field(70090;Consitituency;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=const(Constituency),
                                                                "Direct Reports To"=field("Primary Region"));
        }
    }


    //Unsupported feature: Code Modification on "CopyFromPurchLine(PROCEDURE 160)".

    //procedure CopyFromPurchLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        "Item No." := PurchLine."No.";
        Description := PurchLine.Description;
        "Shortcut Dimension 1 Code" := PurchLine."Shortcut Dimension 1 Code";
        #4..41
        "Overhead Rate" := PurchLine."Overhead Rate";
        "Return Reason Code" := PurchLine."Return Reason Code";

        OnAfterCopyItemJnlLineFromPurchLine(Rec,PurchLine);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..44
        //added by daudi
        "Responsibility Center":=PurchLine."Responsibility Center";
        "Procurement Plan":=PurchLine."Procurement Plan";
        "Procurement Plan Item":=PurchLine."Procurement Plan Item";

        OnAfterCopyItemJnlLineFromPurchLine(Rec,PurchLine);
        */
    //end;


    //Unsupported feature: Code Modification on "CopyFromServHeader(PROCEDURE 59)".

    //procedure CopyFromServHeader();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        "Document Date" := ServiceHeader."Document Date";
        "Order Date" := ServiceHeader."Order Date";
        "Source Posting Group" := ServiceHeader."Customer Posting Group";
        #4..7
        "Source No." := ServiceHeader."Customer No.";
        "Shpt. Method Code" := ServiceHeader."Shipment Method Code";

        OnAfterCopyItemJnlLineFromServHeader(Rec,ServiceHeader);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..10


        OnAfterCopyItemJnlLineFromServHeader(Rec,ServiceHeader);
        */
    //end;
}

