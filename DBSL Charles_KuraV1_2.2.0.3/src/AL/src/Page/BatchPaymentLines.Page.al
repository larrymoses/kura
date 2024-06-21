#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95319 "Batch Payment Lines"
{
    PageType = ListPart;
    SourceTable = "Bank Payments Batching Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Payment Type";"Payment Type")
                {
                    ApplicationArea = Basic;
                }
                field("Batch No";"Batch No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Mode";"Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Cheque No";"Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("On behalf of";"On behalf of")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Paying Bank Account";"Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted By";"Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted Date";"Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Amount";"Total Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Approve;Approve)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        ApprovalEntry.Reset;
                        ApprovalEntry.SetCurrentkey("Sequence No.");
                        ApprovalEntry.SetAscending("Sequence No.",true);
                        ApprovalEntry.SetRange("Document No.","Batch No");
                        if ApprovalEntry.FindLast() then begin
                          if ApprovalEntry."Approver ID"<>UserId then begin
                                Error('Only the final approver can modify this field.');
                          end;
                        end;
                    end;
                }
            }
        }
    }

    actions
    {
    }

    var
        ApprovalEntry: Record "Approval Entry";
}

