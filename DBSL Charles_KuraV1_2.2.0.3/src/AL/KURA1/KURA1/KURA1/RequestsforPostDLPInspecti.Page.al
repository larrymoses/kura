#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72577 "Requests for Post DLP Inspecti"
{
    ApplicationArea = Basic;
    Caption = 'Requests for End of DLP Inspection';
    CardPageID = "Request for Post DLP Inspectio";
    PageType = List;
    SourceTable = "Measurement &  Payment Header";
    SourceTableView = where("Document Type"=filter("Contractor Request for End of DLP Inspection"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Works Start Chainage";"Works Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Works End Chainage";"Works End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name";"Contractor Name")
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
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Document Type":="document type"::"Contractor Request for End of DLP Inspection";
    end;
}

