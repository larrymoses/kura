#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57082 "EFT Details"
{
    ApplicationArea = Basic;
    PageType = ListPart;
    SourceTable = "EFT Details";
    SourceTableView = sorting("Header No",No);
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1102760000)
            {
                field("Account No";"Account No")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name";"Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Staff No";"Staff No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Phone No.";"Phone No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Charges;Charges)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account Type";"Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Destination Account Type";"Destination Account Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Type';
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Not Available";"Not Available")
                {
                    ApplicationArea = Basic;
                    Caption = 'Not Avail.';
                    Editable = false;
                }
                field("Destination Account No";"Destination Account No")
                {
                    ApplicationArea = Basic;
                }
                field(DCHAR;DCHAR)
                {
                    ApplicationArea = Basic;
                    Caption = 'CR';
                    Editable = false;
                }
                field("Destination Account Name";"Destination Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bank No";"Bank No")
                {
                    ApplicationArea = Basic;
                }
                field("Payee Bank Name";"Payee Bank Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Standing Order No";"Standing Order No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(No;No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        DCHAR:=0;
        DCHAR:=StrLen("Destination Account No");

        NotAvailable:=true;
        AvailableBal:=0;


        //Available Bal
        if Accounts.Get("Account No") then begin
        Accounts.CalcFields(Accounts.Balance);
        //IF AccountTypes.GET(Accounts."Account Type") THEN BEGIN
        AvailableBal:=Accounts.Balance;

        if Amount <= AvailableBal then
        NotAvailable:=false;

        //END;
        end;

        //Available Bal
    end;

    var
        DCHAR: Integer;
        NotAvailable: Boolean;
        AvailableBal: Decimal;
        Charges: Decimal;
        Accounts: Record Vendor;
}

