#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80355 "BR Response Score Guide"
{
    PageType = List;
    SourceTable = "BR Response Score Guide";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Survey Response ID";"Survey Response ID")
                {
                    ApplicationArea = Basic;
                }
                field("Section Code";"Section Code")
                {
                    ApplicationArea = Basic;
                }
                field("Question ID";"Question ID")
                {
                    ApplicationArea = Basic;
                }
                field("Line No";"Line No")
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

