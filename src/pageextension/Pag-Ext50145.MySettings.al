pageextension 50145 "My Settings" extends "User Settings"
{
    layout
    {
    modify(UserRoleCenter)
    {
        Visible =AllowChangeRole;
    }
    modify(Company)
    {
        Visible=AllowChangeCompany;
    }
        modify("Work Date")
    {
        Visible = AllowChangeWorkDate;
    }
    }
    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
        NoPermission: Label 'You do not have permission to open the User Settings Page. Please contact your administrator ';
    begin
        AllowChangeCompany := false;
        AllowChangeRole := false;
        AllowChangeWorkDate := false;
        if UserSetup.Get(UserId) then
        if UserSetup."Allow Open My Settings" then begin
           AllowChangeCompany :=UserSetup."Allow Change Company";
           AllowChangeRole := UserSetup."Allow Change Role";
           AllowChangeWorkDate:=UserSetup."Allow Change Company";
            end else
                Error(NoPermission);
    end;

    var
        AllowChangeCompany: Boolean;
        AllowChangeRole: Boolean;
        AllowChangeWorkDate: Boolean;
}