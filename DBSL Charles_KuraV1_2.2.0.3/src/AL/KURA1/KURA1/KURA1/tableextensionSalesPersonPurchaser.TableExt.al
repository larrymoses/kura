#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50001 "tableextension50001" extends "Salesperson/Purchaser"
{
    DrillDownPageID = "Salespersons/Purchasers";
    fields
    {
        field(50000; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(50001; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
            end;
        }
        field(50002; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
            end;
        }
        field(50003; "Procurement Officer License No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70000; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Directorate Code"));
        }
        field(70001; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70002; Division; Code[50])
        {
            DataClassification = ToBeClassified;
            Enabled = false;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
        field(70003; Region; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(70004; "Role Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Sales Person,Procurement Officer';
            OptionMembers = ,"Sales Person","Procurement Officer";
        }
        field(70005; "Employee Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Active,Inactive,Terminated';
            OptionMembers = Active,Inactive,Terminated;
        }
        field(70006; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70007; "Employee No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Emp.Reset;
                Emp.SetRange("No.", "Employee No");
                if Emp.FindSet then begin
                    Emp.CalcFields("Job Title");
                    Name := Emp.FullName;
                    "Employee Status" := Emp.Status;
                    "Job Title" := Emp."Job Title";
                    "Directorate Code" := Emp."Directorate Code";
                    "Department Code" := Emp."Department Code";
                    Region := Emp.Region;
                    "Phone No." := Emp."Phone No.";
                    "E-Mail" := Emp."E-Mail";
                    Validate("Global Dimension 1 Code", Emp."Global Dimension 1 Code");
                    Validate("Global Dimension 2 Code", Emp."Global Dimension 2 Code");
                end;
            end;
        }
        field(70008; "Receive Reorder Notification"; Boolean)
        {

        }
    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // key(Key1;Name)
        // {
        // }
    }

    //Unsupported feature: Property Modification (Name) on "Brick(FieldGroup 1)".


    //Unsupported feature: Insertion (FieldGroupCollection) on "(FieldGroup: Brick)".


    var
        Emp: Record Employee;
}

