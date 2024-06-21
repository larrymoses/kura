#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65021 "Research Authorship List"
{
    CardPageID = "Research Authorship Card";
    Editable = false;
    PageType = List;
    SourceTable = "Research Output Authorship";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Research Output Id";"Research Output Id")
                {
                    ApplicationArea = Basic;
                }
                field("Author No";"Author No")
                {
                    ApplicationArea = Basic;
                }
                field("Author Name";"Author Name")
                {
                    ApplicationArea = Basic;
                }
                field("Author Contribution(%)";"Author Contribution(%)")
                {
                    ApplicationArea = Basic;
                }
                field("Author Category";"Author Category")
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
