#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 70005 "Import IFP General Details"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("RFI Response";"RFI Response")
            {
                XmlName = 'IFP';
                fieldelement(Document_No;"RFI Response"."Document No.")
                {
                }
                fieldelement(Vendor_No;"RFI Response"."Vendor No.")
                {
                }
                fieldelement(IFP_No;"RFI Response"."RFI Document No.")
                {
                }
                fieldelement(Responsibility_Center;"RFI Response"."Responsibility Center ID")
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    "RFI Response".Validate("Vendor No.");
                    // Vend.RESET;
                    // Vend.SETRANGE("VAT Registration No.","Bid Tabulation Line"."Vendor PIN");
                    // ResponseHeader.RESET;
                    // ResponseHeader.SETRANGE("RFI Document No.","IFP Response Line"."RFI Document No.");
                    // ResponseHeader.SETRANGE("Vendor No.","IFP Response Line"."Vendor No.");
                    // ResponseHeader.SETRANGE("Responsibility Center ID","IFP Response Line"."Responsibility Center ID");
                    // IF ResponseHeader.FINDSET THEN BEGIN
                    //
                    //
                    //
                    //  END ELSE BEGIN
                    // ResponseHeader.INIT;
                    // ResponseHeader."Document No.":=NoSeriesManagement.GetNextNo(ProcurementSetup."IFP Response Nos",TODAY,TRUE);
                    // ResponseHeader."RFI Document No.":="IFP Response Line"."RFI Document No.";
                    // ResponseHeader."Vendor No.":="IFP Response Line"."Vendor No.";
                    // ResponseHeader.VALIDATE("Vendor No.");
                    // ResponseHeader."Responsibility Center ID":="IFP Response Line"."Responsibility Center ID";
                    // ResponseHeader.INSERT:=TRUE;
                    //
                    //
                    //   END;
                end;

                trigger OnBeforeInsertRecord()
                begin
                    // // Vend.RESET;
                    // // Vend.SETRANGE("VAT Registration No.","Bid Tabulation Line"."Vendor PIN");IFP
                    // ResponseHeader.RESET;
                    // ResponseHeader.SETRANGE("RFI Document No.","IFP Response Line"."RFI Document No.");
                    // ResponseHeader.SETRANGE("Vendor No.","IFP Response Line"."Vendor No.");
                    // ResponseHeader.SETRANGE("Responsibility Center ID","IFP Response Line"."Responsibility Center ID");
                    // //ResponseHeader.SETRANGE("Document No.",ResponseHeader."Document No.");
                    // IF NOT ResponseHeader.FINDSET THEN BEGIN
                    //  REPEAT
                    // ProcurementSetup.GET;
                    // ResponseHeader.INIT;
                    // ResponseHeader."Document Type":=ResponseHeader."Document Type"::"IFP Response";
                    // ResponseHeader."Document No.":=NoSeriesManagement.GetNextNo(ProcurementSetup."IFP Response Nos",TODAY,TRUE);
                    // ResponseHeader."RFI Document No.":="IFP Response Line"."RFI Document No.";
                    // ResponseHeader."Vendor No.":="IFP Response Line"."Vendor No.";
                    // ResponseHeader.VALIDATE("Vendor No.");
                    // ResponseHeader."Responsibility Center ID":="IFP Response Line"."Responsibility Center ID";
                    // IF ResponseHeader.INSERT=TRUE THEN BEGIN
                    //  ResponseLine.INIT;
                    //  ResponseLine."RFI Document No.":=ResponseHeader."RFI Document No.";
                    //  ResponseLine."Document Type":=ResponseLine."Document Type"::"IFP Response";
                    //  ResponseLine."Document No.":=ResponseHeader."Document No.";
                    //  ResponseLine."Procurement Category":="IFP Response Line"."Procurement Category";
                    //  ResponseLine.VALIDATE("Procurement Category");
                    //  ResponseLine."Responsibility Center ID":="IFP Response Line"."Responsibility Center ID";
                    //  ResponseLine."Constituency Code":="IFP Response Line"."Constituency Code";
                    //  ResponseLine.MODIFY(TRUE);
                    //  END;
                    // UNTIL ResponseHeader.NEXT=0;
                    // END;
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
        Message('Responses Imported Succesfully');
    end;

    var
        Vend: Record Vendor;
        ResponseHeader: Record "RFI Response";
        ResponseLine: Record "IFP Response Line";
        ProcurementCategory: Record "Procurement Category";
        ResponsibilityCenter: Record "Responsibility Center";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        ProcurementSetup: Record "Procurement Setup";
}

