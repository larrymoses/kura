#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72608 "Project Material Template"
{
    PageType = Card;
    SourceTable = "Project Material Template Head";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Template ID";"Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Type";"Project Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control7;"Project Material Temp. SubPage")
            {
                Caption = 'Materials';
                SubPageLink = "Template ID"=field("Template ID");
            }
        }
    }

    actions
    {
    }
}

