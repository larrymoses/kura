#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72228 "Inspection & Payment Header"
{
    PageType = Card;
    SourceTable = "Inspection & Payment Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Purchase Contract ID";"Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No.";"Contractor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name";"Contractor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Contract Sum";"Contract Sum")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project Start Date";"Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End Date";"Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created DateTime";"Created DateTime")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control20;"Inspection & Payment Line")
            {
                Caption = 'Progress Per Road Activity';
                SubPageLink = "Document No"=field("Document No"),
                              "Document Type"=field("Document Type");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Suggest Lines")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Suggest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Insert line from project planning lines';

                trigger OnAction()
                begin
                    //FnPopulateLines();

                    JobPlanningLine.Reset;
                    JobPlanningLine.SetRange(JobPlanningLine."Job No.","Project ID");
                    if JobPlanningLine.FindSet then
                     repeat
                        InspectionPaymentLine.Init;
                        InspectionPaymentLine."Document No":="Document No";
                        InspectionPaymentLine."Document Type":="Document Type";
                        //MESSAGE(FORMAT("Document Type"));
                        InspectionPaymentLine.Reset;
                        InspectionPaymentLine.SetRange(InspectionPaymentLine."Document No","Document No");
                        InspectionPaymentLine.SetRange(InspectionPaymentLine."Document Type","Document Type");
                        if InspectionPaymentLine.FindLast then
                          InspectionPaymentLine."Line No":=InspectionPaymentLine."Line No"+100;

                        InspectionPaymentLine."Bill No":=JobPlanningLine."Road Activity Sub-Category";
                        InspectionPaymentLine."Item Code":=JobPlanningLine."No.";
                        InspectionPaymentLine."Bid Rate(LCY)":=JobPlanningLine."Unit Cost";
                        InspectionPaymentLine."BoQ Quantity":=JobPlanningLine.Quantity;
                        InspectionPaymentLine."Bill Item Amount":=InspectionPaymentLine."Bid Rate(LCY)"*InspectionPaymentLine."BoQ Quantity";
                        InspectionPaymentLine."Previous Qty":=JobPlanningLine."Qty. to Transfer to Invoice";
                        InspectionPaymentLine.Validate("Previous Qty");
                        InspectionPaymentLine."This Qty":=0;
                        InspectionPaymentLine.Validate("This Qty");
                        InspectionPaymentLine.Description:=JobPlanningLine.Description;
                        InspectionPaymentLine."Unit Of Measure":=JobPlanningLine."Unit of Measure";
                        //IF NOT InspectionPaymentLine.GET(InspectionPaymentLine."Document No",InspectionPaymentLine."Document Type",InspectionPaymentLine."Line No") THEN
                        InspectionPaymentLine.Insert(true);
                       until JobPlanningLine.Next=0;


                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = PostBatch;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action("Send Approval Request ")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action("Cancel Approval Request ")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Approvals;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = PrintAcknowledgement;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Success');
                end;
            }
        }
    }

    var
        JobPlanningLine: Record "Job Planning Line";
        InspectionPaymentLine: Record "Inspection & Payment Line";
}

