#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75296 "IFS Purchase Activity Schedule"
{
    PageType = List;
    SourceTable = "IFS Purchase Activity Schedule";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Plan ID";"Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("PP Entry";"PP Entry")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Category";"Planning Category")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method";"Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Activity Code";"Activity Code")
                {
                    ApplicationArea = Basic;
                }
                field("Default Planned Duration(Days)";"Default Planned Duration(Days)")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Duration (Days)";"Actual Duration (Days)")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Dates";"Planned Dates")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Dates";"Actual Dates")
                {
                    ApplicationArea = Basic;
                }
                field("Line no";"Line no")
                {
                    ApplicationArea = Basic;
                }
                field("Solicitation Type";"Solicitation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Activity Description";"Activity Description")
                {
                    ApplicationArea = Basic;
                }
                field("Document No";"Document No")
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

