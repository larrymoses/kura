#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65038 "Grant Research Team list"
{
    CardPageID = "Grant Research Team Card";
    Editable = false;
    PageType = List;
    SourceTable = "Grant Research Team";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Grant Opportunity ID";"Grant Opportunity ID")
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
                }
                field("Primary Role";"Primary Role")
                {
                    ApplicationArea = Basic;
                }
                field("Role Description";"Role Description")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Name";"Grant Name")
                {
                    ApplicationArea = Basic;
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

