#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69122 "Oral Interview  List"
{
    CardPageID = "Oral Interview Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Vacancy Requisition Lines";
    SourceTableView = where(Status = filter(Oral));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup29)
            {
                separator(Action33)
                {
                }
                action("Notify Applicants")
                {
                    ApplicationArea = Basic;
                    Image = Email;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin

                        /*CurrPage.SETSELECTIONFILTER(VacancyApplicantsTable);
                        IF VacancyApplicantsTable.FINDSET THEN BEGIN
                          REPEAT
                          //Code to send email notification
                        SMTPMailSet.GET;
                        IF CONFIRM('Are you sure you want to send email notifications to applicants ',FALSE) THEN BEGIN
                        Notification1.CreateMessage(CompanyInformation.Name,SMTPMailSet."Email Sender Address","E-Mail","Job Applied For",
                                        'Dear '+"First Name"+','+"Last Name"+ ',<BR><BR>'+
                                        ' You have succesfully been shortlisted for an oral interview for the job' +UPPERCASE("Job Applied For")+
                        '<BR>'+'<BR>',TRUE);
                        
                        Notification1.AddBodyline(
                        '<BR><BR>Kind Regards,'+
                        '<BR><BR>For any Information, Please Contact'+'<BR>'+CompanyInformation.Name+'<BR>'+
                        CompInfo.Name+'<BR>'+
                        CompInfo.Address+'<BR>'+
                        CompInfo."Address 2"+'<BR>'+
                        CompInfo."Phone No."+'<BR>'+
                        CompInfo.City);
                        
                        Notification1.Send;
                        END;
                            MESSAGE('Applicants succesfully notified');
                          UNTIL VacancyApplicantsTable.NEXT = 0;
                          CLEAR(VacancyApplicantsTable);
                         END;
                         */

                    end;
                }
            }
        }
    }

    var
        VacancyApplicantsTable: Record "Vacancy  Requisitions Table";
        TempVacancy: Record "Vacancy  Requisitions Table";
        noFilter: Text;
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
}

