#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72599 "WorkPlan Document Attachments"
{
    CardPageID = "WorkPlan Document Attachment";
    PageType = List;
    SourceTable = "Road WorkPlan Document Attach";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Work Program ID"; Rec."Road Work Program ID")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Entry No"; Rec."Budget Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                }
                field("KeRRA Budget Code"; Rec."KeRRA Budget Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'KURA Budget Code';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Attached; Rec.Attached)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }

            }
        }
        area(factboxes)
        {
            systempart(Control8; Links)
            {
                Caption = 'Tender Documents Attachments';
                visible = false;
            }
            part("Attached Documents1"; "Document Attachment Factbox1")
            {
                ApplicationArea = All;
                Caption = 'Attachment Tender Documents Attachments';
                SubPageLink = "Table ID" = const(72304);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Attach Docs")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    DMSManagement.UploadStaffClaimDocuments(DocType."document type"::"Transport Requisition", Rec."Road Work Program ID", 'Testing', Rec.RecordId, '');
                    Rec.Attached := true;
                    Rec.Modify();
                end;
            }
        }
    }

    var
        DMSManagement: Codeunit "DMS Management";
        DocType: Record "DMS Documents";
}

#pragma implicitwith restore

