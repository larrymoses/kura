#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59003 "Operation Setups"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Fleet Management Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Transport Req No";"Transport Req No")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                }
                field("Daily Work Ticket";"Daily Work Ticket")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                    Visible = false;
                }
                field("Fuel Register";"Fuel Register")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                }
                field("Maintenance Request";"Maintenance Request")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                }
                field("Contract  No";"Contract  No")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                    Visible = false;
                }
                field("Fuel Card No";"Fuel Card No")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                }
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field("Sender Email";"Sender Email")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Inspection  No";"Vehicle Inspection  No")
                {
                    ApplicationArea = Basic;
                }
                field("Default Fleet Driver";"Default Fleet Driver")
                {
                    ApplicationArea = Basic;
                }
                field("Transport Admin Email";"Transport Admin Email")
                {
                    ApplicationArea = Basic;
                }
                field("Expiry Notification Period";"Expiry Notification Period")
                {
                    ApplicationArea = Basic;
                }
                field("Out of Office Requistion No";"Out of Office Requistion No")
                {
                    ApplicationArea = Basic;
                }
                field("Fuel Top up  No";"Fuel Top up  No")
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

