#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57154 "Banked Standing Imprests"
{
    CardPageID = "Approved Standing Imprest";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const("Standing Imprest"),
                            Posted = const(false),
                            Status = filter(Released),
                            Selected = const(true),
                            banked = const(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field(PayMode; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeNo; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeDate; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                }
                field(PayingBankAccount; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedBy; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(TotalAmount; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field(ShortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentName; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field(ShortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(ProjectName; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                }
                field(JobName; Rec."Job Name")
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


                    Rec.SetRange(Rec."No.", Rec."No.");
                    Report.Run(59098, true, true, Rec)
                end;
            }
        }
    }
}
