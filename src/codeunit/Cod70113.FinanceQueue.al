/// <summary>
/// Codeunit Finance Queue (ID 70113).
/// </summary>
codeunit 70113 "Finance Queue"
{
    trigger OnRun()
    begin
        ArchiveImprestRequisition;
        NotifyToSurrenderOnImprestDeadline;
    end;

    /// <summary>
    /// ArchiveImprestRequisition.
    /// </summary>
    procedure ArchiveImprestRequisition()
    var
        CMS: Record "Cash Management Setup";
        Payment: Record Payments;
        ArchiveReason: Record "Archive Reasons";
    begin
        if CMS.get() then begin
            if CMS."Archive Requisitions" then begin
                Payment.Reset();
                Payment.SetRange("Payment Type", Payment."Payment Type"::Imprest);
                Payment.SetRange(Status, Payment.Status::Open);
                Payment.SetRange("Archive Document", false);
                if Payment.FindSet() then begin
                    repeat
                        if Payment.Date <> 0D then
                            if (Today - Payment.Date) > CMS."Days To Archive Requisition" then begin
                                Payment."Archive Document" := true;
                                if Payment.Modify() then begin
                                    ArchiveReason.Init();
                                    ArchiveReason."Document No." := Payment."No.";
                                    ArchiveReason."Record ID" := Payment.RecordId;
                                    ArchiveReason."Action Type" := ArchiveReason."Action Type"::Archive;
                                    ArchiveReason."Document Type" := ArchiveReason."Document Type"::Imprest;
                                    ArchiveReason.Reason := StrSubstNo('Requisition open after required period of %1 days', CMS."Days To Archive Requisition");
                                    ArchiveReason.Insert(true);
                                end;

                            end;
                    until Payment.Next() = 0;
                end;
            end;
        end;
    end;


    procedure NotifyToSurrenderOnImprestDeadline()
    var
        Email: Codeunit Email;
        Mail: Codeunit "Email Message";
        Payment: Record Payments;
        Emp: Record Employee;
        Body: Text;
        Subject: Text;
        Recepient: Text;
    begin
        Payment.Reset();
        Payment.setrange(Posted, true);
        Payment.SetRange("Archive Document", false);
        Payment.SetRange(Surrendered, false);
        Payment.SetRange("Imprest Deadline", Today);
        if Payment.FindSet() then begin
            repeat
                if Emp.Get(Payment."Account No.") then begin
                    Recepient := Emp."Company E-Mail";
                    Payment.CalcFields("Imprest Amount");
                Subject := 'IMPREST SURRENDER ' + Payment."No.";
                Body := 'Dear' + ' ' + Payment."Account Name" + ',<br>' + 'This is to notify you that you have an outstanding imprest <b>' + Payment."No." + ' ' + Payment."Payment Narration" + '</b> of Amount ' + format(Payment."Imprest Amount") + ' that needs to be surrendered. <br>' + 'Kindly log in to your ESS portal to surrender';
                Mail.Create(Recepient, Subject, Body, true);
                Email.Send(Mail);
                end;
            until Payment.Next() = 0;
        end;
    end;
}
