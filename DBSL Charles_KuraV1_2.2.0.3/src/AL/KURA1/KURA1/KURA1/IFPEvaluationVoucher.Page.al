#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75346 "IFP Evaluation Voucher"
{
    PageType = ListPart;
    SourceTable = "IFP Response Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Response No';
                }
                field("Vendor No."; "Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Name"; "Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Decision"; "Evaluation Decision")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Remarks)
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Score %"; "Evaluation Score %")
                {
                    ApplicationArea = Basic;
                }
                field("Special Group Reservation"; "Special Group Reservation")
                {
                    ApplicationArea = Basic;
                }
                field("Unique Category Requirements"; "Unique Category Requirements")
                {
                    ApplicationArea = Basic;
                }
                field("Global RC Prequalification"; "Global RC Prequalification")
                {
                    ApplicationArea = Basic;
                }
                field("Restricted Responsbility Cente"; "Restricted Responsbility Cente")
                {
                    ApplicationArea = Basic;
                }
                field("Restricted RC ID"; "Restricted RC ID")
                {
                    ApplicationArea = Basic;
                }
                field("Prequalification Start Date"; "Prequalification Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Prequalification End Date"; "Prequalification End Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = 'Line';
                action("RFI Category Requirement ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Specific Requirement';
                    Image = Category;
                    Promoted = true;
                    RunObject = Page "RFI Category Requirement";
                    RunPageLink = "Requirement Code" = field("Procurement Category");
                }
                action("Prequalified Responsibility Centers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Prequalified Responsibility Centers';
                    Image = Comment;
                    Promoted = true;
                    RunObject = Page "IFP Response Line RC";
                    RunPageLink = "Document No." = field("Document No."),
                                  "Document Type" = field("Document Type"),
                                  "Procurement Category" = field("Procurement Category"),
                                  "Vendor No" = field("Vendor No.");
                }
            }
            group("Vendor Profile")
            {
                Caption = 'Vendor Profile';
                Image = FiledPosted;
                action("Filed Documents")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    RunObject = Page "RFI Response Filed Document";
                    RunPageLink = "Document No" = field("Document No."),
                                  "Vendor No" = field("Vendor No.");
                }
                action("Locations Applied")
                {
                    ApplicationArea = Basic;
                    Image = Document;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFP Response Line RC";
                    RunPageLink = "Document No." = field("Document No."),
                                  "Procurement Category" = field("Procurement Category"),
                                  "Vendor No" = field("Vendor No.");
                }
                action("Vendor Special Group Entry")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category9;
                    RunObject = Page "Vendor Special Group Entry";
                    RunPageLink = "Vendor No" = field("Vendor No.");
                }
                action("Vendor Bank Account List")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category9;
                    //  RunObject = Page "Vendor Bank Account List";
                    //  RunPageLink = "Vendor No = "=field("Vendor No.");
                }
                action("Vendor Business Owner")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Business Owner";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                }
                action("Vendor Litigation History")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Litigation History";
                    // RunPageLink = "Vendor No." = field("Vendor No.");
                }
                action("Vendor Past Experience")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Professional Staff";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                }
                action("Vendor Professional Staff")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Past Experience";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                }
                action("Vendor Audited Income Statemen")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor Audited Income Statement';
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Audited Income Statemen";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                }
                action("Vendor Audited Balance Sheet")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Audited Balance Sheet";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                }
            }
        }
    }
}

