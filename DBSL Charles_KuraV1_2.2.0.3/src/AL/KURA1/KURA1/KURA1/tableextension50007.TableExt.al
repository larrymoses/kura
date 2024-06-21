#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50007 "tableextension50007" extends "Vendor Ledger Entry" 
{

    //Unsupported feature: Property Insertion (Permissions) on ""Vendor Ledger Entry"(Table 25)".

    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Global Dimension 1 Code"(Field 23)".


        //Unsupported feature: Property Modification (Data type) on ""Global Dimension 2 Code"(Field 24)".

        field(70000;"Procurement Plan";Code[10])
        {
            
            TableRelation = "Procurement Header".No;
        }
        field(70001;"Procurement Plan Item";Code[10])
        {
            
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
            
            TableRelation = "Responsibility Center";
        }
        field(70003;"Project No";Code[40])
        {
            
            TableRelation = Job."No.";
        }
        field(70004;"Contractor No";Code[40])
        {
            
            TableRelation = Vendor."No.";
        }
        field(70005;"Earning Code"; Code[20])
        {
          
        }
    }


    //Unsupported feature: Code Modification on "ShowPostedDocAttachment(PROCEDURE 15)".

    //procedure ShowPostedDocAttachment();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE "Document Type" OF
          "Document Type"::Invoice:
            IF PurchInvHeader.GET("Document No.") THEN
              OpenDocumentAttachmentDetails(PurchInvHeader);
          "Document Type"::"Credit Memo":
            IF PurchCrMemoHdr.GET("Document No.") THEN
              OpenDocumentAttachmentDetails(PurchCrMemoHdr);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        CASE "Document Type" OF
          "Document Type"::Payment:
            IF PurchInvHeader.GET("Document No.") THEN
              OpenDocumentAttachmentDetails(PurchInvHeader);
          "Document Type"::Invoice:
        #6..8
        */
    //end;


    //Unsupported feature: Code Modification on "HasPostedDocAttachment(PROCEDURE 16)".

    //procedure HasPostedDocAttachment();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE "Document Type" OF
          "Document Type"::Invoice:
            IF PurchInvHeader.GET("Document No.") THEN
              EXIT(DocumentAttachment.HasPostedDocumentAttachment(PurchInvHeader));
          "Document Type"::"Credit Memo":
            IF PurchCrMemoHdr.GET("Document No.") THEN
              EXIT(DocumentAttachment.HasPostedDocumentAttachment(PurchCrMemoHdr));
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        CASE "Document Type" OF
          "Document Type"::Payment:
            IF PurchInvHeader.GET("Document No.") THEN
              EXIT(DocumentAttachment.HasPostedDocumentAttachment(PurchInvHeader));
          "Document Type"::Invoice:
        #6..8
        */
    //end;


    //Unsupported feature: Code Modification on "CopyFromGenJnlLine(PROCEDURE 6)".

    //procedure CopyFromGenJnlLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        "Vendor No." := GenJnlLine."Account No.";
        "Posting Date" := GenJnlLine."Posting Date";
        "Document Date" := GenJnlLine."Document Date";
        #4..36
        "Payment Method Code" := GenJnlLine."Payment Method Code";
        "Exported to Payment File" := GenJnlLine."Exported to Payment File";

        OnAfterCopyVendLedgerEntryFromGenJnlLine(Rec,GenJnlLine);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..39
         //added by daudi for procurement
        "Procurement Plan":="Procurement Plan";
        "Procurement Plan Item":="Procurement Plan Item";
        "Responsibility Center":="Responsibility Center";

        //Added by Fred For KERRA Contractor Payments
        "Project No":=GenJnlLine."Project No";
        "Contractor No":=GenJnlLine."Contractor No";

        OnAfterCopyVendLedgerEntryFromGenJnlLine(Rec,GenJnlLine);
        */
    //end;
}

