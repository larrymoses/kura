#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59077 "Fuel Top Up List"
{
    ApplicationArea = BasicHR;
    Caption = 'Open Fuel Top-Up Requests';
    CardPageID = "Fuel Top Up Card";
    PageType = List;
    SourceTable = "Fuel Topup Request";
    UsageCategory = Lists;
    // SourceTableView = where(Status = filter(Open|Approved));
    Editable = false;
    PopulateAllFields = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field("Card No.";Rec."Card No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Registration No.";Rec."Vehicle Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No";Rec."Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Name";Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Request Date";Rec."Request Date")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date";Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date";Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Requested by";Rec."Requested by")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Rec.Amount)
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

