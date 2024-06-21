#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65078 "Project Contract Card"
{
    PageType = Card;
    SourceTable = "Project Contract Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Project Contract No"; "Project Contract No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Grant Application ID"; "Grant Application ID")
                {
                    ApplicationArea = Basic;
                }
                field("External Contract No"; "External Contract No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contract Customer No"; "Primary Contract Customer No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Contact No."; "Contact No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Address; Address)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Address 2"; "Address 2")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Post Code"; "Post Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(City; City)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Country/Region Code"; "Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field(Contact; Contact)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Currency Code"; "Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Email; Email)
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Principal Investigator"; "Principal Investigator")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Grant Administrator"; "Grant Administrator")
                {
                    ApplicationArea = Basic;
                }
                field("Award Type"; "Award Type")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Funding Sponsor ID"; "Primary Funding Sponsor ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Sponsor Name"; "Primary Sponsor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Start Date"; "Contract Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract End Date"; "Contract End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Status"; "Contract Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; "Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control30; "Contract Funding Lines")
            {
                SubPageLink = "Project Contract No." = field("Project Contract No");
            }
            systempart(Control32; Links)
            {
                Visible = false;
            }
            systempart(Control31; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(creation)
        {
            separator(Action39)
            {
            }
            action("Print Project Contract")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;

                trigger OnAction()
                begin
                    SetRange("Project Contract No", "Project Contract No");
                    Report.Run(65019, true, true, Rec)
                end;
            }
            action("Notify Contract Award")
            {
                ApplicationArea = Basic;
                Image = Email;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Message('Nofity Team');
                end;
            }
            action("Si&gn Contract")
            {
                ApplicationArea = Service;
                Caption = 'Si&gn Contract';
                Image = Signature;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Confirm the contract.';

                trigger OnAction()
                var
                    SignServContractDoc: Codeunit SignServContractDoc;
                begin
                    "Contract Status" := "contract status"::Signed;
                    "Approval Status" := "approval status"::Released;
                    Modify;
                    Message('Contract Signed Successfully');
                end;
            }
            action("Cancel Contract")
            {
                ApplicationArea = Service;
                Caption = 'Cancel Contract';
                Image = Signature;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Cancel  the contract.';

                trigger OnAction()
                var
                    SignServContractDoc: Codeunit SignServContractDoc;
                begin
                    "Contract Status" := "contract status"::Signed;
                    "Approval Status" := "approval status"::Released;
                    Modify;
                    Message('Contract Signed Successfully');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = false;

                trigger OnAction()
                begin
                    // ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = false;

                trigger OnAction()
                var
                //    ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    TestField("Approval Status", "approval status"::Open);//status must be open.
                                                                          //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                          //    if ApprovalsMgmt.CheckProjectContractApprovalsWorkflowEnabled(Rec) then
                                                                          //      ApprovalsMgmt.OnSendProjectContractForApproval(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = false;

                trigger OnAction()
                begin
                    TestField("Approval Status", "approval status"::"Pending Approval");//status must be open.
                                                                                        //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                                        //       ApprovalsMgmt.OnCancelProjectContractApprovalRequest(Rec);
                end;
            }
            separator(Action35)
            {
            }
        }
    }

    var
    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}

