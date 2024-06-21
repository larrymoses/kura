#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 58999 "Licencing Type"
{
    PageType = List;
    SourceTable = "Licence Types";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Licence Type Code";"Licence Type Code")
                {
                    ApplicationArea = Basic;
                }
                field("Licence Type Description";"Licence Type Description")
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

