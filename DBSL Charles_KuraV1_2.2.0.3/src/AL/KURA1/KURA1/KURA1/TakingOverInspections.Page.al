#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72569 "Taking Over Inspections"
{
    ApplicationArea = Basic;
    CardPageID = "Taking Over inspection";
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Inspection Headersss";
    SourceTableView = where("Inspection Type" = filter("Taking Over Inspection"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Inspection No"; "Inspection No")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Type"; "Inspection Type")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; "Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contract ID"; "Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Request No"; "Contractor Request No")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Date"; "Inspection Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No"; "Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name"; "Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Committee No"; "Committee No")
                {
                    ApplicationArea = Basic;
                }
                field("Project Start Date"; "Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End Date"; "Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field("DLP Start Date"; "DLP Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("DLP Period"; "DLP Period")
                {
                    ApplicationArea = Basic;
                }
                field("DLP End Date"; "DLP End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Tender Sum Inc Tax"; "Awarded Tender Sum Inc Tax")
                {
                    ApplicationArea = Basic;
                }
                field("Payments To Date"; "Payments To Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Committee Decision"; "Committee Decision")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(72274),
                              "No." = field("Inspection No");
                // , "Document Type" = field("Document Type");
            }
            systempart(Control55; Links)
            {
            }
            systempart(Control57; Notes)
            {
            }
        }
    }

    actions
    {
    }
}

