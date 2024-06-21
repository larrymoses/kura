#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72568 "Supervision Template SubPage"
{
    PageType = ListPart;
    SourceTable = "Supervision Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Template ID";"Template ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Category ID";"Category ID")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("Requirement ID";"Requirement ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Weight";"Maximum Weight")
                {
                    ApplicationArea = Basic;
                }
                field("Response Type";"Response Type")
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

