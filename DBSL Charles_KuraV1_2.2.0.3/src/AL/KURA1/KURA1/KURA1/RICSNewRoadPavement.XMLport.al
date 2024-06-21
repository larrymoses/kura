#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 56016 "RICS New Road Pavement"
{
    Format = VariableText;
    FormatEvaluate = Legacy;

    schema
    {
        textelement(Root)
        {
            tableelement("RICS New Road Pavement";"RICS New Road Pavement")
            {
                XmlName = 'INTERBANK';
                fieldelement(REGIONCODE;"RICS New Road Pavement"."RICS No.")
                {
                }
                fieldelement(CONSTITUENCY;"RICS New Road Pavement"."Entry No")
                {
                }
                fieldelement(BANKACC;"RICS New Road Pavement"."Road Code")
                {
                }
                fieldelement(AMOUNT;"RICS New Road Pavement"."Road Section No.")
                {
                }
                fieldelement(DESCR;"RICS New Road Pavement"."Pavement Surface Type")
                {
                }
                fieldelement(DOCNO;"RICS New Road Pavement"."Pavement Category")
                {
                }
                fieldelement(LINENO;"RICS New Road Pavement"."Start Chainage(KM)")
                {
                }
                fieldelement(a;"RICS New Road Pavement"."End Chainage(KM)")
                {
                }
                fieldelement(b;"RICS New Road Pavement"."Road Length (Kms)")
                {
                }
                fieldelement(c;"RICS New Road Pavement"."Road Surface Condition")
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

