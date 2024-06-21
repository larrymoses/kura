report 99125 ITax
{
    ApplicationArea = All;
    Caption = 'ITax';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Itax.rdl';
    dataset
    {
        dataitem(payments; payments)
        {
            PrintOnlyIfDetail = true;
            //RequestFilterFields = "Paying Bank Account";
            column(CompanyPicture; CompanyInfo.Picture)
            {

            }
            column(Motto; CompanyInfo.Motto)
            {

            }
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyAddress7; CompanyAddr[7])
            {
            }
            column(CompanyAddress8; CompanyAddr[8])
            {
            }

            column(Status; Status)
            {
            }
            column(Date_of_Payment_To_Witholdee; "Posting Date")
            {
            }
            column(Total_Witholding_Tax_Amount;"Total Witholding Tax Amount")
            {
            }
            column(VAT_Wthheld_six__;"VAT Wthheld six %")
            {
            }
            dataitem("PV Lines"; "PV Lines")
            {
                DataItemLinkReference = payments;
                DataItemLink = No = field("No.");
                DataItemTableView = where("Account Type" = const(Vendor));
                column(Gross_Amount; Amount)
                {

                }
                column(Payment_Reference; PaymentReference)
                {

                }
                column(Nature_of_Transaction; "Nature of Transaction")
                {

                }
                column(Country; Country)
                {

                }
                column(Pin_of_Witholdee; "VAT Registration No.")
                {

                }
                column(Name_of_Witholdee; Name)
                {

                }
                column(Address_of_Witholdee; Address)
                {

                }
                column(Email_of_Witholdee; Email)
                {

                }
                column(Residential_Status; "Residential Status")
                {

                }

                trigger OnPreDataItem()

                begin
                    CalcFields(Status);
                    SetRange(Status, Status::Released);
                end;

                trigger OnAfterGetRecord()
                var
                    VendorLedger: Record "Vendor Ledger Entry";
                begin
                    "Nature of Transaction" := '';
                    Country := '';
                    "VAT Registration No." := '';
                    Name := '';
                    Address := '';
                    Email := '';
                    "Residential Status" := "Residential Status"::" ";
                    if Vend.Get("Account No") then begin
                        Country := Vend.County;
                        "VAT Registration No." := Vend."VAT Registration No.";
                        Name := Vend.Name;
                        Address := Vend.Address;
                        Email := Vend.Email;
                        "Residential Status" := Vend."Residential Status";
                        if CountryRegion.Get(Vend."Country/Region Code") then
                            Country := CountryRegion.Name;
                    end;
                    TarriffCodes.Reset();
                    TarriffCodes.SetRange(Type, TarriffCodes.Type::"W/Tax");
                    TarriffCodes.SetRange(Code, "W/Tax Code");
                    if TarriffCodes.FindFirst() then
                        "Nature of Transaction" := TarriffCodes."Nature of Transaction";
                    VendorLedger.Reset();
                    VendorLedger.SetRange("Document No.", "Applies to Doc. No");
                    VendorLedger.SetRange("Vendor No.", "Account No");
                    if VendorLedger.FindFirst() then
                        PaymentReference := VendorLedger."External Document No."
                    else
                        PaymentReference := VendorLedger."Document No.";
                end;
            }
            trigger OnPreDataItem()
            begin
                SetRange(Posted, true);
                if (StartDate <> 0D) and (EndDate <> 0D) then
                    SetFilter("Posting Date", '%1..%2', StartDate, EndDate);
                if (StartDate <> 0D) and (EndDate = 0D) then
                    SetRange("Posting Date", StartDate);
                if (StartDate = 0D) and (EndDate <> 0D) then
                    SetRange("Posting Date", EndDate);
                if BankCode <> '' then
                SetRange("Paying Bank Account",BankCode);
            end;

            trigger OnAfterGetRecord()
            begin
                if CompanyInfo.get() then
                    CompanyInfo.CalcFields(Picture);
                if UserSetup.Get(UserId) then
                    FormatAddr.GetCompanyAddr(UserSetup."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(filter)
                {
                    field("Start Date"; StartDate)
                    {
                        ApplicationArea = Basic;
                    }
                    field("End Date"; EndDate)
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Code";BankCode)
                    {
                         ApplicationArea = Basic;
                         TableRelation = "Bank Account"."No.";
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        StartDate: Date;
        EndDate: Date;
        PaymentReference: Code[35];
        corec: Record "Company Information";
        SerialNo: Integer;
        ResponsibilityCenter: Record "Responsibility Center";
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        RespCenter: Record "Responsibility Center";
        UserSetup: Record "User Setup";
        Country: Text[50];
        CountryRegion: Record "Country/Region";
        TarriffCodes: Record "Tariff Codes1";
        "Nature of Transaction": Text;
        Vend: Record Vendor;
        "VAT Registration No.": Code[20];
        Name: Text[100];
        Address: Text[100];
        Email: Text[200];
        "Residential Status": Enum "Residential Status";
        BankCode: Code[20];
}
