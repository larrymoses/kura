#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56057 "Renewal CMO List"
{
    ApplicationArea = Basic;
    CardPageID = "CMO Renewal";
    PageType = List;
    SourceTable = "CMO Registration";
    SourceTableView = where(Type=filter(Renewal));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date";"Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Time";"Creation Time")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Name of society";"Name of society")
                {
                    ApplicationArea = Basic;
                }
                field("Address of society";"Address of society")
                {
                    ApplicationArea = Basic;
                }
                field("Physical address";"Physical address")
                {
                    ApplicationArea = Basic;
                }
                field(Class;Class)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
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

