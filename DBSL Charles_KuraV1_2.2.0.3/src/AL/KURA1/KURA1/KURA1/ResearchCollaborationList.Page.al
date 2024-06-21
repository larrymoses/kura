#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65023 "Research Collaboration List"
{
    CardPageID = "Research Affiliation Card";
    Editable = false;
    PageType = List;
    SourceTable = "Research Output Affiliations";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Research Output ID";"Research Output ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contact ID";"Contact ID")
                {
                    ApplicationArea = Basic;
                }
                field("Affiliation Details";"Affiliation Details")
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

