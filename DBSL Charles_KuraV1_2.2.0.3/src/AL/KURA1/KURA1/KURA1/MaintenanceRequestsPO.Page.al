#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59058 "Maintenance Requests PO"
{
    ApplicationArea = Basic;
    Caption = 'Maintenance Requests with LSO';
    CardPageID = "Maintenance Request";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Fuel & Maintenance Requisition";
    SourceTableView = order(ascending)
                      where(Status=filter(Approved),
                            Type=filter(Maintenance),
                            "PO Created"=filter(true));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requisition No";"Requisition No")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Reg No";"Vehicle Reg No")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor(Dealer)";"Vendor(Dealer)")
                {
                    ApplicationArea = Basic;
                }
                field("Odometer Reading";"Odometer Reading")
                {
                    ApplicationArea = Basic;
                }
                field("Request Date";"Request Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No";"Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field("Date Taken for Maintenance";"Date Taken for Maintenance")
                {
                    ApplicationArea = Basic;
                }
                field("Type of Maintenance";"Type of Maintenance")
                {
                    ApplicationArea = Basic;
                }
                field("Prepared By";"Prepared By")
                {
                    ApplicationArea = Basic;
                }
                field("Closed By";"Closed By")
                {
                    ApplicationArea = Basic;
                }
                field("Date Closed";"Date Closed")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Invoice No";"Vendor Invoice No")
                {
                    ApplicationArea = Basic;
                }
                field("Posted Invoice No";"Posted Invoice No")
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

