#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75390 "IFS Appeal Entries"
{
    Editable = false;
    PageType = List;
    SourceTable = "IFS Appeal Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code";"IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No";"Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Response No";"Bid Response No")
                {
                    ApplicationArea = Basic;
                }
                field("Appeal Date";"Appeal Date")
                {
                    ApplicationArea = Basic;
                }
                field(Decision;Decision)
                {
                    ApplicationArea = Basic;
                }
                field("Date of Verdict";"Date of Verdict")
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
                {
                    ApplicationArea = Basic;
                }
                field("Posted By";"Posted By")
                {
                    ApplicationArea = Basic;
                }
                field("Notice of Award No.";"Notice of Award No.")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date";"Posting Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control16;Outlook)
            {
            }
            systempart(Control17;Notes)
            {
            }
            systempart(Control18;MyNotes)
            {
            }
            systempart(Control19;Links)
            {
            }
        }
    }

    actions
    {
    }
}

