#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 56017 "RICS New Road Facility"
{
    Format = VariableText;
    FormatEvaluate = Legacy;

    schema
    {
        textelement(Root)
        {
            tableelement("RICS New Road Facility";"RICS New Road Facility")
            {
                XmlName = 'INTERBANK';
                fieldelement(REGIONCODE;"RICS New Road Facility"."RICS No.")
                {
                }
                fieldelement(CONSTITUENCY;"RICS New Road Facility"."Entry No")
                {
                }
                fieldelement(BANKACC;"RICS New Road Facility"."Road Code")
                {
                }
                fieldelement(AMOUNT;"RICS New Road Facility"."Road Section No.")
                {
                }
                fieldelement(DESCR;"RICS New Road Facility"."Road Facility Category")
                {
                }
                fieldelement(DOCNO;"RICS New Road Facility"."Road Facility Type")
                {
                }
                fieldelement(LINENO;"RICS New Road Facility"."Road Facility SubType")
                {
                }
                fieldelement(a;"RICS New Road Facility".Description)
                {
                }
                fieldelement(b;"RICS New Road Facility"."Facility Label")
                {
                }
                fieldelement(c;"RICS New Road Facility"."Facility Location")
                {
                }
                fieldelement(d;"RICS New Road Facility"."Material Type")
                {
                }
                fieldelement(f;"RICS New Road Facility"."General Facility Condition")
                {
                }
                fieldelement(g;"RICS New Road Facility"."Construction Project ID")
                {
                }
                fieldelement(h;"RICS New Road Facility"."Construction Date")
                {
                }
                fieldelement(i;"RICS New Road Facility"."Last Maintenance Date")
                {
                }
                fieldelement(j;"RICS New Road Facility".Blocked)
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

