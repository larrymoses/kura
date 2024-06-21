#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56096 "Case Register List"
{
    ApplicationArea = Basic;
    CardPageID = "Case Register Card";
    PageType = List;
    SourceTable = "Case Register";
    SourceTableView = where(Status=const(Ongoing));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field("Reference Number";"Reference Number")
                {
                    ApplicationArea = Basic;
                }
                field("Case Number";"Case Number")
                {
                    ApplicationArea = Basic;
                }
                field("Nature of Case";"Nature of Case")
                {
                    ApplicationArea = Basic;
                }
                field("Case Types";"Case Types")
                {
                    ApplicationArea = Basic;
                }
                field("Nature of Claim";"Nature of Claim")
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
                field("Advocate on Record";"Advocate on Record")
                {
                    ApplicationArea = Basic;
                }
                field("Name of Parties";"Name of Parties")
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
    }
}

