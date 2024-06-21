#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50005 "tableextension50005" extends "Cust. Ledger Entry" 
{
    fields
    {
        field(1201;"Project No";Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(1202;"Contractor No";Code[40])
        {
            DataClassification = ToBeClassified;
        }
    }


    //Unsupported feature: Code Insertion on "OnInsert".

    //trigger OnInsert()
    //var
        //GenJnlPostPreview: Codeunit "Gen. Jnl.-Post Preview";
    //begin
        /*
        //GenJnlPostPreview.SaveCustLedgEntry(Rec);
        */
    //end;


    //Unsupported feature: Code Modification on "CopyFromGenJnlLine(PROCEDURE 6)".

    //procedure CopyFromGenJnlLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        "Customer No." := GenJnlLine."Account No.";
        "Posting Date" := GenJnlLine."Posting Date";
        "Document Date" := GenJnlLine."Document Date";
        #4..36
        "Payment Method Code" := GenJnlLine."Payment Method Code";
        "Exported to Payment File" := GenJnlLine."Exported to Payment File";

        OnAfterCopyCustLedgerEntryFromGenJnlLine(Rec,GenJnlLine);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..39
        //Added By Fred To Cater for KERRA Contractor Payments
        "Project No":=GenJnlLine."Project No";
        "Contractor No":=GenJnlLine."Contractor No";

        OnAfterCopyCustLedgerEntryFromGenJnlLine(Rec,GenJnlLine);
        */
    //end;
}

