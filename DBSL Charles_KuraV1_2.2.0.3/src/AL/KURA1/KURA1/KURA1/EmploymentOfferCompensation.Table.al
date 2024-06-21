#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69729 "Employment Offer Compensation"
{

    fields
    {
        field(1;"Offer ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employment Offer";
        }
        field(2;"Earnings Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = EarningsX;

            trigger OnValidate()
            var
                EmploymentOffer: Record "Employment Offer";
            begin
                EarningsX.Reset;
                EarningsX.SetRange(Code,"Earnings Code");
                if EarningsX.FindSet then begin
                  Message('Wow');
                  Description:=EarningsX.Description
                end;
                EmploymentOffer.Reset;
                EmploymentOffer.SetRange("Offer ID","Offer ID");
                if EmploymentOffer.FindFirst then begin
                  "Payroll Start Period":=EmploymentOffer."Payroll Start Period";
                end
            end;
        }
        field(3;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Pay Frequency";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Monthly Payroll,Daily Wage';
            OptionMembers = "Monthly Payroll","Daily Wage";
        }
        field(5;"Currency Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(6;"Line Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Line Amount(LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Payroll Start Period";Date)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Payroll PeriodX"."Starting Date";
        }
    }

    keys
    {
        key(Key1;"Offer ID","Earnings Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        EarningsX: Record EarningsX;
}

