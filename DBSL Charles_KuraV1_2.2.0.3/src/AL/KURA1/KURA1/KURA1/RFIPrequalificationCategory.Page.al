#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
/// <summary>
/// Page RFI Prequalification Category (ID 75046).
/// </summary>
Page 75046 "RFI Prequalification Category"
{
    PageType = ListPart;
    SourceTable = "RFI Prequalification Category";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Prequalification Category ID"; Rec."Prequalification Category ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Period Start Date"; Rec."Period Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Period End Date"; Rec."Period End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Submission Start Date"; Rec."Submission Start Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Invitation Start Date';
                }
                field("Submission Start Time"; Rec."Submission Start Time")
                {
                    ApplicationArea = Basic;
                    Caption = 'Invitation Start Time';
                }
                field("Submission End Date"; Rec."Submission End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Submission End Time"; Rec."Submission End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Applicable Location"; Rec."Applicable Location")
                {
                    ApplicationArea = Basic;
                }
                field("Restricted RC"; Rec."Restricted RC")
                {
                    ApplicationArea = Basic;
                }
                field("Restricted RC Type"; Rec."Restricted RC Type")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Restricted RC Code"; Rec."Restricted RC Code")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Submissions"; Rec."No. of Submissions")
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
                    RunObject = Page "RFI Required Document";
                    RunPageLink = "Document No" = field("Document No"),
                                  "Linked To category No" = field("Prequalification Category ID"),
                                  "Document Type" = field("Document Type");
                }
                action("RFI Restricted Vendor Category")
                {
                    ApplicationArea = Basic;
                    Image = Comment;
                    Promoted = true;
                    RunObject = Page "RFI Restricted Vendor Category";
                    RunPageLink = "Prequalification Category ID" = field("Prequalification Category ID"),
                                  "Document No" = field("Document No");
                }
                action("Applicable Location")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "RFI Responsibility Center";
                    RunPageLink = "Document Type" = field("Document Type"),
                                   "Document No" = field("Document No"),
                                   "Procurement Category" = field("Prequalification Category ID");
                }
            }
        }
    }
}

#pragma implicitwith restore

