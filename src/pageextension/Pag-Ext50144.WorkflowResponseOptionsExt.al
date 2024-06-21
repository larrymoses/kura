pageextension 50144 "Workflow Response Options Ext" extends "Workflow Response Options"
{
    layout
    {
        modify(Control4)
        {
            Visible = false;
        }
        addafter(Control4)
        {
            group(Control50)
            {
                ShowCaption = false;
                Visible = ApproverLimitType;
                field("Approver Limit Types"; Rec."Approver Limit Type")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies how approvers'' approval limits affect when approval request entries are created for them. A qualified approver is an approver whose approval limit is above the value on the approval request.';
                    Caption = 'Approver Limit Type';
                    trigger OnValidate()
                    begin
                        CurrPage.Update(true)
                    end;
                }
            }
        }

    }
    trigger OnAfterGetRecord()
    begin
        ApproverLimitType := (Rec."Approver Type" = Rec."Approver Type"::"Salesperson/Purchaser") or (Rec."Approver Type" = Rec."Approver Type"::"Approver");
    end;

    trigger OnAfterGetCurrRecord()
    begin
        ApproverLimitType := (Rec."Approver Type" = Rec."Approver Type"::"Salesperson/Purchaser") or (Rec."Approver Type" = Rec."Approver Type"::"Approver");
    end;

    trigger OnOpenPage()
    begin
        ApproverLimitType := (Rec."Approver Type" = Rec."Approver Type"::"Salesperson/Purchaser") or (Rec."Approver Type" = Rec."Approver Type"::"Approver");
    end;

    var
        ApproverLimitType: Boolean;

}


