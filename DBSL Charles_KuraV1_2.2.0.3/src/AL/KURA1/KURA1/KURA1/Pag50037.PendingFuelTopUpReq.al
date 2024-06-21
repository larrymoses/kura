/// <summary>
/// Page Pending Fuel TopUp Req. (ID 50037).
/// </summary>
page 50037 "Pending Fuel TopUp Req."
{
    Caption = 'Pending Fuel TopUp Req.';
    ApplicationArea = BasicHR;
    PageType = List;
    SourceTable = "Fuel Topup Request";
    CardPageID = "Fuel Top Up Card";
    UsageCategory = Lists;
    SourceTableView = where(Status = filter("Pending Approval"));
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field("Card No."; Rec."Card No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Requested by"; Rec."Requested by")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
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

