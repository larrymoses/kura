#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69739 "Insurance Header"
{

    fields
    {
        field(1;"Document No.";Code[10])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                  if "Document No."<>xRec."Document No." then
                    HRSetup.Get();
                      NoSeriesMgt.TestManual(HRSetup."Insurance Document No.");
                   "No. Series" := '';
            end;
        }
        field(2;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Employee No.";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                if Emp.Get("Employee No.") then begin
                  "Employee Name":=Emp."First Name"+' '+Emp."Last Name";
                  "ID No.":=Emp."ID Number";
                  "KRA PIN No.":=Emp."P.I.N";
                  end;
            end;
        }
        field(4;"Employee Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"ID No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"KRA PIN No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Approved,Released,Cancelled';
            OptionMembers = Open,"Pending Approval",Approved,Released,Cancelled;
        }
        field(8;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Created By";Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Created Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Sum Assuared";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Monthly Premium";Decimal)
        {
            CalcFormula = sum("Insurance Lines"."Monthly Deduction" where ("Document No."=field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(13;"Policy Number";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"No. Series";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1;"Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
         if "Document No."='' then begin
           HRSetup.Get();
           HRSetup.TestField(HRSetup."Insurance Document No.");
          NoSeriesMgt.InitSeries(HRSetup."Insurance Document No." ,xRec."No. Series",0D,"Document No.","No. Series");
          end;

        "Created By":=UserId;
        "Created Date":=Today;
        "Document Date":=Today;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        HRSetup: Record "Human Resources Setup";
        Emp: Record Employee;
}

