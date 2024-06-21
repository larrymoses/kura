#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69621 "Recruitment Plan"
{
    PageType = Card;
    SourceTable = "Recruitment Plan";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Financial Year Code"; "Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Planning Start Date"; "Planning Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planning End Date"; "Planning End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategic Plan ID"; "Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Staff Establishment"; "Approved Staff Establishment")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No. of Planned New Hires"; "No. of Planned New Hires")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No. of Recruitment Requisition"; "No. of Recruitment Requisition")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Recruitment Budget (LCY)"; "Total Recruitment Budget (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created BY"; "Created BY")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; "Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control26; "Recruitment Plan Position")
            {
                SubPageLink = "Recruitment Plan ID" = field("Document No.");
            }
        }
        area(factboxes)
        {
            part(Control30; "Plan Factbox")
            {
                SubPageLink = "Document No." = field("Document No.");
            }
            systempart(Control22; Outlook)
            {
            }
            systempart(Control23; Notes)
            {
            }
            systempart(Control24; MyNotes)
            {
            }
            systempart(Control25; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    SetRange("Document No.", "Document No.");
                    Report.Run(69603, true, false, Rec);
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                ShortCutKey = 'Shift+Ctrl+D';

                trigger OnAction()
                begin
                    CurrPage.SaveRecord;
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedIsBig = false;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin
                    //ApprovalEntries.Setfilters(DATABASE::"Purchase Header","Document Type","No.");
                    ApprovalEntries.Setfilters(Database::"Purchase Header", 14, "Document No.");
                    ApprovalEntries.Run;
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                var
                //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    TestField("Approval Status", "approval status"::Open);
                    Message('Approval Request has been approved');
                    "Approval Status" := "approval status"::Released;
                    Modify(true);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = true;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                var
                //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    TestField("Approval Status", "approval status"::"Pending Approval");
                    Message('Approval Request has been cancelled');
                    "Approval Status" := "approval status"::Open;
                    Modify(true);
                end;
            }
            action("Guiding Principles")
            {
                ApplicationArea = Basic;
                Image = AgreementQuote;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Hr Guiding Principle";
                RunPageLink = "HR Process" = filter("Recruitment & Selection");
            }
        }
    }
}

