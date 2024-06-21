#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72718 "RMS PC Targets&Output"
{
    PageType = Card;
    SourceTable = "RMS PC Target Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project Type";"Project Type")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code";"Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date/Time";"Created Date/Time")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control10;"RMS PC Targets&Output Lines")
            {
                SubPageLink = "Document No"=field("Document No"),
                              "Project Type"=field("Project Type");
            }
        }
    }

    actions
    {
    }
}

