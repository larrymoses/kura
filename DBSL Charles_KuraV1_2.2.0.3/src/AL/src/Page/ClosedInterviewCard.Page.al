#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69131 "Closed Interview Card"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = true;
    PageType = Card;
    SourceTable = "Vacancy Requisition Lines";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = false;
                field("Requisition No."; "Requisition No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Id"; "Job Id")
                {
                    ApplicationArea = Basic;
                }
                field("Job Description"; "Job Description")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Qty"; "Planned Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Requested Qty"; "Requested Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date"; "Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned End Date"; "Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Start Date"; "Actual Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Actual End Date"; "Actual End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Applications End Time"; "Applications End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Applications End Date"; "Applications End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Applications Start Date"; "Applications Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Closed Date"; "Closed Date")
                {
                    ApplicationArea = Basic;
                }
                field("Closed By"; "Closed By")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control14; "Closed Interview Lines")
            {
            }
        }
        area(factboxes)
        {
            systempart(Control11; Outlook)
            {
            }
            systempart(Control12; Links)
            {
            }
            systempart(Control13; MyNotes)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Fu&nctions")
            {
                Caption = 'Fu&nctions';
                action("Onboard as Employee")
                {
                    ApplicationArea = Basic;
                    Caption = 'Onboard as Employee';
                    Image = Salutation;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        VacancyRequisitionLines.Reset;
                        VacancyRequisitionLines.SetRange(Employ, true);
                        if VacancyRequisitionLines.FindSet then begin
                            if Confirm('Are you sure you want to add the employees to the database?', false) then begin
                                repeat
                                    AddEmployee(VacancyRequisitionLines."Application No");

                                until VacancyRequisitionLines.Next = 0;
                            end;
                        end
                    end;
                }
                action("Notify Qualified Applicants")
                {
                    // ApplicationArea = Basic;
                    // Image = Email;
                    // Promoted = true;
                    // PromotedCategory = Process;
                    // PromotedIsBig = true;

                    // trigger OnAction()
                    // begin
                    //       VacancyRequisitionLines.Reset;
                    //       //VacancyRequisitionLines.SETRANGE("Application No","Application No");
                    //       VacancyRequisitionLines.SetRange(Employ,true);
                    //     if VacancyRequisitionLines.FindSet then begin

                    //             SMTPMailSet.Get;
                    //             if Confirm('Are you sure you want to send email notifications to the succesfull applicants',false) then begin
                    //                repeat
                    //                     Notification1.CreateMessage(CompanyInformation.Name,SMTPMailSet."Email Sender Address",VacancyRequisitionLines.Email,"Job Description",
                    //                     'Dear '+VacancyRequisitionLines."Full Name"+',<BR><BR>'+
                    //                     ' You have succesfully been accepted for the job' +' '+UpperCase("Job Description")+'<BR>'+'You are required to confirm your availability'+
                    //                     'for the job by'+'',true);
                    //                     //Add attachment
                    //                     Notification1.AddBodyline(
                    //                     '<BR><BR>Kind Regards,'+
                    //         '<BR><BR>For any Information, Please Contact'+'<BR>'+CompanyInformation.Name+'<BR>'+
                    //         CompInfo.Name+'<BR>'+
                    //         CompInfo.Address+'<BR>'+
                    //         CompInfo."Address 2"+'<BR>'+
                    //         CompInfo."Phone No."+'<BR>'+
                    //         CompInfo.City);

                    //           Notification1.Send;

                    //   until VacancyRequisitionLines.Next = 0;
                    //   Message('Email notifications sent succesfully');
                    // end;
                    // end else begin
                    //     VacancyRequisitionLines.Reset;
                    //     //VacancyRequisitionLines.SETRANGE("Application No","Application No");
                    //     VacancyRequisitionLines.SetRange(Employ,false);
                    //     if VacancyRequisitionLines.FindSet then begin

                    // SMTPMailSet.Get;
                    //        repeat
                    //                     Notification1.CreateMessage(CompanyInformation.Name,SMTPMailSet."Email Sender Address",VacancyRequisitionLines.Email,"Job Description",
                    //                     'Dear '+VacancyRequisitionLines."Full Name"+',<BR><BR>'+
                    //                     ' This is a regret email,regarding the application for the position' +' '+UpperCase("Job Description")+'<BR>'+'You have not been succesfull.<BR>Kindly look'+
                    //                     'at our website to be up to date on new openings'+'',true);
                    //                     //Add attachment
                    //                     Notification1.AddBodyline(
                    //                     '<BR><BR>Kind Regards,'+
                    //                     '<BR><BR>For any Information, Please Contact'+'<BR>'+CompanyInformation.Name+'<BR>'+
                    //                     CompInfo.Name+'<BR>'+
                    //                     CompInfo.Address+'<BR>'+
                    //                     CompInfo."Address 2"+'<BR>'+
                    //                     CompInfo."Phone No."+'<BR>'+
                    //                     CompInfo.City);

                    //                       Notification1.Send;

                    //               until VacancyRequisitionLines.Next = 0;
                    //               end;
                    //               end
                    // end;
                }
            }
        }
    }

    var
        VacancyApplicantsTable: Record "Job Application Table";
        VacancyRequisitionLines: Record "Shortlisting Lines";
        SMTPMailSet: Record "Email Account";
        ServiceItem: Record "Service Item";
        Service: Text;
        Notification1: Codeunit Mail;
        objCustomer: Record Customer;
        CompInfo: Record "Company Information";
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        //Copyright: Record "Copyright Registration Table";
        CompanyInformation: Record "Company Information";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        EmployeeHistoryTable: Record "Employee History Table";
        Text001: label 'Kindly update full details for the employee %1 on the contract document %2';
        ServiceMgtSetup: Record "Service Mgt. Setup";

    local procedure AddEmployee("Applicant No": Code[30])
    var
        VacancyRequisitionsTable: Record "Vacancy  Requisitions Table";
        VacancyApplicantsTable: Record "Job Application Table";
        ApplicantBackground: Record "Applicant Background";
        ApplicantReferees: Record "Applicant Referees";
        VacancyRequisitionLines: Record "Shortlisting Lines";
        Employee: Record Employee;
        HumanResSetup: Record "Human Resources Setup";
    begin
        //add details to employee table
        Employee.Init;
        Employee."No." := '';
        if Employee."No." = '' then begin
            HumanResSetup.Get;
            HumanResSetup.TestField("Employee Nos.");
            NoSeriesMgt.InitSeries(HumanResSetup."Employee Nos.", Employee."No. Series", 0D, Employee."No.", Employee."No. Series");
        end;

        VacancyApplicantsTable.Reset;
        VacancyApplicantsTable.SetRange("Application No", "Applicant No");

        if VacancyApplicantsTable.FindFirst then begin
            Employee.Reset;
            Employee.SetRange("ID Number", VacancyApplicantsTable."ID/Passport");
            if Employee.FindSet then begin
                //Create a contract document
                EmployeeHistoryTable.Init;
                EmployeeHistoryTable."Employee No." := Employee."No.";
                EmployeeHistoryTable."Posting Date" := Today;
                EmployeeHistoryTable."Document Type" := EmployeeHistoryTable."document type"::Promotion;
                EmployeeHistoryTable.Description := VacancyApplicantsTable."Job Applied For";
                EmployeeHistoryTable."Document No." := VacancyApplicantsTable."Application No";
                EmployeeHistoryTable.Insert;
            end
            else begin
                Employee."First Name" := VacancyApplicantsTable."First Name";
                Employee."Middle Name" := VacancyApplicantsTable."Middle Name";
                Employee."Last Name" := VacancyApplicantsTable.Surname;
                Employee."E-Mail" := VacancyApplicantsTable.Email;
                Employee."ID Number" := VacancyApplicantsTable."ID/Passport";
                Employee.Gender := VacancyApplicantsTable.Gender;
                Employee."Birth Date" := VacancyApplicantsTable."Date of Birth";
                Employee.Citizenship := VacancyApplicantsTable.Citizenship;
                Employee."Marital Status" := VacancyApplicantsTable."Marital Status";
                Employee."Ethnic Origin" := VacancyApplicantsTable."Ethnic Origin";
                Employee."Address 2" := VacancyApplicantsTable."Postal Address";
                Employee."Post Code" := VacancyApplicantsTable."Postal Code.";
                // Employee.ad:=VacancyApplicantsTable."Residential Address";
                Employee.City := VacancyApplicantsTable.City;
                Employee.County := VacancyApplicantsTable.County;
                Employee."Country/Region Code" := VacancyApplicantsTable."Country Code";
                Employee.Disabled := VacancyApplicantsTable.Disabled;
                Employee."Disability No." := VacancyApplicantsTable."Disability Grade";
                Employee."Disability Description" := VacancyApplicantsTable."Disability Description";
                VacancyRequisitionLines.Reset;
                VacancyRequisitionLines.SetRange("Application No", VacancyApplicantsTable."Application No");
                if VacancyRequisitionLines.FindSet then begin
                    Employee."Employment Date" := VacancyRequisitionLines."Employment Date";
                end;
                VacancyApplicantsTable.Status := VacancyApplicantsTable.Status::Closed;
                Employee.Insert;

                Message('Employee %1 , added succesfully ', VacancyRequisitionLines."Full Name");


                //Create a service contract

            end;

        end;
        CreateContract(Employee."No.");
        //Add details of Employment history
    end;

    local procedure CreateContract("Applicant No": Code[30])
    var
        ServiceContractHeader: Record "Service Contract Header";
    begin
        ServiceContractHeader.Init;
        ServiceContractHeader."Contract No." := '';
        if ServiceContractHeader."Contract No." = '' then begin
            ServiceMgtSetup.Get;
            ServiceMgtSetup.TestField("Service Contract Nos.");
            NoSeriesMgt.InitSeries(ServiceMgtSetup."Service Contract Nos.", ServiceContractHeader."No. Series", 0D, ServiceContractHeader."Contract No.", ServiceContractHeader."No. Series");
        end;
        //ServiceContractHeader."Contract Type":=ServiceContractHeader."contract type"::"2";
        ServiceContractHeader."Customer No." := "Applicant No";
        ServiceContractHeader.Validate("Customer No.");
        ServiceContractHeader.Insert;
        Message(Text001, "Applicant No", ServiceContractHeader."Contract No.");
    end;
}

