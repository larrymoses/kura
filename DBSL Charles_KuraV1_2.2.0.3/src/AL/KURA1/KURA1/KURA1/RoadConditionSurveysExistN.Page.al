
Page 72357 "Road Condition Surveys(Exist N"
{
    PageType = List;
    SourceTable = "Road Inv. Condition Survey";
    SourceTableView = where("Survey Type"=filter("Existing Road Network"),
                            Posted=filter(false));
    PopulateAllFields=true;
    CardPageId ="ARICS card";
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Survey Type"; Rec."Survey Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Service Type"; Rec."Service Type")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contract No."; Rec."Contract No.")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Vendor No."; Rec."Primary Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Target Road Inventory Type"; Rec."Target Road Inventory Type")
                {
                    ApplicationArea = Basic;
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                }
                field("Branch/Center"; Rec."Branch/Center")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Constituencies"; Rec."No. of Constituencies")
                {
                    ApplicationArea = Basic;
                }
                field("No.Of Existing Roads"; Rec."No.Of Existing Roads")
                {
                    ApplicationArea = Basic;
                }
                field("No. of New Roads"; Rec."No. of New Roads")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime"; Rec."Created DateTime")
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



