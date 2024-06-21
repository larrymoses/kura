#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72341 "PCO Project Road Link"
{
    DrillDownPageID = "Project Road Links";
    LookupPageID = "Project Road Links";

    fields
    {
        field(1; "Document No"; Code[20])
        {

        }
        field(2; "Document Type"; Option)
        {

            OptionCaption = ' ,Order-To-Commence,Work Execution Programme,Mobilization Checklist,Mobilization Checklist Status Report';
            OptionMembers = " ","Order-To-Commence","Work Execution Programme","Mobilization Checklist","Mobilization Checklist Status Report";
        }
        field(3; "Line No."; Integer)
        {

        }
        field(4; "Road Code"; Code[20])
        {

        }
        field(5; "Road Name"; Text[300])
        {

        }
        field(6; "Start Chainage"; Decimal)
        {

        }
        field(7; "End Chainage"; Decimal)
        {

        }
        field(8; "Workplanned Length"; Decimal)
        {

        }
        field(9; "Project ID"; Code[20])
        {

        }
        field(10; "Issue Possession of Site?"; Boolean)
        {

        }
        field(11; "Effective Date"; Date)
        {

        }
        field(12; "Possession of Site Issued"; Boolean)
        {
            trigger OnValidate()
            begin
                if ("Issue Possession of Site?" = true) and IssuePossessionofSite(Rec) then begin
                    Rec."Effective Date" := Today;
                    Rec."Issued DateTime" := CurrentDateTime;
                end;
            end;
        }
        field(13; "Issued DateTime"; DateTime)
        {

        }
    }

    keys
    {
        key(Key1; "Document No", "Document Type", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        //   RoadInventory: Record "Road Inventory";
        //        RoadSection: Record "Road Section";

        /// <summary>
        /// IssuePossessionofSite.
        /// </summary>
        /// <param name="ProjectRoadLink">VAR Record "PCO Project Road Link".</param>
    procedure IssuePossessionofSite(var ProjectRoadLink: Record "PCO Project Road Link"):Boolean
    var
    ConfirmManagement: Codeunit "Confirm Management";
    begin
        if ConfirmManagement.GetResponse(StrSubstNo('Are you sure to issue possession for %1',ProjectRoadLink."Road Code"),true) then
        exit(true);
    end;
}

