#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50080 "tableextension50080" extends "Approval Comment Line" 
{
    fields
    {
        modify("Document Type")
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Imprest Memo,Payment Voucher,Petty Cash, Imprest,Imprest Surrender,Payroll,Store Requisition,Purchase Requisition,Leave Application,Bank Transfer, ';

            //Unsupported feature: Property Modification (OptionString) on ""Document Type"(Field 3)".

        }
        field(50000;"Approved Days";Decimal)
        {
            Caption = 'Approved Days';

            trigger OnValidate()
            begin
                //CALCULATE THE END DATE AND RETURN DATE
                begin
                if ("Approved Days" <> 0) and ("Approved Start Date" <> 0D) then
                "Approved Return Date" := HRLeaveApp.DetermineLeaveReturnDate("Approved Start Date","Approved Days");
                //"Approved End Date" := HRLeaveApp.DeterminethisLeaveEndDate(RetDate);
                //MODIFY;
                end;
            end;
        }
        field(50001;"Approved Start Date";Date)
        {

            trigger OnValidate()
            begin
                //CALCULATE THE END DATE AND RETURN DATE
                begin
                if ("Approved Days" <> 0) and ("Approved Start Date" <> 0D) then
                "Approved Return Date" := HRLeaveApp.DetermineLeaveReturnDate("Approved Start Date","Approved Days");
                //"Approved End Date" := HRLeaveApp.DeterminethisLeaveEndDate(RetDate);
                //MODIFY;
                end;
            end;
        }
        field(50002;"Approved Return Date";Date)
        {
        }
        field(50003;Reason;Text[100])
        {
        }
        field(50004;"Leave Allowance Granted";Boolean)
        {
        }
    }

    var
        HRLeaveApp: Record "HR Leave Applications";
}

