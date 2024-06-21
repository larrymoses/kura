#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69825 "All Published  Vacancies List"
{
    ApplicationArea = Basic;
    CardPageID = "Insurance Headers";
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Recruitment Requisition Header";
    SourceTableView = where("Document Type"=const("Job Vacancy"),
                            "Approval Status"=const(Released));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Position ID";"Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status";"Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Applications";"No. of Applications")
                {
                    ApplicationArea = Basic;
                }
                field(Published;Published)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control41;Outlook)
            {
            }
            systempart(Control42;Notes)
            {
            }
            systempart(Control43;MyNotes)
            {
            }
            systempart(Control44;Links)
            {
            }
        }
    }

    actions
    {
    }
}

