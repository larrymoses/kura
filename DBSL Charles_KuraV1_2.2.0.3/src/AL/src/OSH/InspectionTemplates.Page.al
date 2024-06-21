#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69439 "Inspection Templates"
{
    //CardPageID = "Inspection Template";
    Editable = false;
    PageType = List;
    SourceTable = 69418;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Inspection Type"; "Inspection Type")
                {
                    ApplicationArea = Basic;
                }
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
