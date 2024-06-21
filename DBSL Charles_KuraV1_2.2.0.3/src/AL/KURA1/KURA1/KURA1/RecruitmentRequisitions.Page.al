#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69626 "Recruitment Requisitions"
{
    ApplicationArea = Basic;
    CardPageID = "Recruitment Requisition";
    Editable = false;
    PageType = List;
    SourceTable = "Recruitment Requisition Header";
    SourceTableView = where("Document Type"=filter("Recruitment Requisition"));
    UsageCategory = Tasks;

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
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Plan ID";"Recruitment Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Plan Type";"Recruitment Plan Type")
                {
                    ApplicationArea = Basic;
                }
                field("Position ID";"Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title/Designation";"Job Title/Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Requester ID";"Requester ID")
                {
                    ApplicationArea = Basic;
                }
                field("Requester Staff No";"Requester Staff No")
                {
                    ApplicationArea = Basic;
                }
                field("Requester Name";"Requester Name")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate;Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department;Department)
                {
                    ApplicationArea = Basic;
                }
                field(Region;Region)
                {
                    ApplicationArea = Basic;
                }
                field("Finacial Year Code";"Finacial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status";"Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On";"Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time";"Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control20;Outlook)
            {
            }
            systempart(Control21;Notes)
            {
            }
            systempart(Control22;MyNotes)
            {
            }
            systempart(Control23;Links)
            {
            }
        }
    }

    actions
    {
    }
}

