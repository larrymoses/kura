#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59048 "Fuel Card-Closed"
{
    DeleteAllowed = false;
    Editable = false;
    PageType = Card;
    SourceTable = "Fuel Card";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Registration No."; "Registration No.")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Fleet Vehicles List";
                }
                field(Make; Make)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Model; Model)
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field("Card Type"; "Card Type")
                {
                    ApplicationArea = Basic;
                }
                field(lowerlimit; lowerlimit)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Allocated Limit"; "Total Allocated Limit")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    LookupPageID = "Limit Types";
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Interval"; "Requisition Interval")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("End Date"; "End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Fuel Card No."; "Fuel Card No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Amount Spend"; "Total Amount Spend")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Balance"; "Total Balance")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Allocated Vehicle Limit"; "Allocated Vehicle Limit")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Amt Spend per Vehicle"; "Total Amt Spend per Vehicle")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                }
                field("Vehicle Balance"; "Vehicle Balance")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                }
            }
            part(Control1000000015; "Fuel Card Lines")
            {
                Editable = false;
                SubPageLink = "No." = field(No);
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Send Request Approval")
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;

                trigger OnAction()
                begin
                    if Status <> Status::Open then
                        Error('Status must be open');
                    //ApprovalMgt.SendFuelCardApprovalRequest(Rec)
                    Status := Status::Approved;
                    Modify;
                    Message('Document Approved Successfully');
                end;
            }
            action("Cancel  Request Approval")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;

                trigger OnAction()
                begin
                    //ApprovalMgt.CancelFuelCardRequest(Rec,TRUE,TRUE);
                end;
            }
            action("Fuel Post")
            {
                ApplicationArea = Basic;
                Caption = 'Post';
                Image = Post;
                Promoted = true;

                trigger OnAction()
                begin
                    if Status <> Status::Approved then
                        Error('Approval Status MUST be Approved');

                    if Posted = true then
                        Error('This Fuel Card Record is Already Posted %1', No);
                    //check if amount to be posted is greator than allocated amount.
                    CalcFields(check, "Total Allocated Limit");
                    CheckLimit := "Total Amount Spend" + check;
                    if CheckLimit > "Total Allocated Limit" then
                        Error('You are not allowed to post Reciept amount(s) that is greater than amount allocated');
                    //check if lower lower limit has been exceeded.
                    if "Total Balance" < lowerlimit then
                        Message('Remaining balance is%1,Please reoder,your limit of Ksh. %2,has been passed', "Total Balance", lowerlimit);
                    //Check if vehicle limit has been exceeded.
                    lowercheck := "Total Amt Spend per Vehicle" + check;

                    if lowercheck > "Total Allocated Limit" then begin
                        Error('The amount spend for this vehicle is more than allocated amount');
                        /*IF CONFIRM('The amount spend for this vehicle is more than allocated amount,Do you still want to Post?',TRUE)=FALSE THEN
                        EXIT;*/
                    end;
                    //enter data to Detailed ledger entry table
                    FuelCard.Reset;
                    FuelCard.SetRange(FuelCard.No, No);
                    if FuelCard.Find('-') then begin
                        FuelCardLines.Reset;
                        FuelCardLines.SetRange(FuelCardLines."No.", No);
                        if FuelCardLines.Find('-') then
                            repeat
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
                            until FuelCardLines.Next = 0;
                        Posted := true;
                        Message('Fuel card record posted successfully');
                    end;

                end;
            }
            action("Close Document")
            {
                ApplicationArea = Basic;
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                    FuelCardLines.Reset;
                    FuelCardLines.SetRange(FuelCardLines."No.", No);
                    if FuelCardLines.Find('-') then begin
                        repeat
                            FuelCardLines.closed := true;
                            FuelCardLines.Modify;
                        until FuelCardLines.Next = 0;
                    end;


                    DetailedFD.Reset;
                    DetailedFD.SetRange(No, No);
                    if DetailedFD.Find('-') then begin
                        repeat
                            DetailedFD.closed := true;
                            DetailedFD.Modify;
                        until DetailedFD.Next = 0;
                    end;


                    closed := true;
                    Modify;

                    Message('Fuel Card Document Closed successfully');
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        CalcFields("Total Amount Spend");
        "Total Balance" := "Total Allocated Limit" - "Total Amount Spend";
        CalcFields("Total Amt Spend per Vehicle");
        "Vehicle Balance" := "Allocated Vehicle Limit" - "Total Amt Spend per Vehicle";
        CalcFields(check);
    end;

    trigger OnOpenPage()
    begin
        /*IF "Total Amount Spend">"Allocated vehicle Limit" THEN BEGIN
        ERROR('Total amount spend can not be more that allocated amount');
        END;*/

    end;

    var
        DetailedFD: Record "Fuel Card Entries";
        FuelCardLines: Record "Vehicle Fuel Card Lines";
        FuelCard: Record "Fuel Card";
        CheckLimit: Decimal;
        LowerLimit: Record "Limit Types";
        lowercheck: Decimal;
    //ApprovalMgt: Codeunit "Approvals Mgmt.";
}

