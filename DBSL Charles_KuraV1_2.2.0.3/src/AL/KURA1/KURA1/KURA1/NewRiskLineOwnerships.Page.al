#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95058 "New Risk Line Ownerships"
{
    CardPageID = "New Risk Line Ownership";
    PageType = List;
    SourceTable = "New Risk Line Ownership";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Risk ID";"Risk ID")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center ID";"Responsibility Center ID")
                {
                    ApplicationArea = Basic;
                }
                field(Desciption;Desciption)
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Officer No.";"Responsible Officer No.")
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

