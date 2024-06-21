table 99471 "Contract Required Documents"
{
    Caption = 'Contract Required Documents';
    
    
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Document Type";Code[30] )
        {
            Caption = 'Document Type';
            TableRelation = "Procurement Document Type".Code where("Document Class" =const("Contract Stage"));
            trigger OnValidate()
            begin
                ProcurementDocumentType.Reset;
                ProcurementDocumentType.SetRange(Code,"Document Type");
                if ProcurementDocumentType.Findfirst() then begin
                  "Document Description":=ProcurementDocumentType.Description;
                end;
            end;
        }
        field(3; "Document Description";Text[250] )
        {
            Caption = 'Description';
        }
          field(4;"Requirement Type";Option)
        {
            
            OptionCaption = ',Mandatory,Optional';
            OptionMembers = ,Mandatory,Optional;
        }
         field(5;"Guidelines/Instruction";Text[300])
        {
            
        }
    }
    keys
    {
        key(PK; "Document No.","Document Type")
        {
            Clustered = true;
        }
    }
    
    var
        ProcurementDocumentType: Record "Procurement Document Type";
}
