#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50048 "tableextension50048" extends "Bank Account Ledger Entry" 
{
    fields
    {

        //Unsupported feature: Property Insertion (Editable) on ""Remaining Amount"(Field 14)".

        field(50070;"Statement Date";Date)
        {
            CalcFormula = lookup("Bank Account Statement"."Statement Date" where ("Bank Account No."=field("Bank Account No."),
                                                                                  "Statement No."=field("Statement No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50071;"Project No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50072;"Contractor No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
}

