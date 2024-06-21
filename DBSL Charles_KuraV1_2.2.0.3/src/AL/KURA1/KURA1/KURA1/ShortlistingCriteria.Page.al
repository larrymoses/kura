#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69142 "Shortlisting Criteria"
{
    PageType = List;
    SourceTable = "Shortlist Criteria";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requisition No.";"Requisition No.")
                {
                    ApplicationArea = Basic;
                }
                field("Shortlist Criteria";"Shortlist Criteria")
                {
                    ApplicationArea = Basic;
                }
                field("Shortlist Description";"Shortlist Description")
                {
                    ApplicationArea = Basic;
                }
                field(Requirement;Requirement)
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
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

