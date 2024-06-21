#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75006 "Procurement Law & Regulation"
{
    ApplicationArea = Basic;
    CardPageID = "Law & Regulation Card";
    PageType = List;
    SourceTable = "Procurement Law & Regulation";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
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
                Caption = 'Procurement Disputes';
            }
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Procurement Laws';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    DMSManagement.UploadProcurementLawsDocuments(Rec.Code, 'Procurement Laws', Rec.RecordId, 'R48');
                end;
            }
            action(AttachDocumentsM)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Procurement Manual';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    DMSManagement.UploadProcurementManualDocuments(Rec.Code, 'Procurement Manual', Rec.RecordId, 'R48');
                end;
            }
            action(AttachDocumentsC)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Procurement Circular';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;

                trigger OnAction()
                begin
                    DMSManagement.UploadProcurementCircularDocuments(Rec.Code, 'Procurement Circular', Rec.RecordId, 'R48');
                end;
            }
        }
    }

    var
        DMSManagement: Codeunit "DMS Management";
}

#pragma implicitwith restore

