#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69088 "Director List"
{
    ApplicationArea = Basic;
    Caption = 'Directors';
    CardPageID = "Director Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = Vendor;
    SourceTableView = where("Vendor Type" = const(Director));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(vo; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Co&mments")
            {
                ApplicationArea = Basic;
                Caption = 'Co&mments';
                Image = ViewComments;
                RunObject = Page "Human Resource Comment Sheet";
                RunPageLink = "Table Name" = const(Employee),
                              "No." = field("No.");
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                // RunObject = Page "Default Dimensions";
                // RunPageLink = "Table ID"=const(5200),
                //               "No."=field("No.");
                ShortCutKey = 'Shift+Ctrl+D';
            }
            action("&Picture")
            {
                ApplicationArea = Basic;
                Caption = '&Picture';
                Image = Picture;
                RunObject = Page "Employee Picture";
                RunPageLink = "No." = field("No.");
            }
            action("&Alternative Addresses")
            {
                ApplicationArea = Basic;
                Caption = '&Alternative Addresses';
                Image = Addresses;
                RunObject = Page "Alternative Address List";
                RunPageLink = "Employee No." = field("No.");
            }
            action("&Relatives")
            {
                ApplicationArea = Basic;
                Caption = '&Relatives';
                Image = Relatives;
                RunObject = Page "Employee Relatives";
                RunPageLink = "Employee No." = field("No.");
            }
            action("Mi&sc. Article Information")
            {
                ApplicationArea = Basic;
                Caption = 'Mi&sc. Article Information';
                Image = Filed;
                RunObject = Page "Misc. Article Information";
                RunPageLink = "Employee No." = field("No.");
            }
            action("&Confidential Information")
            {
                ApplicationArea = Basic;
                Caption = '&Confidential Information';
                Image = Lock;
                RunObject = Page "Confidential Information";
                RunPageLink = "Employee No." = field("No.");
            }
            action("Q&ualifications")
            {
                ApplicationArea = Basic;
                Caption = 'Q&ualifications';
                Image = Certificate;
                RunObject = Page "Employee Qualifications";
                RunPageLink = "Employee No." = field("No.");
            }
            action("A&bsences")
            {
                ApplicationArea = Basic;
                Caption = 'A&bsences';
                Image = Absence;
                RunObject = Page "Employee Absences";
                RunPageLink = "Employee No." = field("No.");
            }
            separator(Action1000000013)
            {
            }
            action("Absences by Ca&tegories")
            {
                ApplicationArea = Basic;
                Caption = 'Absences by Ca&tegories';
                Image = AbsenceCategory;
                RunObject = Page "Empl. Absences by Categories";
                RunPageLink = "No." = field("No."),
                              "Employee No. Filter" = field("No.");
            }
            action("Misc. Articles &Overview")
            {
                ApplicationArea = Basic;
                Caption = 'Misc. Articles &Overview';
                Image = FiledOverview;
                RunObject = Page "Misc. Articles Overview";
            }
            action("Co&nfidential Info. Overview")
            {
                ApplicationArea = Basic;
                Caption = 'Co&nfidential Info. Overview';
                Image = ConfidentialOverview;
                RunObject = Page "Confidential Info. Overview";
            }
            separator(Action1000000009)
            {
            }
            action("Online Map")
            {
                ApplicationArea = Basic;
                Caption = 'Online Map';
                Image = Map;

                trigger OnAction()
                begin
                    Rec.DisplayMap;
                end;
            }
            group("&Purchases")
            {
                Caption = '&Purchases';
                Image = Purchasing;
            }
            action("Assign Default Earn/Ded")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Default Earn/Ded';
                Ellipsis = true;
                Image = Default;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                end;
            }
            action("Assign Earnings")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Earnings';
                Ellipsis = true;
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Director Ledger Entries";
                RunPageLink = "Director No" = field("No."),
                              Type = const(Payment),
                              Closed = const(false);
                Visible = false;

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                end;
            }
            action("Assign Deductions")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Deductions';
                Ellipsis = true;
                Image = Cost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Director Ledger Entries";
                RunPageLink = "Director No" = field("No."),
                              Type = const(Deduction),
                              Closed = const(false);
                Visible = false;

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    //IM.GenerateAcquisitionJournal(Rec);
                end;
            }
            separator(Action1000000002)
            {
            }
            action("&Run Director Payroll")
            {
                ApplicationArea = Basic;
                Caption = '&Run Director Payroll';
                Ellipsis = true;
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    // //IM.GenerateRedemptionJournal(Rec);
                    //
                    Payperiod.Reset;
                    Payperiod.SetRange(Payperiod.Closed, false);
                    if Payperiod.Find('-') then
                        CurrentMonth := Payperiod."Starting Date";
                    //DirectorRec.SETRANGE("No.","No.");
                    DirectorRec.SetRange("Pay Period Filter", CurrentMonth);
                    Report.Run(89032, true, false, DirectorRec);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetSocialListeningFactboxVisibility
    end;

    var
        CalendarMgmt: Codeunit "Calendar Management";
        PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
        CustomizedCalEntry: Record "Customized Calendar Entry";
        CustomizedCalendar: Record "Customized Calendar Change";
        [InDataSet]
        MapPointVisible: Boolean;
        [InDataSet]
        ContactEditable: Boolean;
        [InDataSet]
        SocialListeningSetupVisible: Boolean;
        [InDataSet]
        SocialListeningVisible: Boolean;
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        Payperiod: Record "Payroll PeriodX";
        DirectorRec: Record Vendor;
        CurrentMonth: Date;


    procedure GetSelectionFilter(): Text
    var
        Vend: Record Vendor;
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SetSelectionFilter(Vend);
        exit(SelectionFilterManagement.GetSelectionFilterForVendor(Vend));
    end;


    procedure SetSelection(var Vend: Record Vendor)
    begin
        CurrPage.SetSelectionFilter(Vend);
    end;

    local procedure SetSocialListeningFactboxVisibility()
    var
    //   SocialListeningMgt: Codeunit "Social Listening Management";
    begin
        //  SocialListeningMgt.GetVendFactboxVisibility(Rec,SocialListeningSetupVisible,SocialListeningVisible);
    end;
}

#pragma implicitwith restore

