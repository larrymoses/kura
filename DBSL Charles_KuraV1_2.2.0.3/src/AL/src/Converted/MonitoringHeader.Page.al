#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 99452 "Monitoring Header"
{
    PageType = Card;
    SourceTable = 99451;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }

                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Financial Year';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("M&E Type"; Rec."M&E Type")
                {
                    ApplicationArea = Basic;
                }
                field("Respondent Category"; Rec."Respondent Category")
                {
                    ApplicationArea = Basic;
                    Caption = 'Respondent Category Code';
                }
                field("Res Description"; Rec."Res Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Respondent Category Description';
                }


                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Datetime"; Rec."Created Datetime")
                {
                    ApplicationArea = Basic;
                }
                field("Road Cordinates"; Rec."Road Cordinates")
                {
                    ApplicationArea = basic;
                }
                part("Attached Documents1"; "Document Attachment Factbox1")
                {
                    ApplicationArea = All;
                    Caption = 'Attachment Documents';
                    SubPageLink = "Table ID" = CONST(99451), "No." =
                FIELD("Document No.");

                }
            }
            part(Control15; "Road Intervention")
            {
                SubPageLink = "Document No." = field("Document No.");
            }
            part(Control17; "Impact On Residents")
            {
                Caption = 'Impact of Ongoing Activities on Local Residents';
                SubPageLink = "Document No." = field("Document No.");
            }
            group("Additional Comments")
            {
                Caption = 'Additional Comments';
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Additional Comments';
                }
            }
            part(Control18; "Impact of Road Intervantion")
            {
                Caption = 'Measure of Impact of Ongoing Road Interventions';
                SubPageLink = "Document No." = field("Document No.");
            }
            group("Additional Comments1")
            {
                Caption = 'Additional Comments';
                field(Comments1; Rec.Comments1)
                {
                    ApplicationArea = Basic;
                    Caption = 'Additional Comments';
                }
            }
        }
    }

    actions
    {
        area(Creation)
        {
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin

                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant);

                        //  Rec."Approval Status" := Rec."approval status"::Released;
                        //   Rec.Modify;
                        //  Message('Document %1 has been approved Automatically', Rec.Code);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        //   TestField(Status, Status::"Pending Approval");
                        //   TestField("Created By", UserId);

                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);

                    end;
                }
            }
        }
    }
    trigger
  OnNewRecord(BelowxRec: Boolean)
    BEGIN
        REC."Document Date" := Today;
        REC.Status := REC.Status::Open;

        REC."Created By" := UserId;
        REC."Created Datetime" := CreateDatetime(Today, Time);




        if REC."Document No." = '' then begin
            SPMSetup.Get;
            SPMSetup.TestField("Monitoring Nos");
            NoSeriesMgt.InitSeries(SPMSetup."Monitoring Nos", xRec."No. Series", TODAY, REC."Document No.", REC."No. Series");
        end;
    END;

    var
        FinancialYearCode: Record "Financial Year Code";
        Job: Record Job;
        AuditAssuranceSetup: Record "Audit & Assurance Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        SPMSetup: Record "SPM General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        StrategyCoreV: Record "Strategy Core Value";
        CoreV: Record "Core Values";

#pragma implicitwith restore

}