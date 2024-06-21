/// <summary>
/// Page Membership Fee Requisitions (ID 50031).
/// </summary>
page 50031 "Membership Fee Requisitions"
{
    ApplicationArea = BasicHR;
    Caption = 'Open Membership Fees Requisitions';
    PageType = List;
    SourceTable = "Membership Fees Requisitions";
    SourceTableView = where(Status = filter(Open));
    UsageCategory = Lists;
    CardPageId = "Membership Fee Requisition";
    Editable = false;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Request-By No."; Rec."Request-By No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request-By No. field.';
                }
                field("Request-By Name"; Rec."Request-By Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request-By Name field.';
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requester ID field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Directorate Code field.';
                }
                field("Directorate Name"; Rec."Directorate Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Directorate Name field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field("Last Date Modified";Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
