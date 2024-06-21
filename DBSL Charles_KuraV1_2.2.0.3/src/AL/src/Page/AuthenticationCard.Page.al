#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56052 "Authentication Card"
{
    PageType = Card;
    SourceTable = "Authentication Device Applicat";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Applicant No."; "Applicant No.")
                {
                    ApplicationArea = Basic;
                }
                field("Applicant Name"; "Applicant Name")
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Works"; "Copyright Works")
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Title"; "Copyright Title")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                }
                field("Authentication Item"; "Authentication Item")
                {
                    ApplicationArea = Basic;
                }
                field("Authentication Description"; "Authentication Description")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Price"; "Unit Price")
                {
                    ApplicationArea = Basic;
                }
                field("Quantity Requested"; "Quantity Requested")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Due"; "Amount Due")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Quantity"; "Minimum Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Date Created"; "Date Created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created"; "Time Created")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Captured by"; "Captured by")
                {
                    ApplicationArea = Basic;
                }
                field(Created; Created)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Function")
            {
                Caption = 'Function';
                group(Approvals)
                {
                    Caption = '-';
                }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        Text001: label 'This request is already pending approval';
                    begin
                    end;
                }
                action("Approval Request Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approval;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                    end;
                }
                action("Approved Request Entries")
                {
                    ApplicationArea = Basic;
                    Image = approval;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Approval Entries";
                    RunPageLink = "Document No." = field("No.");
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                }
                separator(Action24)
                {
                    Caption = '       -';
                }
                action(SUMBIT)
                {
                    ApplicationArea = Basic;
                    Caption = 'SUBMIT';
                    Image = Customer;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = true;

                    trigger OnAction()
                    begin
                        SalesOrder.Reset;
                        SalesOrder.SetRange("Bill-to Customer No.", "Applicant No.");
                        SalesOrder.SetRange("External Document No.", "No.");
                        if SalesOrder.Find('-') then begin
                            Error('The Sales Order has already been created.');

                        end else begin

                            SalesOrder.Init;
                            SalesOrder."Document Type" := SalesOrder."document type"::Order;
                            SalesOrder."No." := '';
                            SalesOrder.Validate(SalesOrder."Sell-to Customer No.", "Applicant No.");
                            SalesOrder."Document Date" := Date;
                            SalesOrder."Order Date" := Date;
                            SalesOrder."Posting Date" := Date;
                            SalesOrder."External Document No." := "No.";
                            SalesOrder.Type := SalesOrder.Type::"Authentication Device";
                            SalesOrder.Insert(true);

                            SalesLine.Init;
                            SalesLine."Document Type" := SalesLine."document type"::Order;
                            SalesLine."Document No." := SalesOrder."No.";
                            SalesLine.Type := SalesLine.Type::Item;
                            SalesLine.Validate(SalesLine."No.", "Authentication Item");
                            SalesLine.Validate(SalesLine.Quantity, "Minimum Quantity");
                            SalesLine.Validate(SalesLine."Unit Price", "Unit Price");
                            SalesLine.Insert(true);

                            Created := true;
                            Modify;
                        end;
                    end;
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    // RunObject = Page "Default Dimensions";
                    //  RunPageLink = "No."=field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);


                        SetRange("No.", "No.");
                        Report.Run(58001, true, true, Rec)
                    end;
                }
            }
        }
    }

    var
        SalesOrder: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Cust: Record Customer;
}

