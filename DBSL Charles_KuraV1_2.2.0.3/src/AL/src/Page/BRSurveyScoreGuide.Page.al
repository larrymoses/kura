#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80349 "BR Survey Score Guide"
{
    PageType = List;
    SourceTable = "BR Survey Score Guide";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Rating Type";"Rating Type")
                {
                    ApplicationArea = Basic;
                }
                field("Desired Perfomance Direction";"Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                }
                field("Response Value";"Response Value")
                {
                    ApplicationArea = Basic;
                }
                field("Score %";"Score %")
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

