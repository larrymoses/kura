#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95043 "RMP Line Job Tasks"
{
    CardPageID = "RMP Line Job Task";
    PageType = List;
    SourceTable = "RMP Line Job Task";

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
                field("Job No";"Job No")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No";"Job Task No")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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

