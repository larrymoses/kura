#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72009 "Task Line Template"
{
    Caption = 'Job Task';
    DrillDownPageID = "Job Task Lines";
    LookupPageID = "Job Task Lines";

    fields
    {
        field(1;"Job No.";Code[20])
        {
            Caption = 'Job No.';
            Editable = true;
            NotBlank = true;
            TableRelation = Job;
        }
        field(2;"Job Task No.";Code[20])
        {
            Caption = 'Job Task No.';
            NotBlank = true;

            trigger OnValidate()
            var
                Job: Record Job;
                Cust: Record Customer;
            begin
            end;
        }
        field(3;Description;Text[250])
        {
            Caption = 'Description';
        }
        field(4;"Job Task Type";Option)
        {
            Caption = 'Job Task Type';
            OptionCaption = 'Posting,Heading,Total,Begin-Total,End-Total';
            OptionMembers = Posting,Heading,Total,"Begin-Total","End-Total";
        }
        field(5;"Job Posting Group";Code[20])
        {
            Caption = 'Job Posting Group';
            TableRelation = "Job Posting Group";
        }
    }

    keys
    {
        key(Key1;"Job No.","Job Task No.")
        {
            Clustered = true;
        }
        key(Key2;"Job Task No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Job Task No.",Description,"Job Task Type")
        {
        }
    }

    trigger OnDelete()
    var
        JobPlanningLine: Record "Job Planning Line";
        JobWIPTotal: Record "Job WIP Total";
        JobTaskDim: Record "Job Task Dimension";
    begin
    end;

    trigger OnInsert()
    var
        Job: Record Job;
        Cust: Record Customer;
    begin
    end;

    var
        CannotDeleteAssociatedEntriesErr: label 'You cannot delete %1 because one or more entries are associated.', Comment='%1=The job task table name.';
        CannotChangeAssociatedEntriesErr: label 'You cannot change %1 because one or more entries are associated with this %2.', Comment='%1 = The field name you are trying to change; %2 = The job task table name.';
        Job: Record Job;
        DimMgt: Codeunit DimensionManagement;
}

