#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59047 "Fuel Card List-closed"
{
    ApplicationArea = Basic;
    CardPageID = "Fuel Card-Closed";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Fuel Card";
    SourceTableView = where(closed=const(true));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field("Receipt No";"Receipt No")
                {
                    ApplicationArea = Basic;
                }
                field("Registration No.";"Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field(Make;Make)
                {
                    ApplicationArea = Basic;
                }
                field(Model;Model)
                {
                    ApplicationArea = Basic;
                }
                field("Fuel Card No.";"Fuel Card No.")
                {
                    ApplicationArea = Basic;
                }
                field("Fuel Card Pin";"Fuel Card Pin")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Limit";"Vehicle Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Total Allocated Limit";"Total Allocated Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Total Balance";"Total Balance")
                {
                    ApplicationArea = Basic;
                }
                field("Allocated Vehicle Limit";"Allocated Vehicle Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Balance";"Vehicle Balance")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount Spend";"Total Amount Spend")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amt Spend per Vehicle";"Total Amt Spend per Vehicle")
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

