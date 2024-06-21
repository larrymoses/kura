#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72648 "Contractor Inspection Requests"
{
    ApplicationArea = Basic;
    Caption = 'Contractor Inspection/Test Request Forms';
    CardPageID = "Contractor Inspection Request";
    PageType = List;
    SourceTable = "Contractor Inspection Request";
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
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Requires Lab Test"; "Requires Lab Test")
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
                field("Contractor No."; "Contractor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name"; "Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Daily/Weekly/Monthly W/Plan No"; "Daily/Weekly/Monthly W/Plan No")
                {
                    ApplicationArea = Basic;
                    Visible=false;
                }
                field("Resident Engineer ID"; "Resident Engineer ID")
                {
                    ApplicationArea = Basic;
                }
                field("Residnet Engineer Name"; "Residnet Engineer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Site Agent No."; "Site Agent No.")
                {
                    ApplicationArea = Basic;
                }
                field("Site Agent Name"; "Site Agent Name")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Prepared By"; "Prepared By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date Time"; "Created Date Time")
                {
                    ApplicationArea = Basic;
                }
                field("Last Modified By"; "Last Modified By")
                {
                    ApplicationArea = Basic;
                }
                field("Last Modified Date Time"; "Last Modified Date Time")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(FactBoxes)
        {
            part(Control1906354007; "Document Attachment Factbox")
            {

                SubPageLink = "Table ID" = const(72318),
                              "No." = field("Document No.");

            }
        }
    }

    actions
    {
    }
}

