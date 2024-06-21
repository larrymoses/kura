#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65019 "Grants Setup List"
{
    CardPageID = "Grants Setup Card";
    Editable = false;
    PageType = List;
    SourceTable = "Grants Setup";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Research Iinfrastructure Nos";"Research Iinfrastructure Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Research Output Nos";"Research Output Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Researcher Nos";"Researcher Nos")
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

