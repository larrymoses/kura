#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 50016 "Active Approval Delegations"
{
    Editable = false;
    PageType = List;
    SourceTable = "Document Approval Delegation";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Delegation No"; Rec."Delegation No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Current Approver ID"; "Current Approver ID")
                {
                    ApplicationArea = Basic;
                }
                field("New Approver ID"; "New Approver ID")
                {
                    ApplicationArea = Basic;
                }
                field("Delegation Limits Approver ID"; "Delegation Limits Approver ID")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(Duration; Duration)
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; "End Date")
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
            group(Line)
            {
                Caption = 'Line';
                action("Resume Approval Duties")
                {
                    ApplicationArea = Basic;
                    Caption = 'Resume Approval Duties';

                    trigger OnAction()
                    begin
                        Resume(Rec);

                        if UserSetup.Get("Current Approver ID") then begin
                            UserSetup.TestField("E-Mail");
                            SenderAddress := UserSetup."E-Mail";
                            if Employee.Get(UserSetup."Employee No.") then
                                SenderName := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                        end;

                        if UserSetup.Get("New Approver ID") then begin
                            UserSetup.TestField("E-Mail");
                            Recipient := UserSetup."E-Mail";
                        end;

                        Subject := StrSubstNo('Resumption of Delegated Document Approval');
                        Body := 'This is to inform you that I,' + SenderName + 'have resumed the document approval functions I had delegated to you';

                        // SMTPSetup.CreateMessage(SenderName,SenderAddress,Recipient,Subject,Body,true);
                        // SMTPSetup.Send;
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        ActiveDelegations(Rec);
    end;

    var
        //   SMTPSetup: Codeunit Mail;
        UserSetup: Record "User Setup";
        SenderName: Text[50];
        SenderAddress: Text[50];
        Recipient: Text[50];
        Employee: Record Employee;
        Subject: Text[80];
        Body: Text[250];


    procedure ActiveDelegations(var Delegations: Record "Document Approval Delegation")
    begin
        Delegations.Reset;
        Delegations.SetCurrentkey("Delegation No");
        Delegations.SetRange("Current Approver ID", UserId);
        //Delegations.SETFILTER("Start Date",'<=%1',TODAY);
        //Delegations.SETFILTER("End Date",'>=%1',TODAY);
        Delegations.SetRange(Status, Delegations.Status::Processed);
    end;
}

