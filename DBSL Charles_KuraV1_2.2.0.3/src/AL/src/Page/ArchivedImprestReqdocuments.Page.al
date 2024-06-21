
Page 57181 "Archived Imprest Req documents"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = payments;
    SourceTableView = where("Archive Document" = const(true),
                            "Document Type" = const(Imprest));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = Basic;
                }
                field("On behalf of"; Rec."On behalf of")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Time Posted"; Rec."Time Posted")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Surrendered; Rec.Surrendered)
                {
                    ApplicationArea = Basic;
                }
                field("Applies- To Doc No."; Rec."Applies- To Doc No.")
                {
                    ApplicationArea = Basic;
                }
                field("Petty Cash Amount"; Rec."Petty Cash Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Original Document"; Rec."Original Document")
                {
                    ApplicationArea = Basic;
                }
                field("PV Creation DateTime"; Rec."PV Creation DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("PV Creator ID"; Rec."PV Creator ID")
                {
                    ApplicationArea = Basic;
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Receipt Created"; Rec."Receipt Created")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("Surrender Date"; Rec."Surrender Date")
                {
                    ApplicationArea = Basic;
                }
                field("Date Filter"; Rec."Date Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Type"; Rec."Imprest Type")
                {
                    ApplicationArea = Basic;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                }
                field("Travel Date"; Rec."Travel Date")
                {
                    ApplicationArea = Basic;
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = Basic;
                }
                field("Function Name"; Rec."Function Name")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Center Name"; Rec."Budget Center Name")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Release Date"; Rec."Payment Release Date")
                {
                    ApplicationArea = Basic;
                }
                field("No. Printed"; Rec."No. Printed")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Surrender Status"; Rec."Surrender Status")
                {
                    ApplicationArea = Basic;
                }
                field("Departure Date"; Rec."Departure Date")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque Type"; Rec."Cheque Type")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                }
                field("Total VAT Amount"; Rec."Total VAT Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Witholding Tax Amount"; Rec."Total Witholding Tax Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Payment Amount LCY"; Rec."Total Payment Amount LCY")
                {
                    ApplicationArea = Basic;
                }
                field("Total Retention Amount"; Rec."Total Retention Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Amount Spent"; Rec."Actual Amount Spent")
                {
                    ApplicationArea = Basic;
                }
                field("Cash Receipt Amount"; Rec."Cash Receipt Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Phone Number"; Rec."Phone Number")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Reporting"; Rec."Date of Reporting")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Issue Date"; Rec."Imprest Issue Date")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Issue Doc. No"; Rec."Imprest Issue Doc. No")
                {
                    ApplicationArea = Basic;
                }
                field("Date Surrendered"; Rec."Date Surrendered")
                {
                    ApplicationArea = Basic;
                }
                field("Surrendered By"; Rec."Surrendered By")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Petty Cash Amount Spent"; Rec."Actual Petty Cash Amount Spent")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Remaining Petty Cash Amount"; Rec."Remaining Petty Cash Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Receipted Petty Cash Amount"; Rec."Receipted Petty Cash Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Memo Surrender No"; Rec."Imprest Memo Surrender No")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Wthheld six %"; Rec."VAT Wthheld six %")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Budget"; Rec."Project Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Project Costs"; Rec."Actual Project Costs")
                {
                    ApplicationArea = Basic;
                }
                field("PO Commitments"; Rec."PO Commitments")
                {
                    ApplicationArea = Basic;
                }
                field("PRN Commitments"; Rec."PRN Commitments")
                {
                    ApplicationArea = Basic;
                }
                field("Store Requisition Commitments"; Rec."Store Requisition Commitments")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Application Commitment"; Rec."Imprest Application Commitment")
                {
                    ApplicationArea = Basic;
                }
                field("Total Budget Commitments"; Rec."Total Budget Commitments")
                {
                    ApplicationArea = Basic;
                }
                field("Available Funds"; Rec."Available Funds")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                }
                field("Division Name"; Rec."Division Name")
                {
                    ApplicationArea = Basic;
                }
                field("Notification Sent"; Rec."Notification Sent")
                {
                    ApplicationArea = Basic;
                }
                field("DateTime Sent"; Rec."DateTime Sent")
                {
                    ApplicationArea = Basic;
                }
                field("Destination Name"; Rec."Destination Name")
                {
                    ApplicationArea = Basic;
                }
                field(Reversed; Rec.Reversed)
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Memo No"; Rec."Imprest Memo No")
                {
                    ApplicationArea = Basic;
                }
                field("Job Group"; Rec."Job Group")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Bank Account Number"; Rec."Imprest Bank Account Number")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Bank Name"; Rec."Imprest Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Bank Branch Name"; Rec."Imprest Bank Branch Name")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Bank"; Rec."Vendor Bank")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Bank Branch"; Rec."Vendor Bank Branch")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Bank Account"; Rec."Vendor Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field("Advance Recovery"; Rec."Advance Recovery")
                {
                    ApplicationArea = Basic;
                }
                field("Total Net Pay"; Rec."Total Net Pay")
                {
                    ApplicationArea = Basic;
                }
                field(Test; Rec.Test)
                {
                    ApplicationArea = Basic;
                }
                field("Used Claim"; Rec."Used Claim")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                    ApplicationArea = Basic;
                }
                field("PV Remaining Amount"; Rec."PV Remaining Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Part Payment"; Rec."Part Payment")
                {
                    ApplicationArea = Basic;
                }
                field("User ID Filter"; Rec."User ID Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Reasons to Reopen"; Rec."Reasons to Reopen")
                {
                    ApplicationArea = Basic;
                }
                field("Payment processed"; Rec."Payment processed")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Created"; Rec."Imprest Created")
                {
                    ApplicationArea = Basic;
                }
                field(Imprest; Rec.Imprest)
                {
                    ApplicationArea = Basic;
                }
                field("Converted By"; Rec."Converted By")
                {
                    ApplicationArea = Basic;
                }
                field("Date converted"; Rec."Date converted")
                {
                    ApplicationArea = Basic;
                }
                field("Time converted"; Rec."Time converted")
                {
                    ApplicationArea = Basic;
                }
                field("Vote Item"; Rec."Vote Item")
                {
                    ApplicationArea = Basic;
                }
                field("Vote Amount"; Rec."Vote Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Commitments; Rec.Commitments)
                {
                    ApplicationArea = Basic;
                }
                field("Actual Amount"; Rec."Actual Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Available Amount"; Rec."Available Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                }
                field(Selected; Rec.Selected)
                {
                    ApplicationArea = Basic;
                }
                // field(Job; Job)
                // {
                //     ApplicationArea = Basic;
                // }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                }
                field("Send for Posting"; Rec."Send for Posting")
                {
                    ApplicationArea = Basic;
                }
                field("Standing Imprest Type"; Rec."Standing Imprest Type")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Advance"; Rec."Salary Advance")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Last Drawn"; Rec."Salary Last Drawn")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Joining"; Rec."Date of Joining")
                {
                    ApplicationArea = Basic;
                }
                field("No of months deducted"; Rec."No of months deducted")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Pending"; Rec."Amount Pending")
                {
                    ApplicationArea = Basic;
                }
                field("Recovery Start Month"; Rec."Recovery Start Month")
                {
                    ApplicationArea = Basic;
                }
                field("Monthly Installment"; Rec."Monthly Installment")
                {
                    ApplicationArea = Basic;
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                }
                field("Amount Approved"; Rec."Amount Approved")
                {
                    ApplicationArea = Basic;
                }
                field("Effective from Month"; Rec."Effective from Month")
                {
                    ApplicationArea = Basic;
                }
                field("Float Reimbursement"; Rec."Float Reimbursement")
                {
                    ApplicationArea = Basic;
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                }
                field(Finance; Rec.Finance)
                {
                    ApplicationArea = Basic;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                }
                field(HOD; Rec.HOD)
                {
                    ApplicationArea = Basic;
                }
                field(Select; Rec.Select)
                {
                    ApplicationArea = Basic;
                }
                field(banked; Rec.banked)
                {
                    ApplicationArea = Basic;
                }
                field("Commitments."; Rec."Commitments.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Budget"; Rec."Job Task Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Remaining Amount"; Rec."Job Task Remaining Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                }
                field("Archive Document"; Rec."Archive Document")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Archive Reason")
            {
                Promoted =true;
                PromotedCategory = Process;
                RunObject = Page "Archive Reasons";
                RunPageLink  = "Action Type" = const(UnArchive),"Document No."=field("No."),"Table ID"=const(57000),"Document Type" = const(Imprest);
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        //SETRANGE("Created By",USERID);

        //Fred Rc
        // IF UserSetup.GET(USERID) THEN BEGIN
        //  SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
        //  END;
    end;

    trigger OnAfterGetRecord()
    begin
        //SETRANGE("Created By",USERID);

        //Fred Rc
        // IF UserSetup.GET(USERID) THEN BEGIN
        //  SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
        //  END;
    end;

    trigger OnOpenPage()
    begin
        //SETRANGE("Created By",USERID);

        //Fred Rc
        // IF UserSetup.GET(USERID) THEN BEGIN
        //  SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
        //  END;
    end;

    var
        UserSetup: Record "User Setup";
}



