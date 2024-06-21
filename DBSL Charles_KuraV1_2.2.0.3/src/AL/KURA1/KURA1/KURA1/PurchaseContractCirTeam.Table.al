#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72330 "Purchase Contract Cir Team"
{
    DrillDownPageID = "Puchase Contract Signatories";
    LookupPageID = "Puchase Contract Signatories";

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials,Taking Over Inspection,End of DLP Inspection';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials","Taking Over Inspection","End of DLP Inspection";
        }
        field(2; No; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4; "Signatory Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Procuring Entity Authorizer,Procuring Entity Witness,Vendor Authorizer,Vendor Witness';
            OptionMembers = " ","Procuring Entity Authorizer","Procuring Entity Witness","Vendor Authorizer","Vendor Witness";
        }
        field(5; "Representative Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Contract Signing Role"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Executed on behalf of"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Email; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Execution Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Stakeholder ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Description; Text[500])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document Type", No, "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Execution Date" := Today;
    end;
}

