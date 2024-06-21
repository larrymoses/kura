#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56099 "Case Hearing List"
{
    CardPageID = "Case Hearing Card";
    PageType = List;
    SourceTable = "Case Hearing";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Case Entry";"Case Entry")
                {
                    ApplicationArea = Basic;
                }
                field("Last Hearing Date";"Last Hearing Date")
                {
                    ApplicationArea = Basic;
                }
                field(Progress;Progress)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Next Hearing Date";"Next Hearing Date")
                {
                    ApplicationArea = Basic;
                }
                field("Advocate On Record";"Advocate On Record")
                {
                    ApplicationArea = Basic;
                }
                field("Bring Up Date";"Bring Up Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control8;Outlook)
            {
            }
            systempart(Control9;Notes)
            {
            }
            systempart(Control10;MyNotes)
            {
            }
            systempart(Control11;Links)
            {
            }
        }
    }

    actions
    {
    }
}

