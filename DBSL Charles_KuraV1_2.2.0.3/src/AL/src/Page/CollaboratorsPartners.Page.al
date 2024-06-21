#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80214 "Collaborators & Partners"
{
    PageType = List;
    SourceTable = "Colaborators & Partners";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Contact Type";"Contact Type")
                {
                    ApplicationArea = Basic;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
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

