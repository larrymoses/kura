#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72363 "Posted RICS (Projects Closeout"
{
    ApplicationArea = Basic;
    Caption = 'Posted RICS (Projects Closeout)';
    //CardPageID = "Road Condition Survey Project";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Road Inv. Condition Survey";
    SourceTableView = where(Posted = filter(false),
                            "Survey Type" = const("Project-Based"));
    UsageCategory = History;

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
                field("Survey Type"; "Survey Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Service Type"; "Service Type")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; "Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contract No."; "Contract No.")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Vendor No."; "Primary Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Name"; "Vendor Name")
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
                field("Target Road Inventory Type"; "Target Road Inventory Type")
                {
                    ApplicationArea = Basic;
                }
                field(Region; Region)
                {
                    ApplicationArea = Basic;
                }
                field("Branch/Center"; "Branch/Center")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Department)
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Constituencies"; "No. of Constituencies")
                {
                    ApplicationArea = Basic;
                }
                field("No.Of Existing Roads"; "No.Of Existing Roads")
                {
                    ApplicationArea = Basic;
                }
                field("No. of New Roads"; "No. of New Roads")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime"; "Created DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; "No. Series")
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
        "Approval Status" := "approval status"::Open;
        "Service Type" := "service type"::OutSourced;
    end;
}

