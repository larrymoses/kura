#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 56014 "Import RICS New Lines"
{
    Format = VariableText;
    FormatEvaluate = Legacy;

    schema
    {
        textelement(Root)
        {
            tableelement("RICS New Road Link Line";"RICS New Road Link Line")
            {
                XmlName = 'INTERBANK';
                fieldelement(REGIONCODE;"RICS New Road Link Line"."RICS No.")
                {
                }
                fieldelement(CONSTITUENCY;"RICS New Road Link Line"."Road Code")
                {
                }
                fieldelement(BANKACC;"RICS New Road Link Line"."Link Name")
                {
                }
                fieldelement(AMOUNT;"RICS New Road Link Line"."Road Class ID")
                {
                }
                fieldelement(DESCR;"RICS New Road Link Line"."General Road Surface Condition")
                {
                }
                fieldelement(DOCNO;"RICS New Road Link Line"."Primary County ID")
                {
                }
                fieldelement(LINENO;"RICS New Road Link Line"."Primary Region ID")
                {
                }
                fieldelement(a;"RICS New Road Link Line"."Start Chainage(KM)")
                {
                }
                fieldelement(b;"RICS New Road Link Line"."End  Chainage(KM)")
                {
                }
                fieldelement(c;"RICS New Road Link Line"."Total Road Length (KMs)")
                {
                }
                fieldelement(d;"RICS New Road Link Line"."No. of Road Sections")
                {
                }
                fieldelement(e;"RICS New Road Link Line".Blocked)
                {
                }
                fieldelement(f;"RICS New Road Link Line"."Entry No")
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

