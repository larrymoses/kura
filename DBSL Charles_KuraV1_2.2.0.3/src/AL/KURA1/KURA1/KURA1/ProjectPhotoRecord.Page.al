#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72435 "Project Photo Record"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Project Photo Record";

    layout
    {
        area(content)
        {
            group(General)
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
                field("Contractor No";"Contractor No")
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

