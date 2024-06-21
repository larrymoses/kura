/// <summary>
/// Page Approved Fuel TopUp Req. (ID 50035).
/// </summary>
page 50035 "Approved Fuel TopUp Req."
{
    ApplicationArea = BasicHR;
    Caption = 'Approved Fuel TopUp Req.';
    PageType = List;
    SourceTable = "Fuel Topup Request";
    UsageCategory = Lists;
    SourceTableView = where(Status = filter(Approved));
    Editable = false;
    DeleteAllowed = false;
    InsertAllowed = false;

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

