#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69200 "HR Disciplinary Cases"
{
    DrillDownPageID = "Disciplinary Committee";
    LookupPageID = "Disciplinary Committee";

    fields
    {
        field(1; "Case Number"; Code[20])
        {
            Caption = 'Case No.';
        }
        field(3; "Date of Complaint"; Date)
        {
            Caption = 'Date of Reporting';
        }
        field(4; "Type of Disciplinary Case"; Code[20])
        {
            NotBlank = true;
            TableRelation = "HR Models".Code where(Type = const("Disciplinary Case"));

            trigger OnValidate()
            begin
                Status := Status::Ongoing;
                Modify;
            end;
        }
        field(5; "Recommended Action"; Code[20])
        {
            TableRelation = "HR Models".Code where(Type = const("Disciplinary Action"));
        }
        field(6; "Case Description"; Text[250])
        {
        }
        field(7; Accuser; Code[10])
        {
            TableRelation = if ("Accuser Is Staff" = const(true)) "Company Positions";
            Caption = 'Reporter';
        }
        field(8; Witness; Code[20])
        {
            TableRelation = "Hr Case Witness"."Witness Number" where("Employee No" = field("Employee No"),
                                                                      "Case Number" = field("Case Number"));
        }
        field(9; "Witness #2"; Code[20])
        {
            TableRelation = if ("Witness#2 Staff" = const(true)) Employee."No.";
        }
        field(10; "Action Taken"; Code[20])
        {
            TableRelation = "HR Models".Code where(Type = const("Disciplinary Action"));
        }
        field(11; "Date To Discuss Case"; Date)
        {
        }
        field(12; "Document Link"; Text[200])
        {
        }
        field(13; "Disciplinary Remarks"; Code[50])
        {
        }
        field(14; Comments; Text[250])
        {
        }
        field(15; "Case Discussion"; Boolean)
        {
        }
        field(16; "Body Handling The Complaint"; Code[10])
        {
        }
        field(17; Recomendations; Text[250])
        {
        }
        field(18; "HR/Payroll Implications"; Integer)
        {
        }
        field(19; "Support Documents"; Option)
        {
            OptionMembers = Yes,No;
        }
        field(20; "Policy Guidlines In Effect"; Code[10])
        {
        }
        field(21; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Ongoing,Court Case,Closed,Appeal,"Internal Appeal","External Appeal",Reinstated';
            OptionMembers = Open,Ongoing,"Court Case",Closed,Appeal,"Internal Appeal","External Appeal",Reinstated;
        }
        field(22; "Mode of Lodging the Complaint"; Text[30])
        {
            Caption = 'Mode of Reporting';
        }
        field(23; "No. Series"; Code[20])
        {
        }
        field(24; "Employee No"; Code[30])
        {
            TableRelation = Employee."No.";
        }
        field(25; Selected; Boolean)
        {
        }
        field(26; "Closed By"; Code[100])
        {
        }
        field(27; "Case Severity"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Minor,Major';
            OptionMembers = " ",Minor,Major;
        }
        field(28; "Handled By"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,HOD,HR, Commitee,Court';
            OptionMembers = " ",HOD,HR," Commitee",Court;

            trigger OnValidate()
            begin
                if "Handled By" = "handled by"::Court then begin
                    Status := Status::"Court Case";
                    Modify;
                end;
            end;
        }
        field(29; "Disciplinary Commitee"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Disciplinary Committees".Code;
        }
        field(3963; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center";
        }
        field(3964; "Accuser Is Staff"; Boolean)
        {
            Caption = 'Reporter is Staff';
        }
        field(3965; "Witness#1 Staff"; Boolean)
        {
        }
        field(3966; "Witness#2 Staff"; Boolean)
        {
        }
        field(3967; "Disciplinary status"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Disciplinary Status"."Disciplinary Status" where("Employee No" = field("Employee No"),
                                                                                        "Case Number" = field("Case Number"));

            trigger OnValidate()
            begin
                if Confirm('Are you sure you want to change disciplinary status, please note that this change will have implications on the payroll?', true) then begin
                    "Disciplinary status" := "Disciplinary status";
                    Modify;
                end else begin
                    "Disciplinary status" := xRec."Disciplinary status";
                    Modify;
                end;
            end;
        }
        field(3968; "Case Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(3969; "Legal Case No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Case Register"."No.";
        }
        field(3970; "Legal Case Recommendation"; Text[2000])
        {
            CalcFormula = lookup("Case Register"."Verdict Summary" where("No." = field("Legal Case No.")));
            FieldClass = FlowField;
        }
        field(3971; "Inserted to Payroll"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(3972; "Action Taken Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3973; "Disciplinary Hearing Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(3974; "Recommendation Action Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3975; "Disciplinary Hearing"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(3976; "Appeal Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3977; "Response to Show Cause"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3978; "Area of Incident"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3979; "Other Persons Involved"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(3980; "HOD Comments"; Text[550])
        {
            DataClassification = ToBeClassified;
        }
        field(3981; "Date to Respond"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date to Respond';
        }
        field(3982; "Hearing Venue"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Employee No", "Case Number")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //GENERATE NEW NUMBER FOR THE DOCUMENT
        if "Case Number" = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Disciplinary Cases Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Disciplinary Cases Nos.", xRec."No. Series", 0D, "Case Number", "No. Series");
        end;
    end;

    trigger OnModify()
    begin
        if Status = Status::Closed then
            Error('You cannot modify a closed case');
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    /// <summary>
    /// NotifyHROnCaseFile.
    /// </summary>
    /// <param name="CaseFile">Record "HR Disciplinary Cases".</param>
    procedure NotifyHROnCaseFile(CaseFile: Record "HR Disciplinary Cases")
    var
        Emp: Record Employee;
        DispCase: Record "HR Disciplinary Cases";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
        Txt001: Label 'Notification sent successfully.';
    begin
        DispCase.Reset();
        DispCase.SetRange("Case Number", CaseFile."Case Number");
        DispCase.FindFirst;

        Emp.Reset();
        Emp.SetRange("No.", DispCase."Employee No");
        Emp.FindFirst();

        EmailRecepient.Add('paulmutuku@dynasoft.co.ke');
        EmailSubject := 'Disciplinary Case';
        EmailBody := 'This is to notify you that a report has been filed against <B>' + Emp.FullName + '</B.';
        EmailBody += '<BR>Please log on to your account to view the details of <B>Case No.' + DispCase."Case Number" + '</B> reported.';

        EmailMessage.Create(
            EmailRecepient,
            EmailSubject,
            EmailBody,
            true
        );

        Email.Send(EmailMessage);
    end;

    /// <summary>
    /// NotifyEmployeeToRespond.
    /// </summary>
    /// <param name="CaseFile">Record "HR Disciplinary Cases".</param>
    procedure NotifyEmployeeToRespond(CaseFile: Record "HR Disciplinary Cases")
    var
        Emp: Record Employee;
        DispCase: Record "HR Disciplinary Cases";
        DocAttach: Record "Document Attachment";
        TempBlob: Codeunit "Temp Blob";
        FileInStream: InStream;
        FileOutStream: OutStream;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
        Txt001: Label 'Notification sent successfully.';
    begin
        DispCase.Reset();
        DispCase.SetRange("Case Number", CaseFile."Case Number");
        DispCase.FindFirst;

        Emp.Reset();
        Emp.SetRange("No.", DispCase."Employee No");
        Emp.FindFirst();

        DocAttach.Reset();
        DocAttach.SetRange("Table ID", Database::"HR Disciplinary Cases");
        DocAttach.SetRange("No.", DispCase."Case Number");
        if DocAttach.FindFirst() then begin
            if DocAttach."Document Reference ID".HasValue then begin
                Clear(TempBlob);
                TempBlob.CreateOutStream(FileOutStream);
                TempBlob.CreateInStream(FileInStream);
                DocAttach."Document Reference ID".ExportStream(FileOutStream);

                EmailRecepient.Add(Emp."E-Mail");
                EmailSubject := 'Disciplinary Case';
                EmailBody := 'Dear ' + Emp."First Name" + ',';
                EmailBody += '<BR><BR>PFA your letter for <B>Case No.' + DispCase."Case Number" + '</B> reported on date: <B>' + Format(DispCase."Date of Complaint") + '</B>.';
                EmailBody += '<BR>You are hereby required to respond to show cause by date: <B>' + Format(DispCase."Date to Respond") + '</B>.';

                EmailMessage.Create(
                    EmailRecepient,
                    EmailSubject,
                    EmailBody,
                    true
                );

                EmailMessage.AddAttachment(
                    DocAttach."File Name" + '.' + DocAttach."File Extension",
                    DocAttach."File Extension",
                    FileInStream
                );

                Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
            end;
        end;

        Message(Txt001);
    end;

    /// <summary>
    /// NotifyHROnResponseToShowCause.
    /// </summary>
    /// <param name="CaseFile">Record "HR Disciplinary Cases".</param>
    procedure NotifyHROnResponseToShowCause(CaseFile: Record "HR Disciplinary Cases")
    var
        Emp: Record Employee;
        DispCase: Record "HR Disciplinary Cases";
        DocAttach: Record "Document Attachment";
        TempBlob: Codeunit "Temp Blob";
        FileInStream: InStream;
        FileOutStream: OutStream;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
        Txt001: Label 'Notification sent successfully.';
    begin
        DispCase.Reset();
        DispCase.SetRange("Case Number", CaseFile."Case Number");
        DispCase.FindFirst;

        Emp.Reset();
        Emp.SetRange("No.", DispCase."Employee No");
        Emp.FindFirst();

        DocAttach.Reset();
        DocAttach.SetRange("Table ID", Database::"HR Disciplinary Cases");
        DocAttach.SetRange("No.", DispCase."Case Number");
        if DocAttach.FindLast() then begin
            if DocAttach."Document Reference ID".HasValue then begin
                Clear(TempBlob);
                TempBlob.CreateOutStream(FileOutStream);
                TempBlob.CreateInStream(FileInStream);
                DocAttach."Document Reference ID".ExportStream(FileOutStream);

                EmailRecepient.Add('paulmutuku@dynasoft.co.ke');
                EmailSubject := 'Response To Show Cause';
                EmailBody := 'This is to inform you that <B>' + Emp.FullName + '</B> has responded according to the <B>Case No.' + DispCase."Case Number" + '</B> reported on date: <B>' + Format(DispCase."Date of Complaint") + '</B>.';

                EmailMessage.Create(
                    EmailRecepient,
                    EmailSubject,
                    EmailBody,
                    true
                );

                EmailMessage.AddAttachment(
                    DocAttach."File Name" + '.' + DocAttach."File Extension",
                    DocAttach."File Extension",
                    FileInStream
                );

                Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
            end;
        end;

        Message(Txt001);
    end;

    procedure NotifyEmployeeAndCommitteeOnDispHearing(CaseFile: Record "HR Disciplinary Cases")
    var
        Emp: Record Employee;
        DispCase: Record "HR Disciplinary Cases";
        DocAttach: Record "Document Attachment";
        CommitteeMembers: Record "Disciplinary Committee Members";
        TempBlob: Codeunit "Temp Blob";
        FileInStream: InStream;
        FileOutStream: OutStream;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailMessage1: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailBody1: Text;
        EmailRecepient: List of [Text];
        EmailRecepient1: List of [Text];
        Txt001: Label 'Members notified successfully.';
    begin
        DispCase.Reset();
        DispCase.SetRange("Case Number", CaseFile."Case Number");
        DispCase.FindFirst;

        Emp.Reset();
        Emp.SetRange("No.", DispCase."Employee No");
        Emp.FindFirst();

        EmailRecepient.Add(Emp."E-Mail");
        EmailSubject := 'Disciplinary Hearing';
        EmailBody := 'Dear ' + Emp."First Name" + ',';
        EmailBody += '<BR><BR>This is to inform you on your disciplinary hearing for Case No: <B>' + DispCase."Case Number" + '</B> which has been set on date: <B>' + Format(DispCase."Disciplinary Hearing Date") + '</B> at <B>' + DispCase."Hearing Venue" + '</B>.';

        EmailMessage.Create(
            EmailRecepient,
            EmailSubject,
            EmailBody,
            true
        );

        Email.Send(EmailMessage);

        CommitteeMembers.Reset();
        CommitteeMembers.SetRange(Committee, DispCase."Disciplinary Commitee");
        if CommitteeMembers.FindSet() then
            repeat
                Emp.Reset();
                Emp.SetRange("No.", CommitteeMembers.Code);
                if Emp.FindFirst() then
                    EmailRecepient1.Add(Emp."E-Mail");
            until CommitteeMembers.Next() = 0;

        EmailBody1 := 'You are hereby invited to a disciplinary hearing for Case No: <B>' + DispCase."Case Number" + '</B> which has been set on date: <B>' + Format(DispCase."Disciplinary Hearing Date") + '</B> at <B>' + DispCase."Hearing Venue" + '</B>.';

        EmailMessage1.Create(
            EmailRecepient1,
            EmailSubject,
            EmailBody1,
            true
        );

        Email.Send(EmailMessage1);

        Message(Txt001);
    end;

    /// <summary>
    /// NotifyHROnCaseAppeal.
    /// </summary>
    /// <param name="CaseFile">Record "HR Disciplinary Cases".</param>
    procedure NotifyHROnCaseAppeal(CaseFile: Record "HR Disciplinary Cases")
    var
        Emp: Record Employee;
        DispCase: Record "HR Disciplinary Cases";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
        Txt001: Label 'Notification sent successfully.';
    begin
        DispCase.Reset();
        DispCase.SetRange("Case Number", CaseFile."Case Number");
        DispCase.FindFirst;

        Emp.Reset();
        Emp.SetRange("No.", DispCase."Employee No");
        Emp.FindFirst();

        EmailRecepient.Add('paulmutuku@dynasoft.co.ke');
        EmailSubject := 'Case File Appeal';
        EmailBody := 'This is to inform you that <B>' + Emp.FullName + '</B> has made an appeal for <B>Case No.' + DispCase."Case Number" + '</B> reported on date: <B>' + Format(DispCase."Date of Complaint") + '</B>.';

        EmailMessage.Create(
            EmailRecepient,
            EmailSubject,
            EmailBody,
            true
        );

        Email.Send(EmailMessage);
    end;
}

