#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56039 "Case Schedule List"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Document registration";
    SourceTableView = where("Court Date"=filter(<>''));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Case ID";"Case ID")
                {
                    ApplicationArea = Basic;
                }
                field("Court Date";"Court Date")
                {
                    ApplicationArea = Basic;
                }
                field("Case Title";"Case Title")
                {
                    ApplicationArea = Basic;
                }
                field("Accused Name";"Accused Name")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Investigator";"Assigned Investigator")
                {
                    ApplicationArea = Basic;
                }
                field("Date Created";"Date Created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created";"Time Created")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series";"No. Series")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12;Outlook)
            {
            }
            systempart(Control13;Notes)
            {
            }
            systempart(Control14;Links)
            {
            }
        }
    }

    actions
    {
    }
}

