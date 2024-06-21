#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75156 "Bid Opening Register Line"
{
    DeleteAllowed = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = "Bid Opening Register Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Name"; Rec."Bidder Name")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Bid No."; Rec."Assigned Bid No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bid No.';
                }
                field("External Bid Reference No"; Rec."External Bid Reference No")
                {
                    ApplicationArea = Basic;
                }
                field("Valid Bid Security Provided"; Rec."Valid Bid Security Provided")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Security Issuer"; Rec."Bid Security Issuer")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Security Amount (LCY)"; Rec."Bid Security Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Security Amount Pass"; Rec."Bid Security Amount Pass")
                {
                    ApplicationArea = Basic;
                }
                field("Total Tender Price (LCY)"; Rec."Total Tender Price (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(Rank; Rec.Rank)
                {
                    ApplicationArea = Basic;
                }
                field("Complete Bid Doc Submitted"; Rec."Complete Bid Doc Submitted")
                {
                    ApplicationArea = Basic;
                }
                field("Late Bid"; Rec."Late Bid")
                {
                    ApplicationArea = Basic;
                }
                field("Late Bid Submission Time"; Rec."Late Bid Submission Time")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Withdrawal Notice No."; Rec."Bid Withdrawal Notice No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Modification Notice No."; Rec."Bid Modification Notice No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Withdrawal Exists"; Rec."Bid Withdrawal Exists")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Modification Exists"; Rec."Bid Modification Exists")
                {
                    ApplicationArea = Basic;
                }
                field("Final Bid Opening Result"; Rec."Final Bid Opening Result")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Opening Com Remarks"; Rec."Tender Opening Com Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Representatives"; Rec."No. of Representatives")
                {
                    ApplicationArea = Basic;
                }
                field(Notified; Rec.Notified)
                {
                    ApplicationArea = Basic;
                }
                field("Date/Time Notified"; Rec."Date/Time Notified")
                {
                    ApplicationArea = Basic;
                }
                field("Bid No."; Rec."Bid No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Sum 1(LCY)"; Rec."Bid Sum 1(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Sum 2(LCY)"; Rec."Bid Sum 2(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("No Of Pages"; Rec."No Of Pages")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Compliance Certificate"; Rec."Tax Compliance Certificate")
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
                action("Bidder Attendance")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Bid Opening Bidder Attendance";
                    RunPageLink = "IFS Code" = field("IFS Code"),
                                  "Vendor No." = field("Vendor No.");
                }
                action("Bid Filed Documents")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Bid Filed Document";
                    RunPageLink = "No." = field("Bid No.");
                }
            }
        }
    }
}

#pragma implicitwith restore

