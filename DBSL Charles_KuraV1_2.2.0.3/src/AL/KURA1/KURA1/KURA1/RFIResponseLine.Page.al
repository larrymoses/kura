#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75173 "RFI Response Line"
{
    PageType = ListPart;
    SourceTable = "IFP Response Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Category";"Procurement Category")
                {
                    ApplicationArea = Basic;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Category Description";"Category Description")
                {
                    ApplicationArea = Basic;
                }
                field("RFI Document No.";"RFI Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No.";"Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Name";"Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center ID";"Responsibility Center ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Code';
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Region';
                }
                field("Constituency Code";"Constituency Code")
                {
                    ApplicationArea = Basic;
                }
                field(Constituency;Constituency)
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Decision";"Evaluation Decision")
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
                    RunPageLink = "Requirement Code"=field("Procurement Category");
                }
                action("Prequalified Responsibility Centers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Prequalified Responsibility Centers';
                    Image = Comment;
                    Promoted = true;
                    RunObject = Page "IFP Response Line RC";
                    RunPageLink = "Document No."=field("Document No."),
                                  "Document Type"=field("Document Type"),
                                  "Procurement Category"=field("Procurement Category"),
                                  "Vendor No"=field("Vendor No.");
                }
            }
        }
    }
}

