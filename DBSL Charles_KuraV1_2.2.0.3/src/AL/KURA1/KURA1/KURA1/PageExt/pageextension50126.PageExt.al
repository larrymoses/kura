#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50126 "pageextension50126" extends "IT Operations Activities"
{

    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    RESET;
    IF NOT GET THEN BEGIN
      INIT;
      INSERT;
    END;

    DataClassificationMgt.ShowNotifications;

    #9..16
    ShowIntelligentCloud := NOT PermissionManager.SoftwareAsAService;
    IntegrationSynchJobErrors.SetDataIntegrationUIElementsVisible(ShowDataIntegrationCues);
    ShowD365SIntegrationCues := CRMConnectionSetup.IsEnabled;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
    SETRANGE("User ID Filter",USERID);
    #6..19
    */
    //end;
    layout
    {
        addafter(Administration)
        {
            cuegroup("Document Approvals")
            {
                Caption = 'Document Approvals';
                field("Requests to Approve"; Rec."Requests to Approve")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Requests to Approve";
                }
                field("Requests Sent for Approval"; Rec."Requests Sent for Approval")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Approval Entries";
                }
            }
        }
    }
}

