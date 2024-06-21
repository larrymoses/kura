#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69125 "Oral Interview Card"
{
    PageType = Card;
    SourceTable = "Vacancy Requisition Lines";
    SourceTableView = where(Status = filter(Oral));

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = false;
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
                field("Requisition No."; "Requisition No.")
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
                field("Advertised By"; "Advertised By")
                {
                    ApplicationArea = Basic;
                }
                field("Advertised Date"; "Advertised Date")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Type"; "Requisition Type")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control14; "Oral Interview Lines")
            {
                SubPageLink = "Job Id." = field("Job Id"),
                              Type = const(Oral);
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
                action("Get Oral  Shortlisted Applicants")
                {
                    ApplicationArea = Basic;
                    Caption = 'Get Shortlisted Applicants';
                    Image = Salutation;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        VacancyApplicantsTable.Reset;
                        VacancyApplicantsTable.SetRange("Vacancy Requisition No.", "Requisition No.");
                        VacancyApplicantsTable.SetRange("Job Id", "Job Id");
                        VacancyApplicantsTable.SetRange(Status, VacancyApplicantsTable.Status::Oral);
                        if VacancyApplicantsTable.FindSet then begin

                            repeat
                                VacancyRequisitionLines.Init;
                                VacancyRequisitionLines.Type := VacancyRequisitionLines.Type::Oral;
                                VacancyRequisitionLines."Application No" := VacancyApplicantsTable."Application No";
                                VacancyRequisitionLines."Full Name" := VacancyApplicantsTable."First Name" + ' ' + VacancyApplicantsTable."Middle Name" + ' ' + VacancyApplicantsTable.Surname;
                                VacancyRequisitionLines.Email := VacancyApplicantsTable.Email;
                                VacancyRequisitionLines."Job Id." := VacancyApplicantsTable."Job Id";
                                VacancyRequisitionLines.Insert(true);
                            until VacancyApplicantsTable.Next = 0;
                            Message(Text001);
                        end else
                            Message(Text002);
                    end;
                }
                action("Notify Applicants")
                {
                    // ApplicationArea = Basic;
                    // Image = Email;
                    // Promoted = true;
                    // PromotedCategory = Process;
                    // PromotedIsBig = true;

                    // trigger OnAction()
                    // begin
                    // VacancyRequisitionLines.Reset;
                    // VacancyApplicantsTable.SetRange("Vacancy Requisition No.","Requisition No.");
                    // VacancyApplicantsTable.SetRange(Status,VacancyApplicantsTable.Status::Oral);
                    // if VacancyRequisitionLines.FindSet then begin
                    //  VacancyRequisitionLines.TestField(Email);
                    //   SMTPMailSet.Get;
                    // if Confirm(Text003,false) then begin
                    //    repeat
                    // Notification1.CreateMessage(CompanyInformation.Name,SMTPMailSet."Email Sender Address",VacancyRequisitionLines.Email,UpperCase('Job application:'+"Job Description"),
                    //                 'Dear '+VacancyRequisitionLines."Full Name"+',<BR><BR>'+
                    //                 ' You have succesfully been shortlisted for an oral interview for the job' +' '+"Job Description"+
                    // '<BR>'+'<BR>'+'Venue'+':'+''+VacancyRequisitionLines."Interview Location"+'<BR>'+'Date'+':'+''+Format(VacancyRequisitionLines."Interview Date")+'<BR>'+
                    // 'Time'+':'+''+Format(VacancyRequisitionLines."Interview Time")+'<BR>',true);

                    // Notification1.AddBodyline(
                    // '<BR><BR>Kind Regards,'+
                    // '<BR><BR>For any Information, Please Contact'+'<BR>'+CompanyInformation.Name+'<BR>'+
                    // CompInfo.Name+'<BR>'+
                    // CompInfo.Address+'<BR>'+
                    // CompInfo."Address 2"+'<BR>'+
                    // CompInfo."Phone No."+'<BR>'+
                    // CompInfo.City);

                    // Notification1.Send;

                    //   until VacancyRequisitionLines.Next = 0;
                    //     Message('Email notifications sent succesfully');
                    //     end;
                    //     end
                    // end;
                }
                action("Close Interview")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to close the shortlisting process', false) then begin
                            Rec."Actual End Date" := Today;
                            Rec.Status := Rec.Status::Closed;
                            Rec."Closed By" := UserId;
                            "Closed Date" := Today;
                            Modify();
                        end;
                    end;
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
        VacancyRequisitionLines1: Record "Vacancy Requisition Lines";
        Text001: label 'Candidates have been added into this category';
        Text002: label 'There are no applicants shortlisted for the Oral interview category';
        Text003: label 'Are you sure you want to send email notifications to applicants ';
        OralInterviewLines: Page "Oral Interview Lines";
        ShortlistingLines: Record "Shortlisting Lines";
}

