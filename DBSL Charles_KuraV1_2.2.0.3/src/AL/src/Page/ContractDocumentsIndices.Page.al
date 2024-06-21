#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma warning disable DOC0101
#pragma implicitwith disable
Page 70126 "Contract Documents Indices"
#pragma warning restore DOC0101
{
    ApplicationArea = Basic;
    Caption = 'Contract Documents Indices';
    PageType = List;
    SourceTable = "Procurement Doc Template Line";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Document Type"; Rec."Procurement Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Contract Index"; Rec."Contract Index")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Procurement Process"; Rec."Procurement Process")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Track Certificate Expiry"; Rec."Track Certificate Expiry")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Guidelines/Instruction"; Rec."Guidelines/Instruction")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        ProcurementSetup.Get;
        Rec.Reset;
        Rec.SetRange("Template ID", ProcurementSetup."Default Procurement Template");
        Rec.SetRange("Part of Contract Document", true);
        Rec.FilterGroup(2);
        Rec.FilterGroup(0);
    end;

    trigger OnOpenPage()
    begin
        ProcurementSetup.Get;
        Rec.Reset;
        Rec.SetRange("Template ID", ProcurementSetup."Default Procurement Template");
        Rec.SetRange("Part of Contract Document", true);
        Rec.FilterGroup(2);
        Rec.FilterGroup(0);
    end;

    var
        ProcurementDocTemplateLine: Record "Procurement Doc Template Line";
        ProcurementSetup: Record "Procurement Setup";
}

#pragma implicitwith restore

