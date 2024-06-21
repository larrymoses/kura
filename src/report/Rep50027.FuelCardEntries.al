/// <summary>
/// Report Fuel Card Entries (ID 50027).
/// </summary>
report 50027 "Fuel Card Entries"
{
    Caption = 'Fuel Card Deductions';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/FuelCardEntries.rdl';

    dataset
    {
        dataitem(FuelCardEntries; "Fuel Card Entries")
        {
            DataItemTableView = sorting("Reciept No") where(Posted = const(true));
            RequestFilterFields = No;
            
            column(No; No)
            {
            }
            column(RegNo; RegNo)
            {
            }
            column(Driver; Driver)
            {
            }
            column(DriverNames; "Driver Names")
            {
            }
            column(RecieptNo; "Reciept No")
            {
            }
            column(Amount; Amount)
            {
            }
            column(DateofFilling; "Date of Filling")
            {
            }
            column(Dateofposting; "Date of posting")
            {
            }
            column(Make; Make)
            {
            }
            column(OtherExpenses; "Other Expenses")
            {
            }
            column(CompanyPicture; CompanyInformation.Picture)
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
            column(CompanyMotto; CompanyInformation.Motto)
            {

            }

            trigger OnAfterGetRecord()
            var
                Text001: Label 'The Start Date field is required.';
                Text002: Label 'The End Date field is required.';
            begin
                CompanyInformation.get();
                CompanyInformation.CalcFields(Picture);
                FormatAddr.GetCompanyAddr('', ResponsibilityCenter, CompanyInformation, CompanyAddr);

                if StartDate = 0D then
                    Error(Text001);

                if EndDate = 0D then
                    Error(Text002);

                FuelCardEntries.SetRange("Date of Filling", StartDate, EndDate);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group("Date Filter")
                {
                    field(StartDate;StartDate)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Start Date';
                    }
                    field(EndDate;EndDate)
                    {
                        ApplicationArea = Basic;
                        Caption = 'End Date';
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
        CompanyInformation: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        CompanyAddr: array[8] of Text[100];
        ResponsibilityCenter: Record "Responsibility Center";
        StartDate: Date;
        EndDate: Date;
}
