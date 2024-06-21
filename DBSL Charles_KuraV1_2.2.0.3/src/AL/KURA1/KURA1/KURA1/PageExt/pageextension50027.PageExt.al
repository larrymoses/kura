#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50027 "pageextension50027" extends "Job List"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Job List"(Page 89)".

    layout
    {
        modify("No.")
        {
            Caption = 'Project Number';
        }
        modify(Description)
        {
            Caption = 'Project Descrption';
        }

        //Unsupported feature: Property Insertion (Visible) on ""Bill-to Customer No."(Control 8)".

        modify("Person Responsible")
        {
            Caption = '<Person Responsible>';
        }
        modify("Project Manager")
        {
            Caption = '<Regional Officer>';
        }
        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = Basic;
            }
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = Basic;
                Caption = 'Region';
                Editable = false;
            }
        }
        addafter("% Invoiced")
        {
            field("Project Budget"; Rec."Project Budget")
            {
                ApplicationArea = Basic;
                Caption = 'Total Contract Sum';
            }
            field("Actual Project Costs"; Rec."Actual Project Costs")
            {
                ApplicationArea = Basic;
            }
            field("Creation Date"; Rec."Creation Date")
            {
                ApplicationArea = Basic;
            }
            field(Commitments; Rec.Commitments)
            {
                ApplicationArea = Basic;
            }
            field("WIP Method"; Rec."WIP Method")
            {
                ApplicationArea = Basic;
            }
            field("Starting Date"; Rec."Starting Date")
            {
                ApplicationArea = Basic;
            }
            field("Ending Date"; Rec."Ending Date")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Project Manager")
        {
            field("Contractor Name"; Rec."Contractor Name")
            {
                ApplicationArea = Basic;
            }
            field(exchequer; Rec.exchequer)
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        addafter("Job Task &Lines")
        {
            action("Job Planning Lines")
            {
                ApplicationArea = Jobs;
                Caption = 'Job Planning Lines';
                Image = Planning;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Job Planning Lines";
                RunPageLink = "Job No." = field("No.");
                ShortCutKey = 'Shift+Ctrl+T';
                ToolTip = 'Plan how you want to set up your planning information. In this window you can specify the tasks involved in a job. To start planning a job or to post usage for a job, you must set up at least one job task.';
            }
        }
    }

    var
        UserSetup: Record "User Setup";


    //Unsupported feature: Code Insertion on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //begin
    /*
    // IF  exchequer = FALSE THEN BEGIN
    // IF UserSetup.GET(USERID) THEN BEGIN
    //
    //  SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
    //  END;
    //  END ELSE
    //  RESET;
    */
    //end;


    //Unsupported feature: Code Insertion on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //begin
    /*
    // IF  exchequer = FALSE THEN BEGIN
    // IF UserSetup.GET(USERID) THEN BEGIN
    //
    //  SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
    //  END;
    //  END ELSE
    //  RESET;
    */
    //end;


    //Unsupported feature: Code Insertion on "OnOpenPage".

    //trigger OnOpenPage()
    //begin
    /*
    // IF  exchequer = FALSE THEN BEGIN
    // IF UserSetup.GET(USERID) THEN BEGIN
    //
    //  SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
    //  END;
    //  END ELSE
    //  RESET;
    */
    //end;
}

#pragma implicitwith restore

