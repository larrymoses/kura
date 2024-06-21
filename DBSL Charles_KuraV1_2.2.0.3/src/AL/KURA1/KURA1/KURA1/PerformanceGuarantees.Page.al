#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72633 "Performance Guarantees"
{
    CardPageID = "Performance Guarantee";
    PageType = List;
    SourceTable = "Insurance/Guarantee Header";
    SourceTableView = where("Document Type"=filter("Performance Guarantee"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor ID";"Contractor ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name";"Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Insurer/Guarantor Name";"Insurer/Guarantor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Policy/Guarantee No";"Policy/Guarantee No")
                {
                    ApplicationArea = Basic;
                }
                field("Expiry Date";"Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date";"Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Expiry Notification Date";"Expiry Notification Date")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Amount Insured/Guaranteed";"Amount Insured/Guaranteed")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Contract ID";"Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Form of Security";"Form of Security")
                {
                    ApplicationArea = Basic;
                }
                field("Security Type";"Security Type")
                {
                    ApplicationArea = Basic;
                }
                field("Issuer Institution Type";"Issuer Institution Type")
                {
                    ApplicationArea = Basic;
                }
                field("Issuer Registered Offices";"Issuer Registered Offices")
                {
                    ApplicationArea = Basic;
                }
                field("Insurance Type";"Insurance Type")
                {
                    ApplicationArea = Basic;
                }
                field("Second Expiry Notification Dat";"Second Expiry Notification Dat")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type":="document type"::"Performance Guarantee";
    end;
}

