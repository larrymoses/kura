#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 69107 "Institutional Report_email"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Institutional Report_email.rdlc';

    dataset
    {
        dataitem(DeductionsX; 69006)
        {
            RequestFilterFields = "Institution Code", "Pay Period Filter";
            column(ReportForNavId_1; 1)
            {
            }
            column(Page_No; CurrReport.PageNo)
            {
            }
            column(CompInfo_Picture; CompInfo.Picture)
            {
            }
            column(PreparedBy; Approver[1])
            {
            }
            column(DatePrepared; ApproverDate[1])
            {
            }
            column(PreparedBy_Signature; UserSetup1.Picture)
            {
            }
            column(CheckedBy; Approver[2])
            {
            }
            column(DateChecked; ApproverDate[2])
            {
            }
            column(CheckedBy_Signature; UserSetup2.Picture)
            {
            }
            column(Company_address1; CompInfo.Address)
            {
            }
            column(Company_address2; CompInfo."Address 2")
            {
            }
            column(Company_Phone; CompInfo."Phone No.")
            {
            }
            column(Company_Name; CompInfo.Name)
            {
            }
            column(Company_Bank; CompInfo."Bank Account No.")
            {
            }
            column(Code_DeductionsX; DeductionsX.Code)
            {
            }
            column(Description_DeductionsX; DeductionsX.Description)
            {
            }
            column(Institution_Name; InstitutionName)
            {
            }
            column(PayPeriodFilter_DeductionsX; DeductionsX."Pay Period Filter")
            {
            }
            column(Institution_Code; "Institution Code")
            {

            }
            column(Period; Period)
            {
            }
            column(PrintedOn; PrintedOn)
            {
            }
            column(PrintedBy; PrintedBy)
            {
            }
            dataitem("Assignment Matrix-X"; 69009)
            {
                DataItemLink = Code = field(Code), "Payroll Period" = field("Pay Period Filter");
                DataItemTableView = order(ascending);
                column(ReportForNavId_5; 5)
                {
                }
                column(No_Employee; "Assignment Matrix-X"."Employee No")
                {
                }
                column(Initials_Employee; EMPName)
                {
                }
                column(TotalAmount_DeductionsX; "Assignment Matrix-X".Amount)
                {
                }
                column(Employer_Amount; "Employer Amount")
                {
                }
                column(EMPL; EMPL) { }
                column(total; total)
                {
                }
                column(CountX; CountX)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    CountX := CountX + 1;
                    if Employee.Get("Assignment Matrix-X"."Employee No") then begin
                        EMPName := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    end;
                    ASS.RESET;
                    ASS.SETRANGE("Employee No", "Assignment Matrix-X"."Employee No");
                    ASS.SetRange(ASS."Payroll Period", "Assignment Matrix-X"."Payroll Period");
                    ASS.SetFilter(Code, 'D056');
                    IF ASS.FindSet THEN begin
                        EMPL := ASS."Employer Amount";
                    end;

                end;

                trigger OnPreDataItem()
                begin
                    CountX := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CompInfo.Get;
                CompInfo.CalcFields(Picture);
                Period := DeductionsX.GetFilter("Pay Period Filter");
                Institution1.Reset;
                Institution1.SetRange(Code, DeductionsX."Institution Code");
                if Institution1.Find('-') then begin
                    InstitutionName := Institution1.Name;
                    Institutionaddress := Institution1.Address;

                end;
                PrintedOn := Today;
                PrintedBy := UserId;
                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 69030);
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.FindLast then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            Approver[2] := ApprovalEntries."Approver ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup.Get(Approver[2]) then
                                UserSetup.CalcFields(Picture);



                        end;
                        if i = 4 then begin
                            Approver[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver[3]) then
                                UserSetup2.CalcFields(Picture);
                        end;
                    until
                   ApprovalEntries.Next = 0;
                end;

                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 69030);
                ApprovalEntries.SetRange("Sequence No.", 1);
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.FindLast then begin
                    Approver[1] := ApprovalEntries."Approver ID";
                    ApproverDate[1] := ApprovalEntries."Last Date-Time Modified";
                    if UserSetup1.Get(Approver[1]) then
                        UserSetup1.CalcFields(Picture);
                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        //  Institution: record Institution;
        Filename: Text;
        Ded: Record 69006;
        CompInfo: Record "Company Information";
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[100];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        CoName: Text[80];
        ASS: RECORD "Assignment Matrix-X";
        i: Integer;
        UserSetup2: Record "User Setup";
        total: decimal;
        Institution1: Record Institution;
        InstitutionName: Text;
        Institutionaddress: Text;
        Period: Text;
        PrintedOn: Date;
        PrintedBy: Text;
        CountX: Integer;
        EMPName: Text;
        EMPL: DECIMAL;
        Employee: Record Employee;
}



