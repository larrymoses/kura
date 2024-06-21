#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69326 "Applicant Reg Request Card"
{
    Caption = 'Applicant Registration Request Card';
    DeleteAllowed = false;
    PageType = ListPlus;
    PromotedActionCategories = 'New,Process,Report,Navigate';
    SourceTable = Contact;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    ApplicationArea = All;
                    Importance = Standard;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    Visible = NoFieldVisible;

                    trigger OnAssistEdit()
                    begin
                        if AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                    AssistEdit = true;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the name of the contact. If the contact is a person, you can click the field to see the Name Details window.';

                    trigger OnAssistEdit()
                    var
                        Contact: Record Contact;
                    begin
                        if "No." = '' then begin
                            Insert(true);
                            Commit;
                        end;
                        Contact := Rec;
                        Contact.SetRecfilter;
                        if Contact.Type = Contact.Type::Person then begin
                            Clear(NameDetails);
                            NameDetails.SetTableview(Contact);
                            NameDetails.SetRecord(Contact);
                            NameDetails.RunModal;
                        end else begin
                            Clear(CompanyDetails);
                            CompanyDetails.SetTableview(Contact);
                            CompanyDetails.SetRecord(Contact);
                            CompanyDetails.RunModal;
                        end;
                        Rec := Contact;
                        CurrPage.Update(false);
                    end;
                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; "E-Mail")
                {
                    ApplicationArea = Basic, Suite;
                    ExtendedDatatype = EMail;
                    Importance = Promoted;
                    ToolTip = 'Specifies the email address of the contact.';
                }
            }
        }
        area(factboxes)
        {
            part(Control41; "Contact Picture")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("No.");
                Visible = not IsOfficeAddin;
            }
            part(Control31; "Contact Statistics FactBox")
            {
                ApplicationArea = RelationshipMgmt;
                SubPageLink = "No." = field("No."),
                              "Date Filter" = field("Date Filter");
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("C&ontact")
            {
                Caption = 'C&ontact';
                Image = ContactPerson;
                group("Comp&any")
                {
                    Caption = 'Comp&any';
                    Enabled = CompanyGroupEnabled;
                    Image = Company;
                    action("Notify Applicant")
                    {
                        ApplicationArea = Basic;
                        Image = Email;
                        Promoted = true;

                        trigger OnAction()
                        begin
                            //  ShortlistingCriteria.FnSendEmaiNotificationOnApplicantRegRequest(Rec);
                            ///  ShortlistingCriteria.FnSendEmaiNotificationOnApplicantRegRequestAcknowledge(Rec)
                        end;
                    }
                    action("Business Relations")
                    {
                        ApplicationArea = RelationshipMgmt;
                        Caption = 'Business Relations';
                        Image = BusinessRelation;
                        ToolTip = 'View or edit the contact''s business relations, such as customers, vendors, banks, lawyers, consultants, competitors, and so on.';

                        trigger OnAction()
                        var
                            ContactBusinessRelationRec: Record "Contact Business Relation";
                        begin
                            TestField(Type, Type::Company);
                            ContactBusinessRelationRec.SetRange("Contact No.", "Company No.");
                            Page.Run(Page::"Contact Business Relations", ContactBusinessRelationRec);
                        end;
                    }
                    action("Industry Groups")
                    {
                        ApplicationArea = RelationshipMgmt;
                        Caption = 'Industry Groups';
                        Image = IndustryGroups;
                        ToolTip = 'View or edit the industry groups, such as Retail or Automobile, that the contact belongs to.';

                        trigger OnAction()
                        var
                            ContactIndustryGroupRec: Record "Contact Industry Group";
                        begin
                            TestField(Type, Type::Company);
                            ContactIndustryGroupRec.SetRange("Contact No.", "Company No.");
                            Page.Run(Page::"Contact Industry Groups", ContactIndustryGroupRec);
                        end;
                    }
                    action("Web Sources")
                    {
                        ApplicationArea = RelationshipMgmt;
                        Caption = 'Web Sources';
                        Image = Web;
                        ToolTip = 'View a list of the web sites with information about the contact.';

                        trigger OnAction()
                        var
                            ContactWebSourceRec: Record "Contact Web Source";
                        begin
                            TestField(Type, Type::Company);
                            ContactWebSourceRec.SetRange("Contact No.", "Company No.");
                            Page.Run(Page::"Contact Web Sources", ContactWebSourceRec);
                        end;
                    }
                }
                group("P&erson")
                {
                    Caption = 'P&erson';
                    Enabled = PersonGroupEnabled;
                    Image = User;
                    action("Job Responsibilities")
                    {
                        ApplicationArea = RelationshipMgmt;
                        Caption = 'Job Responsibilities';
                        Image = Job;
                        ToolTip = 'View or edit the contact''s job responsibilities.';

                        trigger OnAction()
                        var
                            ContJobResp: Record "Contact Job Responsibility";
                        begin
                            TestField(Type, Type::Person);
                            ContJobResp.SetRange("Contact No.", "No.");
                            Page.RunModal(Page::"Contact Job Responsibilities", ContJobResp);
                        end;
                    }
                }
                action("Pro&files")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Pro&files';
                    Image = Answers;
                    ToolTip = 'Open the Profile Questionnaires window.';

                    trigger OnAction()
                    var
                        ProfileManagement: Codeunit ProfileManagement;
                    begin
                        ProfileManagement.ShowContactQuestionnaireCard(Rec, '', 0);
                    end;
                }
                action("&Picture")
                {
                    ApplicationArea = Suite, RelationshipMgmt;
                    Caption = '&Picture';
                    Image = Picture;
                    RunObject = Page "Contact Picture";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'View or add a picture of the contact person or, for example, the company''s logo.';
                    Visible = ActionVisible;
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Rlshp. Mgt. Comment Sheet";
                    RunPageLink = "Table Name" = const(Contact),
                                  "No." = field("No."),
                                  "Sub No." = const(0);
                    ToolTip = 'View or add comments for the record.';
                }
                group("Alternati&ve Address")
                {
                    Caption = 'Alternati&ve Address';
                    Image = Addresses;
                    action(Card)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Card';
                        Image = EditLines;
                        RunObject = Page "Contact Alt. Address List";
                        RunPageLink = "Contact No." = field("No.");
                        ToolTip = 'View or change detailed information about the contact.';
                    }
                    action("Date Ranges")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Date Ranges';
                        Image = DateRange;
                        RunObject = Page "Contact Alt. Addr. Date Ranges";
                        RunPageLink = "Contact No." = field("No.");
                        ToolTip = 'Specify date ranges that apply to the contact''s alternate address.';
                    }
                }
            }
            group(ActionGroupCRM)
            {
                Caption = 'Dynamics 365 for Sales';
                Enabled = (Type <> Type::Company) and ("Company No." <> '');
                Visible = CRMIntegrationEnabled;
                action(CRMGotoContact)
                {
                    ApplicationArea = Suite;
                    Caption = 'Contact';
                    Image = CoupledContactPerson;
                    ToolTip = 'Open the coupled Dynamics 365 for Sales contact.';

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowCRMEntityFromRecordID(RecordId);
                    end;
                }
                action(CRMSynchronizeNow)
                {
                    AccessByPermission = TableData "CRM Integration Record" = IM;
                    ApplicationArea = Suite;
                    Caption = 'Synchronize';
                    Image = Refresh;
                    ToolTip = 'Send or get updated data to or from Dynamics 365 for Sales.';

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.UpdateOneNow(RecordId);
                    end;
                }
                group(Coupling)
                {
                    Caption = 'Coupling', Comment = 'Coupling is a noun';
                    Image = LinkAccount;
                    ToolTip = 'Create, change, or delete a coupling between the Business Central record and a Dynamics 365 for Sales record.';
                    action(ManageCRMCoupling)
                    {
                        AccessByPermission = TableData "CRM Integration Record" = IM;
                        ApplicationArea = Suite;
                        Caption = 'Set Up Coupling';
                        Image = LinkAccount;
                        ToolTip = 'Create or modify the coupling to a Dynamics 365 for Sales contact.';

                        trigger OnAction()
                        var
                            CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        begin
                            CRMIntegrationManagement.DefineCoupling(RecordId);
                        end;
                    }
                    action(DeleteCRMCoupling)
                    {
                        AccessByPermission = TableData "CRM Integration Record" = IM;
                        ApplicationArea = Suite;
                        Caption = 'Delete Coupling';
                        Enabled = CRMIsCoupledToRecord;
                        Image = UnLinkAccount;
                        ToolTip = 'Delete the coupling to a Dynamics 365 for Sales contact.';

                        trigger OnAction()
                        var
                            CRMCouplingManagement: Codeunit "CRM Coupling Management";
                        begin
                            CRMCouplingManagement.RemoveCoupling(RecordId);
                        end;
                    }
                }
                action(ShowLog)
                {
                    ApplicationArea = Suite;
                    Caption = 'Synchronization Log';
                    Image = Log;
                    ToolTip = 'View integration synchronization jobs for the contact table.';

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowLog(RecordId);
                    end;
                }
            }
            group("Related Information")
            {
                Caption = 'Related Information';
                Image = Users;
                action("Relate&d Contacts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Relate&d Contacts';
                    Image = Users;
                    RunObject = Page "Contact List";
                    RunPageLink = "Company No." = field("Company No.");
                    ToolTip = 'View a list of all contacts.';
                }
                action("Segmen&ts")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Segmen&ts';
                    Image = Segment;
                    RunObject = Page "Contact Segment List";
                    RunPageLink = "Contact Company No." = field("Company No."),
                                  "Contact No." = filter(<> ''),
                                  "Contact No." = field(filter("Lookup Contact No."));
                    RunPageView = sorting("Contact No.", "Segment No.");
                    ToolTip = 'View the segments that are related to the contact.';
                }
                action("Mailing &Groups")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Mailing &Groups';
                    Image = DistributionGroup;
                    RunObject = Page "Contact Mailing Groups";
                    RunPageLink = "Contact No." = field("No.");
                    ToolTip = 'View or edit the mailing groups that the contact is assigned to, for example, for sending price lists or Christmas cards.';
                }
                action("C&ustomer/Vendor/Bank Acc.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'C&ustomer/Vendor/Bank Acc.';
                    Image = ContactReference;
                    ToolTip = 'View the related customer, vendor, or bank account that is associated with the current record.';

                    trigger OnAction()
                    begin
                        ShowCustVendBank;
                    end;
                }
                action("Online Map")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Online Map';
                    Image = Map;
                    ToolTip = 'View the address on an online map.';

                    trigger OnAction()
                    begin
                        DisplayMap;
                    end;
                }
                action("Office Customer/Vendor")
                {
                    ApplicationArea = All;
                    Caption = 'Customer/Vendor';
                    Image = ContactReference;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'View the related customer, vendor, or bank account.';
                    Visible = IsOfficeAddin;

                    trigger OnAction()
                    begin
                        ShowCustVendBank;
                    end;
                }
            }
            group(Tasks)
            {
                Caption = 'Tasks';
                Image = Task;
                action("T&asks")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'T&asks';
                    Image = TaskList;
                    RunObject = Page "Task List";
                    RunPageLink = "Contact Company No." = field("Company No."),
                                  "Contact No." = field(filter("Lookup Contact No.")),
                                  "System To-do Type" = filter("Contact Attendee");
                    RunPageView = sorting("Contact Company No.", Date, "Contact No.", Closed);
                    ToolTip = 'View all marketing tasks that involve the contact person.';
                }
                action("Oppo&rtunities")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Oppo&rtunities';
                    Image = OpportunityList;
                    RunObject = Page "Opportunity List";
                    RunPageLink = "Contact Company No." = field("Company No."),
                                  "Contact No." = filter(<> ''),
                                  "Contact No." = field(filter("Lookup Contact No."));
                    RunPageView = sorting("Contact Company No.", "Contact No.");
                    ToolTip = 'View the sales opportunities that are handled by salespeople for the contact. Opportunities must involve a contact and can be linked to campaigns.';
                }
                action("Postponed &Interactions")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Postponed &Interactions';
                    Image = PostponedInteractions;
                    RunObject = Page "Postponed Interactions";
                    RunPageLink = "Contact Company No." = field("Company No."),
                                  "Contact No." = filter(<> ''),
                                  "Contact No." = field(filter("Lookup Contact No."));
                    RunPageView = sorting("Contact Company No.", Date, "Contact No.", Canceled, "Initiated By", "Attempt Failed");
                    ToolTip = 'View postponed interactions for the contact.';
                    Visible = ActionVisible;
                }
            }
            group(Documents)
            {
                Caption = 'Documents';
                Image = Documents;
                action(SalesQuotes)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales &Quotes';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Sales Quotes";
                    RunPageLink = "Sell-to Contact No." = field("No.");
                    RunPageView = sorting("Document Type", "Sell-to Contact No.");
                    ToolTip = 'View sales quotes that exist for the contact.';
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Interaction Log E&ntries")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Interaction Log E&ntries';
                    Image = InteractionLog;
                    RunObject = Page "Interaction Log Entries";
                    RunPageLink = "Contact Company No." = field("Company No."),
                                  "Contact No." = filter(<> ''),
                                  "Contact No." = field(filter("Lookup Contact No."));
                    RunPageView = sorting("Contact Company No.", Date, "Contact No.", Canceled, "Initiated By", "Attempt Failed");
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View a list of the interactions that you have logged, for example, when you create an interaction, print a cover sheet, a sales order, and so on.';
                }
                action(Statistics)
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Contact Statistics";
                    RunPageLink = "No." = field("No.");
                    ShortCutKey = 'F7';
                    ToolTip = 'View statistical information, such as the value of posted entries, for the record.';
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Launch &Web Source")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Launch &Web Source';
                    Image = LaunchWeb;
                    ToolTip = 'Search for information about the contact online.';
                    Visible = ActionVisible;

                    trigger OnAction()
                    var
                        ContactWebSource: Record "Contact Web Source";
                    begin
                        ContactWebSource.SetRange("Contact No.", "Company No.");
                        if Page.RunModal(Page::"Web Source Launch", ContactWebSource) = Action::LookupOK then
                            ContactWebSource.Launch;
                    end;
                }
                action("Print Cover &Sheet")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Print Cover &Sheet';
                    Image = PrintCover;
                    ToolTip = 'View cover sheets to send to your contact.';

                    trigger OnAction()
                    var
                        Cont: Record Contact;
                    begin
                        Cont := Rec;
                        Cont.SetRecfilter;
                        Report.Run(Report::"Contact - Cover Sheet", true, false, Cont);
                    end;
                }
                group("Create as")
                {
                    Caption = 'Create as';
                    Image = CustomerContact;
                    action(CreateCustomer)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Customer';
                        Image = Customer;
                        ToolTip = 'Create the contact as a customer.';
                        Visible = false;

                        trigger OnAction()
                        begin
                            CreateCustomer(ChooseCustomerTemplate);
                        end;
                    }
                    action(CreateVendor)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Vendor';
                        Image = Vendor;
                        ToolTip = 'Create the contact as a vendor.';
                        Visible = false;

                        trigger OnAction()
                        begin
                            CreateVendor;
                        end;
                    }
                    action(CreateBank)
                    {
                        AccessByPermission = TableData "Bank Account" = R;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Bank';
                        Image = Bank;
                        ToolTip = 'Create the contact as a bank.';
                        Visible = false;

                        trigger OnAction()
                        begin
                            CreateBankAccount;
                        end;
                    }
                    action(CreateApplicant)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Applicant';
                        Image = Customer;
                        ToolTip = 'Create the contact as a Applicant.';

                        trigger OnAction()
                        begin
                            CreateApplicant;
                        end;
                    }
                }
                group("Link with existing")
                {
                    Caption = 'Link with existing';
                    Image = Links;
                    Visible = ActionVisible;
                    action(Customer)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Customer';
                        Image = Customer;
                        ToolTip = 'Link the contact to an existing customer.';

                        trigger OnAction()
                        begin
                            CreateCustomerLink;
                        end;
                    }
                    action(Vendor)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Vendor';
                        Image = Vendor;
                        ToolTip = 'Link the contact to an existing vendor.';

                        trigger OnAction()
                        begin
                            CreateVendorLink;
                        end;
                    }
                    action(Bank)
                    {
                        AccessByPermission = TableData "Bank Account" = R;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Bank';
                        Image = Bank;
                        ToolTip = 'Link the contact to an existing bank.';

                        trigger OnAction()
                        begin
                            CreateBankAccountLink;
                        end;
                    }
                }
                action("Apply Template")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Apply Template';
                    Ellipsis = true;
                    Image = ApplyTemplate;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Select a defined template to quickly create a new record.';

                    trigger OnAction()
                    var
                        ConfigTemplateMgt: Codeunit "Config. Template Management";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        ConfigTemplateMgt.UpdateFromTemplateSelection(RecRef);
                    end;
                }
                action(MergeDuplicate)
                {
                    AccessByPermission = TableData "Merge Duplicates Buffer" = RIMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Merge With';
                    Ellipsis = true;
                    Image = ItemSubstitution;
                    ToolTip = 'Merge two contact records into one. Before merging, review which field values you want to keep or override. The merge action cannot be undone.';

                    trigger OnAction()
                    var
                        TempMergeDuplicatesBuffer: Record "Merge Duplicates Buffer" temporary;
                    begin
                        TempMergeDuplicatesBuffer.Show(Database::Contact, "No.");
                    end;
                }
                action(CreateAsCustomer)
                {
                    ApplicationArea = All;
                    Caption = 'Create as Customer';
                    Image = Customer;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Create a new customer based on this contact.';
                    Visible = IsOfficeAddin;

                    trigger OnAction()
                    begin
                        CreateCustomer(ChooseCustomerTemplate);
                    end;
                }
                action(CreateAsVendor)
                {
                    ApplicationArea = All;
                    Caption = 'Create as Vendor';
                    Image = Vendor;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Create a new vendor based on this contact.';
                    Visible = IsOfficeAddin;

                    trigger OnAction()
                    begin
                        CreateVendor;
                    end;
                }
            }
            action("Create &Interaction")
            {
                AccessByPermission = TableData Attachment = R;
                ApplicationArea = RelationshipMgmt;
                Caption = 'Create &Interaction';
                Image = CreateInteraction;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Create an interaction with a specified contact.';

                trigger OnAction()
                begin
                    CreateInteraction;
                end;
            }
            action("Create Opportunity")
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Create Opportunity';
                Image = NewOpportunity;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Opportunity Card";
                RunPageLink = "Contact No." = field("No."),
                              "Contact Company No." = field("Company No.");
                RunPageMode = Create;
                ToolTip = 'Register a sales opportunity for the contact.';
                Visible = false;
            }
        }
        area(reporting)
        {
            action(ContactCoverSheet)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Contact Cover Sheet';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                ToolTip = 'Print or save cover sheets to send to one or more of your contacts.';

                trigger OnAction()
                var
                    Contact: Record Contact;
                    ContactCoverSheetReportID: Integer;
                begin
                    Contact := Rec;
                    Contact.SetRecfilter;
                    ContactCoverSheetReportID := Report::"Contact Cover Sheet";
                    OnBeforePrintContactCoverSheet(ContactCoverSheetReportID);
                    Report.Run(ContactCoverSheetReportID, true, false, Contact);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        CRMCouplingManagement: Codeunit "CRM Coupling Management";
    begin
        if CRMIntegrationEnabled then begin
            CRMIsCoupledToRecord := CRMCouplingManagement.IsRecordCoupledToCRM(RecordId);
            if "No." <> xRec."No." then
                CRMIntegrationManagement.SendResultNotification(Rec);
        end;

        xRec := Rec;
        EnableFields;

        if Type = Type::Person then
            IntegrationFindCustomerNo
        else
            IntegrationCustomerNo := '';
    end;

    trigger OnInit()
    var
        ClientTypeManagement: Codeunit "Client Type Management";
    begin
        OrganizationalLevelCodeEnable := true;
        CompanyNameEnable := true;
        VATRegistrationNoEnable := true;
        CurrencyCodeEnable := true;
        ActionVisible := ClientTypeManagement.GetCurrentClientType = Clienttype::Windows;
        "Portal Request" := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        Contact: Record Contact;
    begin
        "Portal Request" := true;
        "Applicant Type" := "applicant type"::"E-Recruitment";

        if GetFilter("Company No.") <> '' then begin
            "Company No." := GetRangemax("Company No.");
            Type := Type::Person;
            Contact.Get("Company No.");
            InheritCompanyToPersonData(Contact);
        end;
    end;

    trigger OnOpenPage()
    var
        OfficeManagement: Codeunit "Office Management";
    begin
        "Portal Request" := true;
        IsOfficeAddin := OfficeManagement.IsAvailable;
        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
        SetNoFieldVisible;
        SetParentalConsentReceivedEnable;
        "Applicant Type" := "applicant type"::"E-Recruitment";
    end;

    var
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
        CompanyDetails: Page "Company Details";
        NameDetails: Page "Name Details";
        IntegrationCustomerNo: Code[20];
        [InDataSet]
        CurrencyCodeEnable: Boolean;
        [InDataSet]
        VATRegistrationNoEnable: Boolean;
        [InDataSet]
        CompanyNameEnable: Boolean;
        [InDataSet]
        OrganizationalLevelCodeEnable: Boolean;
        CompanyGroupEnabled: Boolean;
        PersonGroupEnabled: Boolean;
        CRMIntegrationEnabled: Boolean;
        CRMIsCoupledToRecord: Boolean;
        IsOfficeAddin: Boolean;
        ActionVisible: Boolean;
        ShowMapLbl: label 'Show Map';
        NoFieldVisible: Boolean;
        ParentalConsentReceivedEnable: Boolean;
        Procurement: Codeunit "Procurement Processing";
        ShortlistingCriteria: Codeunit "Shortlisting Criteria";

    local procedure EnableFields()
    begin
        CompanyGroupEnabled := Type = Type::Company;
        PersonGroupEnabled := Type = Type::Person;
        CurrencyCodeEnable := Type = Type::Company;
        VATRegistrationNoEnable := Type = Type::Company;
        CompanyNameEnable := Type = Type::Person;
        OrganizationalLevelCodeEnable := Type = Type::Person;
    end;

    local procedure IntegrationFindCustomerNo()
    var
        ContactBusinessRelation: Record "Contact Business Relation";
    begin
        ContactBusinessRelation.SetCurrentkey("Link to Table", "Contact No.");
        ContactBusinessRelation.SetRange("Link to Table", ContactBusinessRelation."link to table"::Customer);
        ContactBusinessRelation.SetRange("Contact No.", "Company No.");
        if ContactBusinessRelation.FindFirst then begin
            IntegrationCustomerNo := ContactBusinessRelation."No.";
        end else
            IntegrationCustomerNo := '';
    end;

    local procedure TypeOnAfterValidate()
    begin
        EnableFields;
    end;

    local procedure SetNoFieldVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
    begin
        NoFieldVisible := DocumentNoVisibility.ContactNoIsVisible;
    end;

    local procedure SetParentalConsentReceivedEnable()
    begin
        if Minor then
            ParentalConsentReceivedEnable := true
        else begin
            "Parental Consent Received" := false;
            ParentalConsentReceivedEnable := false;
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforePrintContactCoverSheet(var ContactCoverSheetReportID: Integer)
    begin
    end;
}

