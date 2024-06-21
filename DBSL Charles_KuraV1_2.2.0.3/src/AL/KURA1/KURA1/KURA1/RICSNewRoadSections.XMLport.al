#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 56015 "RICS New Road Sections"
{
    Format = VariableText;
    FormatEvaluate = Legacy;

    schema
    {
        textelement(Root)
        {
            tableelement("RICS New Road Section";"RICS New Road Section")
            {
                XmlName = 'INTERBANK';
                fieldelement(REGIONCODE;"RICS New Road Section"."RICS No")
                {
                }
                fieldelement(CONSTITUENCY;"RICS New Road Section"."Road Section No.")
                {
                }
                fieldelement(BANKACC;"RICS New Road Section"."Road Code")
                {
                }
                fieldelement(AMOUNT;"RICS New Road Section"."Section Name")
                {
                }
                fieldelement(DESCR;"RICS New Road Section"."Road Class ID")
                {
                }
                fieldelement(DOCNO;"RICS New Road Section"."Road Category")
                {
                }
                fieldelement(LINENO;"RICS New Road Section"."Carriageway Type")
                {
                }
                fieldelement(a;"RICS New Road Section"."Primary Constituency ID")
                {
                }
                fieldelement(b;"RICS New Road Section"."Primary County ID")
                {
                }
                fieldelement(c;"RICS New Road Section"."Primary Region ID")
                {
                }
                fieldelement(d;"RICS New Road Section"."Start Chainage(KM)")
                {
                }
                fieldelement(e;"RICS New Road Section"."End Chainage(KM)")
                {
                }
                fieldelement(f;"RICS New Road Section"."Total Road Length (KMs)")
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

