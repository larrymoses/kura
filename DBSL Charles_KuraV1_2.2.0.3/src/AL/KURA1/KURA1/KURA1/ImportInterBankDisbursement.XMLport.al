#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 56012 "Import Inter Bank Disbursement"
{
    Format = VariableText;
    FormatEvaluate = Legacy;
    schema
    {
        textelement(Root)
        {
            tableelement("Inter Bank Transfer Line"; "Inter Bank Transfer Line")
            {
                XmlName = 'INTERBANK';
                fieldelement(REGIONCODE; "Inter Bank Transfer Line"."Shortcut Dimension 1 Code")
                {
                }
                fieldelement(FS; "Inter Bank Transfer Line"."Funding Source")
                {
                }
                fieldelement(BANKACC; "Inter Bank Transfer Line"."Bank Account No")
                {
                }
                fieldelement(AMOUNT; "Inter Bank Transfer Line".Amount)
                {
                }
                fieldelement(PAYREF; "Inter Bank Transfer Line"."Payment Reference")
                {
                }
                fieldelement(DOCNO; "Inter Bank Transfer Line"."Document No")
                {
                }
                fieldelement(DESCR; "Inter Bank Transfer Line".Description)
                {
                }
                fieldelement(LINENO; "Inter Bank Transfer Line"."Line No")
                {
                }

                // trigger OnBeforeInsertRecord()
                // begin := 
                //     "Inter Bank Transfer Line"."Document Type":="Inter Bank Transfer Line"."document type"::"AIE Funds Transfer";
                //     "Inter Bank Transfer Line".Validate("Inter Bank Transfer Line".Amount);
                // end;
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
        Message('Success');
    end;

    var
        AIEHeaderNo: Code[30];
        LineNo: Integer;

    procedure GetVariables(InterBankTransferLine: Record "Inter Bank Transfer Line") AIEHeader: Code[30]
    begin
        //AIEHeaderNo:=InterBankTransferLine."Document No";
    end;
}