#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 50037 "Institutional iCEA"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Institutional Report_email.rdlc';

    dataset
    {
        dataitem(DeductionsX; 69006)
        {
            RequestFilterFields = "Institution Code", "Pay Period Filter";
            column(ReportForNavId_1; 1)
            {
            }
            column(Page_No; CurrReport.PageNo)
            {
            }
            column(CompInfo_Picture; CompInfo.Picture)
            {
            }
            column(PreparedBy; Approver[1])
            {
            }
            column(DatePrepared; ApproverDate[1])
            {
            }
            column(PreparedBy_Signature; UserSetup1.Picture)
            {
            }
            column(CheckedBy; Approver[2])
            {
            }
            column(DateChecked; ApproverDate[2])
            {
            }
            column(CheckedBy_Signature; UserSetup2.Picture)
            {
            }
            column(Company_address1; CompInfo.Address)
            {
            }
            column(Company_address2; CompInfo."Address 2")
            {
            }
            column(Company_Phone; CompInfo."Phone No.")
            {
            }
            column(Company_Name; CompInfo.Name)
            {
            }
            column(Company_Bank; CompInfo."Bank Account No.")
            {
            }
            column(Code_DeductionsX; DeductionsX.Code)
            {
            }
            column(Description_DeductionsX; DeductionsX.Description)
            {
            }
            column(Institution_Name; InstitutionName)
            {
            }
            column(PayPeriodFilter_DeductionsX; DeductionsX."Pay Period Filter")
            {
            }
            column(Institution_Code; "Institution Code")
            {

            }
            column(Period; Period)
            {
            }
            column(PrintedOn; PrintedOn)
            {
            }
            column(PrintedBy; PrintedBy)
            {
            }
            column(TotalEMPL1; TotalEMPL1) { }
            dataitem("Assignment Matrix-X"; 69009)
            {
                DataItemLink = Code = field(Code), "Payroll Period" = field("Pay Period Filter");
                DataItemTableView = order(ascending);
                column(ReportForNavId_5; 5)
                {
                }
                column(No_Employee; "Assignment Matrix-X"."Employee No")
                {
                }
                column(Initials_Employee; EMPName)
                {
                }
                column(TotalAmount_DeductionsX; "Assignment Matrix-X".Amount)
                {
                }
                column(Employer_Amount; "Employer Amount")
                {
                }
                column(EMPL; EMPL) { }
                column(TotalEMPL; TotalEMPL) { }
                column(total; total)
                {
                }
                column(Total_Icea_Employer_Amount; "Total Icea Employer Amount") { }
                column(CountX; CountX)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    CountX := CountX + 1;
                    if Employee.Get("Assignment Matrix-X"."Employee No") then begin
                        EMPName := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    end;
                    ASS.RESET;
                    ASS.SETRANGE("Employee No", "Assignment Matrix-X"."Employee No");
                    ASS.SetRange(ASS."Payroll Period", "Assignment Matrix-X"."Payroll Period");
                    ASS.SetFilter(Code, 'D056');
                    IF ASS.FindSet THEN begin
                        EMPL := ASS."Employer Amount";
                    end;

                    //total
                    Ded.RESET;
                    Ded.SetRange(Ded."Pay Period Filter", "Assignment Matrix-X"."Payroll Period");
                    Ded.SetFilter(Code, 'D056');
                    IF ASS.FindSet THEN begin

                        Ded.CalcFields("Total Amount Employer");
                        TotalEMPL := ded."Total Amount Employer";
                        // Message('%1', TotalEMPL);
                    end;

                end;

                trigger OnPreDataItem()
                begin
                    CountX := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CompInfo.Get;
                CompInfo.CalcFields(Picture);
                Period := DeductionsX.GetFilter("Pay Period Filter");
                Institution1.Reset;
                Institution1.SetRange(Code, DeductionsX."Institution Code");
                if Institution1.Find('-') then begin
                    InstitutionName := Institution1.Name;
                    Institutionaddress := Institution1.Address;

                end;

                //total
                Ded.RESET;
                Ded.SetRange(Ded."Pay Period Filter", "Assignment Matrix-X"."Payroll Period");
                Ded.SetFilter(Code, 'D056');
                IF ASS.FindSet THEN begin

                    Ded.CalcFields("Total Amount Employer");
                    TotalEMPL1 := ded."Total Amount Employer";
                    // Message('%1', TotalEMPL1);
                end;
                PrintedOn := Today;
                PrintedBy := UserId;
                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 69030);
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.FindLast then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            Approver[2] := ApprovalEntries."Approver ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup.Get(Approver[2]) then
                                UserSetup.CalcFields(Picture);



                        end;
                        if i = 4 then begin
                            Approver[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver[3]) then
                                UserSetup2.CalcFields(Picture);
                        end;
                    until
                   ApprovalEntries.Next = 0;
                end;

                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 69030);
                ApprovalEntries.SetRange("Sequence No.", 1);
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.FindLast then begin
                    Approver[1] := ApprovalEntries."Approver ID";
                    ApproverDate[1] := ApprovalEntries."Last Date-Time Modified";
                    if UserSetup1.Get(Approver[1]) then
                        UserSetup1.CalcFields(Picture);
                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        //  Institution: record Institution;
        Filename: Text;
        Ded: Record 69006;
        CompInfo: Record "Company Information";
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[100];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        CoName: Text[80];
        ASS: RECORD "Assignment Matrix-X";
        i: Integer;
        UserSetup2: Record "User Setup";
        total: decimal;
        Institution1: Record Institution;
        InstitutionName: Text;
        TotalEMPL: Decimal;
        TotalEMPL1: Decimal;
        Institutionaddress: Text;
        Period: Text;
        PrintedOn: Date;
        PrintedBy: Text;
        CountX: Integer;
        EMPName: Text;
        EMPL: DECIMAL;
        Employee: Record Employee;
}

