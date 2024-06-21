#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72559 "Project Supervision Template"
{
    PageType = Card;
    SourceTable = "Project Supervision Template";

    layout
    {
        area(content)
        {
            group(General)
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
                field(Type;Type)
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
            part(Control11;"Supervision Template Cat Lines")
            {
                SubPageLink = "Document Type"=field("Document Type"),
                              "Template ID"=field("Template ID");
            }
        }
    }

    actions
    {
    }
}

