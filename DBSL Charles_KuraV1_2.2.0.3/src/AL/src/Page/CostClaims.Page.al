#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72705 "Cost Claims"
{
    ApplicationArea = Basic;
    CardPageID = "Cost Claim";
    PageType = List;
    SourceTable = "Project Variation Header";
    SourceTableView = where("Document Type" = filter("Cost Claim"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; Rec."Document No.")
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Executive Summary"; Rec."Executive Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Original Value of Work (LCY)"; Rec."Original Value of Work (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("New Varied Works Value (LCY)"; Rec."New Varied Works Value (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Net Change Value of Work (LCY)"; Rec."Net Change Value of Work (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Contract ID"; Rec."Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("External Contract Reference"; Rec."External Contract Reference")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No."; Rec."Contractor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Award Tender Sum Inc Taxes"; Rec."Award Tender Sum Inc Taxes")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
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

