#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57190 "Archived Payment documents"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    PageType = List;
    SourceTable = payments;
    SourceTableView = where("Archive Document" = filter(true));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Payee)
                {
                    ApplicationArea = Basic;
                }
                field("Payment Type"; "Payment Type")
                {
                    ApplicationArea = Basic;
                }
                field("On behalf of"; "On behalf of")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted By"; "Posted By")
                {
                    ApplicationArea = Basic;
                }
                field("Posted Date"; "Posted Date")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Time Posted"; "Time Posted")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; "Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Paying Bank Account"; "Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(Currency; Currency)
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; "No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Account Type"; "Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; "Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; "Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Amount"; "Imprest Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Surrendered; Surrendered)
                {
                    ApplicationArea = Basic;
                }
                field("Applies- To Doc No."; "Applies- To Doc No.")
                {
                    ApplicationArea = Basic;
                }
                field("Petty Cash Amount"; "Petty Cash Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Original Document"; "Original Document")
                {
                    ApplicationArea = Basic;
                }
                field("PV Creation DateTime"; "PV Creation DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("PV Creator ID"; "PV Creator ID")
                {
                    ApplicationArea = Basic;
                }
                field("Remaining Amount"; "Remaining Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Receipt Created"; "Receipt Created")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Deadline"; "Imprest Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("Surrender Date"; "Surrender Date")
                {
                    ApplicationArea = Basic;
                }
                field("Date Filter"; "Date Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Type"; "Imprest Type")
                {
                    ApplicationArea = Basic;
                }
                field(Project; Project)
                {
                    ApplicationArea = Basic;
                }
                field("Project Description"; "Project Description")
                {
                    ApplicationArea = Basic;
                }
                field("Travel Date"; "Travel Date")
                {
                    ApplicationArea = Basic;
                }
                field(Cashier; Cashier)
                {
                    ApplicationArea = Basic;
                }
                field("Function Name"; "Function Name")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Center Name"; "Budget Center Name")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Release Date"; "Payment Release Date")
                {
                    ApplicationArea = Basic;
                }
                field("No. Printed"; "No. Printed")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Surrender Status"; "Surrender Status")
                {
                    ApplicationArea = Basic;
                }
                field("Departure Date"; "Departure Date")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque Type"; "Cheque Type")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Narration"; "Payment Narration")
                {
                    ApplicationArea = Basic;
                }
                field("Total VAT Amount"; "Total VAT Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Witholding Tax Amount"; "Total Witholding Tax Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Net Amount"; "Total Net Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Payment Amount LCY"; "Total Payment Amount LCY")
                {
                    ApplicationArea = Basic;
                }
                field("Total Retention Amount"; "Total Retention Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 3 Code"; "Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No."; "Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Name"; "Job Task Name")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Amount Spent"; "Actual Amount Spent")
                {
                    ApplicationArea = Basic;
                }
                field("Cash Receipt Amount"; "Cash Receipt Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 4 Code"; "Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Phone Number"; "Phone Number")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Reporting"; "Date of Reporting")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Issue Date"; "Imprest Issue Date")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Issue Doc. No"; "Imprest Issue Doc. No")
                {
                    ApplicationArea = Basic;
                }
                field("Date Surrendered"; "Date Surrendered")
                {
                    ApplicationArea = Basic;
                }
                field("Surrendered By"; "Surrendered By")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Petty Cash Amount Spent"; "Actual Petty Cash Amount Spent")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 5 Code"; "Shortcut Dimension 5 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Remaining Petty Cash Amount"; "Remaining Petty Cash Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Receipted Petty Cash Amount"; "Receipted Petty Cash Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Memo Surrender No"; "Imprest Memo Surrender No")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID"; "Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Wthheld six %"; "VAT Wthheld six %")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Name"; "Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Budget"; "Project Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Project Costs"; "Actual Project Costs")
                {
                    ApplicationArea = Basic;
                }
                field("PO Commitments"; "PO Commitments")
                {
                    ApplicationArea = Basic;
                }
                field("PRN Commitments"; "PRN Commitments")
                {
                    ApplicationArea = Basic;
                }
                field("Store Requisition Commitments"; "Store Requisition Commitments")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Application Commitment"; "Imprest Application Commitment")
                {
                    ApplicationArea = Basic;
                }
                field("Total Budget Commitments"; "Total Budget Commitments")
                {
                    ApplicationArea = Basic;
                }
                field("Available Funds"; "Available Funds")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Unit  Name"; "Unit  Name")
                {
                    ApplicationArea = Basic;
                }
                field("Division Name"; "Division Name")
                {
                    ApplicationArea = Basic;
                }
                field("Notification Sent"; "Notification Sent")
                {
                    ApplicationArea = Basic;
                }
                field("DateTime Sent"; "DateTime Sent")
                {
                    ApplicationArea = Basic;
                }
                field("Destination Name"; "Destination Name")
                {
                    ApplicationArea = Basic;
                }
                field(Reversed; Reversed)
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Memo No"; "Imprest Memo No")
                {
                    ApplicationArea = Basic;
                }
                field("Job Group"; "Job Group")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Bank Account Number"; "Imprest Bank Account Number")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Bank Name"; "Imprest Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Bank Branch Name"; "Imprest Bank Branch Name")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Bank"; "Vendor Bank")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Bank Branch"; "Vendor Bank Branch")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Bank Account"; "Vendor Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field("Advance Recovery"; "Advance Recovery")
                {
                    ApplicationArea = Basic;
                }
                field("Total Net Pay"; "Total Net Pay")
                {
                    ApplicationArea = Basic;
                }
                field(Test; Test)
                {
                    ApplicationArea = Basic;
                }
                field("Used Claim"; "Used Claim")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Paid"; "Amount Paid")
                {
                    ApplicationArea = Basic;
                }
                field("PV Remaining Amount"; "PV Remaining Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Part Payment"; "Part Payment")
                {
                    ApplicationArea = Basic;
                }
                field("User ID Filter"; "User ID Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Reasons to Reopen"; "Reasons to Reopen")
                {
                    ApplicationArea = Basic;
                }
                field("Payment processed"; "Payment processed")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Created"; "Imprest Created")
                {
                    ApplicationArea = Basic;
                }
                field(Imprest; Imprest)
                {
                    ApplicationArea = Basic;
                }
                field("Converted By"; "Converted By")
                {
                    ApplicationArea = Basic;
                }
                field("Date converted"; "Date converted")
                {
                    ApplicationArea = Basic;
                }
                field("Time converted"; "Time converted")
                {
                    ApplicationArea = Basic;
                }
                field("Vote Item"; "Vote Item")
                {
                    ApplicationArea = Basic;
                }
                field("Vote Amount"; "Vote Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Commitments; Commitments)
                {
                    ApplicationArea = Basic;
                }
                field("Actual Amount"; "Actual Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Available Amount"; "Available Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Reference No."; "Reference No.")
                {
                    ApplicationArea = Basic;
                }
                field(Selected; Selected)
                {
                    ApplicationArea = Basic;
                }
                // field(Job; Job)
                // {
                //     ApplicationArea = Basic;
                // }
                field("Job Task No"; "Job Task No")
                {
                    ApplicationArea = Basic;
                }
                field("Job Name"; "Job Name")
                {
                    ApplicationArea = Basic;
                }
                field("Send for Posting"; "Send for Posting")
                {
                    ApplicationArea = Basic;
                }
                field("Standing Imprest Type"; "Standing Imprest Type")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Advance"; "Salary Advance")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Last Drawn"; "Salary Last Drawn")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Joining"; "Date of Joining")
                {
                    ApplicationArea = Basic;
                }
                field("No of months deducted"; "No of months deducted")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Pending"; "Amount Pending")
                {
                    ApplicationArea = Basic;
                }
                field("Recovery Start Month"; "Recovery Start Month")
                {
                    ApplicationArea = Basic;
                }
                field("Monthly Installment"; "Monthly Installment")
                {
                    ApplicationArea = Basic;
                }
                field(Purpose; Purpose)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Remarks)
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Comments)
                {
                    ApplicationArea = Basic;
                }
                field("Amount Approved"; "Amount Approved")
                {
                    ApplicationArea = Basic;
                }
                field("Effective from Month"; "Effective from Month")
                {
                    ApplicationArea = Basic;
                }
                field("Float Reimbursement"; "Float Reimbursement")
                {
                    ApplicationArea = Basic;
                }
                field(Destination; Destination)
                {
                    ApplicationArea = Basic;
                }
                field(Finance; Finance)
                {
                    ApplicationArea = Basic;
                }
                field("Department Code"; "Department Code")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Code"; "Directorate Code")
                {
                    ApplicationArea = Basic;
                }
                field(Division; Division)
                {
                    ApplicationArea = Basic;
                }
                field(HOD; HOD)
                {
                    ApplicationArea = Basic;
                }
                field(Select; Select)
                {
                    ApplicationArea = Basic;
                }
                field(banked; banked)
                {
                    ApplicationArea = Basic;
                }
                field("Commitments."; "Commitments.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Budget"; "Job Task Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Remaining Amount"; "Job Task Remaining Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source"; "Funding Source")
                {
                    ApplicationArea = Basic;
                }
                field("Archive Document"; "Archive Document")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Unarchive Document")
            {
                ApplicationArea = Basic;
                Image = "archive";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    UserSetup.Reset;
                    UserSetup.SetRange("User ID", UserId);
                    UserSetup.SetRange("Archive Document", true);
                    if UserSetup.Find('-') then begin
                        SetRange("No.", "No.");
                        "Archive Document" := false;
                        Modify;
                    end else
                        Error('You dont have rights to unachive finance Documents,Contact System administrator');
                end;
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

