#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 50019 "Doc Approval Delegation Admin"
{
    PageType = Card;
    SourceTable = "Document Approval Delegation";
   // SourceTableView = where(Status = const(Open));
    Caption = 'Approval Delegation';
    DataCaptionFields = "Delegation No","Current Approver ID","New Approver ID";
     PopulateAllFields = true;
    PromotedActionCategories = 'New,Process,Report,Delegate,Resume';
    layout
    {
        area(content)
        {
            group("Approval Delegation")
            {
                Caption = 'Approval Delegation';
                field("Delegation No"; Rec."Delegation No")
                {
                    ApplicationArea = Basic;
                }
                field("Current Approver ID"; Rec."Current Approver ID")
                {
                    ApplicationArea = Basic;
                    editable = false;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Delegate to Single Approver"; Rec."Delegate to Single Approver")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("New Approver ID"; Rec."New Approver ID")
                {
                    ApplicationArea = Basic;
                    // Enabled = Rec."Delegate to Single Approver";
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }

                field("Alternate Approver ID"; Rec."Alternate Approver ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            part("Document Approval Delegation"; "Document Approval Delegation")
            {
                Caption = 'Delegation Entries';
                SubPageLink = "Delegation No" = field("Delegation No");
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action("Delegate Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Delegate Approval';
                    Promoted =true;
                    PromotedCategory = Category4;
                    trigger OnAction()
                    var
                        WorkflowUserGroupMember: Record "Workflow User Group Member";
                        UserSetup: Record "User Setup";
                        UserSetup1: Record "User Setup";
                        Entries: Record "Delegation Entries";

                        WorkflowUserGroupMember1: Record "Workflow User Group Member";
                    begin
                        Rec.TestField(Delegated, false);
                        Rec.TestField(Rec."Current Approver ID");
                        //if Rec."Delegate to Single Approver" then begin
                        Rec.TestField(Rec."New Approver ID");
                            UserSetup.Reset;
                            WorkflowUserGroupMember.Reset;
                            WorkflowUserGroupMember.SetRange("User Name", Rec."Current Approver ID");
                            if WorkflowUserGroupMember.Findset() then
                                repeat
                                    if not WorkflowUserGroupMember1.Get(WorkflowUserGroupMember."Workflow User Group Code", Rec."New Approver ID") then BEGIN
                                        // WorkflowUserGroupMember.Rename(WorkflowUserGroupMember."Workflow User Group Code", Rec."New Approver ID");
                                        Entries.Reset();
                                        Entries.SetRange("Delegation No", Rec."Delegation No");
                                        Entries.SetRange("Workflow User Group", WorkflowUserGroupMember."Workflow User Group Code");
                                        if Entries.FindFirst() then begin
                                            Entries.Status := Entries.Status::Processed;
                                            Entries.Validate("New Approver ID", Rec."New Approver ID");
                                            Entries.Modify();
                                        end;
                                    END;


                                until WorkflowUserGroupMember.Next = 0;
                        //end;


                        /* WorkflowUserGroupMember.Reset;
                         WorkflowUserGroupMember.SetRange("User Name", Rec."Current Approver ID");
                         if WorkflowUserGroupMember.Findset() then
                             repeat
                                 if WorkflowUserGroupMember1.Get(WorkflowUserGroupMember."Workflow User Group Code", Rec."Current Approver ID") then BEGIN
                                     Entries.Reset();
                                     Entries.SetRange("Delegation No", Rec."Delegation No");
                                     Entries.SetFilter("New Approver ID", '<>%1', '');
                                     Entries.SetRange("Workflow User Group", WorkflowUserGroupMember."Workflow User Group Code");
                                     if Entries.FindFirst() then begin
                                         Entries.Status := Entries.Status::Processed;
                                         Entries."New Approver ID" := Rec."New Approver ID";
                                         ENTRIES."isGroup Member" := TRUE;
                                         Entries.Modify();
                                     end;
                                     WorkflowUserGroupMember1.Delete();
                                 END;
                             until WorkflowUserGroupMember.Next = 0;*/
                             //Disabe changing of workflow user groups when delegating
                        // Rec.DelegateWorkflows(Rec."Current Approver ID", Rec."Delegation No");
                        // Rec.DelegateProjectWorkflows(Rec."Current Approver ID", Rec."Delegation No");
                        Rec.Delegated := true;
                        Rec.Status := Rec.Status::Processed;
                        if Rec.Modify() then
                            Message('Delegations processed successfully');
                    END;
                }
                action(Resume)
                {
                    ApplicationArea = Basic;
                    Caption = 'Resume';
                    Promoted =true;
                    PromotedCategory = Category5;
                    trigger OnAction()
                    var
                        WorkflowUserGroupMember: Record "Workflow User Group Member";
                        WorkflowUserGroupMember1: Record "Workflow User Group Member";
                        UserSetup: Record "User Setup";
                        UserSetup1: Record "User Setup";
                        Entries: Record "Delegation Entries";
                        UserGroup: Record "Workflow User Group";
                    begin
                        Rec.TestField(Delegated, true);
                        Rec.TestField(Rec."Current Approver ID");
                           Rec.TestField(Rec."New Approver ID");
                           Rec.TestField(Status,Rec.Status::Processed);
                           Rec.Status := Rec.Status::Expired;
                           Rec.Modify();
                        //UserSetup.Reset;

                        /* Entries.Reset();
                         Entries.SetRange("Delegation No", Rec."Delegation No");
                         Entries.SetRange(Status, Entries.Status::Processed);
                         Entries.SetRange("isGroup Member", true);
                         if Entries.FindSet() then
                             repeat
                                 WorkflowUserGroupMember.Reset;
                                 WorkflowUserGroupMember.SetRange("User Name", Rec."Current Approver ID");
                                 WorkflowUserGroupMember.SetRange("Workflow User Group Code", Entries."Workflow User Group");
                                 if NOT WorkflowUserGroupMember.FindFirst() then begin

                                     WorkflowUserGroupMember.Init();
                                     WorkflowUserGroupMember."Workflow User Group Code" := Entries."Workflow User Group";
                                     WorkflowUserGroupMember."User Name" := REC."Current Approver ID";
                                     WorkflowUserGroupMember.VALIDATE(WorkflowUserGroupMember."User Name");
                                     WorkflowUserGroupMember."Sequence No." := Entries.Sequence;
                                     WorkflowUserGroupMember.Insert(TRUE);
                                     WorkflowUserGroupMember.Modify(TRUE);
                                 end;

                                 Entries.Status := Entries.Status::Expired;
                                 Entries.Modify();
                             until Entries.Next() = 0;*/
                        //curr
                        /*Rec.TestField(Rec."Current Approver ID");
                        Rec.TestField(Rec."New Approver ID");
                        UserSetup.Reset;*/

                        /* Entries.Reset();
                         Entries.SetRange("Delegation No", Rec."Delegation No");
                         Entries.SetRange(Status, Entries.Status::Processed);
                         Entries.SetRange("isGroup Member", false);
                         if Entries.FindSet() then
                             repeat
                                 WorkflowUserGroupMember.Reset;
                                 WorkflowUserGroupMember.SetRange("User Name", Rec."New Approver ID");
                                 WorkflowUserGroupMember.SetRange("Workflow User Group Code", Entries."Workflow User Group");
                                 if WorkflowUserGroupMember.FindFirst() then begin
                                     WorkflowUserGroupMember.Rename(WorkflowUserGroupMember."Workflow User Group Code", Rec."Current Approver ID");
                                     WorkflowUserGroupMember.Modify(TRUE);
                                     Entries.Status := Entries.Status::Expired;
                                     Entries.Modify();
                                 end;
                             until Entries.Next() = 0;*/

                             //
                        // Rec.ResumeWorkflows(Rec."Current Approver ID", Rec."Delegation No");
                        // Rec.ResumeProjectWorkflows(Rec."Current Approver ID", Rec."Delegation No");
                    end;


                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        REC."Current Approver ID" := USERID;
        rec.validate("Current Approver ID");

    end;

    trigger OnOpenPage()
    begin
        REC.SETRANGE("Current Approver ID", USERID);
        if Rec.Delegated then
        CurrPage.Editable(false);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        rec.validate("Current Approver ID");
    end;

    var
        SMTPSetup: Codeunit Mail;
        UserSetup: Record "User Setup";
        //SenderName: Text[50];
        SenderAddress: Text[50];
        Recipient: Text[50];
        Employee: Record Employee;
        Subject: Text[80];
        Body: Text[250];
        currsequence: Integer;
}



