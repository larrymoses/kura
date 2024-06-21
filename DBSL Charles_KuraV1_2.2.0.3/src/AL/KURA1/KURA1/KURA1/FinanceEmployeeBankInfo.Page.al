#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57207 "Finance Employee Bank Info"
{
    PageType = ListPart;
    SourceTable = "Employee Payment Information";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Employee Bank Code"; Rec."Employee Bank Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Code';
                }
                field("Employee Bank Name"; Rec."Employee Bank Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Name';
                    Editable = false;
                }
                field("Employee Bank Branch Code"; Rec."Employee Bank Branch Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Branch Code';
                }
                field("Employee Bank Branch Name"; Rec."Employee Bank Branch Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Branch Name';
                    Editable = false;
                }
                field("Employee Bank Account Number"; Rec."Employee Bank Account Number")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Account Number';
                }
                field("Employee Mobile No"; Rec."Employee Mobile No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mobile No';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord(): Boolean
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Amend Bank Account Details" = false then begin
                Error('You do not have permission to edit bank details.Please contact your system admin.');
            end;

        end;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Amend Bank Account Details" = false then begin
                Error('You do not have permission to edit bank details.Please contact your system admin.');
            end;

        end;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Amend Bank Account Details" = false then begin
                Error('You do not have permission to edit bank details.Please contact your system admin.');
            end;

        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Amend Bank Account Details" = false then begin
                Error('You do not have permission to edit bank details.Please contact your system admin.');
            end;

        end;
    end;

    var
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

