#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75306 "Cancelled Contract List"
{
    ApplicationArea = Basic;
    CardPageID = "Contract Card";
    PageType = List;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type"=const("Blanket Order"),
                            "Contract Status"=const(" "));
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Vendor No.";"Buy-from Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Vendor Name";"Buy-from Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Registration No.";"VAT Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Address";"Buy-from Address")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Address 2";"Buy-from Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from City";"Buy-from City")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Contact";"Buy-from Contact")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Country/Region Code";"Buy-from Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Language Code";"Language Code")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Description";"Contract Description")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Start Date";"Contract Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract End Date";"Contract End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Notice of Award No.";"Notice of Award No.")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Bid No";"Awarded Bid No")
                {
                    ApplicationArea = Basic;
                }
                field("Award Tender Sum Inc Taxes";"Award Tender Sum Inc Taxes")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code";"IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name";"Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Type";"Contract Type")
                {
                    ApplicationArea = Basic;
                }
                field("Governing Laws";"Governing Laws")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Status";"Contract Status")
                {
                    ApplicationArea = Basic;
                }
                field("Procuring Entity (PE) Name";"Procuring Entity (PE) Name")
                {
                    ApplicationArea = Basic;
                }
                field("PE Representative";"PE Representative")
                {
                    ApplicationArea = Basic;
                }
                field("Your Reference";"Your Reference")
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

