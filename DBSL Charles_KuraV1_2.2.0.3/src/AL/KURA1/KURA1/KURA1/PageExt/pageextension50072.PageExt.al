#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50072 "pageextension50072" extends "Workflow User Group" 
{
    layout
    {
        addafter(Description)
        {
            field("Project Based";"Project Based")
            {
                ApplicationArea = Basic;
            }
            field("Region Code";"Region Code")
            {
                ApplicationArea = Basic;
                Visible = RegionCodeVisible;
            }
            field("Project ID";"Project ID")
            {
                ApplicationArea = Basic;
                Visible = ProjectIDVisible;
            }
            field("Project Name";"Project Name")
            {
                ApplicationArea = Basic;
                Visible = ProjectIDVisible;
            }
        }
    }

    var
        ProjectIDVisible: Boolean;
        RegionCodeVisible: Boolean;


    //Unsupported feature: Code Insertion on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //begin
        /*
        ProjectIDVisible:=FALSE;
        IF "Project Based"=TRUE THEN
          ProjectIDVisible:=TRUE;

        RegionCodeVisible:=TRUE;
        IF "Project Based"=TRUE THEN
        RegionCodeVisible:=FALSE;
        */
    //end;


    //Unsupported feature: Code Insertion on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //begin
        /*
        ProjectIDVisible:=FALSE;
        IF "Project Based"=TRUE THEN
          ProjectIDVisible:=TRUE;

        RegionCodeVisible:=TRUE;
        IF "Project Based"=TRUE THEN
        RegionCodeVisible:=FALSE;
        */
    //end;


    //Unsupported feature: Code Insertion on "OnOpenPage".

    //trigger OnOpenPage()
    //begin
        /*
        ProjectIDVisible:=FALSE;
        IF "Project Based"=TRUE THEN
          ProjectIDVisible:=TRUE;

        RegionCodeVisible:=TRUE;
        IF "Project Based"=TRUE THEN
        RegionCodeVisible:=FALSE;
        */
    //end;
}

