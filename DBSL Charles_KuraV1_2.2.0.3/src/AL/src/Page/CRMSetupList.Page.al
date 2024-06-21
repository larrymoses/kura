#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56060 "CRM Setup List"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Crm General Setup.";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Primary key";"Primary key")
                {
                    ApplicationArea = Basic;
                }
                field("Lead Nos";"Lead Nos")
                {
                    ApplicationArea = Basic;
                }
                field("General Enquiries Nos";"General Enquiries Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Cases nos";"Cases nos")
                {
                    ApplicationArea = Basic;
                }
                field("Crm logs Nos";"Crm logs Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Training Nos";"Training Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Customer App Nos";"Customer App Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Feedback Nos";"Customer Feedback Nos")
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

