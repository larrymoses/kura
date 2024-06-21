#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 69120 "Employee Transfer Process"
{
    ProcessingOnly = true;
    ShowPrintStatus = false;

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "No.", "Global Dimension 1 Code";
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                ProgressWindow.Open('Processing Employee Transfer on: \#1#######  ');
                Emp.Reset;
                Emp.SetRange("No.", "No.");
                if Emp.FindSet then begin
                    Sleep(1000);
                    if NewStation = Employee."Global Dimension 1 Code" then
                        Error('The new station %1 should not be the same as the current station %2', NewStation, Employee."Global Dimension 1 Code");
                    ProgressWindow.Update(1, Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name");
                    Emp."Global Dimension 1 Code" := NewStation;
                    Emp.Validate("Global Dimension 1 Code");
                    Emp.Modify(true);
                    HRSetup.Get;
                    /*AssignmentMatrixX.RESET;
                    AssignmentMatrixX.SETRANGE(Code,HRSetup."Transfer Allowance Code");*/
                    AssignmentMatrixX.Init;
                    AssignmentMatrixX.Code := HRSetup."Transfer Allowance Code";
                    AssignmentMatrixX.Validate(Code);
                    AssignmentMatrixX."Employee No" := Emp."No.";
                    AssignmentMatrixX.Validate("Employee No");
                    //  AssignmentMatrixX.VALIDATE(AssignmentMatrixX.Code);

                    ObjAssMatrix.Reset;
                    ObjAssMatrix.SetRange(ObjAssMatrix."Employee No", Employee."No.");
                    ObjAssMatrix.SetRange(ObjAssMatrix."Basic Salary Code", true);
                    if ObjAssMatrix.FindLast then begin
                        AssignmentMatrixX.Amount := ObjAssMatrix.Amount;
                        //AssignmentMatrixX.VALIDATE(Code);
                    end;

                    AssignmentMatrixX."Payroll Period" := CalcDate('<-CM>', Today);
                    if not AssignmentMatrixX.Insert then
                        AssignmentMatrixX.Modify;

                    DimensionValue.Reset;
                    DimensionValue.SetRange(Code, NewStation);
                    DimensionValue.SetRange("Hardship Area", true);
                    if DimensionValue.FindSet then begin
                        AssignmentMatrixX.Init;
                        AssignmentMatrixX."Employee No" := Emp."No.";
                        AssignmentMatrixX.Type := AssignmentMatrixX.Type::Payment;
                        AssignmentMatrixX.Code := HRSetup."Hardship Allowance Code";
                        AssignmentMatrixX.Validate(Code);
                        AssignmentMatrixX."Payroll Period" := CalcDate('<CM+1D>', Today);
                        if not AssignmentMatrixX.Get(AssignmentMatrixX."Employee No", AssignmentMatrixX.Type, AssignmentMatrixX.Code,
                        AssignmentMatrixX."Payroll Period", AssignmentMatrixX."Reference No") then
                            AssignmentMatrixX.Insert(true);
                    end;

                    DimensionValue.Reset;
                    DimensionValue.SetRange(Code, NewStation);
                    DimensionValue.SetRange("Hardship Area", false);
                    if DimensionValue.FindSet then begin
                        AssignmentMatrixX.Reset;
                        AssignmentMatrixX.SetRange(Code, HRSetup."Hardship Allowance Code");
                        AssignmentMatrixX.SetRange("Employee No", Emp."No.");
                        AssignmentMatrixX.SetRange("Payroll Period", CalcDate('<CM+1D>', Today));
                        AssignmentMatrixX.DeleteAll;
                    end;



                    Transfers.Init;
                    Transfers."Employee No" := Emp."No.";
                    Transfers."Employee Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                    Transfers."Transfer Date" := Today;
                    Transfers."Transfered By" := UserId;
                    Transfers."New Station" := NewStation;
                    Transfers."To Hardship Area?" := DimensionValue."Hardship Area";
                    Transfers."Original Station" := Employee."Global Dimension 1 Code";
                    Transfers.Insert;

                    //send email

                    //Filename:= ObjCompany."Payslip Path"+Employee."First Name"+'_'+Employee."Last Name"+FORMAT(DATE2DMY(SelectedPeriod,2))+FORMAT(DATE2DMY(SelectedPeriod,3))+'.pdf';

                    //REPORT.SAVEASPDF(69140,Filename,Emp);
                    Header := 'TRANSFER NOTIFICATION DATED' + Format(Date2dmy(Today, 1)) + '/' + Format(Date2dmy(Today, 2)) + '/' + Format(Date2dmy(Today, 3));

                    if SMTPSetup.Get() then begin
                        //     SenderEmail:=SMTPSetup."Email Sender Address";
                        //     SenderName:= SMTPSetup."Email Sender Name";
                        //   end;
                        //   if Employee."E-Mail" <> '' then begin
                        //   SMTPMail.CreateMessage(SenderName,SenderEmail,Employee."E-Mail",Header,'',true);
                        //   SMTPMail.AppendBody('<br><br>');
                        //   SMTPMail.AppendBody('Dear '+Employee."First Name"+' '+Employee."Last Name"+',');
                        //   SMTPMail.AppendBody('<br><br>');
                        //   SMTPMail.AppendBody('This is to notify you that your transer from '+Employee."Global Dimension 1 Code" +' to '+NewStation+
                        //   ' has been effected successfuly, you will receive transfer allowance plus hardship allowance if the new station is classified under hardship areas ');// for the month of January 2014');
                        //   SMTPMail.AppendBody('<br><br>');
                        //   SMTPMail.AppendBody('We take this earliest opportunity to congratulate you and wish you good speed in your new work station');
                        //   SMTPMail.AppendBody('<br><br>');
                        //   SMTPMail.AppendBody('Thanks & Regards');
                        //   SMTPMail.AppendBody('<br><br>');
                        //   SMTPMail.AppendBody(SenderName);
                        //   SMTPMail.AppendBody('<br><br>');
                        //   SMTPMail.AppendBody('<HR>');
                        //   SMTPMail.AppendBody('This is a system generated mail.');
                        //   SMTPMail.AppendBody('<br><br>');
                        //   SMTPMail.AppendBody('All Enquires regarding wages should be sent to HR@kerra.go.ke');
                        //   SMTPMail.AppendBody('<br><br>');
                        //  // SMTPMail.AddAttachment(Filename,'PAYSLIP'+Employee."No."+'-'+FORMAT(DATE2DMY(SelectedPeriod,2))+'-'+FORMAT(DATE2DMY(SelectedPeriod,3))+'.pdf');
                        //   SMTPMail.Send;
                        //     //MESSAGE('The email %1 for %2 is invalid',Employee."E-Mail",Employee."No.");

                        //   if Exists(Filename) then
                        //   Erase(Filename);
                    end;
                end;
                ProgressWindow.Close;
                Message('Transfer was successfull\Old Station: %1\New Station: %2', Employee."Global Dimension 1 Code", NewStation);

            end;

            trigger OnPreDataItem()
            begin
                HRSetup.Get;
                HRSetup.TestField("Hardship Allowance Code");
                HRSetup.TestField("Transfer Allowance Code");
                HRSetup.TestField("Transfer Nos");
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group("New Station Details")
                {
                    field("New Station"; NewStation)
                    {
                        ApplicationArea = Basic;
                        Editable = true;
                        TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Station: Code[30];
        NewStation: Code[30];
        Emp: Record Employee;
        Transfers: Record "Employee Transfers";
        AssignmentMatrixX: Record "Assignment Matrix-X";
        HRSetup: Record "Human Resources Setup";
        DimensionValue: Record "Dimension Value";
        ProgressWindow: Dialog;
        Filename: Text;
        SMTPSetup: Record "Email Account";
        SMTPMail: Codeunit Email;
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        ObjAssMatrix: Record "Assignment Matrix-X";
}

