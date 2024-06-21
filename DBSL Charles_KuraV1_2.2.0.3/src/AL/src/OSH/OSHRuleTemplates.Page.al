#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69432 "OSH Rule Templates"
{
    //CardPageID = "OSH Rule Template";
    PageType = List;
    SourceTable = 69413;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Template ID"; "Template ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Last Review Date"; "Last Review Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Blocked)
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