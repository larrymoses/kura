#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56042 "CaseFile Movment Registr List"
{
    ApplicationArea = Basic;
    CardPageID = "Case file Movement register";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Case File Movement Register";
    UsageCategory = Lists;

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
                field("Movement Reason Code";"Movement Reason Code")
                {
                    ApplicationArea = Basic;
                }
                field("Movement Reason";"Movement Reason")
                {
                    ApplicationArea = Basic;
                }
                field("Case ID";"Case ID")
                {
                    ApplicationArea = Basic;
                }
                field("Source Type";"Source Type")
                {
                    ApplicationArea = Basic;
                }
                field("Source No";"Source No")
                {
                    ApplicationArea = Basic;
                }
                field("Destination Type";"Destination Type")
                {
                    ApplicationArea = Basic;
                }
                field("Destination No";"Destination No")
                {
                    ApplicationArea = Basic;
                }
                field("Transaction Date";"Transaction Date")
                {
                    ApplicationArea = Basic;
                }
                field("Date Created";"Date Created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created";"Time Created")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
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
            systempart(Control18;Links)
            {
            }
        }
    }

    actions
    {
    }
}

