#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57044 "Posted PV Lines"
{
    PageType = ListPart;
    SourceTable = "PV Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        TestField(Status, Status::Open);
                    end;
                }
                field("Account Type"; "Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        TestField(Status, Status::Open);
                    end;
                }
                field("Account No"; "Account No")
                {
                    ApplicationArea = Basic;
                    //Editable = false;

                    trigger OnValidate()
                    begin
                        TestField(Status, Status::Open);
                    end;
                }
                field("Contractor No"; "Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Obligation Total Amount"; "Obligation Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; "Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Applies-to Doc. Type"; "Applies-to Doc. Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Applies to Doc. No"; "Applies to Doc. No")
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                    //Editable = false;

                    trigger OnValidate()
                    begin
                        //TestField(Status, Status::Open);
                    end;
                }
                field("Net Amount"; "Net Amount")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                }
                field("Remaining Amount"; "Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("VAT Rate"; "VAT Rate")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Six % Rate"; "VAT Six % Rate")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        TestField(Status, Status::Open);
                    end;
                }
                field("VAT Withheld Code"; "VAT Withheld Code")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        TestField(Status, Status::Open);
                    end;
                }
                field("VAT Withheld Amount"; "VAT Withheld Amount")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        TestField(Status, Status::Open);
                    end;
                }
                field("Budgetary Control A/C"; "Budgetary Control A/C")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No."; "Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Retention Code"; "Retention Code")
                {
                    ApplicationArea = Basic;
                }
                field("Advance Recovery"; "Advance Recovery")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        //TESTFIELD(Status,Status::Open);
                    end;
                }
                field("Retention  Amount"; "Retention  Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Claim Doc No."; "Claim Doc No.")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Code"; "VAT Code")
                {
                    ApplicationArea = Basic;
                }
                field("W/Tax Code"; "W/Tax Code")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        TestField(Status, Status::Open);
                    end;
                }
                field("W/T VAT Code"; "W/T VAT Code")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Amount"; "VAT Amount")
                {
                    ApplicationArea = Basic;
                }
                field("W/Tax Amount"; "W/Tax Amount")
                {
                    ApplicationArea = Basic;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        TestField(Status, Status::Open);
                    end;

                    trigger OnValidate()
                    begin
                        TestField(Status, Status::Open);
                    end;
                }
                field("Project No"; "Project No")
                {
                    ApplicationArea = Basic;
                }
                field("Obligation WHT"; "Obligation WHT")
                {
                    ApplicationArea = Basic;
                }
                field("Total Net Pay"; "Total Net Pay")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        TestField(Status, Status::Open);
                    end;
                }
                field("Bank Account Number"; "Bank Account Number")
                {
                    ApplicationArea = Basic;
                }
                field("Payee Bank Account Number"; "Payee Bank Account Number")
                {
                    ApplicationArea = Basic;
                }
                field("Payee Bank Name"; "Payee Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Payee Bank Branch Code"; "Payee Bank Branch Code")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Bank Name"; "Vendor Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Bill Discounting No"; "Bill Discounting No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Agency notice Total Amount';
                }
                field("Agency Notice No."; "Agency Notice No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Agency notice  VAT';
                }
                field("Installment No."; "Installment No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Agency Notice Income Tax';
                }
                field("Agency Notice WHT"; "Obligation WHT")
                {
                    ApplicationArea = Basic;
                    Caption = 'Agency Notice WHT';
                }
            }
        }
    }

    actions
    {
    }
}

