#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80219 "Policy Framework Article Rev"
{
    PageType = List;
    SourceTable = "Policy Framework Article Rev";

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
                field("Framework Code";"Framework Code")
                {
                    ApplicationArea = Basic;
                }
                field("Implication ID";"Implication ID")
                {
                    ApplicationArea = Basic;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("External Document No.";"External Document No.")
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

