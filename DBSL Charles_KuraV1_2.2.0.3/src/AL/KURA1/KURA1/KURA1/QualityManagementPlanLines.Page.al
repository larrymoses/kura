#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72545 "Quality Management Plan Lines"
{
    PageType = ListPart;
    SourceTable = "QM Plan Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Plan ID";"Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Type";"Inspection Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Responsibility;Responsibility)
                {
                    ApplicationArea = Basic;
                }
                field("Project Supervision Template";"Project Supervision Template")
                {
                    ApplicationArea = Basic;
                }
                field("Scheduled Start Date";"Scheduled Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Scheduled End Date";"Scheduled End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Start Date";"Actual Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Actual End Date";"Actual End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Corrective Orders Issued";"Corrective Orders Issued")
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
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

