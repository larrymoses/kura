#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75194 "Released Procurement Plan"
{
    ApplicationArea = Basic;
    CardPageID = "Procurement Plan Card";
    PageType = List;
    SourceTable = "Procurement Plan";
    SourceTableView = where("Approval Status"=const(Released));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategic Plan ID";"Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Budget ID";"Financial Budget ID")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code";"Financial Year Code")
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
            }
        }
        area(factboxes)
        {
            systempart(Control28;Outlook)
            {
            }
            systempart(Control29;Notes)
            {
            }
            systempart(Control30;MyNotes)
            {
            }
            systempart(Control31;Links)
            {
            }
        }
    }

    actions
    {
    }
}

