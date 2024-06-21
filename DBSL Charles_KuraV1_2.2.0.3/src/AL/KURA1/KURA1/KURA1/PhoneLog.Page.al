#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69777 "Phone Log"
{
    PageType = ListPart;
    SourceTable = "PreScreening Phone Log";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Phone Interview Template ID";"Phone Interview Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Question ID";"Question ID")
                {
                    ApplicationArea = Basic;
                }
                field("Question Asked";"Question Asked")
                {
                    ApplicationArea = Basic;
                }
                field("General Rating";"General Rating")
                {
                    ApplicationArea = Basic;
                }
                field("Response Rating %";"Response Rating %")
                {
                    ApplicationArea = Basic;
                }
                field("Comments/Notes";"Comments/Notes")
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

