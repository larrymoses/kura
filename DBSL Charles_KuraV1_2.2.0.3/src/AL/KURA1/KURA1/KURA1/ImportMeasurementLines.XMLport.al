#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 56013 "Import Measurement Lines"
{
    Format = VariableText;
    FormatEvaluate = Legacy;

    schema
    {
        textelement(Root)
        {
            tableelement("Measurement & Payment Line";"Measurement & Payment Line")
            {
                XmlName = 'INTERBANK';
                fieldelement(REGIONCODE;"Measurement & Payment Line"."Document Type")
                {
                }
                fieldelement(CONSTITUENCY;"Measurement & Payment Line"."Document No")
                {
                }
                fieldelement(BANKACC;"Measurement & Payment Line"."Job No.")
                {
                }
                fieldelement(AMOUNT;"Measurement & Payment Line"."Job Task No.")
                {
                }
                fieldelement(DESCR;"Measurement & Payment Line"."Line No.")
                {
                }
                fieldelement(DOCNO;"Measurement & Payment Line"."No.")
                {
                }
                fieldelement(LINENO;"Measurement & Payment Line".Description)
                {
                }
                fieldelement(a;"Measurement & Payment Line"."Unit of Measure Code")
                {
                }
                fieldelement(b;"Measurement & Payment Line"."Measurement Type")
                {
                }
                fieldelement(c;"Measurement & Payment Line"."Linear/Unit Quantity")
                {
                }
                fieldelement(d;"Measurement & Payment Line"."Length (m)")
                {
                }
                fieldelement(e;"Measurement & Payment Line"."Width (m)")
                {
                }
                fieldelement(f;"Measurement & Payment Line"."Height/Depth (m)")
                {
                }
                fieldelement(g;"Measurement & Payment Line"."Measured Quantity")
                {
                }
                fieldelement(h;"Measurement & Payment Line"."Contract Quantity")
                {
                }
                fieldelement(i;"Measurement & Payment Line"."Direct Unit Cost (LCY)")
                {
                }
                fieldelement(j;"Measurement & Payment Line"."Unit Cost (LCY)")
                {
                }
                fieldelement(k;"Measurement & Payment Line"."Total Cost (LCY)")
                {
                }
                fieldelement(l;"Measurement & Payment Line"."Gen. Prod. Posting Group")
                {
                }
                fieldelement(m;"Measurement & Payment Line"."Technology Type")
                {
                }
                fieldelement(n;"Measurement & Payment Line"."Bill Item Category Code")
                {
                }
                fieldelement(o;"Measurement & Payment Line"."Works Start Chainage")
                {
                }
                fieldelement(p;"Measurement & Payment Line"."Works End Chainage")
                {
                }

                trigger OnBeforeInsertRecord()
                begin
                    "Measurement & Payment Line".Type:="Measurement & Payment Line".Type::" ";
                end;
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

