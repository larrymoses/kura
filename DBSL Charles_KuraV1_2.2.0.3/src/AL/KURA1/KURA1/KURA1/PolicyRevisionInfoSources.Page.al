#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80191 "Policy Revision Info Sources"
{
    PageType = List;
    SourceTable = "Policy Revision Info Sources";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Policy ID";"Policy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Source Type";"Source Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("URL Link";"URL Link")
                {
                    ApplicationArea = Basic;
                }
                field("Revision No.";"Revision No.")
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

