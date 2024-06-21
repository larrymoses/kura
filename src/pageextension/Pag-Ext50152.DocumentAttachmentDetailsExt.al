pageextension 50152 "Document Attachment DetailsExt" extends "Document Attachment Details"
{
    layout{
        addafter(Name)
        {
            field("Contract Document Type";Rec."Contract Document Type")
            {
                Visible =TypeVisible;
                ApplicationArea = All;
            }
        }

    }
    trigger OnAfterGetRecord()
    begin
        TypeVisible := (Rec."Document Type" = Rec."Document Type"::"Blanket Order") and (Rec."Table ID" = 38);
    end;
    trigger OnAfterGetCurrRecord()
    begin
        TypeVisible := (Rec."Document Type" = Rec."Document Type"::"Blanket Order") and (Rec."Table ID"= 38);
    end;

    var
    TypeVisible: Boolean;
}
