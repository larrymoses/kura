#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72510 "New Job Voucher"
{
    PageType = Card;
    SourceTable = "Measurement &  Payment Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project No";"Project No")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No";"Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name";"Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Start Date";"Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End Date";"Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID";"Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Location";"Project Location")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID";"Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID";"Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Agency ID";"Funding Agency ID")
                {
                    ApplicationArea = Basic;
                }
                field("Funder Name";"Funder Name")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Section No.";"Road Section No.")
                {
                    ApplicationArea = Basic;
                }
                field("Section Name";"Section Name")
                {
                    ApplicationArea = Basic;
                }
                field("Section Start Chainage";"Section Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Section End Chainage";"Section End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Total  Section Length (KMs)";"Total  Section Length (KMs)")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Sum";"Contract Sum")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted By";"Posted By")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime";"Created DateTime")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control29;"New Job Voucher Task Lines")
            {
                SubPageLink = "Document Type"=field("Document Type"),
                              "Document No."=field("Document No."),
                              "Job No."=field("Project No");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Import BoQ Categories")
            {
                ApplicationArea = Basic;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Imported successfully');
                end;
            }
            action("Import Bill Items")
            {
                ApplicationArea = Basic;
                Image = ImportChartOfAccounts;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Imported successfully');
                end;
            }
            action("Create Project")
            {
                ApplicationArea = Basic;
                Image = CreateJobSalesInvoice;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('created successfully');
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type":="document type"::"New Job Voucher";
    end;
}

