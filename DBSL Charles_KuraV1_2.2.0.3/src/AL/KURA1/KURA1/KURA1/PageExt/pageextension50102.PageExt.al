#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50102 "pageextension50102" extends "Fixed Asset Card"
{
    layout
    {
        modify("FA Location Code")
        {
            Caption = 'Location';
        }
        addafter("FA Location Code")
        {
            field("Location Code"; "Location Code")
            {
                ApplicationArea = Basic;
                Caption = 'Region Code';
            }
            field("Responsibility Center"; "Responsibility Center")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Serial No.")
        {
            field("Tag No"; "Tag No")
            {
                ApplicationArea = Basic;
            }
            field("Chassis No"; "Chassis No")
            {
                ApplicationArea = Basic;
            }
            field("Asset Purchase Groups"; "Asset Purchase Groups")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Acquired)
        {
            field("Record Type"; "Record Type")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(General)
        {
            group("Research Details")
            {
                field("Research Center"; "Research Center")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
        addfirst(Maintenance)
        {
            field("Fixed Asset Type"; "Fixed Asset Type")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

