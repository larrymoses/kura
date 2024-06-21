
Page 70125 "Contract Issuance Requirements"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Contract Issuance Requirements";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Document Type"; Rec."Procurement Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Document Link"; Rec."Document Link")
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = URL;
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Track Certificate Expiry"; Rec."Track Certificate Expiry")
                {
                    ApplicationArea = Basic;
                }
                field("Guidelines/Instruction"; Rec."Guidelines/Instruction")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Attach Document")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    DMSManagement.UploadContractDocs(Rec."Procurement Document Type", Rec.Description, Rec.RecordId, Rec."PRN No", Rec."Contract Index", Rec."Document ID");
                end;
            }
        }
    }

    var
        DMSManagement: Codeunit "DMS Management";
}


