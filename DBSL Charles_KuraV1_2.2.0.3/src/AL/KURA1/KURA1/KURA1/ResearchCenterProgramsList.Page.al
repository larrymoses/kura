#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65005 "Research Center Programs List"
{
    CardPageID = "Research Center Programs Card";
    Editable = false;
    PageType = List;
    SourceTable = "Research Center Programs";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Center Code";"Center Code")
                {
                    ApplicationArea = Basic;
                }
                field("Center Name";"Center Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Program Code";"Program Code")
                {
                    ApplicationArea = Basic;
                }
                field("Program Name";"Program Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Blocked;Blocked)
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

