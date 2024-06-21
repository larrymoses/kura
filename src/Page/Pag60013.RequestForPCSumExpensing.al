page 60013 "Requests For PC Sum Expensing"
{
    ApplicationArea = All;
    Caption = 'Requests For PC Sum Expensing';
    PageType = List;
    SourceTable = "Request for PC sum Expensing";
    UsageCategory = Lists;
    CardPageId = "Request For PC Sum Expensing";
    PromotedActionCategories = 'New,Process,Report,Approve,Print,Request Approval,Customer,Navigate,Prices & Discounts';
    SourceTableView = where("Document Type" = const(Request));
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Purchase Contract ID"; Rec."Purchase Contract ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purchase Contract ID field.';
                }
                field("Contractor ID"; Rec."Contractor ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contractor ID field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("CIT Comm No."; Rec."CIT Comm No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CIT Comm No. field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Funding Source field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
            }
        }
    }

}
