#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50073 "pageextension50073" extends "Workflow User Group Members" 
{
    layout
    {

        //Unsupported feature: Property Insertion (Visible) on ""User Name"(Control 3)".

        addafter("User Name")
        {
            field("HR Position";"HR Position")
            {
                ApplicationArea = Basic;
                Visible = HRPositionVisible;
            }
        }
        addafter("Sequence No.")
        {
            field("Region Code";"Region Code")
            {
                ApplicationArea = Basic;
                Editable = false;
                Visible = RegionCodeVisible;
            }
            field("Alternative Station";"Alternative Station")
            {
                ApplicationArea = Basic;
                Visible = AlternativeStationVisible;
            }
            field("Project ID";"Project ID")
            {
                ApplicationArea = Basic;
            }
            field("Project Role";"Project Role")
            {
                ApplicationArea = Basic;
            }
        }
    }

    var
        HRPositionVisible: Boolean;
        RegionCodeVisible: Boolean;
        AlternativeStationVisible: Boolean;
        WFGroup: Record "Workflow User Group";


    //Unsupported feature: Code Insertion on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //begin
        /*
        HRPositionVisible:=TRUE;
        AlternativeStationVisible:=TRUE;
        RegionCodeVisible:=TRUE;
        IF "Project Based" =TRUE THEN BEGIN
            HRPositionVisible:=FALSE;
            AlternativeStationVisible:=FALSE;
            RegionCodeVisible:=FALSE;
        END;
        */
    //end;


    //Unsupported feature: Code Insertion on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //begin
        /*
        HRPositionVisible:=TRUE;
        AlternativeStationVisible:=TRUE;
        RegionCodeVisible:=TRUE;
        IF "Project Based" =TRUE THEN BEGIN
            HRPositionVisible:=FALSE;
            AlternativeStationVisible:=FALSE;
            RegionCodeVisible:=FALSE;
        END;
        */
    //end;


    //Unsupported feature: Code Insertion on "OnOpenPage".

    //trigger OnOpenPage()
    //begin
        /*
        HRPositionVisible:=TRUE;
        AlternativeStationVisible:=TRUE;
        RegionCodeVisible:=TRUE;
        IF "Project Based" =TRUE THEN BEGIN
            HRPositionVisible:=FALSE;
            AlternativeStationVisible:=FALSE;
            RegionCodeVisible:=FALSE;
        END;
        */
    //end;
}

