#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95060 "New Risk Line Response Actions"
{
    CardPageID = "New Risk Line Response Action";
    PageType = List;
    SourceTable = "New Risk Line Resp. Action";

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
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk ID";"Risk ID")
                {
                    ApplicationArea = Basic;
                }
                field("Action ID";"Action ID")
                {
                    ApplicationArea = Basic;
                }
                field("Activity Description";"Activity Description")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Officer No.";"Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Action Status";"Action Status")
                {
                    ApplicationArea = Basic;
                }
                field("Percentage Complete";"Percentage Complete")
                {
                    ApplicationArea = Basic;
                }
                field("Task Priority";"Task Priority")
                {
                    ApplicationArea = Basic;
                }
                field("Action Type";"Action Type")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Date Done";"Actual Date Done")
                {
                    ApplicationArea = Basic;
                    Caption = 'Actual Start Date';
                }
                field("Planned Start Date";"Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Due Date";"Planned Due Date")
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

