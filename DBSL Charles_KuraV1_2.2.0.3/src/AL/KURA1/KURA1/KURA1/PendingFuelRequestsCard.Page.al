#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59031 "Pending Fuel Requests Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Fuel & Maintenance Requisition";
    SourceTableView = where(Status = const("Pending Approval"),
                            Type = filter(Fuel));

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = false;
                field("Requisition No"; "Requisition No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Vehicle Reg No"; "Vehicle Reg No")
                {
                    ApplicationArea = Basic;
                }
                field("Type of Fuel"; "Type of Fuel")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Odometer Reading"; "Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Vendor(Dealer)"; "Vendor(Dealer)")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Vendor List";
                    TableRelation = Vendor;
                }
                field("Vendor Name"; "Vendor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Litres of Oil"; "Litres of Oil")
                {
                    ApplicationArea = Basic;
                    Caption = 'Litres';

                    trigger OnValidate()
                    begin
                        if "Price/Litre" <> 0 then
                            "Total Price of Fuel" := "Litres of Oil" * "Price/Litre";
                    end;
                }
                field("Price/Litre"; "Price/Litre")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if "Price/Litre" <> 0 then
                            "Total Price of Fuel" := "Litres of Oil" * "Price/Litre";
                    end;
                }
                field("Total Price of Fuel"; "Total Price of Fuel")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Amount Requested';

                    trigger OnValidate()
                    begin
                        if "Price/Litre" <> 0 then
                            "Litres of Oil" := "Total Price of Fuel" / "Price/Litre";
                    end;
                }
                field("Request Date"; "Request Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Prepared By"; "Prepared By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted Invoice No"; "Posted Invoice No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Invoice No';
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Cancel Document")
            {
                ApplicationArea = Basic;
                Promoted = true;

                trigger OnAction()
                var
                // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    //ApprovalMgt.CancelFuelMaintApprovalRequest(Rec,TRUE,TRUE);


                    //  ApprovalsMgmt.OnCancelFuelReqApprovalRequest(Rec);
                end;
            }
            action("Close Fuel Request")
            {
                ApplicationArea = Basic;
                Image = RegisteredDocs;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //TESTFIELD("Posted Invoice No");

                    if Confirm('Are you sure you want to close this Fuel Request?', true) = false then begin
                        exit
                    end else
                        Status := Status::Closed;
                    "Closed By" := UserId;
                    "Date Closed" := Today;
                    Modify;
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = false;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin

                    // ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Approve the requested changes.';

                    trigger OnAction()
                    var
                    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //CheckAllocationDetails;
                        //   ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                        //MESSAGE('Requision approved...');
                        CurrPage.Close;
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //CheckAllocationDetails;
                        //  ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                    end;
                }
            }
        }
    }

    var
    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}

