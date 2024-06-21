#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59010 "Fleet Drivers List"
{
    ApplicationArea = Basic;
    CardPageID = "Fleet Driver Card";
    //  DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Vehicle Drivers";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Driver; Driver)
                {
                    ApplicationArea = Basic;
                }
                field("Driver Name"; "Driver Name")
                {
                    ApplicationArea = Basic;
                }
                field("Driver License Number"; "Driver License Number")
                {
                    ApplicationArea = Basic;
                }
                field("Last License Renewal"; "Last License Renewal")
                {
                    ApplicationArea = Basic;
                }
                field("Renewal Interval"; "Renewal Interval")
                {
                    ApplicationArea = Basic;
                }
                field("Renewal Interval Value"; "Renewal Interval Value")
                {
                    ApplicationArea = Basic;
                }
                field("Next License Renewal"; "Next License Renewal")
                {
                    ApplicationArea = Basic;
                }
                field("Year Of Experience"; "Year Of Experience")
                {
                    ApplicationArea = Basic;
                }
                field(Grade; Grade)
                {
                    ApplicationArea = Basic;
                }
                field(Active; Active)
                {
                    ApplicationArea = Basic;
                }
                field("Region Code"; "Region Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Update Dates")
            {
                ApplicationArea = Basic;
                Image = CalendarMachine;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction()
                begin
                    VehicleDrivers.Reset;
                    if VehicleDrivers.Find('-') then
                        repeat
                            StrValue := 'D';

                            if VehicleDrivers."Renewal Interval" = VehicleDrivers."renewal interval"::Days then begin
                                StrValue := 'D';
                            end
                            else
                                if VehicleDrivers."Renewal Interval" = VehicleDrivers."renewal interval"::Weeks then begin
                                    StrValue := 'W';
                                end
                                else
                                    if VehicleDrivers."Renewal Interval" = VehicleDrivers."renewal interval"::Months then begin
                                        StrValue := 'M';
                                    end
                                    else
                                        if VehicleDrivers."Renewal Interval" = VehicleDrivers."renewal interval"::Quarterly then begin
                                            StrValue := 'Q';
                                        end
                                        else
                                            if VehicleDrivers."Renewal Interval" = VehicleDrivers."renewal interval"::Years then begin
                                                StrValue := 'Y';
                                            end;
                            if (VehicleDrivers."Renewal Interval Value" <> 0) and (VehicleDrivers."Last License Renewal" <> 0D) then
                                VehicleDrivers."Next License Renewal" := CalcDate(Format(VehicleDrivers."Renewal Interval Value") + StrValue, VehicleDrivers."Last License Renewal");
                            //VehicleDrivers.VALIDATE("Renewal Interval");
                            VehicleDrivers.Modify;
                        until VehicleDrivers.Next = 0;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        //  SETRANGE("Region Code",UserSetup."Region Code");
        //  END;
        if UserSetup.Get(UserId) then begin
            SetRange("Region Code", UserSetup."Region Code");
        end;

        if UserSetup.Get(UserId) then begin
            if (UserSetup."View Lab Works Inspections" = true) then
                Reset;
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        //  SETRANGE("Region Code",UserSetup."Region Code");
        //  END;
        if UserSetup.Get(UserId) then begin
            SetRange("Region Code", UserSetup."Region Code");
        end;

        if UserSetup.Get(UserId) then begin
            if (UserSetup."View Lab Works Inspections" = true) then
                Reset;
        end;
    end;

    trigger OnOpenPage()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        //  SETRANGE("Region Code",UserSetup."Region Code");
        //  END;
        if UserSetup.Get(UserId) then begin
            SetRange("Region Code", UserSetup."Region Code");
        end;

        if UserSetup.Get(UserId) then begin
            if (UserSetup."View Lab Works Inspections" = true) then
                Reset;
        end;
    end;

    var
        VehicleDrivers: Record "Vehicle Drivers";
        StrValue: Text[1];
        UserSetup: Record "User Setup";
}

