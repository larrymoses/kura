#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95143 "Audit Testing Method Details"
{
    CardPageID = "Audit Testing Method Detail";
    PageType = List;
    SourceTable = "Audit Testing Method Detail";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Audit Testing Method ID";"Audit Testing Method ID")
                {
                    ApplicationArea = Basic;
                }
                field("Line No.";"Line No.")
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

