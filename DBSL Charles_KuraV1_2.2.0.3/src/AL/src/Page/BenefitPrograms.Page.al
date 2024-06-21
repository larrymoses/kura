#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69782 "Benefit Programs"
{
    PageType = List;
    SourceTable = "Benefit Program";

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
                field("Benefit Category";"Benefit Category")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Benefit Packages";"No. of Benefit Packages")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Benefit Plans";"No. of Benefit Plans")
                {
                    ApplicationArea = Basic;
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
        area(processing)
        {
            action("Eligibility Criteria")
            {
                ApplicationArea = Basic;
                Promoted = true;
                RunObject = Page "Eligibility Criteria";
                RunPageLink = "Benefit ID"=field(Code);
            }
        }
    }
}

