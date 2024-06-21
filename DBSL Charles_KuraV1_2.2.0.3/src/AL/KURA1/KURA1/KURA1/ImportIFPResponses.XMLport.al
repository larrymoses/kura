#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 70004 "Import IFP Responses"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("IFP Response Line";"IFP Response Line")
            {
                XmlName = 'IFP';
                fieldelement(Response_No;"IFP Response Line"."Document No.")
                {
                }
                fieldelement(Category;"IFP Response Line"."Procurement Category")
                {
                }
                fieldelement(IFPCode;"IFP Response Line"."RFI Document No.")
                {
                }
                fieldelement(VendorNo;"IFP Response Line"."Vendor No.")
                {
                }
                fieldelement(RegionCode;"IFP Response Line"."Responsibility Center ID")
                {
                }
                fieldelement(ConstituencyCode;"IFP Response Line"."Constituency Code")
                {
                }

                trigger OnBeforeInsertRecord()
                begin
                    // Vend.RESET;
                    // Vend.SETRANGE("VAT Registration No.","Bid Tabulation Line"."Vendor PIN");IFP
                    ResponseHeader.Reset;
                    ResponseHeader.SetRange("RFI Document No.","IFP Response Line"."RFI Document No.");
                    ResponseHeader.SetRange("Vendor No.","IFP Response Line"."Vendor No.");
                    ResponseHeader.SetRange("Responsibility Center ID","IFP Response Line"."Responsibility Center ID");
                    //ResponseHeader.SETRANGE("Document No.",ResponseHeader."Document No.");
                    if not ResponseHeader.FindSet then begin
                      repeat
                    ProcurementSetup.Get;
                    ResponseHeader.Init;
                    ResponseHeader."Document Type":=ResponseHeader."document type"::"IFP Response";
                    ResponseHeader."Document No.":=NoSeriesManagement.GetNextNo(ProcurementSetup."IFP Response Nos",Today,true);
                    ResponseHeader."RFI Document No.":="IFP Response Line"."RFI Document No.";
                    ResponseHeader."Vendor No.":="IFP Response Line"."Vendor No.";
                    ResponseHeader.Validate("Vendor No.");
                    ResponseHeader."Responsibility Center ID":="IFP Response Line"."Responsibility Center ID";
                    if ResponseHeader.Insert=true then begin
                    //  ResponseLine.INIT;
                    //  ResponseLine."RFI Document No.":=ResponseHeader."RFI Document No.";
                    //  ResponseLine."Document Type":=ResponseLine."Document Type"::"IFP Response";
                    //  ResponseLine."Document No.":=ResponseHeader."Document No.";
                    //  ResponseLine."Procurement Category":="IFP Response Line"."Procurement Category";
                    //  ResponseLine.VALIDATE("Procurement Category");
                    //  ResponseLine."Responsibility Center ID":="IFP Response Line"."Responsibility Center ID";
                    //  ResponseLine."Constituency Code":="IFP Response Line"."Constituency Code";
                    //  ResponseLine.MODIFY(TRUE);
                      end;
                    until ResponseHeader.Next=0;
                    end;
                    //  REPEAT
                    //  ResponseLine.INIT;
                    //  ResponseLine."RFI Document No.":=ResponseHeader."RFI Document No.";
                    //  ResponseLine."Document Type":=ResponseLine."Document Type"::"IFP Response";
                    //  ResponseLine."Document No.":=ResponseHeader."Document No.";
                    //  ResponseLine."Procurement Category":="IFP Response Line"."Procurement Category";
                    //  ResponseLine.VALIDATE("Procurement Category");
                    //  ResponseLine."Responsibility Center ID":="IFP Response Line"."Responsibility Center ID";
                    //  ResponseLine."Constituency Code":="IFP Response Line"."Constituency Code";
                    //  ResponseLine.MODIFY(TRUE);
                    //
                    //  UNTIL ResponseHeader.NEXT=0;

                    //  END ELSE BEGIN
                    //
                    //
                    //
                    //   END;
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

