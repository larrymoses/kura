#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59028 "Fuel Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Fuel Card";
    SourceTableView = where(closed = const(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;

                    LookupPageID = "Fleet Vehicles List";
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field("Card Type"; Rec."Card Type")
                {
                    ApplicationArea = Basic;
                }
                field(lowerlimit; Rec.lowerlimit)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Allocated Limit"; Rec."Total Allocated Limit")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    LookupPageID = "Limit Types";
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Interval"; Rec."Requisition Interval")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Number"; Rec."Vehicle Number")
                {
                    ApplicationArea = Basic;
                    Caption = 'Fleet No.';
                }
                field("Driver Details"; Rec."Driver Details")
                {
                    ApplicationArea = Basic;
                }
                field("Fuel Card No."; Rec."Fuel Card No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Amount Spend"; Rec."Total Amount Spend")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Balance"; Rec."Total Balance")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Allocated Vehicle Limit"; Rec."Allocated Vehicle Limit")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Total Amt Spend per Vehicle"; Rec."Total Amt Spend per Vehicle")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    Visible = false;
                }
                field("Vehicle Balance"; Rec."Vehicle Balance")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                    Visible = false;
                }
            }
            part(Control1000000015; "Fuel Card Lines")
            {
                SubPageLink = "No." = field(No),Posted=const(true);
                UpdatePropagation =Both;
                
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Fuel Post")
            {
                ApplicationArea = Basic;
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                  Visible = false;
                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::Approved then
                        Error('Approval Status MUST be Approved');
                end;
            }
            action("Close Document")
            {
                ApplicationArea = Basic;
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin

                    FuelCardLines.Reset;
                    FuelCardLines.SetRange(FuelCardLines."No.", Rec.No);
                    if FuelCardLines.Find('-') then begin
                        repeat
                            FuelCardLines.closed := true;
                            FuelCardLines.Modify;
                        until FuelCardLines.Next = 0;
                    end;


                    DetailedFD.Reset;
                    DetailedFD.SetRange(No, Rec.No);
                    if DetailedFD.Find('-') then begin
                        repeat
                            DetailedFD.closed := true;
                            DetailedFD.Modify;
                        until DetailedFD.Next = 0;
                    end;


                    Rec.closed := true;
                    Rec.Modify;

                    Message('Fuel Card Document Closed successfully');
                end;
            }
        }
        area(Navigation)
        {
            action("Top ups")
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                RunObject = Page "Fuel Top Up List";
                RunPageLink = "Card No." = field(No);
            }
            action(Expense)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                RunObject = Page "Fuel Expenses";
                RunPageLink = "No." = field(No);
            }
        }
        area(creation)
        {
            action("Send Request Approval")
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;

                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::Open then
                        Error('Status must be open');
                    //ApprovalMgt.SendFuelCardApprovalRequest(Rec)
                    Rec.Status := Rec.Status::Approved;
                    Rec.Modify;
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

        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Total Top Up Amount", "Total Amount Spend", "Total Amt Spend per Vehicle", check,"Total Allocated Limit",lowerlimit,"Total Allocated Amount");
        Rec."Total Balance" := (Rec."Total Allocated Amount" + Rec."Total Top Up Amount") - Rec."Total Amount Spend";
    end;

    trigger OnAfterGetCurrRecord()
    begin
        Rec.CalcFields("Total Top Up Amount", "Total Amount Spend", "Total Amt Spend per Vehicle", check,"Total Allocated Limit",lowerlimit,"Total Allocated Amount");
        Rec."Total Balance" := (Rec."Total Allocated Amount" + Rec."Total Top Up Amount") - Rec."Total Amount Spend";
    end;

    trigger OnOpenPage()
    begin
        /*IF "Total Amount Spend">"Allocated vehicle Limit" THEN BEGIN
        ERROR('Total amount spend can not be more that allocated amount');
        END;*/
        Rec.CalcFields("Total Top Up Amount", "Total Amount Spend", "Total Amt Spend per Vehicle", check,"Total Allocated Limit",lowerlimit,"Total Allocated Amount");
        Rec."Total Balance" := (Rec."Total Allocated Amount" + Rec."Total Top Up Amount") - Rec."Total Amount Spend";
    end;

    var
        DetailedFD: Record "Fuel Card Entries";
        FuelCardLines: Record "Vehicle Fuel Card Lines";
        FuelCard: Record "Fuel Card";
        CheckLimit: Decimal;
        LowerLimit: Record "Limit Types";
        lowercheck: Decimal;
    // ApprovalMgt: Codeunit "Approvals Mgmt.";
}



