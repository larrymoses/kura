#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50079 "tableextension50079" extends "Approval Entry"
{
    fields
    {

        field(32; "From Date"; Date)
        {

        }
        field(33; "To Date"; Date)
        {

        }
        field(34; "Original Approver ID"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(35; "Approval Stage"; Code[50])
        {

        }
        field(36; "Region ID"; Code[100])
        {

            Description = '//Custom for KeRRA/KURA';
        }
        field(37; "Department ID"; Code[100])
        {

            Description = '//Custom for KeRRA/KURA';
        }
        field(38; "Approver Position"; Code[100])
        {

            Description = '//Custom for KeRRA/KURA';
        }
        field(50039; "Sender Name"; Text[100])
        {

        }
        field(50040; "Project Document Type"; Enum "Project Approval Doc Type")
        {

        }
        field(50041; "Employee No."; Code[20])
        {
            
        }
        field(50042; "Employee Name"; Text[100])
        {
            
        }
        field(50043; "Statement No."; Code[50])
        {
            
        }
        field(50044; Delegated; Boolean)
        {
            
        }
    }

        procedure RecordDetailsB() Details: Text
    var
        SalesHeader: Record "Sales Header";
        PurchHeader: Record "Purchase Header";
        RecRef: RecordRef;
        ChangeRecordDetails: Text;
        PV: Record Payments;
        Appraisals: Record "Employee Appraisals";
        Receipt: Record "Receipts Header1";
        LeaveApp: Record "Employee Leave Application";
        BankRec: Record "Bank Acc. Reconciliation";
    begin

        if not RecRef.Get("Record ID to Approve") then
            exit(Format("Record ID to Approve", 0, 1));
        ChangeRecordDetails := GetChangeRecordDetails;

        case RecRef.Number of
            DATABASE::"Sales Header":
                begin
                    RecRef.SetTable(SalesHeader);
                    SalesHeader.CalcFields(Amount);
                    Details :=
                      StrSubstNo(
                        '%1 ; %2: %3', SalesHeader."Sell-to Customer Name", SalesHeader.FieldCaption(Amount), SalesHeader.Amount);
                end;
            DATABASE::"Purchase Header":
                begin
                    RecRef.SetTable(PurchHeader);
                    PurchHeader.CalcFields(Amount);
                    Details :=
                      StrSubstNo(
                        '%1 ; %2: %3', PurchHeader."Buy-from Vendor Name", PurchHeader.FieldCaption(Amount), PurchHeader.Amount);
                end;
          
           
            Database::Payments:
                begin
                    RecRef.SetTable(PV);
                    pv.CalcFields("Total Amount");
                    Details := StrSubstNo('%1 ; %2, %3: %4', PV."Paying Bank Account", PV.Payee, 'Amount', Pv."Total Amount");
                end;
            Database::"Employee Appraisals":
                begin
                    RecRef.SetTable(Appraisals);
                    Details := StrSubstNo('%1 ; %2: %3', Appraisals."Appraisee Name", 'Period', Appraisals."Appraisal Period");
                end;
            Database::Receipts:
                begin
                    RecRef.SetTable(Receipt);
                    Receipt.CalcFields(Amount);
                    Details := StrSubstNo('%1 ; %2: %3', Receipt."Received From", 'Amount', Receipt.Amount);
                end;
            Database::"Employee Leave Application":
                begin
                    RecRef.SetTable(LeaveApp);
                    Details := StrSubstNo('%1 ; %2: %3', LeaveApp."Employee Name", LeaveApp.FieldCaption("Days Applied"), LeaveApp."Days Applied");
                end;
            else
                Details := Format("Record ID to Approve", 0, 1) + ChangeRecordDetails;
        end;
    end;

     procedure MarkAllWhereUserisApproverandApproved()
    var
        UserSetup: Record "User Setup";
        IsHandled: Boolean;
    begin
        if UserSetup.Get(UserId) and UserSetup."Approval Administrator" then
            exit;

        FilterGroup(-1); // Used to support the cross-column search
        SetRange("Approver ID", UserId);
        //Rec.SetRange(Status,Status::Approved);
        if FindSet() then
            repeat
                Mark(true);
            until Next() = 0;
        MarkedOnly(true);
        FilterGroup(0);
    end;

}

