#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72661 "Taken Over Sections"
{
    PageType = List;
    SourceTable = "Taking Over Section Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Taking Over Start Chainage";"Taking Over Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Taking Over End Chainage";"Taking Over End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Taking Over Length";"Taking Over Length")
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        TakingOverSection: Record "Taking Over Section";
}

