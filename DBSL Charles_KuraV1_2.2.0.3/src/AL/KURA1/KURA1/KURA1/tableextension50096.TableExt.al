#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50096 "tableextension50096" extends "Document Attachment"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""No."(Field 3)".

        // modify("Document Type")
        // {
        //    // OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Plaintiffs,Defendants,Court Hearings,HR Case,Imprest Memo,General,Payment Voucher,Certificate,Contract,Licence,Warrant,ID Document';

        //     //Unsupported feature: Property Modification (OptionString) on ""Document Type"(Field 13)".

        // }
        modify("No.")
        {
            trigger OnBeforeValidate()
            begin
                rec."Document Nunmber" := "No.";
            end;

            trigger OnAfterValidate()
            begin
                rec."Document Nunmber" := "No.";
            end;

        }
        field(50000; "Document Nunmber"; Code[50])
        {
            
        }
        field(115; "Document Categories"; Option)
        {
            Caption = 'Document Type';
            
            OptionCaption = 'General,Receipt,Quote,Order,Invoice,Credit Memo,Blanket Order,Payment Voucher,Certificate,Contract,Licence,Warrant,ID Document,Imprest Memo';
            OptionMembers = General,Receipt,Quote,"Order",Invoice,"Credit Memo","Blanket Order","Payment Voucher",Certificate,Contract,Licence,Warrant,"ID Document","Imprest Memo";
        }
        field(16; "Category Name"; Text[50])
        {
            
        }
        field(17; "URL1"; Text[150])
        {
            
            ExtendedDatatype = URL;
        }
        field(18; "Contract Document Type"; Code[30])
        {
            TableRelation = "Contract Required Documents"."Document Type";
        }
    }

    keys
    {
        // Unsupported feature: Key containing base fields
        // key(Key1;"No.")
        // {
        // }
    }
    trigger OnInsert()
    var

    begin
        rec."Document Nunmber" := rec."No.";
    end;

    trigger ondelete()
    var
        RecRef: RecordRef;
    begin
        Customfunction.CheckDocAttachmentStatusOpen(Rec, RecRef);
    end;

    var
        Customfunction: Codeunit "Custom Function";

}

