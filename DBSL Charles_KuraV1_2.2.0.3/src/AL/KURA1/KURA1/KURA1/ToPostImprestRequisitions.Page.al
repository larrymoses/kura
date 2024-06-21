#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57135 "To Post Imprest Requisitions"
{
    CardPageID = "To post  Imprest Requisition";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = payments;
    SourceTableView = where("Payment Type"=const(Imprest),
                            Status=filter(Released),
                            Posted=const(false),
                            "Send for Posting"=const(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
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
                field("Imprest Amount";"Imprest Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Deadline";"Imprest Deadline")
                {
                    ApplicationArea = Basic;
                }
                field(Payee;Payee)
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015;Notes)
            {
            }
            systempart(Control1000000016;Links)
            {
            }
        }
    }

    actions
    {
        area(reporting)
        {
        }
    }

    trigger OnAfterGetRecord()
    begin
        if UserSetup.Get(UserId) then begin
        if UserSetup."Post Requisition" =false then
        SetRange("Created By",UserId);
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Imprest Type":="imprest type"::"Project Imprest";
    end;

    trigger OnOpenPage()
    begin
        if UserSetup.Get(UserId) then begin
        if UserSetup."Post Requisition" =false then
        SetRange("Created By",UserId);
        end;
    end;

    var
        UserSetup: Record "User Setup";
}

