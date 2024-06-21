#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 56092 "Case Register"
{
    DrillDownPageID = "All Case Register List";
    LookupPageID = "All Case Register List";

    fields
    {
        field(1;"No.";Code[50])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                  HRSetup.Get;
                  NoSeriesMgt.TestManual(HRSetup."Legal Case Nos");
                  "No series" := '';
                end;
            end;
        }
        field(2;"Case Number";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Case Types";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Case Types"."Case Type" where ("Case Nature"=field("Nature of Case"));
        }
        field(4;"Nature of Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Case Desscription/Transpired";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Nature of Case";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Nature of Cases";
        }
        field(7;"Last Hearing Date";Date)
        {
            CalcFormula = max("Case Hearing"."Last Hearing Date" where ("Case Entry"=field("No.")));
            FieldClass = FlowField;
        }
        field(8;"Next Hearing Date";Date)
        {
            CalcFormula = max("Case Hearing"."Next Hearing Date" where ("Case Entry"=field("No.")));
            FieldClass = FlowField;
        }
        field(9;"Advocate on Record";Text[200])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Case Advocates".Code;

            trigger OnValidate()
            begin
                // CaseHearing.RESET;
                // CaseHearing.SETRANGE(CaseHearing."Case Entry","No.");
                // IF CaseHearing.FINDLAST THEN
                //  REPEAT
                //    CaseHearing."Advocate On Record":="Advocate on Record";
                //    CaseHearing.MODIFY;
                // UNTIL CaseHearing.NEXT

                CaseAdvocates.Reset;
                CaseAdvocates.SetRange(CaseAdvocates.Code,"Advocate on Record");
                if CaseAdvocates.FindSet then
                  "Advocate on Record":=CaseAdvocates.Names;
            end;
        }
        field(10;Progress;Text[1000])
        {
            CalcFormula = max("Case Hearing".Progress where ("Case Entry"=field("No.")));
            FieldClass = FlowField;
        }
        field(11;"Name of Parties";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Nature of Claim";Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(13;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'New,Ongoing,Closed';
            OptionMembers = New,Ongoing,Closed;
        }
        field(14;Verdict;Option)
        {
            Caption = 'Verdict Status';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Won,Lost';
            OptionMembers = " ",Won,Lost;
        }
        field(15;"Verdict Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Verdict Summary";Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"No series";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"From Document Number";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Employee Name";Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Employee No";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(21;"HR Case Number";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Reference Number";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Plaintiff Advocate";Text[200])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
          HRSetup.Get;
          HRSetup.TestField(HRSetup."Legal Case Nos");
          NoSeriesMgt.InitSeries(HRSetup."Legal Case Nos",xRec."No series",0D,"No.","No series");
        end;
    end;

    var
        CaseHearing: Record "Case Hearing";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRSetup: Record "Human Resources Setup";
        UserSetup: Record "User Setup";
        HREmp: Record Employee;
        CaseAdvocates: Record "Case Advocates";
}

