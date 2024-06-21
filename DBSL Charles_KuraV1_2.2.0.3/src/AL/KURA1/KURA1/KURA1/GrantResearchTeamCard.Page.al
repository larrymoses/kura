#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65037 "Grant Research Team Card"
{
    PageType = Card;
    SourceTable = "Grant Research Team";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Grant Opportunity ID";"Grant Opportunity ID")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Name";"Grant Name")
                {
                    ApplicationArea = Basic;
                }
                field("Researcher ID";"Researcher ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Primary Role";"Primary Role")
                {
                    ApplicationArea = Basic;
                }
                field("Role Description";"Role Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Grantor;Grantor)
                {
                    ApplicationArea = Basic;
                }
                field("Funding Decision";"Funding Decision")
                {
                    ApplicationArea = Basic;
                }
                field("Requested Amount(LCY)";"Requested Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Amount(LCY)";"Awarded Amount(LCY)")
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

