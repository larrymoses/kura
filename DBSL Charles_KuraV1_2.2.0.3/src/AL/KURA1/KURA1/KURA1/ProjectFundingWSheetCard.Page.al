#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72063 "Project Funding W_Sheet Card"
{
    PageType = Card;
    SourceTable = "Project Funding Request Vouche";
    SourceTableView = where("Document Type"=filter(PFW));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Year Code";"Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date";"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date";"End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Region;Region)
                {
                    ApplicationArea = Basic;
                }
                field(Directorate;Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department;Department)
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Default Works Category";"Default Works Category")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date";"Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Time";"Creation Time")
                {
                    ApplicationArea = Basic;
                }
                field("Default Funding Source";"Default Funding Source")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Funding Total Value(LCY)";"Funding Total Value(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("PFV No";"PFV No")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency Code";"Constituency Code")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control25;"Project Funding W_Sheet Line")
            {
                SubPageLink = "Document No"=field("Document No");
            }
        }
        area(factboxes)
        {
            systempart(Control21;Outlook)
            {
            }
            systempart(Control22;Notes)
            {
            }
            systempart(Control23;MyNotes)
            {
            }
            systempart(Control24;Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('APproval Request has  been send');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('APproval Request has  been canceled');
                end;
            }
            action("Approval Entries")
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = PostDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    Message('Posted Successfully');
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type":="document type"::PFW;
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}

