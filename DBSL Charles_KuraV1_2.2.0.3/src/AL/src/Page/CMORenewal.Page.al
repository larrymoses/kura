#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56058 "CMO Renewal"
{
    PageType = Card;
    SourceTable = "CMO Registration";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date";"Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Time";"Creation Time")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Name of society";"Name of society")
                {
                    ApplicationArea = Basic;
                }
                field("Address of society";"Address of society")
                {
                    ApplicationArea = Basic;
                }
                field("Physical address";"Physical address")
                {
                    ApplicationArea = Basic;
                }
                field("Name of Agent";"Name of Agent")
                {
                    ApplicationArea = Basic;
                }
                field("Address of agent";"Address of agent")
                {
                    ApplicationArea = Basic;
                }
                field("Application number";"Application number")
                {
                    ApplicationArea = Basic;
                }
                field("Registration number";"Registration number")
                {
                    ApplicationArea = Basic;
                }
                field("Any change which occurred";"Any change which occurred")
                {
                    ApplicationArea = Basic;
                }
                field("Renewal Period";"Renewal Period")
                {
                    ApplicationArea = Basic;
                }
                field("Year of audited accounts";"Year of audited accounts")
                {
                    ApplicationArea = Basic;
                }
                field("Submission Date";"Submission Date")
                {
                    ApplicationArea = Basic;
                }
                field("Submission Time";"Submission Time")
                {
                    ApplicationArea = Basic;
                }
                field("Submitted By";"Submitted By")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control22;Notes)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Type := Type::Renewal;
    end;
}

