#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69228 "Training App Participants List"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = "Training Participants";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(Destination;Destination)
                {
                    ApplicationArea = Basic;
                }
                field("Employee Code";"Employee Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee No.';
                }
                field("Employee Name";"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Days";"No. of Days")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Amount";"Total Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Training Responsibility Code";"Training Responsibility Code")
                {
                    ApplicationArea = Basic;
                }
                field("Training Responsibility";"Training Responsibility")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Schedule)
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Training Schedule";
                RunPageLink = "Training Application No."=field("Training Code");
            }
            group(Register)
            {
                action("Attendance Register")
                {
                    ApplicationArea = Basic;
                    Caption = 'Attendance Register';
                    Image = ApplyEntries;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Attendance Register";
                    RunPageLink = "Training Application No."=field("Training Code");

                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition";
                    begin
                        DocumentType:=Documenttype::"Training Application";
                        
                        /*ApprovalComments.Setfilters(DATABASE::"HR Training Applications",DocumentType,Code);
                        ApprovalComments.SetUpLine(DATABASE::"HR Training Applications",DocumentType,Code);
                        ApprovalComments.RUN;*/

                    end;
                }
            }
        }
    }
}

