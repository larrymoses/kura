table 99608 "Departmental Objectives"
{
    Caption = 'Departmental Objectives';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Appraisal Period"; Code[30])
        {
            Caption = 'Appraisal Period';
            TableRelation = "Appraisal Periods";
        }
        field(2; "Shortcut Dimension 3 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3),
                                                          Blocked = const(false));
        }
    }
    keys
    {
        key(PK; "Appraisal Period","Shortcut Dimension 3 Code")
        {
            Clustered = true;
        }
    }
}
