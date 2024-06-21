#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57151 "Approved Standing Imprests"
{
    CardPageID = "Approved Standing Imprest";
    PageType = List;
    SourceTable = payments;
    SourceTableView = where("Payment Type"=const("Standing Imprest"),
                            Posted=const(false),
                            Status=filter(Released),
                            Selected=const(false),
                            "Archive Document"=const(false),
                            banked=const(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Selected;Rec.Selected)
                {
                    ApplicationArea = Basic;
                }
                field(No;Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Date;Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PayMode;Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ChequeNo;Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ChequeDate;Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Payee;Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PayingBankAccount;Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(CreatedBy;Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status;Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TotalAmount;Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ShortcutDimension1Code;Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DepartmentName;Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ShortcutDimension2Code;Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ProjectName;Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Job;Rec.Job)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(JobName;Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
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


                    Rec.SetRange(Rec."No.",Rec."No.");
                    Report.Run(59098,true,true,Rec)
                end;
            }
            action("Banked Standing Imprest")
            {
                ApplicationArea = Basic;
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange(Rec.Select,true);
                    if Rec.Find('-') then begin
                         Rec.banked:=true;
                         Rec.Modify;
                    end;
                    Message('Banked Successfully');
                end;
            }
            action("Archive Document")
            {
                ApplicationArea = Basic;
                Image = Archive;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Usersetup.Reset;
                    Usersetup.SetRange("User ID",UserId);
                    Usersetup.SetRange("Archive Document",true);
                    if Usersetup.Find('-') then begin
                      Rec.SetRange(Rec."No.",Rec."No.");
                      Rec."Archive Document":=true;
                      Rec.Modify;
                    end else
                      Error('You don''t have rights to archive finance documents,Contact System administrator');
                end;
            }
        }
    }

    var
        Payments: Record payments;
        Usersetup: Record "User Setup";
}
