#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 56018 "RICS New Road Environ"
{
    Format = VariableText;
    FormatEvaluate = Legacy;

    schema
    {
        textelement(Root)
        {
            tableelement("RICS New Road Environ";"RICS New Road Environ")
            {
                XmlName = 'INTERBANK';
                fieldelement(REGIONCODE;"RICS New Road Environ"."RICS No.")
                {
                }
                fieldelement(CONSTITUENCY;"RICS New Road Environ"."Entry No")
                {
                }
                fieldelement(BANKACC;"RICS New Road Environ"."Road Environ Category")
                {
                }
                fieldelement(AMOUNT;"RICS New Road Environ".Description)
                {
                }
                fieldelement(DESCR;"RICS New Road Environ"."Road Code")
                {
                }
                fieldelement(DOCNO;"RICS New Road Environ"."Road Section No.")
                {
                }
                fieldelement(LINENO;"RICS New Road Environ"."Connected to Road Link")
                {
                }
                fieldelement(a;"RICS New Road Environ"."Connection Road Length (Km)")
                {
                }
                fieldelement(b;"RICS New Road Environ"."Location Details")
                {
                }
                fieldelement(c;"RICS New Road Environ".Blocked)
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
        Message('Lines Imported Successfully');
    end;

    var
        AIEHeaderNo: Code[30];
        LineNo: Integer;

    procedure GetVariables(InterBankTransferLine: Record "Inter Bank Transfer Line") AIEHeader: Code[30]
    begin
        //AIEHeaderNo:=InterBankTransferLine."Document No";
    end;
}

