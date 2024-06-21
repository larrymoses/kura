/// <summary>
/// Table ProfessionalBodyMembers (ID 50019).
/// </summary>
table 50019 ProfessionalBodyMembers
{
    Caption = 'ProfessionalBodyMembers';
    DataClassification = ToBeClassified;
    DrillDownPageId = ProfessionalBodyMembers;
    LookupPageId = ProfessionalBodyMembers;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Membership No."; Code[20])
        {
            Caption = 'Membership No.';
        }
        field(4; "Membership Category"; Code[20])
        {
            Caption = 'Membership Category';
            TableRelation = ProfBodyMembershipCategories where(Blocked = const(false));
        }
        field(5; Member; Code[20])
        {
            Caption = 'Member';
            NotBlank = true;
            TableRelation = Employee where(Status = filter(Active));

            trigger OnValidate()
            var
                Employee: Record Employee;
                Positions: Record Positions;
            begin
                if Member <> '' then begin
                    Employee.Get(Member);
                    Name := Employee.FullName();
                    Designation := Employee."Job Title";
                    Position := Employee."Job ID";
                    "Department Code" := Employee."Department Code";
                    "Directorate Code" := Employee."Directorate Code";
                    "Region Code" := Employee."Global Dimension 1 Code";

                    ResponsibilityCenter.Reset();
                    ResponsibilityCenter.SetRange(Code, Employee."Department Code");
                    if ResponsibilityCenter.FindFirst then
                        Department := ResponsibilityCenter.Name;

                    ResponsibilityCenter1.Reset();
                    ResponsibilityCenter1.SetRange(Code, Employee."Directorate Code");
                    if ResponsibilityCenter1.FindFirst then
                        Directorate := ResponsibilityCenter1.Name;

                    Positions.Reset();
                    Positions.SetRange("Position ID", Employee.Position);
                    if Positions.FindFirst then
                        "Job Title" := Positions."Job Title";
                    
                end else begin
                    Name := '';
                    Designation := '';
                    Position := '';
                    Directorate := '';
                    Department := '';
                    "Department Code" := '';
                    "Directorate Code" := '';
                    "Region Code" := '';
                end;
            end;
        }
        field(6; Name; Text[250])
        {
            Caption = 'Member Name';
            Editable = false;
        }
        field(7; Designation; Text[250])
        {
            Caption = 'Designation';
            Editable = false;
        }
        field(8; Position; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Positions;
            Editable = false;
        }
        field(9; "Annual Fee Payable"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "CPD Points Required"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Department; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; Directorate; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Department Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter("Department/Center"));
        }
        field(14; "Directorate Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate));
        }
        field(15; "Region Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Region));
        }
        field(16; "Job Title"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Practicing Licence No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.", "Membership No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        Member: Record ProfessionalBodyMembers;
    begin
        Member.Reset();
        Member.SetRange("Document No.", Rec."Document No.");
        if Member.FindLast() then begin
            "Line No." := Member."Line No." + 1;
        end;
    end;

    var
        ResponsibilityCenter: Record "Responsibility Center";
        ResponsibilityCenter1: Record "Responsibility Center";
}
