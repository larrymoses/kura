#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69254 "Disciplinary Committees"
{
    DrillDownPageID = "Disciplinary Committee";
    LookupPageID = "Disciplinary Committee";

    fields
    {
        field(1;"Code";Code[20])
        {

            trigger OnValidate()
            begin
                if Code <> xRec.Code then begin
                  HRSetup.Get;
                  NoSeriesMgt.TestManual(HRSetup."Disciplinary Committee Nos");
                  "No series" := '';
                end;
            end;
        }
        field(2;Description;Text[200])
        {
            NotBlank = true;
        }
        field(3;Comments;Text[200])
        {
        }
        field(4;"Start Date";Date)
        {
        }
        field(5;"End Date";Date)
        {
        }
        field(6;Status;Option)
        {
            OptionCaption = 'Active,Disbanded';
            OptionMembers = Active,Disbanded;
        }
        field(7;Mandate;Text[250])
        {
        }
        field(8;"No series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Non-Employee"; Boolean)
        {
            DataClassification = ToBeClassified;
            InitValue = false;

            trigger OnValidate()
            var
                EmployeeCommittee: Record "Disciplinary Committee Members";
                NonEmployeeCommittee: Record "Board Disciplinary Committee";
            begin
                if "Non-Employee" = true then begin
                    EmployeeCommittee.Reset();
                    EmployeeCommittee.SetRange(Committee, Code);
                    if EmployeeCommittee.FindSet() then
                        EmployeeCommittee.DeleteAll();
                end else begin
                    NonEmployeeCommittee.Reset();
                    NonEmployeeCommittee.SetRange("Document No.", Code);
                    if NonEmployeeCommittee.FindSet() then
                        NonEmployeeCommittee.DeleteAll();
                end;
            end;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
          HRSetup.Get;
          HRSetup.TestField(HRSetup."Disciplinary Committee Nos");
          NoSeriesMgt.InitSeries(HRSetup."Disciplinary Committee Nos",xRec."No series",0D,Code,"No series");
        end;
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    /// <summary>
    /// IsEmployee.
    /// </summary>
    /// <returns>Return value of type Boolean.</returns>
    procedure IsEmployee():Boolean
    begin
        exit(Rec."Non-Employee" = false);
    end;
}

