#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57189 "Posted Salary Advance Card"
{
    PageType = Card;
    SourceTable = payments;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Account Type";"Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No.";"Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name";"Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Joining";"Date of Joining")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name";"Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Unit Name';
                }
                field("Salary Last Drawn";"Salary Last Drawn")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Advance";"Salary Advance")
                {
                    ApplicationArea = Basic;
                }
                field("No of months deducted";"No of months deducted")
                {
                    ApplicationArea = Basic;
                }
                field("Monthly Installment";"Monthly Installment")
                {
                    ApplicationArea = Basic;
                }
                field(Purpose;Purpose)
                {
                    ApplicationArea = Basic;
                }
                field("Amount Pending";"Amount Pending")
                {
                    ApplicationArea = Basic;
                }
                field("Recovery Start Month";"Recovery Start Month")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
                {
                    ApplicationArea = Basic;
                }
                field("Amount Approved";"Amount Approved")
                {
                    ApplicationArea = Basic;
                }
                field("Effective from Month";"Effective from Month")
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
            action(Print)
            {
                ApplicationArea = Basic;
                Image = PrintForm;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    SetRange("No.","No.");
                    Report.Run(57015,true,true,Rec)
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Payment Type" := "payment type"::"Salary Advance";
        "Document Type":="document type"::"Salary Advance";

        Date := Today;
        "Created By" := UserId;
        "Account Type" := "account type"::Employee;

        Usersetup.Reset;
        Usersetup.SetRange("User ID","Created By");
        if Usersetup.FindSet then
        begin

          "Account No."  := Usersetup."Employee No.";
          "Account Name" := Usersetup."Employee Name";
        end;

        Employee.Reset;
        Employee.SetRange("No.","Account No.");
        if Employee.FindSet then
        begin
          //Employee.CALCFIELDS("Job Title");
          //Designation := Employee."Job Title";
          "Date of Joining" := Employee."Employment Date";
          "Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
          "Shortcut Dimension 2 Code" := Employee."Global Dimension 2 Code";
          Validate("Shortcut Dimension 2 Code");
          Validate("Shortcut Dimension 1 Code");

        end;
    end;

    var
        Usersetup: Record "User Setup";
        Employee: Record Employee;
}

