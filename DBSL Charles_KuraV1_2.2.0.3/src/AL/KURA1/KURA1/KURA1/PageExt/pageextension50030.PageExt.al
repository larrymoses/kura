#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50030 "pageextension50030" extends "General Ledger Setup" 
{
    layout
    {
        addafter(Application)
        {
            group("Customized Number Series")
            {
                field("File Movement Nos"; Rec."File Movement Nos")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        addafter("Allow Deferral Posting To")
        {
            field("Current Budget"; Rec."Current Budget")
            {
                ApplicationArea = Basic;
            }
        }
    }

    var
        UserSetup: Record "User Setup";
        Text004: label 'You do not have the permission to change or view general ledger setup. Please contact your system administrator.';


    //Unsupported feature: Code Insertion on "OnModifyRecord".

    //trigger OnModifyRecord(): Boolean
    //begin
        /*
        IF UserSetup.GET(USERID) THEN BEGIN
          IF UserSetup."View Appraisals"=FALSE THEN
            ERROR(Text004);
          END;
        */
    //end;


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
        xGeneralLedgerSetup := Rec;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..6

        IF UserSetup.GET(USERID) THEN BEGIN
          IF UserSetup."View Appraisals"=FALSE THEN
            ERROR(Text004);
          END;
        */
    //end;
}

