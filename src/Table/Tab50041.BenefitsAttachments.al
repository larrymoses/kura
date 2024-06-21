table 50041 "Benefits Attachments"
{
    Caption = 'Benefits Attachments';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Benefit Category";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Benefits Matrix Setup"."Line No.";

            trigger OnValidate()
            begin
                BenefitsMatrixSetup.RESET;
                BenefitsMatrixSetup.SETRANGE("Line No.","Benefit Category");
                IF BenefitsMatrixSetup.FINDFIRST THEN BEGIN
                  "Benefit Description":=BenefitsMatrixSetup."Benefit Description";
                END;
            end;
        }
        field(3;"Benefit Description";Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Attachment Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Attachment Setup";

            trigger OnValidate()
            begin
                AttachmentSetup.RESET;
                AttachmentSetup.SETRANGE(Code,"Attachment Code");
                IF AttachmentSetup.FINDFIRST THEN BEGIN
                  "Attachment Description":=AttachmentSetup."Attachment Description";
                END
            end;
        }
        field(5;"Attachment Description";Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Attachment Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Mandatory,Optional';
            OptionMembers = Mandatory,Optional;
        }
    }

    keys
    {
        key(Key1;"Line No")
        {
        }
    }

    fieldgroups
    {
    }

    var
        AttachmentSetup: Record "Attachment Setup";
        BenefitsMatrixSetup: Record "Benefits Matrix Setup";
}

