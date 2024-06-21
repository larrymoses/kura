#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80206 "Attestation Invitations"
{
    Editable = false;
    PageType = List;
    SourceTable = "Policy Attestation Invitation";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Policy ID"; "Policy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field("Email address"; "Email address")
                {
                    ApplicationArea = Basic;
                }
                field(Invited; Invited)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date Invited"; "Date Invited")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Time Invited"; "Time Invited")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Invited By"; "Invited By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Due Date"; "Due Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Attestation No."; "Attestation No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Signing Status"; "Employee Signing Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date Approved"; "Date Approved")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Send E-Invites")
            {
                // ApplicationArea = Basic;
                // Image = Email;
                // Promoted = true;
                // PromotedCategory = Process;
                // PromotedIsBig = true;

                // trigger OnAction()
                // var
                //     // ApprovalMgt: Codeunit "Approvals Mgmt.";
                //     SMTPSetup: Codeunit Mail;
                //     CompanyInfo: Record "Company Information";
                //     UserSetup: Record "User Setup";
                //     SenderAddress: Text[80];
                //     Recipients: Text[80];
                //     SenderName: Text[70];
                //     Body: Text[500];
                //     Subject: Text[80];
                //     FileName: Text;
                //     FileMangement: Codeunit "File Management";
                //     ProgressWindow: Dialog;
                //     SMTPMailSet: Record "Email Account";
                //     FileDirectory: Text[100];
                //     Window: Dialog;
                //     WindowisOpen: Boolean;
                //     Counter: Integer;
                //     cu400: Codeunit Mail;
                //     DocLog: Record "Document E-mail Log";
                //     BranchName: Code[80];
                //     DimValue: Record "Dimension Value";
                //     CustEmail: Text[100];
                //     HRSetup: Record "Human Resources Setup";
                //     CompInfo: Record "Company Information";
                //     FundingOpp: Record "Project Contract Header";
                //     GrantsSetup: Record "Grants Setup";
                //     PerfomanceContractHeader: Record "Perfomance Contract Header";
                //     Employee: Record Employee;
                //     Policy: Record Policy;
                // begin
                //     PolicyAttestationInvitation.Reset;
                //     PolicyAttestationInvitation.SetRange("Policy ID", "Policy ID");
                //     if PolicyAttestationInvitation.Find('-') then begin
                //         repeat
                //             PolicyAttestationInvitation.TestField(Invited, false);
                //             AttestationNo := '';
                //             EmployeePolicyAttestation.Init;
                //             EmployeePolicyAttestation."Attestation No." := NoSeriesManagement.GetNextNo('ATT', Today, true);
                //             EmployeePolicyAttestation."Document Date" := Today;
                //             EmployeePolicyAttestation."Policy No." := PolicyAttestationInvitation."Policy ID";
                //             EmployeePolicyAttestation.Validate("Policy No.");
                //             EmployeePolicyAttestation."Employee No." := PolicyAttestationInvitation."Employee No";
                //             EmployeePolicyAttestation.Validate("Employee No.");
                //             EmployeePolicyAttestation."Due Date" := PolicyAttestationInvitation."Due Date";
                //             EmployeePolicyAttestation.Insert;


                //             AttestationNo := EmployeePolicyAttestation."Attestation No.";

                //             PolicyAttestationInvitation."Attestation No." := AttestationNo;
                //             //PolicyAttestationInvitation.Invited:=TRUE;
                //             PolicyAttestationInvitation."Invited By" := UserId;
                //             PolicyAttestationInvitation."Date Invited" := Today;
                //             PolicyAttestationInvitation."Time Invited" := Time;
                //             PolicyAttestationInvitation.Modify;


                //             PolicyManagementSetup.Get;
                //             if PolicyManagementSetup."Enable Email Alerts" then begin
                //                 CompanyInfo.Get();
                //                 SMTPMailSet.Get;
                //                 SenderAddress := SMTPMailSet."Email Address";
                //                 SenderName := CompanyInfo.Name + ' M&E';
                //                 Subject := StrSubstNo('Policy Attestation Invite');

                //                 FileDirectory := 'C:\DOCS\';
                //                 FileName := 'PCA_' + PolicyAttestationInvitation."Policy ID" + '.pdf';
                //                 //Window.OPEN('processing');
                //                 Window.Open('PROCESSING ATTESTATION INVITES ############1##');
                //                 Window.Update(1, PolicyAttestationInvitation."Policy ID" + '-' + PolicyAttestationInvitation.Name);

                //                 WindowisOpen := true;
                //                 if FileName = '' then
                //                     Error('Please specify what the file should be saved as');
                //                 Policy.Reset;
                //                 Policy.SetRange(Code, PolicyAttestationInvitation."Policy ID");
                //                 if Policy.Find('-') then begin
                //                     // Report.SaveAsPdf(80014,FileDirectory+FileName,Policy);
                //                 end;



                //                 //  if  then begin
                //                 Counter := Counter + 1;

                //                 SMTPMailSet.Get;
                //                 SenderAddress := SMTPMailSet."Email Address";

                //                 Recipients := PolicyAttestationInvitation."Email address";

                //                 if Recipients <> '' then begin
                //                     Body := 'Dear ' + PolicyAttestationInvitation.Name + '<BR>This email is to invite you to submit your Attestation for this Company Policy:<Br>'
                //                     + PolicyAttestationInvitation."Policy ID" + ' ' + PolicyAttestationInvitation."Policy Name" + ' ' + PolicyAttestationInvitation."External Ref No" + ' ' + 'Attestation Due Date is ' + ''
                //                     + Format(PolicyAttestationInvitation."Due Date")
                //                     + '<BR>By Signing the Attestation form,you Confirm that you have read and reviewed the Policy Document.<Br> if you require any assistance, please contact Strategy and Compliance office via Email: strategyoffice@kemri.org.ke';
                //                     //   cu400.CreateMessage(CompanyInfo.Name,SenderAddress,Recipients,Subject,Body,true);

                //                     //   cu400.AddBodyline(
                //                     //   '<BR><BR>Kind Regards,');
                //                     //   cu400.AddBodyline('<BR>'+CompInfo.Name);
                //                     //   cu400.AddAttachment(FileDirectory+FileName,FileName);
                //                     //   cu400.Send;

                //                     Sleep(1000);
                //                     Window.Close;
                //                     // end;
                //                 end;
                //             end;

                // //         until PolicyAttestationInvitation.Next = 0;
                //     end;
                // end;
            }
        }
    }

    var
        PolicyAttestationInvitation: Record "Policy Attestation Invitation";
        EmployeePolicyAttestation: Record "Employee Policy Attestation";
        AttestationNo: Code[50];
        PolicyManagementSetup: Record "Policy Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
}

