#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95000 "StakeHolders"
{
    CardPageID = Stakeholder;
    Editable = false;
    PageType = List;
    SourceTable = Stakeholder;

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
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Stakeholder Type";"Stakeholder Type")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Default Form ID";"Default Form ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9;Outlook)
            {
            }
            systempart(Control10;Notes)
            {
            }
            systempart(Control11;MyNotes)
            {
            }
            systempart(Control12;Links)
            {
            }
        }
    }

    actions
    {
    }
}

