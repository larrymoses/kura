#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69106 "Staff Establishment Plan Lines"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Staff Est Plan Lines";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job Title";"Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("Department Code";"Department Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name";"Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Code";"Directorate Code")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Name";"Directorate Name")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Establishment";"Approved Establishment")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Active";"Actual Active")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Suspended";"Actual Suspended")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Terminated";"Actual Terminated")
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

