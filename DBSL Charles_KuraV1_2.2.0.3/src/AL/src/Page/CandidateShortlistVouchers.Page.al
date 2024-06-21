#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69704 "Candidate Shortlist Vouchers"
{
    ApplicationArea = Basic;
    Caption = 'Candidate Shortlist Vouchers';
    CardPageID = "Candidate Shortlist Voucher";
    Editable = false;
    PageType = List;
    SourceTable = "Candidate Selection Header";
    SourceTableView = where("Document Type"=filter("Candidate Shortlisting"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Lead HR Officer";"Lead HR Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status";"Document Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On";"Created On")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control37;Outlook)
            {
            }
            systempart(Control38;Notes)
            {
            }
            systempart(Control39;MyNotes)
            {
            }
            systempart(Control40;Links)
            {
            }
        }
    }

    actions
    {
    }
}

