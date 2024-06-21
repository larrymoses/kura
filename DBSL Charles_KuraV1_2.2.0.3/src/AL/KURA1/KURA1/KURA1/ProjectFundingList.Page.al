#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 52024 "Project Funding List"
{
    ApplicationArea = Basic;
    CardPageID = "Project Funding Contract Form";
    PageType = List;
    SourceTable = "Project Contract Header";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project Contract No"; "Project Contract No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Sponsor Name"; "Primary Sponsor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Start Date"; "Contract Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract End Date"; "Contract End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Status"; "Contract Status")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; "Created On")
                {
                    ApplicationArea = Basic;
                }
                // field("Study ID";"Study ID")
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
        area(factboxes)
        {
            systempart(Control14; Outlook)
            {
            }
            systempart(Control15; Notes)
            {
            }
            systempart(Control16; MyNotes)
            {
            }
            systempart(Control17; Links)
            {
            }
        }
    }

    actions
    {
    }
}

