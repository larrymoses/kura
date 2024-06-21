#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72110 "Montly Evaluation Header"
{
    PageType = Card;
    SourceTable = "Montly Evaluation Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Project No";"Project No")
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
                field("Date Checked";"Date Checked")
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
                field("No. Of Elapsed Months";"No. Of Elapsed Months")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control13;"Monthly Evaluation Line")
            {
                SubPageLink = "Project No"=field("Project No"),
                              "Contractor No"=field("Contractor No");
            }
        }
    }

    actions
    {
    }
}

