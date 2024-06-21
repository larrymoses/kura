/// <summary>
/// Table SubscriptionSetup (ID 50013).
/// </summary>
table 50013 SubscriptionSetup
{
    Caption = 'Subscription & Continuous Development Setup';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Professional Body No."; Code[20])
        {
            Caption = 'Professional Body No.';
            TableRelation = "No. Series";
        }
        field(3; "Membership No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(4; "Membership Fees Req. No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(5; "Admin E-Mail"; Text[80])
        {
            DataClassification = ToBeClassified;
            Caption = 'Admin Email';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                if "Admin E-Mail" = '' then
                    exit;
                MailManagement.CheckValidEmailAddresses("Admin E-Mail");
            end;
        }
        field(6; "Conference Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
