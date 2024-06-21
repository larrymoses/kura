#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 50017 "Document Approval Delegation"
{
    //   DrillDownPageID = UnknownPage51511600;
    //  LookupPageID = UnknownPage51511600;

    fields
    {
        field(1; "Delegation No"; Code[20])
        {
            trigger OnValidate()
            begin
                if xRec."Delegation No" <> "Delegation No" then begin
                    SSetUp.Get;
                    SSetUp.TestField("Delegation Nos");
                    NoSeriesMgt.TestManual(SSetUp."Delegation Nos");
                    "No. Series" := '';
                end;

            end;

        }
        field(2; "Current Approver ID"; Code[80])
        {
            TableRelation = "User Setup";
            trigger OnValidate()
            var
                WFMember: Record "Workflow User Group Member";
                Entries: Record "Delegation Entries";
                SEntries: Record "Delegation Entries";
                Workflows: Record Workflow;
            begin
                WFMember.Reset();
                WFMember.SetRange("User Name", "Current Approver ID");
                if WFMember.FindSet() then begin
                    repeat
                        Entries.Init();
                        SEntries.Reset();
                        if SEntries.FindLast() then
                            Entries."Entry No" := SEntries."Entry No" + 1;
                        Entries."Delegation No" := "Delegation No";
                        if Workflows.Get(WFMember."Workflow User Group Code") then
                            Entries.Description := Workflows.Description;
                        Entries."Workflow User Group" := WFMember."Workflow User Group Code";
                        Entries.Sequence := WFMember."Sequence No.";
                        Entries."Current Approver ID" := UserId;
                        Entries.Status := Entries.Status::Open;
                        SEntries.Reset();
                        SEntries.SetRange("Workflow User Group", Entries."Workflow User Group");
                        SEntries.SetRange("Delegation No", Entries."Delegation No");
                        if not SEntries.FindFirst() then
                            Entries.Insert();
                    until wfmember.next() = 0;
                end;
                if "Delegation No" <> '' then
                    getProjectApprovals("Current Approver ID", Rec."Delegation No");

            end;
        }
        field(3; "New Approver ID"; Code[80])
        {
            TableRelation = "User Setup";


            trigger OnValidate()
            begin

            end;
        }
        field(4; "Start Date"; Date)
        {

            trigger OnValidate()
            var
                CustomFunction: Codeunit "Custom Function";
                days: Integer;
                Dayss: Text;
                StrCount: Integer;
            begin
                // days 
                // Evaluate()
                if Format(Rec.Duration) <> '' then begin
                    StrCount := StrLen(format(Rec.Duration));
                    Dayss := CopyStr(format(Rec.Duration), 1, StrCount - 1);
                    evaluate(days, Dayss);
                    CustomFunction.BaseCalendarAddNonWorkingDays("Start Date", days, false, false, false);
                end;
                //   CompInfo.Get;
                //   //    if CalendarMgmt.CheckDateStatus(CompInfo."Base Calendar Code","Start Date",Description) then
                //    //    Error(Text003);
            end;
        }
        field(5; Duration; DateFormula)
        {
            trigger OnValidate()
            begin
                if Rec."Start Date" <> 0D then
                    Rec.Validate("Start Date");
            end;
            // trigger OnValidate()
            // begin
            //     CompInfo.Get;
            //     EndDate:="Start Date";
            //     NoOfDays:=(CalcDate(Duration,"Start Date")-"Start Date");
            //     //Calculate the end date based on working days
            //      repeat
            //    //  if not CalendarMgmt.CheckDateStatus(CompInfo."Base Calendar Code",EndDate,Description) then
            //     //        NoOfWorkingDays:=NoOfWorkingDays+1;
            //      //       EndDate:=CalcDate('1D',EndDate);

            //      until  NoOfWorkingDays=NoOfDays;
            //     // "End Date":=EndDate;
            //    //  if not CalendarMgmt.CheckDateStatus(CompInfo."Base Calendar Code","End Date",Description) then
            //     //       Loop:=true
            //     //       else begin
            //     //       Loop:=false;
            //     //       repeat
            //     //       "End Date":=CalcDate('1D',"End Date");
            //     //    //  if not CalendarMgmt.CheckDateStatus(CompInfo."Base Calendar Code","End Date",Description) then
            //     //       Loop:=true;
            //     //       until Loop=true;
            //      end;
            // end;
        }
        field(6; "End Date"; Date)
        {
        }
        field(7; Status; Option)
        {
            OptionCaption = 'Open,Processed,Expired';
            OptionMembers = Open,Processed,Expired;
        }
        field(8; "Delegation Limits Approver ID"; Code[80])
        {
            TableRelation = "User Setup";


        }
        field(9; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(10; Description; Text[250])
        {
        }
        field(11; "Alternate Approver ID"; Code[80])
        {
            TableRelation = "User Setup";

        }
        field(12; "Delegate to Single Approver"; Boolean)
        {

        }
        field(13; Delegated; Boolean)
        {

        }
    }

    keys
    {
        key(Key1; "Delegation No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Delegation No" = '' then begin
            SSetUp.Get;
            SSetUp.TestField("Delegation Nos");
            NoSeriesMgt.InitSeries(SSetUp."Delegation Nos", xRec."No. Series", 0D, "Delegation No", "No. Series");
        end;

        REC.Validate("Current Approver ID", USERID);

    end;

    var
        LoginMgt: Codeunit "User Management";
        Text000: label 'Processing Approval Delegation \From #1#########\ To   #2#########\ Delegated Authority #3#########';
        Text001: label 'There is a current Delegation that is already open, Do u want to replace it?';
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ApprovalSetup: Record "User Setup";
        Text002: label 'Processing Approval Resumption \From #1######### To   #2#########\ Delegated Authority From #3########  to#4#########';
        CalendarMgmt: Codeunit "Calendar Management";
        CompInfo: Record "Company Information";
        NoOfWorkingDays: Integer;
        EndDate: Date;
        NoOfDays: Integer;
        Loop: Boolean;
        Text003: label 'The Date you have entered is not a working day of the calendar';
        SSetUp: Record "Sales & Receivables Setup";


    procedure Delegate(Rec: Record "Document Approval Delegation")
    var
        UserSetup: Record "User Setup";
        CurrentDelegations: Record "Document Approval Delegation";
        Window: Dialog;
        ApprovalEntry: Record "Approval Entry";
        DelegationEntries: Record "Delegation Entries";
        EntryNo: Integer;
        DimensionRec: Record Dimension;
        DimensionValueRec: Record "Dimension Value";
    begin
        //Check if there is an already open delegation
        Window.Open(Text000, Rec."Current Approver ID", Rec."New Approver ID", Rec."Delegation Limits Approver ID");
        Rec.TestField("Start Date");
        Rec.TestField("End Date");
        Rec.TestField("Current Approver ID");
        Rec.TestField("Alternate Approver ID");

        //Change in User Setup=========================================================================================
        UserSetup.Reset;
        UserSetup.SetFilter(UserSetup."Approver ID", Rec."Current Approver ID");
        if UserSetup.FindSet(true) then begin
            UserSetup."Original Approver ID" := UserSetup."Approver ID";
            UserSetup."From Date" := Rec."Start Date";
            UserSetup."To Date" := Rec."End Date";
            UserSetup."Approver ID" := Rec."New Approver ID";
            UserSetup.Modify;
            Window.Update(3, 'User Setup');
            // MESSAGE('User Setup Done...');
        end;
        //=============================================================================================================

        //Approval Entry setup=========================================================================================
        ApprovalEntry.Reset;
        ApprovalEntry.SetFilter(ApprovalEntry."Approver ID", Rec."Current Approver ID");
        ApprovalEntry.SetFilter(ApprovalEntry.Status, '%1|%2', ApprovalEntry.Status::Open, ApprovalEntry.Status::Created);
        if ApprovalEntry.FindSet then
            repeat
                ApprovalEntry."Approver ID" := Rec."New Approver ID";
                ApprovalEntry."From Date" := Rec."Start Date";
                ApprovalEntry."To Date" := Rec."End Date";
                ApprovalEntry."Original Approver ID" := ApprovalEntry."Approver ID";
                ApprovalEntry.Modify;
                Window.Update(3, 'Approval Entry');
            until ApprovalEntry.Next = 0;
        //=============================================================================================================
        //Changing Current Record======================================================================================
        Rec.Status := Rec.Status::Processed;
        Rec.Modify;
        Window.Update(3, 'Delegation Record');
        Message('Approval Delegation Done!!');
        Window.Close;
    end;


    procedure Resume(var Rec: Record "Document Approval Delegation")
    var
        UserSetup: Record "User Setup";
        CurrentDelegations: Record "Document Approval Delegation";
        Window: Dialog;
        ApprovalEntry: Record "Approval Entry";
        DelegationEntries: Record "Delegation Entries";
        EntryNo: Integer;
        DimensionRec: Record Dimension;
        DimensionValueRec: Record "Dimension Value";
        CurrentDelegation: Boolean;
        NewApprover: Code[50];
        i: Integer;
        OpenDelegations: array[100, 5] of Code[50];
    begin
        Window.Open(Text002, Rec."New Approver ID", Rec."Current Approver ID", Rec."Delegation Limits Approver ID", Rec."Current Approver ID");
        //Change in User Setup=========================================================================================
        UserSetup.Reset;
        UserSetup.SetFilter(UserSetup."Approver ID", Rec."Current Approver ID");
        if UserSetup.FindSet then begin
            UserSetup."Original Approver ID" := '';//UserSetup."Approver ID";
            UserSetup."From Date" := 0D;
            UserSetup."To Date" := 0D;
            UserSetup."Approver ID" := UserSetup."Original Approver ID";
            UserSetup.Modify;
            Window.Update(3, 'User Setup');
        end;
        //=============================================================================================================

        //Approval Entry setup=========================================================================================
        ApprovalEntry.Reset;
        ApprovalEntry.SetFilter(ApprovalEntry."Approver ID", Rec."Current Approver ID");
        ApprovalEntry.SetFilter(ApprovalEntry.Status, '%1|%2', ApprovalEntry.Status::Open, ApprovalEntry.Status::Created);
        if ApprovalEntry.FindSet then
            repeat
                ApprovalEntry."Approver ID" := ApprovalEntry."Original Approver ID";//Rec."New Approver ID";
                ApprovalEntry."From Date" := 0D;//Rec."Start Date";
                ApprovalEntry."To Date" := 0D;//Rec."End Date";
                ApprovalEntry."Original Approver ID" := '';//ApprovalEntry."Approver ID";
                ApprovalEntry.Modify;
                Window.Update(3, 'Approval Entry');
            //MESSAGE('Approval Entry Done...');

            until ApprovalEntry.Next = 0;
        //=============================================================================================================
        //Changing Current Record======================================================================================
        Rec.Status := Rec.Status::Expired;
        Rec.Modify;
        Window.Update(3, 'Delegation Resumption');
        Message('Approval Resumption Done...');
        Window.Close;
        //=============================================================================================================
    end;


    procedure ResumeJobQueue(var Rec: Record "Document Approval Delegation")
    var
        UserSetup: Record "User Setup";
        CurrentDelegations: Record "Document Approval Delegation";
        Window: Dialog;
        ApprovalEntry: Record "Approval Entry";
        DelegationEntries: Record "Delegation Entries";
        EntryNo: Integer;
        DimensionRec: Record Dimension;
        DimensionValueRec: Record "Dimension Value";
        CurrentDelegation: Boolean;
        NewApprover: Code[50];
        i: Integer;
        OpenDelegations: array[100, 5] of Code[50];
    begin
        CurrentDelegation := false;
        UserSetup.Reset;
        UserSetup.SetRange("Approver ID", Rec."New Approver ID");
        UserSetup.SetFilter("Relieved Approver", '%1|%2', Rec."Current Approver ID", Rec."Alternate Approver ID");
        if UserSetup.Find('-') then begin
            repeat
                UserSetup."Approver ID" := Rec."Current Approver ID";
                UserSetup.Modify;
                CurrentDelegation := true;
            until
            UserSetup.Next = 0;
        end;


        if not CurrentDelegation then
            CheckPriorDelegation(Rec);

        //Modify all open approval entries other than Delagated Authority
        ApprovalEntry.Reset;
        ApprovalEntry.SetFilter(Status, '%1|%2', ApprovalEntry.Status::Open, ApprovalEntry.Status::Created);
        ApprovalEntry.SetRange("Approver ID", Rec."New Approver ID");
        if ApprovalEntry.Find('-') then begin
            repeat
                if CheckIfRelieved(Rec."New Approver ID", Rec."Current Approver ID", ApprovalEntry."Approval Code") then begin
                    ApprovalEntry."Approver ID" := Rec."Current Approver ID";
                    ApprovalEntry.Modify;
                end;
            until
            ApprovalEntry.Next = 0;
        end;

        if not CurrentDelegation then begin

            GetCurrentDelegation(Rec, OpenDelegations, i);

            ApprovalEntry.Reset;
            ApprovalEntry.SetFilter(Status, '%1|%2', ApprovalEntry.Status::Open, ApprovalEntry.Status::Created);
            ApprovalEntry.SetFilter("Approver ID", '%1|%2', OpenDelegations[i] [2], OpenDelegations[i] [3]);
            if ApprovalEntry.Find('-') then begin
                repeat
                    if CheckIfRelieved(OpenDelegations[i] [1], OpenDelegations[i] [2], ApprovalEntry."Approval Code") then begin
                        ApprovalEntry."Approver ID" := Rec."Current Approver ID";
                        ApprovalEntry.Modify;
                    end;
                until
                ApprovalEntry.Next = 0;
            end;

        end;

        //Insert Delegation Entries
        if DelegationEntries.Find('+') then
            EntryNo := DelegationEntries."Entry No"
        else
            EntryNo := 1;

        DelegationEntries.Init;
        DelegationEntries."Entry No" := EntryNo + 1;
        DelegationEntries."Delegation No" := Rec."Delegation No";
        DelegationEntries."Current Approver ID" := Rec."Current Approver ID";
        DelegationEntries."New Approver ID" := Rec."New Approver ID";
        DelegationEntries."Start Date" := Rec."Start Date";
        DelegationEntries.Duration := Rec.Duration;
        DelegationEntries."End Date" := Rec."End Date";
        DelegationEntries."Delegation Limits Approver ID" := Rec."Delegation Limits Approver ID";
        DelegationEntries."No. Series" := Rec."No. Series";
        DelegationEntries.Description := Rec.Description;
        DelegationEntries."Entry Type" := DelegationEntries."entry type"::Resumption;
        DelegationEntries."Alternate Approver ID" := DelegationEntries."Alternate Approver ID";
        if not DelegationEntries.Get(DelegationEntries."Entry No") then
            DelegationEntries.Insert;


        Rec.Status := Rec.Status::Expired;
        Rec.Modify;
    end;


    procedure CheckIfRelieved(SenderID: Code[50]; ApproverID: Code[50]; ApprovalCode: Code[50]): Boolean
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.Reset;
        UserSetup.SetRange("Approver ID", SenderID);
        UserSetup.SetRange("Relieved Approver", ApproverID);
        if UserSetup.Find('-') then begin
            exit(true);
        end else
            exit(false);
    end;


    procedure CheckPriorDelegation(PriorDelegation: Record "Document Approval Delegation")
    var
        UserSetup: Record "User Setup";
        OpenDelegations: array[100, 5] of Code[50];
        i: Integer;
        DelegationsRec: Record "Document Approval Delegation";
        z: Integer;
    begin

        GetCurrentDelegation(PriorDelegation, OpenDelegations, i);

        UserSetup.Reset;
        UserSetup.SetRange("Approver ID", OpenDelegations[i] [2]);
        UserSetup.SetFilter("Relieved Approver", '=%1', OpenDelegations[i] [1]);
        if UserSetup.Find('-') then begin
            repeat
                UserSetup."Approver ID" := PriorDelegation."Current Approver ID";
                UserSetup.Modify;
            until
            UserSetup.Next = 0;
        end;


        //Close all Open delgations related
        for z := 1 to i do begin
            if DelegationsRec.Get(OpenDelegations[z] [4]) then begin
                DelegationsRec.Status := DelegationsRec.Status::Expired;
                DelegationsRec.Modify;
            end;
        end;
        //
    end;


    procedure GetCurrentDelegation(CurrentDelegation: Record "Document Approval Delegation"; var Approvers: array[100, 5] of Code[50]; var i: Integer)
    var
        DelegationEntries: Record "Delegation Entries";
        DelegationEntries2: Record "Delegation Entries";
    begin
        i := 0;
        DelegationEntries.Reset;
        DelegationEntries.CalcFields(Status);
        DelegationEntries.SetRange(Status, DelegationEntries.Status::Processed);
        DelegationEntries.SetRange("Entry Type", DelegationEntries."entry type"::Delegation);
        if DelegationEntries.Find('-') then
            repeat
                DelegationEntries2.Reset;
                DelegationEntries2.CalcFields(Status);
                DelegationEntries2.SetRange(Status, DelegationEntries2.Status::Processed);
                DelegationEntries2.SetRange("Entry Type", DelegationEntries2."entry type"::Delegation);
                DelegationEntries2.SetFilter("Current Approver ID", '%1|%2', DelegationEntries."New Approver ID",
                                             DelegationEntries."Alternate Approver ID");
                if DelegationEntries2.Find('-') then begin
                    i := i + 1;
                    Approvers[i] [1] := DelegationEntries2."Current Approver ID";
                    Approvers[i] [2] := DelegationEntries2."New Approver ID";
                    Approvers[i] [3] := DelegationEntries2."Alternate Approver ID";
                    Approvers[i] [4] := DelegationEntries2."Delegation No";
                end;
            until
             DelegationEntries.Next = 0;
    end;


    /// <summary>
    /// getProjectApprovals.
    /// </summary>
    /// <param name="User ID">Code[50].</param>
    procedure getProjectApprovals("User ID": Code[50]; "Document No.": Code[20])
    var
        Entries: Record "Delegation Entries";
        SEntries: Record "Delegation Entries";
        ProjectApprovalSetup: Record "Project Approval Setup Matrix";
        Jobs: Record Job;
    begin
        ProjectApprovalSetup.Reset();
        ProjectApprovalSetup.SetRange("Approver ID", "User ID");
        if ProjectApprovalSetup.FindSet() then begin
            repeat
                Entries.Init();
                SEntries.Reset();
                if SEntries.FindLast() then
                    Entries."Entry No" := SEntries."Entry No" + 1;
                Entries."Delegation No" := "Document No.";
                if Jobs.Get(ProjectApprovalSetup."Project ID") then
                    Entries.Description := Jobs.Description;
                Entries."Workflow User Group" := ProjectApprovalSetup."Project ID";
                Entries.Sequence := ProjectApprovalSetup."Sequence No.";
                Entries.Status := Entries.Status::Open;
                Entries."Current Approver ID" := "User ID";
                Entries."Project Workflow" := true;
                SEntries.Reset();
                SEntries.SetRange("Workflow User Group", Entries."Workflow User Group");
                SEntries.SetRange("Delegation No", Entries."Delegation No");
                if not SEntries.FindFirst() then
                    Entries.Insert();
            until ProjectApprovalSetup.next() = 0;
        end;
    end;

    Procedure DelegateWorkflows("User ID": Code[50]; "Document No.": Code[20])
    var
        Entries: Record "Delegation Entries";
        WorkflowUserGroupMember: Record "Workflow User Group Member";
    begin
        Entries.Reset();
        Entries.SetRange("Delegation No", "Document No.");
        Entries.SetFilter("New Approver ID", '<>%1', '');
        Entries.SetRange("Project Workflow", false);
        // Entries.SetRange("isGroup Member",false);
        if Entries.FindSet() then begin
            repeat
                WorkflowUserGroupMember.Reset();
                WorkflowUserGroupMember.SetRange("User Name", Entries."Current Approver ID");
                WorkflowUserGroupMember.SetRange("Workflow User Group Code", Entries."Workflow User Group");
                if WorkflowUserGroupMember.FindFirst() then begin
                    if Entries."isGroup Member" and not InSameSequence(Entries) then begin
                        Error(StrSubstNo('You cannot delegate to %1 for workflow %2 as they are already in the workflow and might affect reporting. Please contact ICT for assistance', Entries."New Approver ID", Entries."Workflow User Group"));
                    end;// else begin
                    if Entries."isGroup Member" and InSameSequence(Entries) then begin
                        WorkflowUserGroupMember.Delete();
                        Entries."Same Sequence" := true;
                        Entries.Status := Entries.Status::Processed;
                        Entries.Modify();
                    end;

                    if not Entries."isGroup Member" then begin
                        WorkflowUserGroupMember.Rename(WorkflowUserGroupMember."Workflow User Group Code", Entries."New Approver ID");
                        WorkflowUserGroupMember.Delegation := true;
                        // end;
                        if WorkflowUserGroupMember.Modify() then begin
                            Entries.Status := Entries.Status::Processed;
                            Entries.Modify();
                        end;
                    end;
                end;
            until Entries.Next() = 0;
        end;
    end;

    /// <summary>
    /// CheckifInSameSequence.
    /// </summary>
    /// <param name="Entries">Record "Delegation Entries".</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure InSameSequence(Entries: Record "Delegation Entries"): Boolean
    var
        CurrentApproverSequence: Integer;
        NewApproverSequence: Integer;
        WorkflowUserGroupMember: Record "Workflow User Group Member";
    begin
        CurrentApproverSequence := 0;
        NewApproverSequence := 0;
        WorkflowUserGroupMember.Reset();
        WorkflowUserGroupMember.SetRange("Workflow User Group Code", Entries."Workflow User Group");
        WorkflowUserGroupMember.SetRange("User Name", Entries."Current Approver ID");
        if WorkflowUserGroupMember.FindFirst() then
            CurrentApproverSequence := WorkflowUserGroupMember."Sequence No.";
        WorkflowUserGroupMember.Reset();
        WorkflowUserGroupMember.SetRange("Workflow User Group Code", Entries."Workflow User Group");
        WorkflowUserGroupMember.SetRange("User Name", Entries."New Approver ID");
        if WorkflowUserGroupMember.FindFirst() then
            NewApproverSequence := WorkflowUserGroupMember."Sequence No.";
        if CurrentApproverSequence <> 0 then
            if CurrentApproverSequence = NewApproverSequence then
                exit(true)
            else
                exit(false);
    end;

    procedure DelegateProjectWorkflows("User ID": Code[50]; "Document No.": Code[20])
    var
        ProjectApprovalSetupMatrice: Record "Project Approval Setup Matrix";
        Entries: Record "Delegation Entries";
    begin
        Entries.Reset();
        Entries.SetRange("Delegation No", "Document No.");
        Entries.SetFilter("New Approver ID", '<>%1', '');
        Entries.SetRange("Project Workflow", true);
        if Entries.FindSet() then begin
            repeat
                ProjectApprovalSetupMatrice.Reset();
                ProjectApprovalSetupMatrice.SetRange("Approver ID", Entries."Current Approver ID");
                ProjectApprovalSetupMatrice.SetRange("Project ID", Entries."Workflow User Group");
                if ProjectApprovalSetupMatrice.FindFirst() then begin
                    ProjectApprovalSetupMatrice."Approver ID" := Entries."New Approver ID";
                    ProjectApprovalSetupMatrice.Delegation := true;
                    if ProjectApprovalSetupMatrice.Modify() then begin
                        Entries.Status := Entries.Status::Processed;
                        Entries.Modify();
                    end;
                end;
            until Entries.Next() = 0;
        end;
    end;

    procedure ResumeWorkflows("User ID": Code[50]; "Document No.": Code[20])
    var
        WorkflowUserGroupMember: Record "Workflow User Group Member";
        WorkflowUserGroupMember1: Record "Workflow User Group Member";
        Entries: Record "Delegation Entries";
    begin
        Entries.Reset();
        Entries.SetRange("Delegation No", "Document No.");
        Entries.SetFilter("New Approver ID", '<>%1', '');
        Entries.SetRange("Project Workflow", false);
        if Entries.FindSet() then begin
            repeat
                WorkflowUserGroupMember.Reset();
                WorkflowUserGroupMember.SetRange("User Name", Entries."New Approver ID");
                WorkflowUserGroupMember.SetRange(Delegation, true);
                WorkflowUserGroupMember.SetRange("Workflow User Group Code", Entries."Workflow User Group");
                if WorkflowUserGroupMember.FindFirst() then begin
                    WorkflowUserGroupMember.Rename(WorkflowUserGroupMember."Workflow User Group Code", Entries."Current Approver ID");
                    WorkflowUserGroupMember.Delegation := false;
                    if WorkflowUserGroupMember.Modify() then begin
                        Entries.Status := Entries.Status::Expired;
                        Entries.Modify();
                    end;
                end;
                if Entries."Same Sequence" then begin
                    WorkflowUserGroupMember1.Init();
                    WorkflowUserGroupMember1."Workflow User Group Code" := Entries."Workflow User Group";
                    WorkflowUserGroupMember1."User Name" := Entries."Current Approver ID";
                    WorkflowUserGroupMember1."Sequence No." := Entries.Sequence;
                    if not WorkflowUserGroupMember1.get(Entries."Workflow User Group", Entries."Current Approver ID") then
                        WorkflowUserGroupMember1.Insert();
                end;
            until Entries.Next() = 0;
        end;
    end;

    procedure ResumeProjectWorkflows("User ID": Code[50]; "Document No.": Code[20])
    var
        ProjectApprovalSetupMatrice: Record "Project Approval Setup Matrix";
        Entries: Record "Delegation Entries";
    begin
        Entries.Reset();
        Entries.SetRange("Delegation No", "Document No.");
        Entries.SetFilter("New Approver ID", '<>%1', '');
        Entries.SetRange(Status, Entries.Status::Processed);
        Entries.SetRange("isGroup Member", false);
        Entries.SetRange("Project Workflow", true);
        if Entries.FindSet() then begin
            repeat
                ProjectApprovalSetupMatrice.Reset();
                ProjectApprovalSetupMatrice.SetRange("Approver ID", Entries."New Approver ID");
                ProjectApprovalSetupMatrice.SetRange(Delegation, true);
                ProjectApprovalSetupMatrice.SetRange("Project ID", Entries."Workflow User Group");
                if ProjectApprovalSetupMatrice.FindFirst() then begin
                    ProjectApprovalSetupMatrice."Approver ID" := Entries."Current Approver ID";
                    ProjectApprovalSetupMatrice.Delegation := false;
                    if ProjectApprovalSetupMatrice.Modify() then begin
                        Entries.Status := Entries.Status::Expired;
                        Entries.Modify();
                    end;
                end;
            until Entries.Next() = 0;
        end;
    end;

}

