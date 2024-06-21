#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50042 "tableextension50042" extends "Gen. Journal Batch" 
{
    fields
    {
        field(50000;"User ID";Code[50])
        {
            Caption = 'User ID';
            TableRelation = User;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            var
                LoginMgt: Codeunit "User Management";
            begin
                //LoginMgt.LookupUserID("User ID");
            end;

            trigger OnValidate()
            var
                LoginMgt: Codeunit "User Management";
            begin
                //LoginMgt.ValidateUserID("User ID");
            end;
        }
    }
    trigger OnInsert()
    var
        Usersetup: Record "User Setup";
    begin
        if Usersetup.Get(UserId) then
            if not Usersetup."Principal Accountant" then
                Error('Only the principal accountant can create a journal batch. Please contact your administrator!');
    end;
}

