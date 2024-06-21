#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72637 "Weekly Work Plans"
{
    ApplicationArea = Basic;
    CardPageID = "Weekly Work Plan";
    PageType = List;
    SourceTable = "Work Plan Header";
    SourceTableView = where("Document Type" = filter(Weekly),
                            Status = filter(<> Approved));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; "Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Contract ID"; "Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Name"; "Contract Name")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Day/Week/Month From"; "Day/Week/Month From")
                {
                    ApplicationArea = Basic;
                }
                field("Day/Week/Month To"; "Day/Week/Month To")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Portal Status"; "Portal Status")
                {
                    ApplicationArea = Basic;
                }
                field("Site Agent ID"; "Site Agent ID")
                {
                    ApplicationArea = Basic;
                }
                field("Site Agent Name"; "Site Agent Name")
                {
                    ApplicationArea = Basic;
                }
                field("Resident Engineer ID"; "Resident Engineer ID")
                {
                    ApplicationArea = Basic;
                }
                field("Resident Engineer Name"; "Resident Engineer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No."; "Contractor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name"; "Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Prepared By"; "Prepared By")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Confirmed By"; "Confirmed By")
                {
                    ApplicationArea = Basic;
                }
                field("Received By"; "Received By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime"; "Created DateTime")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(FactBoxes)
        {
            part(Control1906354007; "Document Attachment Factbox")
            {

                SubPageLink = "Table ID" = const(72315),
                              "No." = field("Document No.");

            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::Weekly;
    end;
}

