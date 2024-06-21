#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 54001 "Money Markets Listings"
{
    Format = VariableText;
    FormatEvaluate = Legacy;

    schema
    {
        textelement(Root)
        {
            tableelement("Money Markets listings";"Money Markets listings")
            {
                XmlName = 'Investments';
                fieldelement(IssueNo;"Money Markets listings"."Issue No")
                {
                }
                fieldelement(IssueDate;"Money Markets listings"."Issue Date")
                {
                }
                fieldelement(MaturityDate;"Money Markets listings"."Maturity Date")
                {
                }
                fieldelement(CouponRate;"Money Markets listings"."Coupon Rate")
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    trigger OnPostXmlPort()
    begin
        Message('Imported Succesfully');
    end;

    var
        VarCode: Code[20];
        VendorRec: Record Vendor;
        GenJnlLine: Record "Gen. Journal Line";
        LineNo: Integer;
        ImportDate: Date;
        AccType: Option "G/L Account",Bank;
        AccNo: Code[20];
        TotalAmt: Decimal;
        PurchSetup: Record "Purchases & Payables Setup";
        TaxReliefLimit: Decimal;
        TaxReliefAmt: Decimal;
        User: Record User;
        Periods: Integer;
        SchemeSetup: Record "Company Information";
        X: Integer;
        PreviousPeriod: Record "Payroll PeriodX";
        PensionCalculator: Codeunit "HR Dates";
        NormalRetirementDate: Date;
        xEmployee: Decimal;
        XEmployer: Decimal;
        XemployeeAdd: Decimal;
        Months: Decimal;
        NSSFLower: Decimal;
        NssfUpper: Decimal;
        "NSSFT1%": Decimal;
        "NSSFT2%": Decimal;
}

