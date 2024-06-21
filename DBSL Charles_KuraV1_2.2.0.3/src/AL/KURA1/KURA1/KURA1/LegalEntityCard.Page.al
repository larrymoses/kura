#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80000 "Legal Entity Card"
{
    AdditionalSearchTerms = 'change experience,suite,user interface';
    ApplicationArea = Basic, Suite;
    Caption = 'Legal Entity Card';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Application Settings,System Settings,Currencies,Codes,Regional Settings';
    SourceTable = "Company Information";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(Name; Name)
                {
                    ApplicationArea = Basic, Suite;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the company''s name and corporate form. For example, Inc. or Ltd.';
                }
                field(Address; Address)
                {
                    ApplicationArea = Basic, Suite;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the company''s address.';
                }
                field("Address 2"; "Address 2")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies additional address information.';
                }
                field(City; City)
                {
                    ApplicationArea = Basic, Suite;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the company''s city.';
                }
                field(County; County)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the state, province or county of the company''s address.';
                    Visible = CountyVisible;
                }
                field("Post Code"; "Post Code")
                {
                    ApplicationArea = Basic, Suite;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the postal code.';
                }
                field("Country/Region Code"; "Country/Region Code")
                {
                    ApplicationArea = Basic, Suite;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the country/region of the address.';
                }
                field("Contact Person"; "Contact Person")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Contact Name';
                    ToolTip = 'Specifies the name of the contact person in your company.';
                    Visible = false;
                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the company''s telephone number.';
                }
                field("VAT Registration No."; "VAT Registration No.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'KRA PIN';
                    ToolTip = 'Specifies the company''s VAT registration number.';
                }
                field(GLN; GLN)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies your company in connection with electronic document exchange.';
                }
                field("Industrial Classification"; "Industrial Classification")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the company''s industrial classification code.';
                }
                field(Picture; Picture)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the picture that has been set up for the company, such as a company logo.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord;
                    end;
                }
                field("N.S.SF. No."; "N.S.SF. No.")
                {
                    ApplicationArea = Basic;
                }
                field(RubberStamp; RubberStamp)
                {
                    ApplicationArea = Basic;
                    Caption = 'RubberStamp';
                }
                field(Vision; Vision)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(Mission; Mission)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(Motto; Motto)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Headed By"; "Headed By")
                {
                    ApplicationArea = Basic;
                }
                field("HR Document Link"; "HR Document Link")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Current Head"; "Current Head")
                {
                    ApplicationArea = Basic;
                    Caption = 'Personal Number';
                }
                field("Current Head Name"; "Current Head Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field("Phone No.2"; "Phone No.")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the company''s telephone number.';
                }
                field("Fax No."; "Fax No.")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the company''s fax number.';
                }
                field("E-Mail"; "E-Mail")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the company''s email address.';
                }
                field("Home Page"; "Home Page")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies your company''s web site.';
                }
                field("IC Partner Code"; "IC Partner Code")
                {
                    ApplicationArea = Intercompany;
                    Importance = Additional;
                    ToolTip = 'Specifies your company''s intercompany partner code.';
                }
                field("IC Inbox Type"; "IC Inbox Type")
                {
                    ApplicationArea = Intercompany;
                    Importance = Additional;
                    ToolTip = 'Specifies what type of intercompany inbox you have, either File Location or Database.';
                }
                field("IC Inbox Details"; "IC Inbox Details")
                {
                    ApplicationArea = Intercompany;
                    Importance = Additional;
                    ToolTip = 'Specifies details about the location of your intercompany inbox, which can transfer intercompany transactions into your company.';
                }
                field("Auto. Send Transactions"; "Auto. Send Transactions")
                {
                    ApplicationArea = Intercompany;
                    Importance = Additional;
                    ToolTip = 'Specifies that as soon as transactions arrive in the intercompany outbox, they will be sent to the intercompany partner.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Core Values")
            {
                ApplicationArea = Basic;
                Image = ValueLedger;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Core Values";
            }
            separator(Action11)
            {
            }
            action("Core Mandate")
            {
                ApplicationArea = Basic;
                Image = Hierarchy;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Core Mandates";
            }
            separator(Action13)
            {
            }
            action("Responsibility Centers")
            {
                ApplicationArea = Advanced;
                Caption = 'Responsibility Centers';
                Image = Position;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Responsibility Center List";
                ToolTip = 'Set up responsibility centers to administer business operations that cover multiple locations, such as a sales offices or a purchasing departments.';
            }
            separator(Action12)
            {
            }
            action("Annual Reporting Codes")
            {
                ApplicationArea = Basic;
                Image = AccountingPeriods;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Annual Reporting Codes";
            }
            separator(Action16)
            {
            }
            action("Partners & Collaborators")
            {
                ApplicationArea = Basic;
                Image = ContactPerson;
                Promoted = true;
                PromotedCategory = Category5;
                RunObject = Page "Stakeholder Groups";
            }
            separator(Action18)
            {
            }
            action("Staff Profile")
            {
                ApplicationArea = Basic;
                Image = Employee;
                Promoted = true;
                PromotedCategory = Category6;
                RunObject = Page "Employee List-P";
            }
            separator(Action23)
            {
            }
            action("Grants Profile")
            {
                ApplicationArea = Basic;
                Image = Grid;
                Promoted = true;
                PromotedCategory = Category6;
                RunObject = Page "Grant Funding Application List";
            }
            separator(Action24)
            {
            }
            action("Project profile")
            {
                ApplicationArea = Basic;
                Image = Job;
                Promoted = true;
                PromotedCategory = Category7;
                RunObject = Page "Job List";
            }
            separator(Action25)
            {
            }
            action("Research Programs")
            {
                ApplicationArea = Basic;
                Image = Planning;
                Promoted = true;
                PromotedCategory = Category7;
                RunObject = Page "Research Program List";
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        UpdateSystemIndicator;
    end;

    trigger OnClosePage()
    var
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
    begin
        if ApplicationAreaMgmtFacade.SaveExperienceTierCurrentCompany(Experience) then
            RestartSession;
    end;

    trigger OnInit()
    var
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
    begin
        SetShowMandatoryConditions;
       // IsSaaS := PermissionManager.SoftwareAsAService and not ApplicationAreaMgmtFacade.IsInvoicingOnlyEnabled;
    end;

    trigger OnOpenPage()
    var
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
    begin
        Reset;
        if not Get then begin
            Init;
            Insert;
        end;

        CountyVisible := FormatAddress.UseCounty("Country/Region Code");

        ApplicationAreaMgmtFacade.GetExperienceTierCurrentCompany(Experience);
    end;

    var
        CustomizedCalEntry: Record "Customized Calendar Entry";
        CustomizedCalendar: Record "Customized Calendar Change";
        CalendarMgmt: Codeunit "Calendar Management";
        CompanyInformationMgt: Codeunit "Company Information Mgt.";
        FormatAddress: Codeunit "Format Address";
        PermissionManager: Codeunit "Permission Manager";
        Experience: Text;
        SystemIndicatorText: Text[250];
        [InDataSet]
        SystemIndicatorTextEditable: Boolean;
        IBANMissing: Boolean;
        BankBranchNoOrAccountNoMissing: Boolean;
        IsSaaS: Boolean;
        BankAcctPostingGroup: Code[20];
        CountyVisible: Boolean;

    local procedure UpdateSystemIndicator()
    var
        IndicatorStyle: Option;
    begin
        GetSystemIndicator(SystemIndicatorText, IndicatorStyle); // IndicatorStyle is not used
        //SystemIndicatorTextEditable := CurrPage.Editable and ("System Indicator" = "system indicator"::"Custom Text");
    end;

    local procedure SystemIndicatorTextOnAfterVali()
    begin
        UpdateSystemIndicator
    end;

    local procedure SystemIndicatorOnAfterValidate()
    begin
        UpdateSystemIndicator
    end;

    local procedure SetShowMandatoryConditions()
    begin
        BankBranchNoOrAccountNoMissing := ("Bank Branch No." = '') or ("Bank Account No." = '');
        IBANMissing := Iban = ''
    end;

    local procedure RestartSession()
    var
        SessionSetting: SessionSettings;
    begin
        SessionSetting.Init;
        SessionSetting.RequestSessionUpdate(false);
    end;
}

