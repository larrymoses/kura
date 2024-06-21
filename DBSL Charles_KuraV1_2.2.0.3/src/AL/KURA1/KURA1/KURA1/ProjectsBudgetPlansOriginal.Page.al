#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65114 "Projects Budget Plans-Original"
{
    ApplicationArea = Jobs;
    Caption = 'Projects Budget Plans';
    CardPageID = "Budget Plan Card-Original";
    Editable = false;
    PageType = List;
    SourceTable = "Project Budget Header";
    SourceTableView = where("Budget Type"=const(Original),
                            "Procurement Plan"=const(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Project Budget ID";"Project Budget ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Type";"Budget Type")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code";"Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status";"Approval Status")
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
