#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72593 "Road Facility Rivers"
{
    CardPageID = "Road Facility River";
    PageType = List;
    SourceTable = "Road Facility River";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("No of Structures";"No of Structures")
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

