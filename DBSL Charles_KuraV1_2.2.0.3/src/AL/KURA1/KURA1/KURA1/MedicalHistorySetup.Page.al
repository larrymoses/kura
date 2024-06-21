#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69816 "Medical History Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Medical History Setup";
    UsageCategory = Administration;

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
                field("Record Type";"Record Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Vaccine-Preventable Condition";"Vaccine-Preventable Condition")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Type";"Examination Type")
                {
                    ApplicationArea = Basic;
                }
                field("Applicable Gender";"Applicable Gender")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11;Outlook)
            {
            }
            systempart(Control12;Notes)
            {
            }
            systempart(Control13;MyNotes)
            {
            }
            systempart(Control14;Links)
            {
            }
        }
    }

    actions
    {
    }
}

