#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69763 "Employment Offers"
{
    ApplicationArea = Basic;
    CardPageID = "Employment Offer";
    Editable = false;
    PageType = List;
    SourceTable = "Employment Offer";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Offer ID";"Offer ID")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Panel Interview Report ID";"Panel Interview Report ID")
                {
                    ApplicationArea = Basic;
                }
                field("Application No.";"Application No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("External Document No.";"External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employment Start Date";"Employment Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Start Period";"Payroll Start Period")
                {
                    ApplicationArea = Basic;
                }
                field("Offer Expiration Date";"Offer Expiration Date")
                {
                    ApplicationArea = Basic;
                }
                field("Offer Acceptance Status";"Offer Acceptance Status")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status";"Document Status")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status";"Approval Status")
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
            systempart(Control64;Outlook)
            {
            }
            systempart(Control65;Notes)
            {
            }
            systempart(Control66;MyNotes)
            {
            }
            systempart(Control67;Links)
            {
            }
        }
    }

    actions
    {
    }
}

