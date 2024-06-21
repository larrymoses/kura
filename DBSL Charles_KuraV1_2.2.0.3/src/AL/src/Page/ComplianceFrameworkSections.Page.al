#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95130 "Compliance Framework Sections"
{
    CardPageID = "Compliance Framework Section";
    PageType = List;
    SourceTable = "Compliance Framework Section";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Framework ID";"Framework ID")
                {
                    ApplicationArea = Basic;
                }
                field("Section Type";"Section Type")
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
                field("No. of Comments";"No. of Comments")
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

