#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72554 "Corrective Order Responses"
{
    CardPageID = "Corrective Order Response";
    PageType = List;
    SourceTable = "Corrective Orders Header";
    SourceTableView = where("Document Type" = filter("Corrective Order Action"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Order No"; Rec."Order No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Source Inspection No"; Rec."Source Inspection No")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Contract ID"; Rec."Purchase Contract ID")
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
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Works Start Chainage"; Rec."Works Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Works End Chainage"; Rec."Works End Chainage")
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("No Series"; Rec."No Series")
                {
                    ApplicationArea = Basic;
                }
                field("Portal Status"; Rec."Portal Status")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Corrective Order No"; Rec."Corrective Order No")
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

#pragma implicitwith restore

