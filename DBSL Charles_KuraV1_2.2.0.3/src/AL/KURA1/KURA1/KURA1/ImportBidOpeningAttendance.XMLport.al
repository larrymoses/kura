#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 70006 "Import Bid Opening Attendance"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Bid Opening Bidder Attendance";"Bid Opening Bidder Attendance")
            {
                XmlName = 'BidOpeningRegister';
                fieldelement(Code;"Bid Opening Bidder Attendance".Code)
                {
                }
                fieldelement(IFS_Code;"Bid Opening Bidder Attendance"."IFS Code")
                {
                }
                fieldelement(Vendor_No;"Bid Opening Bidder Attendance"."Vendor No.")
                {
                }
                fieldelement(Bidder_Representative_Name;"Bid Opening Bidder Attendance"."Bidder Representative Name")
                {
                }
                fieldelement(Bidder_Representative_Email;"Bid Opening Bidder Attendance"."Representative Email")
                {
                }
                fieldelement(Bidder_Representative_TelNo;"Bid Opening Bidder Attendance"."Representative Tel No")
                {
                }
                fieldelement(DateTimeNotified;"Bid Opening Bidder Attendance"."Date/Time Notified")
                {
                }
                fieldelement(Entry_No;"Bid Opening Bidder Attendance"."Entry No")
                {
                }
                fieldelement(Desigantion;"Bid Opening Bidder Attendance".Designation)
                {
                }
                fieldelement(NotifiedByEmail;"Bid Opening Bidder Attendance"."Notified By Email")
                {
                }
                fieldelement(VendorName;"Bid Opening Bidder Attendance"."Vendor Name")
                {
                }
                fieldelement(Postal_Address;"Bid Opening Bidder Attendance"."Postal Address")
                {
                }

                trigger OnAfterInsertRecord()
                begin

                    // ProcurementPlanLines.RESET;
                    // IF ProcurementPlanLines.FINDLAST THEN
                    //  LineNo:=ProcurementPlanLines."PP Line No"+1;
                    //
                    // PPEntry.RESET;
                    // PPEntry.SETRANGE("Procurement Plan ID","Procurement Plan Entry"."Procurement Plan ID");
                    // IF PPEntry.FINDSET THEN BEGIN
                    //  REPEAT
                    //  ProcurementPlanLines.RESET;
                    //  ProcurementPlanLines.SETRANGE("Procurement Plan ID","Procurement Plan Entry"."Procurement Plan ID");
                    //  ProcurementPlanLines.SETRANGE("Planning Category","Procurement Plan Entry"."Planning Category");
                    //  IF NOT ProcurementPlanLines.FINDSET THEN BEGIN
                    //  ProcurementPlanLines.INIT;
                    //  ProcurementPlanLines.VALIDATE(ProcurementPlanLines."Procurement Plan ID","Procurement Plan Entry"."Procurement Plan ID");
                    //  ProcurementPlanLines."PP Line No":=LineNo+1;
                    //  ProcurementPlanLines.VALIDATE("Planning Category","Procurement Plan Entry"."Planning Category");
                    //  ProcurementPlanLines.VALIDATE("Procurement Type","Procurement Plan Entry"."Procurement Type");
                    //  ProcurementPlanLines.VALIDATE("Solicitation Type","Procurement Plan Entry"."Solicitation Type");
                    //  ProcurementPlanLines.VALIDATE("Procurement Method","Procurement Plan Entry"."Procurement Method");
                    //  ProcurementPlanLines.VALIDATE("Primary Source of Funds","Procurement Plan Entry"."Funding Source ID");
                    //   ProcurementPlanLines.INSERT(TRUE);
                    //   LineNo+=1;
                    //   END;
                    //   UNTIL PPEntry.NEXT=0;
                    //  END;
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
        Message('Bid opning Register Imported Successfully.');
    end;

    var
        ProcurementPlanLines: Record "Procurement Plan Lines";
        PPEntry: Record "Procurement Plan Entry";
        PPActivity: Record "Procurement Activity Code";
        PPPlanActivity: Record "PP Purchase Activity Schedule";
        LineNo: Integer;
}

