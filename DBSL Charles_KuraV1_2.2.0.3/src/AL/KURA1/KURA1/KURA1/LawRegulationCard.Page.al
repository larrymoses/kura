#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75007 "Law & Regulation Card"
{
    PageType = Card;
    SourceTable = "Procurement Law & Regulation";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Versions"; Rec."No. of Versions")
                {
                    ApplicationArea = Basic;
                }
                field("Current Version No"; Rec."Current Version No")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox1")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(70096);
            }
            systempart(Control10; Outlook)
            {
            }
            systempart(Control11; Notes)
            {
            }
            systempart(Control12; MyNotes)
            {
            }
            systempart(Control13; Links)
            {
                //caption = 'Attach Procurement Laws & Acts';
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Versions)
            {
                ApplicationArea = Basic;
                Image = Versions;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Proc Regulation Version";
                RunPageLink = "Primary Document No" = field(Code);
            }
            action("Procurement Disputes")
            {
                ApplicationArea = Basic;
            }
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Document';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    //DMSManagement.UploadProcurementLawsDocuments(Cod 'Procurement Laws', RecordId, d,"Primary Region");
                end;
            }
        }
    }

    var
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
}

#pragma implicitwith restore

