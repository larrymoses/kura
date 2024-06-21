#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72456 "Material Test Records"
{
    ApplicationArea = Basic;
    CardPageID = "Material Test Record";
    PageType = List;
    SourceTable = "Material Test Record";
    SourceTableView = where("Document Type"=filter("Material Test Record"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field("Material Delivery Date";"Material Delivery Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Material ID";"Material ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Material Test Template ID";"Material Test Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Base Unit of Measure";"Base Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Test Lead No.";"Test Lead No.")
                {
                    ApplicationArea = Basic;
                }
                field("Site Description";"Site Description")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No.";"Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Final Test Result";"Final Test Result")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Contract ID";"Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No.";"Contractor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name";"Contractor Name")
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
                field("Region ID";"Region ID")
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
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date/Time";"Created Date/Time")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Testing Date";"Testing Date")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Driver Name";"Driver Name")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle No.";"Vehicle No.")
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
        "Document Type":="document type"::"Material Test Record";
    end;
}

