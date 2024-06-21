#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72505 "New Job Voucher Task"
{
    PageType = Card;
    SourceTable = "New Job Voucher Task";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
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
                field("Roads Category";"Roads Category")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Section ID";"Road Section ID")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

