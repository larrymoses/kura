#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59000 "Fleet Vehicles List"
{
    ApplicationArea = Basic;
    CardPageID = "Fleet Vehicle Card";
    //  DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Fleet Vehicles.";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Fixed Asset List-flt";
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = Basic;
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = Basic;
                }
                field("FA Class Code"; Rec."FA Class Code")
                {
                    ApplicationArea = Basic;
                }
                field("FA Subclass Code"; Rec."FA Subclass Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("FA Location Code"; Rec."FA Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Warranty Date"; Rec."Warranty Date")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Employee"; Rec."Responsible Employee")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = Loans;
                    LookupPageID = Loans;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("Maintenance Vendor No."; Rec."Maintenance Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Next Service Date"; Rec."Next Service Date")
                {
                    ApplicationArea = Basic;
                }
                field("Last Service Date"; Rec."Last Service Date")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Operation Setups";
                    LookupPageID = "Operation Setups";
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Vehicle Model List";
                    LookupPageID = "Vehicle Model List";
                }
                field("Start Reading"; Rec."Start Reading")
                {
                    ApplicationArea = Basic;
                }
                field("Body Color"; Rec."Body Color")
                {
                    ApplicationArea = Basic;
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = Basic;
                }
                field("Current Reading"; Rec."Current Reading")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        //  SETRANGE("Location Code",UserSetup."Region Code");
        //  END;
        if UserSetup.Get(UserId) then begin
            Rec.SetRange("Location Code", UserSetup."Region Code");
        end;

        if UserSetup.Get(UserId) then begin
            if (UserSetup."View Lab Works Inspections" = true) then
                Rec.Reset;
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        //  SETRANGE("Location Code",UserSetup."Region Code");
        //  END;
        if UserSetup.Get(UserId) then begin
            Rec.SetRange("Location Code", UserSetup."Region Code");
        end;

        if UserSetup.Get(UserId) then begin
            if (UserSetup."View Lab Works Inspections" = true) then
                Rec.Reset;
        end;
    end;

    trigger OnOpenPage()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        //  SETRANGE("Location Code",UserSetup."Region Code");
        //  END;
        // IF UserSetup.GET(USERID) THEN BEGIN
        //        SETRANGE("Responsibility Center",UserSetup."Purchase Resp. Ctr. Filter");
        //    END;
        //
        // IF UserSetup.GET(USERID) THEN BEGIN
        //  IF ((UserSetup."AIE Creation & Posting" = TRUE) OR (UserSetup."Principal Accountant"=TRUE)) THEN
        //    RESET;
        //  END;
        if UserSetup.Get(UserId) then begin
            Rec.SetRange("Location Code", UserSetup."Region Code");
        end;

        if UserSetup.Get(UserId) then begin
            if (UserSetup."View Lab Works Inspections" = true) then
                Rec.Reset;
        end;
    end;

    var
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

