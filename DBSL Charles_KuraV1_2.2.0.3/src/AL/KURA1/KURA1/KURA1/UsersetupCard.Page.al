
Page 57130 "User setup Card"
{
    PageType = Card;
    SourceTable = "User Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Account"; Rec."Imprest Account")
                {
                    ApplicationArea = Basic;
                }
                field(UserName; Rec.UserName)
                {
                    ApplicationArea = Basic;
                }
                field("Staff No"; Rec."Staff No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Tittle"; Rec."Job Tittle")
                {
                    ApplicationArea = Basic;
                }
                field("Resource No"; Rec."Resource No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                }
            }
            group(Permisions)
            {
                field("Payroll View"; Rec."Payroll View")
                {
                    ApplicationArea = Basic;
                }
                field("Post Memo"; Rec."Post Memo")
                {
                    ApplicationArea = Basic;
                }
                field("Process Claims"; Rec."Process Claims")
                {
                    ApplicationArea = basic;
                }
                field("post surrender"; Rec."post surrender")
                {
                    ApplicationArea = Basic;
                }
                field("Post Requisition"; Rec."Post Requisition")
                {
                    ApplicationArea = Basic;
                }
                field("Accounts User"; Rec."Accounts User")
                {
                    ApplicationArea = Basic;
                }
                field("Post Receipts"; Rec."Post Receipts")
                {
                    ApplicationArea = Basic;
                }
                field("Lock Imprests"; Rec."Lock Imprests")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement officer"; Rec."Procurement officer")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Other Settings")
            {
                field("Allow Posting From"; Rec."Allow Posting From")
                {
                    ApplicationArea = Basic;
                }
                field("Allow Posting To"; Rec."Allow Posting To")
                {
                    ApplicationArea = Basic;
                }
                field("Register Time"; Rec."Register Time")
                {
                    ApplicationArea = Basic;
                }
                field(Substitute; Rec.Substitute)
                {
                    ApplicationArea = Basic;
                }
                field("Approver ID"; Rec."Approver ID")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000029; Notes)
            {
            }
            systempart(Control1000000030; MyNotes)
            {
            }
            systempart(Control1000000031; Links)
            {
            }
        }
    }

    actions
    {
    }
}



