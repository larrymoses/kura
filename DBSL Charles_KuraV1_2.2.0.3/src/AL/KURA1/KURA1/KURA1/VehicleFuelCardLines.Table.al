#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 59001 "Vehicle Fuel Card Lines"
{

    fields
    {
        field(1;"No.";Code[20])
        {

            trigger OnValidate()
            begin
                /*FHead.RESET;
                FHead.SETRANGE(FHead.No,"No.");
                IF FHead.FIND('-') THEN
                  BEGIN
                     VALIDATE("No.",FHead.No);
                  END;*/

                if "No." = '' then begin
                    FltMgtSetup.Get;
                    FltMgtSetup.TestField(FltMgtSetup."Fuel Expense No");
                    NoSeriesMgt.InitSeries(FltMgtSetup."Fuel Expense No", xRec."No. Series", 0D, "No.", "No. Series");
                end;
            end;
        }
        field(2;"Reciept No";Code[20])
        {
        }
        field(3;Amount;Decimal)
        {
        }
        field(4;"Date of Fueling";Date)
        {
        }
        field(5;Driver;Text[30])
        {
            TableRelation = "Vehicle Drivers";

            trigger OnValidate()
            begin
                FleetDriver.Reset;
                FleetDriver.SetRange(FleetDriver.Driver,Driver);
                if FleetDriver.Find('-') then
                "Driver Names":=FleetDriver."Driver Name";
            end;
        }
        field(6;"Driver Names";Text[30])
        {
        }
        field(7;"Vehicle RegNo";Code[20])
        {
            TableRelation = "Fleet Vehicles."."FA Serial No";

            trigger OnValidate()
            begin
                    VMake.Reset;
                    VMake.SetRange(VMake."FA Serial No","Vehicle RegNo");
                    if VMake.Find('-') then
                    "vehicle Make":=VMake.Make;
            end;
        }
        field(8;"vehicle Make";Text[30])
        {
        }
        field(9;closed;Boolean)
        {

        }
        field(10;"Other Expenses";Decimal)
        {

        }
        field(11; "Approval Status"; Enum "App Status")
        {

        }
        field(12; Posted; Boolean)
        {

        }
        field(13; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1;"Reciept No","No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            FltMgtSetup.Get;
            FltMgtSetup.TestField(FltMgtSetup."Fuel Expense No");
            NoSeriesMgt.InitSeries(FltMgtSetup."Fuel Expense No", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        FHead: Record "Fuel Card";
        FleetDriver: Record "Vehicle Drivers";
        VMake: Record "Fleet Vehicles.";
        FltMgtSetup: Record "Fleet Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    Procedure PostFuelCardExpense(FuelCardLines: Record "Vehicle Fuel Card Lines")
    var
        DetailedFD: Record "Fuel Card Entries";
        FuelCard: Record "Fuel Card";
        lowercheck: Decimal;
        CheckLimit: Decimal;
    begin
        lowercheck := 0;
        CheckLimit := 0;
        FuelCard.Reset();
        FuelCard.SetRange(No, FuelCardLines."No.");
        if FuelCard.findfirst() then begin
            if FuelCard.closed then
            error('This fuel card is already closed');
            if FuelCardLines.Posted = true then
                Error('This Fuel Card Record is Already Posted %1', FuelCard.No);
            //check if amount to be posted is greator than allocated amount.
            FuelCard.CalcFields(check, "Total Allocated Limit");
            CheckLimit := FuelCard."Total Amount Spend" + FuelCard.check;
            if CheckLimit > FuelCard."Total Allocated Limit" then
                Error('You are not allowed to post Reciept amount(s) that is greater than amount allocated');
            //check if lower lower limit has been exceeded.
            if FuelCard."Total Balance" < FuelCard.lowerlimit then
                Message('Remaining balance is%1,Please reoder,your limit of Ksh. %2,has been passed', FuelCard."Total Balance", FuelCard.lowerlimit);
            //Check if vehicle limit has been exceeded.
            lowercheck := FuelCard."Total Amt Spend per Vehicle" + FuelCard.check;

            if lowercheck > FuelCard."Total Allocated Limit" then begin
                Error('The amount spend for this vehicle is more than allocated amount');
                /*IF CONFIRM('The amount spend for this vehicle is more than allocated amount,Do you still want to Post?',TRUE)=FALSE THEN
                EXIT;*/
            end;
        end
        else
        Error('Could not find fuel card %1', FuelCardLines."No.");
        //enter data to Detailed ledger entry table
        DetailedFD.Init;
        DetailedFD.Line := DetailedFD.Line + 1;
        DetailedFD.No := FuelCardLines."No.";
        DetailedFD."Reciept No" := FuelCardLines."Reciept No";
        DetailedFD.Amount := FuelCardLines.Amount;
        DetailedFD."Date of Filling" := FuelCardLines."Date of Fueling";
        DetailedFD."Date of posting" := Today;
        DetailedFD.Driver := FuelCardLines.Driver;
        DetailedFD."Driver Names" := FuelCardLines."Driver Names";
        DetailedFD.RegNo := FuelCardLines."Vehicle RegNo";
        DetailedFD.Make := FuelCardLines."vehicle Make";
        DetailedFD.Posted := true;
        if DetailedFD.Amount <> 0 then
            DetailedFD.Insert;
        FuelCardLines.Posted := true;
        FuelCardLines.Modify();
    end;
}

