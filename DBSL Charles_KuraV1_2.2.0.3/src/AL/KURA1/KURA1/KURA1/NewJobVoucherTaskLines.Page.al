#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72506 "New Job Voucher Task Lines"
{
    PageType = ListPart;
    SourceTable = "New Job Voucher Task";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job No.";"Job No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No.";"Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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
            group("&Line")
            {
                Caption = '&Line';
                action("New Job Voucher Plan Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Plan Lines';
                    Image = Planning;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "New Job Voucher Plan Lines";
                    RunPageLink = "Document Type"=field("Document Type"),
                                  "Document No"=field("Document No."),
                                  "Job No."=field("Job No."),
                                  "Job Task No."=field("Job Task No.");
                }
            }
        }
    }
}

