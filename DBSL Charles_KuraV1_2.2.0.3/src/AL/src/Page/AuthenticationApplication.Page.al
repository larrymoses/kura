#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56051 "Authentication Application"
{
    ApplicationArea = Basic;
    CardPageID = "Authentication Card";
    PageType = List;
    SourceTable = "Authentication Device Applicat";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Applicant No.";"Applicant No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Works";"Copyright Works")
                {
                    ApplicationArea = Basic;
                }
                field("Applicant Name";"Applicant Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Copyright Title";"Copyright Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Authentication Item";"Authentication Item")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Authentication Description";"Authentication Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Quantity Requested";"Quantity Requested")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Price";"Unit Price")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Amount Due";"Amount Due")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Minimum Quantity";"Minimum Quantity")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date Created";"Date Created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created";"Time Created")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Captured by";"Captured by")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Created;Created)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

