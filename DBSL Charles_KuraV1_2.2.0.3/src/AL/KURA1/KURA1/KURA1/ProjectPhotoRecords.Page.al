#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72434 "Project Photo Records"
{
    ApplicationArea = Basic;
    CardPageID = "Project Photo Record";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Project Photo Record";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Photo ID";"Photo ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("External Reference No.";"External Reference No.")
                {
                    ApplicationArea = Basic;
                }
                field("Date Filed";"Date Filed")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Comments/Notes";"Additional Comments/Notes")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series";"No. Series")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

