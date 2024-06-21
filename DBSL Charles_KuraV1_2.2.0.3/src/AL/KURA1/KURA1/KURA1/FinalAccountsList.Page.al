#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72612 "Final Accounts List"
{
    ApplicationArea = Basic;
    CardPageID = "Final Account";
    PageType = List;
    SourceTable = "Final Account";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contract ID";"Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Start Date";"Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End Date";"Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Template ID";"Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Defects Liability Period";"Defects Liability Period")
                {
                    ApplicationArea = Basic;
                }
                field("DLP Start Date";"DLP Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("DLP End Date";"DLP End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Sum";"Contract Sum")
                {
                    ApplicationArea = Basic;
                }
                field("Payments to Date";"Payments to Date")
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

