#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69155 "Training Needs Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Advertisement Channels";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                //             field(Mode;Mode)
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Training Plan No.";"Training Plan No.")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Category Code";"Category Code")
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = 'Training Plan Code';
                //             }
                //             field("Category Description";"Category Description")
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = 'Training Plan Description';
                //                 Editable = false;
                //             }
                //             field("Cadre Code";"Cadre Code")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Cadre Description";"Cadre Description")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field("Skill for Current Job";"Skill for Current Job")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Skill for Career Progression";"Skill for Career Progression")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("No to be Trained";"No to be Trained")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field("Duration Units";"Duration Units")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field(Duration;Duration)
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Type of Training";"Type of Training")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field(Actual;Actual)
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field(Budget;Budget)
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Available Budget";"Available Budget")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field("Total Cost";"Total Cost")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Planned Training Cost";"Planned Training Cost")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field(Location;Location)
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field(Qualification;Qualification)
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Qualification Description";"Qualification Description")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field(Source;Source)
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Need Source";"Need Source")
                //             {
                //                 ApplicationArea = Basic;
                //                 Editable = false;
                //             }
                //             field(Provider;Provider)
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Provider Name";"Provider Name")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Global Dimension 1 Code";"Global Dimension 1 Code")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Global Dimension 2 Code";"Global Dimension 2 Code")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field("Responsibility Center";"Responsibility Center")
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //             field(text;text)
                //             {
                //                 ApplicationArea = Basic;
                //             }
                //         }
                //     }
                //     area(factboxes)
                //     {
                //         systempart(Control1000000019;Notes)
                //         {
                //         }
                //         systempart(Control1000000020;MyNotes)
                //         {
                //         }
                //         systempart(Control1000000021;Links)
                //         {
                //         }
                //         systempart(Control1000000022;Outlook)
                //         {
                //         }
                //     }
                // }

                // actions
                // {
                //     area(navigation)
                //     {
                //         group("&Functions")
                //         {
                //             Caption = '&Functions';
                //             action("&Submit")
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = '&Submit';
                //                 Image = StepInto;
                //                 Promoted = true;
                //                 PromotedCategory = Category4;

                //                 trigger OnAction()
                //                 begin
                //                     if Confirm('Are you sure you want to submit the Training Need No. '+Code+' ?')=true then
                //                     begin
                //                       text := Text::"4";
                //                       Message('Training need :: %1 :: has been submited',Mode);
                //                       Modify;
                //                     end;
                //                 end;
                //             }
                //         }
                //     }
                //     area(processing)
                //     {
                //         group(ActionGroup22)
                //         {
                //             Caption = '&Functions';
                //             action("Training Costs")
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = 'Training Costs';
                //                 Image = TaskList;
                //                 Promoted = true;
                //                 PromotedCategory = Category4;
                //                 RunObject = Page "Training Cost";
                //                 RunPageLink = "Training ID"=field(Code);
                //             }
                //             action("Page HR Training Participants List")
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = 'Training Participants';
                //                 Image = AddContacts;
                //                 Promoted = true;
                //                 PromotedCategory = Process;
                //                 PromotedIsBig = true;
                //                 RunObject = Page "Training Participants List";
                //                 RunPageLink = "Training Code"=field(Code);
                //             }
                //             action("Training Bonding Conditions")
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = 'Training Bonding Conditions';
                //                 Image = BOM;
                //                 Promoted = true;
                //                 PromotedCategory = Category4;
                //                 RunObject = Page "Training App Participants List";
                //                 RunPageLink = "Global Dimension 1 Code"=field(Code);
                //                 Visible = false;
                //             }
                //         }
                //         group(Functions)
                //         {
                //             Caption = 'Functions';
                //             action(Approvals)
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = 'Approvals';
                //                 Image = Approvals;
                //                 Promoted = true;
                //                 PromotedCategory = Category4;
                //                 Visible = false;

                //                 trigger OnAction()
                //                 var
                //                     DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batch,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation","Overdraft ",BLA,"Benevolent Fund","Staff Claim",TransportRequisition,FuelRequisition,DailyWorkTicket,StaffLoan,HRBatch,Overtime,FTransfer,"Edit Member","Loan Officer",HREmp,FuelCard,Appraisal,HRNeed,HRExit;
                //                     ApprovalEntries: Page "Approval Entries";
                //                 begin
                //                     DocumentType:=Documenttype::HRNeed;
                //                     ApprovalEntries.Setfilters(Database::"Advertisement Channels",DocumentType,Code);
                //                     ApprovalEntries.Run;
                //                 end;
                //             }
                //             action("Send Approval Request")
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = 'Send Approval Request';
                //                 Image = SendApprovalRequest;
                //                 Promoted = true;
                //                 PromotedCategory = Category4;
                //                 Visible = false;

                //                 trigger OnAction()
                //                 begin
                //                     if Confirm('Send Approval Request?',true)=false then exit;
                //                     //AppMgmt.;
                //                 end;
                //             }
                //             action("Cancel Approval Request")
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = 'Cancel Approval Request';
                //                 Image = CancelAllLines;
                //                 Promoted = true;
                //                 PromotedCategory = Category4;
                //                 Visible = false;

                //                 trigger OnAction()
                //                 begin
                //                     if Confirm('Cancel Approval Request?',true)=false then exit;
                //                     //AppMgmt.CancelNeedRequest(Rec,TRUE,TRUE);
                //                 end;
                //             }
                //         }
                //     }
                // }

                // trigger OnAfterGetRecord()
                // begin
                //     UpdateControls;
                // end;

                // trigger OnOpenPage()
                // begin
                //     UpdateControls;
                // end;

                // var
                //     EnableField: Boolean;
                //     HRTrainingBondingCond: Record "Training Participants";
                //     AppMgmt: Codeunit "Approvals Mgmt.";
                //     FieldEditable: Boolean;


                // procedure UpdateControls()
                // begin
                //     if "Budget Controlled" then
                //     begin
                //         EnableField:=true;
                //     end else
                //     begin
                //         EnableField:=false;
                //         "G/L Account":='';
                //         "Expense Code":='';
                //     end;
                // end;
            }
        }

    }
}

