#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72558 "Project Supervision Templates"
{
    CardPageID = "Project Supervision Template";
    PageType = List;
    SourceTable = "Project Supervision Template";
    SourceTableView = where("Project Stage"=filter(Execution));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Template ID";"Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Stage";"Project Stage")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Supervisor";"Primary Supervisor")
                {
                    ApplicationArea = Basic;
                }
                field("Default Response Type";"Default Response Type")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date";"Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
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

