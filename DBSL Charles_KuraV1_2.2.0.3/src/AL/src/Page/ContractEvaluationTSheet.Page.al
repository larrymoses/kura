#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72112 "Contract Evaluation T Sheet"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Contract Evaluation Tally Shee";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project No";"Project No")
                {
                    ApplicationArea = Basic;
                }
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Project Title";"Project Title")
                {
                    ApplicationArea = Basic;
                }
                field("Road Authority Code";"Road Authority Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Authority Name";"Road Authority Name")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No";"Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name";"Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Commencement";"Date of Commencement")
                {
                    ApplicationArea = Basic;
                }
                field("No. of elapsed months";"No. of elapsed months")
                {
                    ApplicationArea = Basic;
                }
                field("Project Manager Code";"Project Manager Code")
                {
                    ApplicationArea = Basic;
                }
                field("Project Manager Name";"Project Manager Name")
                {
                    ApplicationArea = Basic;
                }
                field("Road Manager Code";"Road Manager Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Manager Name";"Road Manager Name")
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

