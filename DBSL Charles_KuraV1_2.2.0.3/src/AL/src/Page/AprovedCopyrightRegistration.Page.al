#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56018 "Aproved Copyright Registration"
{
    Caption = 'Copyright Application Card';
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Copyright Registration Table";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Applicant Account"; "Applicant Account")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Customer Category"; "Customer Category")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Customer Type"; "Customer Type")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Registration Date"; "Registration Date")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("P.I.N"; "P.I.N")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Company Reg No"; "Company Reg No")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("ID. No."; "ID. No.")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field(Address; Address)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Address 2"; "Address 2")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field(City; City)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field(Contact; Contact)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Post Code"; "Post Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("E-Mail"; "E-Mail")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field(Title; Title)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Customer Posting Group"; "Customer Posting Group")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Country/Region Code"; "Country/Region Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("VAT Bus. Posting Group"; "VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Captured by"; "Captured by")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group("Agent Details")
            {
                Caption = 'Agent Details';
                field("Agent First Name"; "Agent First Name")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Agent Surname"; "Agent Surname")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Agent Middle Name"; "Agent Middle Name")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Agent Address"; "Agent Address")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Agent Address 2"; "Agent Address 2")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Agent City"; "Agent City")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Agent Contact"; "Agent Contact")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Agent Phone No."; "Agent Phone No.")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Agent ID. No."; "Agent ID. No.")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Agent P.I.N"; "Agent P.I.N")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
            }
            group("Authorship Details")
            {
                Caption = 'Authorship Details';
                field("Author First Name"; "Author First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Author Surname"; "Author Surname")
                {
                    ApplicationArea = Basic;
                }
                field("Author Middle Name"; "Author Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Author Postal Address"; "Author Postal Address")
                {
                    ApplicationArea = Basic;
                }
                field("Author Physical Address"; "Author Physical Address")
                {
                    ApplicationArea = Basic;
                    Caption = 'Author Address 2';
                }
                field("Author City"; "Author City")
                {
                    ApplicationArea = Basic;
                }
                field("Author Contact"; "Author Contact")
                {
                    ApplicationArea = Basic;
                }
                field("Author Phone No."; "Author Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Author ID. No."; "Author ID. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Author P.I.N"; "Author P.I.N")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Copyright Work Details")
            {
                Caption = 'Copyright Work Details';
                field("Copyright Title"; "Copyright Title")
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Work Category"; "Copyright Work Category")
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Work SubCategory"; "Copyright Work SubCategory")
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Category Description"; "Copyright Category Description")
                {
                    ApplicationArea = Basic;
                }
                field("Copyright SubCategory Desc"; "Copyright SubCategory Desc")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Fixation/Reduction"; "Date of Fixation/Reduction")
                {
                    ApplicationArea = Basic;
                }
                field(Language; Language)
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Works Abstract"; ObjText)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        CalcFields("Copyright Work Abstract");
                        "Copyright Work Abstract".CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);

                        if ObjText <> Format(Obj) then begin
                            Clear("Copyright Work Abstract");
                            Clear(Obj);
                            Obj.AddText(ObjText);
                            "Copyright Work Abstract".CreateOutstream(ObjOutStr);
                            Obj.Write(ObjOutStr);
                            //MODIFY;
                        end;
                    end;
                }
            }
            group("Production Details")
            {
                Caption = 'Production Details';
                field("Prod/Pub Name"; "Prod/Pub Name")
                {
                    ApplicationArea = Basic;
                }
                field("Prod/Pub ID No/Company Reg No"; "Prod/Pub ID No/Company Reg No")
                {
                    ApplicationArea = Basic;
                }
                field("Prod/Pub P.I.N"; "Prod/Pub P.I.N")
                {
                    ApplicationArea = Basic;
                }
                field("Assignment/License Date"; "Assignment/License Date")
                {
                    ApplicationArea = Basic;
                }
                field("1st Country of Production"; "1st Country of Production")
                {
                    ApplicationArea = Basic;
                }
                field(ISBN; ISBN)
                {
                    ApplicationArea = Basic;
                }
                field("Production Category"; "Production Category")
                {
                    ApplicationArea = Basic;
                }
                field("Prod/Pub Phone No."; "Prod/Pub Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Prod/Pub Email"; "Prod/Pub Email")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Payments)
            {
                Caption = 'Payments';
                field("Payement Reference No"; "Payemnt Reference No")
                {
                    ApplicationArea = Basic;
                }
                field("Receipt No"; "Receipt No")
                {
                    ApplicationArea = Basic;
                }
                field("Receipt Amount"; "Receipt Amount")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000021; Notes)
            {
            }
            systempart(Control1000000022; MyNotes)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Function")
            {
                Caption = 'Function';
                separator(Action7)
                {
                    Caption = '       -';
                }
                action("Submit Works")
                {
                    ApplicationArea = Basic;
                    Caption = 'Submit Works';
                    Image = Customer;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin

                        TestField(Invoiced, true);
                        TestField(Submitted, false);
                        //ERROR(Text005);

                        if Status <> Status::Approved then
                            Error(Text008);

                        if Confirm(Text009, false) = true then begin

                            GenSetUp.Get;
                            Scheme.Get;
                            //create a list of registered works
                            Service.Address := Address;
                            Service."Address 2" := "Address 2";
                            Service."Agent City" := "Agent City";
                            Service."Agent Contact" := "Agent Contact";
                            Service."Agent Contact" := "Agent Contact";
                            Service."Agent First Name" := "Agent First Name";
                            Service."Agent ID. No." := "Agent ID. No.";
                            Service."Agent Middle Name" := "Agent Middle Name";
                            Service."Agent P.I.N" := "Agent P.I.N";
                            Service."Author Phone No." := "Author Phone No.";
                            Service."Author Address" := "Author Postal Address";
                            Service."Assignment/License Date" := "Assignment/License Date";
                            Service."Author Address 2" := "Author Physical Address";
                            Service."Agent Phone No." := "Agent Phone No.";
                            Service."Agent Surname" := "Agent Surname";
                            Service."Author Agent Surname" := "Author Surname";
                            Service."Author City" := "Author City";
                            Service."Author Contact" := "Author Contact";
                            Service."Author First Name" := "Author First Name";
                            Service."Author ID. No." := "Author ID. No.";
                            Service."Author Middle Name" := "Author Middle Name";
                            Service."Author P.I.N" := "Author P.I.N";
                            ;
                            Service."Author Phone No." := "Author Phone No.";
                            Service."Applicant Account" := "Applicant Account";
                            Service.City := City;
                            Service."Company Reg No" := "Company Reg No";
                            Service.Contact := Contact;
                            Service."Copyright Category Description" := "Copyright Category Description";
                            Service."Customer No." := "Applicant Account";
                            Service."Customer Type" := "Customer Type";
                            Service."Customer Category" := "Customer Category";
                            ;
                            Service."Copyright SubCategory Desc" := "Copyright SubCategory Desc";
                            Service."Copyright Title" := "Copyright Title";
                            Service."Copyright Work Abstract" := "Copyright Work Abstract";
                            Service."Copyright Work Category" := "Copyright Work Category";
                            Service."Copyright Work SubCategory" := "Copyright Work SubCategory";
                            Service."Date of Fixation/Reduction" := "Date of Fixation/Reduction";
                            Service."ID. No." := "ID. No.";
                            Service.Language := Language;
                            Service.Name := Name;
                            Service."Name 2" := "Name 2";
                            Service."P.I.N" := "P.I.N";
                            Service."Payemnt Reference No" := "Payemnt Reference No";
                            Service."Phone No." := "Phone No.";
                            Service."Post Code" := "Post Code";
                            Service."Prod/Pub Email" := "Prod/Pub Email";
                            Service."Prod/Pub ID No/Company Reg No" := "Prod/Pub ID No/Company Reg No";
                            Service."Prod/Pub Name" := "Prod/Pub Name";
                            Service."Prod/Pub P.I.N" := "Prod/Pub P.I.N";
                            Service."Prod/Pub Phone No." := "Prod/Pub Phone No.";
                            Service."Production Category" := "Production Category";
                            Service."Receipt Amount" := "Receipt Amount";
                            Service."Receipt No" := "Receipt No";
                            Service."Registration Date" := "Registration Date";
                            Service.Title := Title;
                            Service.Type := Type;
                            Service."Copyright?" := true;
                            Service.Description := "Copyright Title";
                            Service."Description 2" := "Copyright Title";
                            //Service."Vendor No.":="Vendor No.";
                            //Service."Vendor Name":="Vendor Name";
                            if Service.Insert(true) then begin
                                Submitted := true;
                                Modify;
                            end;



                            Cust.Reset;
                            if Cust.Get(BOSAACC) then begin
                                Cust.Validate(Cust.Name);
                                Cust.Validate(Cust."Global Dimension 1 Code");
                                Cust.Validate(Cust."Global Dimension 2 Code");
                                Cust.Modify;
                            end;


                            //End Updating Advice Buffer
                            /*
                            GenSetUp.GET();
                            SMTPMailSet.GET;
                            Notification.CreateMessage('Dynamics NAV',SMTPMailSet."Email Sender Address","E-Mail",'Member Acceptance Notification',
                                            'Member application '+ "No." + ' has been approved'
                                           + ' (Dynamics NAV ERP)',FALSE);
                            Notification.Send;
                            //Send SMS
                            */
                            //
                            /*
                            Sms:='Your Account No. '+ "No." +' has been opened successfully. CIC PENSION LTD ';
                            SendSms1.SendSms('MEMBAPP',"Phone No.",Sms);
                            */
                            SendNotMail();
                            Message(Text007);
                            Status := Status::Approved;

                            "Created By" := UserId;
                            Submitted := true;
                            Invoiced := true;
                            Modify;

                        end else
                            Error(Text008);

                    end;
                }
                action(Dimensions)
                {
                    // ApplicationArea = Basic;
                    // Caption = 'Dimensions';
                    // Image = Dimensions;
                    // RunObject = Page "Default Dimensions";
                    // RunPageLink = "No."=field("No.");
                    // ShortCutKey = 'Shift+Ctrl+D';
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print CR1")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print CR1';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);


                        SetRange("No.", "No.");
                        Report.Run(56230, true, true, Rec)
                    end;
                }
                action(Authors)
                {
                    ApplicationArea = Basic;
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Other Participants";
                    // RunPageLink = "Copyright Reg No" = field("No.");
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin

        UpdateControls();
        ClassBCategory := false;
        PrincipalMemberVisible := false;
        PrincipalVisible := false;
    end;

    trigger OnAfterGetRecord()
    begin
        /*IF Status=Status::Approved THEN
          CurrPage.EDITABLE:=FALSE;
          */
        SetControlAppearance;
        UpdateControls;

    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if Status = Status::Approved then
            CurrPage.Editable := false;

        MembAppl.Reset;
        //MembAppl.SETRANGE(MembAppl.Created,FALSE);
        MembAppl.SetRange(MembAppl.Status, MembAppl.Status::Open);
        MembAppl.SetRange(MembAppl."Captured by", UserId);
        if MembAppl.Find('-') then begin
            if MembAppl.Count > 0 then begin
                //ERROR(Text0014);   //users say they dont want limitation on the same
            end;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        //"Customer Posting Group":='MEMBER';
        //"Global Dimension 1 Code":='BOSA';
        //"Vendor Type":="Vendor Type"::Member;
        //"Pension Type":="Pension Type"::Live;
        "Registration Date" := Today;
        "Captured by" := UserId;
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        /*IF Status=Status::Approved THEN
          CurrPage.EDITABLE:=FALSE;
          */

    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
        /*
        InsertBenvVisisble:=FALSE;
        IF Status=Status::Approved THEN
          CurrPage.EDITABLE:=FALSE;
        */
        UpdateControls;

    end;

    var
        Cust: Record Customer;
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Accounts: Record Vendor;
        AcctNo: Code[20];
        Sms: Text;
        Acc: Record Vendor;
        UsersID: Record User;
        BOSAACC: Code[20];
        MembAppl: Record "Copyright Registration Table";
        InsBbfVisible: Boolean;
        i: Integer;
        PrincipalMemberVisible: Boolean;
        PrincipalVisible: Boolean;
        ClassBCategory: Boolean;
        PictureExists: Boolean;
        text001: label 'Status must be open';
        UserMgt: Codeunit "User Setup Management";
        NotificationMAIL: Codeunit Mail;
        NotificationE: Codeunit Mail;
        MailBody: Text[250];
        ccEmail: Text[1000];
        toEmail: Text[1000];
        GenSetUp: Record "Copyright Setup";
        ClearingAcctNo: Code[20];
        AdvrAcctNo: Code[20];
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batches,"Payment Voucher","Petty Cash",Requisition,Loan,Imprest,ImprestSurrender,Interbank,"Copyright registration";
        DivAcctNo: Code[20];
        NameEditable: Boolean;
        AddressEditable: Boolean;
        GlobalDim1Editable: Boolean;
        GlobalDim2Editable: Boolean;
        CustPostingGroupEdit: Boolean;
        PhoneEditable: Boolean;
        MaritalstatusEditable: Boolean;
        IDNoEditable: Boolean;
        RegistrationDateEdit: Boolean;
        OfficeBranchEditable: Boolean;
        DeptEditable: Boolean;
        SectionEditable: Boolean;
        OccupationEditable: Boolean;
        DesignationEdiatble: Boolean;
        EmployerCodeEditable: Boolean;
        DOBEditable: Boolean;
        EmailEdiatble: Boolean;
        StaffNoEditable: Boolean;
        GenderEditable: Boolean;
        MonthlyContributionEdit: Boolean;
        PostCodeEditable: Boolean;
        CityEditable: Boolean;
        WitnessEditable: Boolean;
        StatusEditable: Boolean;
        BankCodeEditable: Boolean;
        BranchCodeEditable: Boolean;
        BankAccountNoEditable: Boolean;
        VillageResidence: Boolean;
        SignatureExists: Boolean;
        ForceNo: Boolean;
        ContPhone: Boolean;
        ContRelation: Boolean;
        ContOcuppation: Boolean;
        Recruitedby: Boolean;
        PassEditable: Boolean;
        EmployerEditable: Boolean;
        CountryEditable: Boolean;
        SalesEditable: Boolean;
        text002: label 'Kindly specify the next of kin';
        AccountCategory: Boolean;
        text003: label 'You must specify Signatories for this type of membership';
        Text004: label 'You MUST specify the next of kin Benevolent';
        CustMember: Record Customer;
        "BenvNo.": Code[10];
        BankAEditable: Boolean;
        MemEditable: Boolean;
        BenvEditable: Boolean;
        BankNEditable: Boolean;
        InserFEditable: Boolean;
        FosAEditable: Boolean;
        Text005: label 'This Application has been created';
        Text006: label 'This Member ID No. Already Exist';
        Text007: label 'This Account Has Been created Successfully';
        Text008: label 'Application Not approved.Contact System Administrator';
        Text009: label 'Are you sure you want to Create Account Application?';
        Text0010: label 'All Members are created  must have a FOSA Account.Please Check General Setup.';
        Text0011: label 'Does this member have a Benevolent Fund Application?';
        Text0012: label 'Traansaction Type Must a value in Application -%1, It cannot be empty';
        InsertBenV: Boolean;
        IdentityEditable: Boolean;
        RecriutedEditable: Boolean;
        ActivicodeEditable: Boolean;
        FosaAccountEditable: Boolean;
        CustPostEditable: Boolean;
        InsertBenvVisisble: Boolean;
        Text0013: label 'Member contributions must have values';
        iEntryNo: Integer;
        Vendor: Record Vendor;
        Text0014: label 'There are still some pending Applications. Please utilise them first';
        Text0015: label 'This information is not needed for this Membership application category- %1';
        Text0016: label 'This category is eligible for BBF enrollment';
        UserSetup: Record "User Setup";
        SMTPMailSet: Record "Email Account";
        Text0017: label 'Insurance Contributions Must have a value in application No. -%1.It cannot be null.';
        Text0018: label 'Deposit Contributions Must have a value.It cannot be null';
        Text0019: label 'Either Benevolent Fund or Entrance fee must have a value in application No. -%1';
        Text0020: label 'Deposit Contributions Must have a value in application No. -%1.It cannot be null.';
        SposnorCode: Record Customer;
        Scheme: Record "Company Information";
        Service: Record "Service Item";
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        OpenApprovalEntriesExist: Boolean;
        ServiceItem: Record "Service Item";
        CompInfo: Record "Company Information";
        Text0021: label 'Copyright Works Registration';
        Text0022: label 'Your copyright work ';
        Text0023: label 'Please find attached, your copyright work certificate.';
        Text0024: label 'has been successfully processed. ';


    procedure UpdateControls()
    begin

        if Status = Status::Approved then begin

            NameEditable := false;
            AddressEditable := false;
            GlobalDim1Editable := false;
            GlobalDim2Editable := false;
            CustPostingGroupEdit := false;
            PhoneEditable := false;
            MaritalstatusEditable := false;
            IDNoEditable := false;
            PhoneEditable := false;
            RegistrationDateEdit := false;
            OfficeBranchEditable := false;
            DeptEditable := false;
            SectionEditable := false;
            OccupationEditable := false;
            DesignationEdiatble := false;
            EmployerCodeEditable := false;
            DOBEditable := false;
            EmailEdiatble := false;
            StaffNoEditable := false;
            GenderEditable := false;
            MonthlyContributionEdit := false;
            PostCodeEditable := false;
            CityEditable := false;
            WitnessEditable := false;
            BankCodeEditable := false;
            BranchCodeEditable := false;
            BankAccountNoEditable := false;
            VillageResidence := false;
            ForceNo := false;
            ContPhone := false;
            ContRelation := false;
            ContOcuppation := false;
            Recruitedby := false;
            PassEditable := false;
            EmployerEditable := false;
            CountryEditable := false;
            SalesEditable := false;
            AccountCategory := false;
            BankAEditable := false;
            MemEditable := false;
            BenvEditable := false;
            BankNEditable := false;
            InsertBenV := false;
            IdentityEditable := false;
            RecriutedEditable := false;
            ActivicodeEditable := false;
            FosaAccountEditable := false;
            CustPostEditable := false;
            PrincipalMemberVisible := false;
            PrincipalVisible := false;
            ClassBCategory := false;


        end;

        if Status = Status::Open then begin
            NameEditable := true;
            //PrincipalMemberVisible:=TRUE;
            //PrincipalVisible:=TRUE;
            //ClassBCategory:=TRUE;
            AddressEditable := true;
            GlobalDim1Editable := false;
            GlobalDim2Editable := true;
            CustPostingGroupEdit := false;
            PhoneEditable := true;
            MaritalstatusEditable := true;
            IDNoEditable := true;
            PhoneEditable := true;
            RegistrationDateEdit := true;
            OfficeBranchEditable := true;
            DeptEditable := true;
            SectionEditable := true;
            OccupationEditable := true;
            DesignationEdiatble := true;
            EmployerCodeEditable := true;
            DOBEditable := true;
            EmailEdiatble := true;
            StaffNoEditable := true;
            GenderEditable := true;
            MonthlyContributionEdit := true;
            PostCodeEditable := true;
            CityEditable := false;
            WitnessEditable := true;
            BankCodeEditable := true;
            BranchCodeEditable := true;
            BankAccountNoEditable := true;
            VillageResidence := true;
            ForceNo := true;
            ContPhone := true;
            ContRelation := true;
            ContOcuppation := true;
            Recruitedby := true;
            PassEditable := true;
            EmployerEditable := true;
            CountryEditable := true;
            SalesEditable := true;
            AccountCategory := true;
            BankAEditable := true;
            MemEditable := true;
            BenvEditable := true;
            BankNEditable := true;
            InsertBenV := true;
            IdentityEditable := true;
            RecriutedEditable := true;
            ActivicodeEditable := true;
            FosaAccountEditable := true;
            CustPostEditable := true;
        end
    end;


    procedure SendSMS()
    begin
        /*
        SMSMessages.RESET;
        IF SMSMessages.FIND('+') THEN BEGIN
        iEntryNo:=SMSMessages."Entry No";
        iEntryNo:=iEntryNo+1;
        END ELSE BEGIN
        iEntryNo:=1;
        END;
        
        SMSMessages.INIT;
        SMSMessages."Entry No":=iEntryNo;
        SMSMessages."Account No":="No.";
        SMSMessages."Date Entered":=TODAY;
        SMSMessages."Time Entered":=TIME;
        SMSMessages.Source:='Member Application';
        SMSMessages."Entered By":=USERID;
        SMSMessages."System Created Entry":=TRUE;
        SMSMessages."Document No":="No.";
        SMSMessages."Sent To Server":=SMSMessages."Sent To Server"::No;
        SMSMessages."SMS Message":='Your Account No. '+ "No." +' of type ' + "FOSA Account Type" + ' has been opened successfully. MWALIMU SACCCO';
        IF Vendor."Phone No."<> '' THEN BEGIN
        SMSMessages."Telephone No":=Vendor."Phone No.";
        END ELSE BEGIN
        SMSMessages."Telephone No":=Vendor."MPESA Mobile No";
        END;
        SMSMessages.INSERT;
        */

    end;


    procedure CheckMemberCat()
    begin

        //IF "Member Category"="Member Category"::"Class A" THEN
        //ERROR(Text0015,"Member Category");
    end;


    procedure SendNotMail()
    var
        Notification: Codeunit Mail;
        FileDirectory: Text[100];
        FileName: Text[100];
    begin

        // SMTPMailSet.Get;

        // FileDirectory := 'C:\DOCS\';
        // FileName := 'Certificate_' + UpperCase("Copyright Title") + '.pdf';
        // ServiceItem.Reset;
        // ServiceItem.SetFilter("No.", Service."No.");
        // Report.SaveAsPdf(56231, FileDirectory + FileName, Service);


        // CompInfo.Get;
        //  Notification.CreateMessage(CompInfo.Name, SMTPMailSet."Email Sender Address",
        // "E-Mail", Text0021, 'Dear ' + Name + ',<BR><BR>' +
        // ' Your copyright work ' + UpperCase("Copyright Title") + ' ' + 'has been successfully processed.<BR>' +
        // Text0023 + '<BR>' + '<BR>' + ' ', true);
        //Notification.AddBodyline(
        // '<BR><BR>Kind Regards,' +
        // '<BR><BR>For any Information, Please Contact' + '<BR>Copyright Registration and Enforcement Department<BR>' +
        // CompInfo.Name + '<BR>' +
        // CompInfo.Address + '<BR>' +
        // CompInfo."Address 2" + '<BR>' +
        // CompInfo."Phone No." + '<BR>' +
        // CompInfo.City);

        /*
        
        Notification.CreateMessage('Kenya Copyright Board ',SMTPMailSet."Email Sender Address","E-Mail",'Copyright Works',
                        'Dear '+ Name + ',<BR><BR>'+
                        ' Your copyright work ' +UPPERCASE("Copyright Title") + ' has been approved',FALSE);
        
        //Notification.AddBodyline(
        '<BR><BR>'+'Kind Regards,'+
        '<BR><BR>'+'ED Office.<BR>');
        //Notification.AddBodyline('<BR>'+Scheme.Name);
        */
        //Notification.AddAttachment(FileDirectory + FileName, FileName);
        //Notification.Send;

    end;

    local procedure SetControlAppearance()
    var
    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;
}

