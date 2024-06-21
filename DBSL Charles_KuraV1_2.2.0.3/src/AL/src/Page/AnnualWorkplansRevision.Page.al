#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80372 "Annual Workplans Revision"
{
    ApplicationArea = Basic;
    Caption = 'Annual Workplans Revision';
    CardPageID = "Annual Workplan Revision Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Annual Workplan Revision";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field("Annual Workplan";"Annual Workplan")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Plan ID";"Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Year Reporting Code";"Year Reporting Code")
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
    }

    actions
    {
    }
}

