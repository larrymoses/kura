page 58001 "Fleet Management Setup"
{
    Caption = 'Fleet Management Setup';
    PageType = Card;
    SourceTable = "Fleet Management Setup";
    UsageCategory = Administration;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Contract  No"; Rec."Contract  No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contract  No field.';
                }
                field("Daily Work Ticket"; Rec."Daily Work Ticket")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Daily Work Ticket field.';
                }
                field("Default Fleet Driver"; Rec."Default Fleet Driver")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Default Fleet Driver field.';
                }
                field("Driver Rotation"; Rec."Driver Rotation")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver Rotation field.';
                }
                field("Expiry Notification Period"; Rec."Expiry Notification Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expiry Notification Period field.';
                }
                field("Fuel Card No"; Rec."Fuel Card No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fuel Card No field.';
                }
                field("Fuel Payment Batch No"; Rec."Fuel Payment Batch No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fuel Payment Batch No field.';
                }
                field("Fuel Register"; Rec."Fuel Register")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fuel Register field.';
                }
                field("Fuel Top up  No"; Rec."Fuel Top up  No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fuel Top up  No field.';
                }
                field("Maintenance Request"; Rec."Maintenance Request")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Maintenance Request field.';
                }
                field("Fuel Requisitions No";Rec."Fuel Requisitions No")
                {
                    ApplicationArea = Basic;
                }
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Out of Office Requistion No"; Rec."Out of Office Requistion No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Out of Office Requistion No field.';
                }
                field("Rotation Interval"; Rec."Rotation Interval")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rotation Interval field.';
                }
                field("Sender Email"; Rec."Sender Email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sender Email field.';
                }
                field("Transport Admin Email"; Rec."Transport Admin Email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transport Admin Email field.';
                }
                field("Transport Req No"; Rec."Transport Req No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transport Req No field.';
                }
                field("Vehicle Inspection  No"; Rec."Vehicle Inspection  No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vehicle Inspection  No field.';
                }
                field("Fuel Allocation No";Rec."Fuel Allocation No")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
