#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69095 "Temporary Employee Card"
{
    Caption = 'Employee Card';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Temporary Employee";

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

                    trigger OnAssistEdit()
                    begin
                        /*IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;*/ //commented by morris during upgrade

                    end;
                }
               
                 field(Initials; Initials)
                {
                    ApplicationArea = Basic;
                }
                field("First Name"; "First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name"; "Last Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name"; "Middle Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Middle Name';
                }
                field("ID Number";"ID Number")
                {
                   ApplicationArea = Basic; 
                }
                field("Job ID";"Job ID")
                {
                    ApplicationArea =Basic;
                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
                }
                 field("Job Title"; "Job Title")
                {
                    ApplicationArea = Basic;
                }
               
                field(Address; Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; "Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; "Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(City; City)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    NotBlank = true;
                }
                field("Country/Region Code"; "Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Search Name"; "Search Name")
                {
                    ApplicationArea = Basic;
                }
                field(Gender; Gender)
                {
                    ApplicationArea = Basic;
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
                field(Rank; Rank)
                {
                    ApplicationArea = Basic;
                }
                field("Employee Posting Group"; "Employee Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Urban Area";Rec."Urban Area")
                {
                  ApplicationArea = Basic;  
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Name';
                    Editable = false;
                }
                field(Balance; Balance)
                {
                    ApplicationArea = Basic;
                }
            }
            group("Payroll Details")
            {
                Caption = 'Payroll Details';
                field("Pays tax?"; "Pays tax?")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Pay Mode"; "Payroll Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("P.I.N"; "P.I.N")
                {
                    ApplicationArea = Basic;
                }
                field("N.H.I.F No"; "N.H.I.F No")
                {
                    ApplicationArea = Basic;
                }
                field("Social Security No."; "Social Security No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'N.S.S.F No.';
                }
                field("National ID Number"; "ID Number")
                {
                    ApplicationArea = Basic;
                }
                field("Taxable Allowance"; "Taxable Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("Total Allowances"; "Total Allowances")
                {
                    ApplicationArea = Basic;
                }
                field("Total Deductions"; "Total Deductions")
                {
                    ApplicationArea = Basic;
                }
                field("Total Gratuity Amount"; "Total Gratuity Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Scale"; "Salary Scale")
                {
                    ApplicationArea = Basic;
                }
                field(Present; Present)
                {
                    ApplicationArea = Basic;
                }
                field(Halt; Halt)
                {
                    ApplicationArea = Basic;
                }
                field(Previous; Previous)
                {
                    ApplicationArea = Basic;
                }
                field("Job No"; "Job No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project';
                }
                field("Job Task No"; "Job Task No")
                {
                    ApplicationArea = Basic;
                }
                field(Basic; Basic)
                {
                    ApplicationArea = Basic;
                }
                group("Primary Bank Details")
                {
                    Caption = 'Primary Bank Details';
                    field("Primary Bank %"; "Primary Bank %")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Account Number"; "Bank Account Number")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Employee's Bank"; "Employee's Bank")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Name"; "Bank Name")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Branch"; "Bank Branch")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Branch Name"; "Bank Branch Name")
                    {
                        ApplicationArea = Basic;
                    }
                }
                group("Bank 2")
                {
                    Caption = 'Bank 2';
                    field("Bank 2 %"; "Bank 2 %")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Employee's Bank 2"; "Employee's Bank 2")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Name 2"; "Bank Name 2")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Branch 2"; "Bank Branch 2")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Branch Name 2"; "Bank Branch Name 2")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Account No. 2"; "Bank Account No. 2")
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field(Extension; Extension)
                {
                    ApplicationArea = Basic;
                }
                field("Mobile Phone No."; "Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Pager; Pager)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No.2"; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; "E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Company E-Mail"; "Company E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Send Payslip By E-mail?"; "Send Payslip By E-mail?")
                {
                    ApplicationArea = Basic;
                }
                field("Alt. Address Code"; "Alt. Address Code")
                {
                    ApplicationArea = Basic;
                }
                field("Alt. Address Start Date"; "Alt. Address Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Alt. Address End Date"; "Alt. Address End Date")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Administration)
            {
                Caption = 'Administration';
                field("Employment Date"; "Employment Date")
                {
                    ApplicationArea = Basic;
                }
                field("Employement Terms"; "Employement Terms")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Inactive Date"; "Inactive Date")
                {
                    ApplicationArea = Basic;
                }
                field("Cause of Inactivity Code"; "Cause of Inactivity Code")
                {
                    ApplicationArea = Basic;
                }
                field("Termination Date"; "Termination Date")
                {
                    ApplicationArea = Basic;
                }
                field("Reason for termination Code"; "Reason for termination Code")
                {
                    ApplicationArea = Basic;
                }
                field("Retirement Date"; "Retirement Date")
                {
                    ApplicationArea = Basic;
                }
                field("Emplymt. Contract Code"; "Emplymt. Contract Code")
                {
                    ApplicationArea = Basic;
                }
                field("Statistics Group Code"; "Statistics Group Code")
                {
                    ApplicationArea = Basic;
                }
                field("Resource No."; "Resource No.")
                {
                    ApplicationArea = Basic;
                }
                field("Research Center"; "Research Center")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Personal)
            {
                Caption = 'Personal';
                field("Birth Date"; "Birth Date")
                {
                    ApplicationArea = Basic;
                }
                field("Union Code"; "Union Code")
                {
                    ApplicationArea = Basic;
                }
                field("Union Membership No."; "Union Membership No.")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Leave Details")
            {
                Caption = 'Leave Details';
                field("Leave Days B/F"; "Reimbursed Leave Days")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Days B/F';
                    Importance = Promoted;
                }
                field(HOD; HOD)
                {
                    ApplicationArea = Basic;
                }
                field("Allocated Leave Days"; "Allocated Leave Days")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Total (Leave Days)"; "Total (Leave Days)")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Total Leave Taken"; "Total Leave Taken")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Leave Outstanding Bal"; "Leave Outstanding Bal")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Balance"; "Leave Balance")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Acrued Leave Days"; "Acrued Leave Days")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Cash per Leave Day"; "Cash per Leave Day")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Cash - Leave Earned"; "Cash - Leave Earned")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Leave Status"; "Leave Status")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Leave Type Filter"; "Leave Type Filter")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Leave Period Filter"; "Leave Period Filter")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("On Leave"; "On Leave")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Update Employee Details")
            {
                Caption = 'Update Employee Details';
                field(overtimehrs; overtimehrs)
                {
                    ApplicationArea = Basic;
                    Caption = 'Overtime 1.5';
                }
                field(overtimehrs2; overtimehrs2)
                {
                    ApplicationArea = Basic;
                    Caption = 'Overtime 2.0';
                }
                field(lostdays2; lostdays2)
                {
                    ApplicationArea = Basic;
                    Caption = 'Lost Days';
                }
                field(leavedays; leavedays)
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Days';
                }
                field("insurance Relief2"; "insurance Relief2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Insurance Relief';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("E&mployee")
            {
                Caption = 'E&mployee';
                Image = Employee;
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
                    //RunObject = Page "Default Dimensions";
#pragma warning disable AL0171
                    //  RunPageLink = "Table ID"=const(5200),
                    //    "No."=field("No.");
#pragma warning restore AL0171
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
                separator(Action23)
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
                separator(Action61)
                {
                }
                action("Online Map")
                {
                    ApplicationArea = Basic;
                    Caption = 'Online Map';
                    Image = Map;

                    trigger OnAction()
                    begin
                        DisplayMap;
                    end;
                }
            }
        }
        area(creation)
        {
            action("Assign Default Earn/Ded")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Default Earn/Ded';
                Ellipsis = true;
                Image = Default;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    Rec.TestField("ID Number");
                    UserSetup.Get(UserId);
                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    PayPeriod.SetRange("Responsibility Center", UserSetup."Responsibility Center");
                    if PayPeriod.FindFirst then begin
                        PayDateP := PayPeriod."Starting Date";

                        Earnings.Reset;
                        Earnings.SetRange(Earnings."Applies to All", true);
                        //Earnings.SETRANGE(Earnings."Basic Salary Code",FALSE);
                        if Earnings.Find('-') then begin
                            repeat
                                AssMatrix.Init;
                                AssMatrix."Employee No" := "No.";
                                AssMatrix.Type := AssMatrix.Type::Payment;
                                AssMatrix."Payroll Period" := PayPeriod."Starting Date";
                                AssMatrix."Department Code" := "Global Dimension 1 Code";
                                AssMatrix."Responsibility Center" := UserSetup."Responsibility Center";
                                AssMatrix."Posting Group Filter" := Rec."Posting Group";
                                AssMatrix.Code := Earnings.Code;
                                AssMatrix.Validate(Code);
                                if not AssMatrix.Insert then;
                            until Earnings.Next = 0;
                        end;
                    end;

                    // Deducton
                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    PayPeriod.SetRange("Responsibility Center", UserSetup."Responsibility Center");
                    if PayPeriod.FindFirst then begin
                        PayDateP := PayPeriod."Starting Date";
                        Ded.Reset;
                        Ded.SetRange("Applies to All", true);
                        if Ded.Find('-') then begin
                            repeat
                                AssMatrix.Init;
                                AssMatrix."Employee No" := "No.";
                                AssMatrix.Type := AssMatrix.Type::Deduction;
                                AssMatrix."Payroll Period" := PayPeriod."Starting Date";
                                AssMatrix."Department Code" := "Global Dimension 1 Code";
                                AssMatrix."Responsibility Center" := UserSetup."Responsibility Center";
                                AssMatrix."Posting Group Filter" := Rec."Posting Group";
                                AssMatrix.Code := Ded.Code;
                                AssMatrix.Validate(Code);
                                if not AssMatrix.Insert then;
                            until Ded.Next = 0;
                        end;
                        //MESSAGE('Defauts assigned to %1 period',PayPeriod."Starting Date");
                    end;
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

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    Rec.TestField("ID Number");
                    UserSetup.Get(UserId);
                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    PayPeriod.SetRange("Responsibility Center", UserSetup."Responsibility Center");
                    if PayPeriod.FindFirst then begin
                        Earnings.Reset;
                        Earnings.SetRange(Earnings."Applies to All", true);
                        Earnings.SetRange(Earnings."Basic Salary Code", true);
                        if Earnings.Find('-') then begin
                            repeat
                                AssMatrix.Init;
                                AssMatrix."Employee No" := "No.";
                                AssMatrix.Type := AssMatrix.Type::Payment;
                                AssMatrix."Payroll Period" := PayPeriod."Starting Date";
                                AssMatrix."Department Code" := "Global Dimension 1 Code";
                                AssMatrix."Responsibility Center" := UserSetup."Responsibility Center";
                                AssMatrix."Posting Group Filter" := Rec."Posting Group";
                                AssMatrix.Code := Earnings.Code;
                                AssMatrix.Validate(Code);
                                if not AssMatrix.Get(AssMatrix."Employee No", AssMatrix.Type, AssMatrix.Code, AssMatrix."Payroll Period") then
                                    AssMatrix.Insert;
                            until Earnings.Next = 0;
                        end;
                    end;


                    UserSetup.Get(UserId);
                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    PayPeriod.SetRange("Responsibility Center", UserSetup."Responsibility Center");
                    if PayPeriod.FindFirst then begin
                        Earnings.Reset;
                        Earnings.SetRange(Earnings."Applies to All", true);
                        // Earnings.SETRANGE(Earnings."Basic Salary Code",FALSE);
                        if Earnings.Find('-') then begin
                            repeat
                                AssMatrix.Init;
                                AssMatrix."Employee No" := "No.";
                                AssMatrix.Type := AssMatrix.Type::Payment;
                                AssMatrix."Payroll Period" := PayPeriod."Starting Date";
                                AssMatrix."Department Code" := "Global Dimension 1 Code";
                                AssMatrix."Responsibility Center" := UserSetup."Responsibility Center";
                                AssMatrix."Posting Group Filter" := Rec."Posting Group";
                                AssMatrix.Code := Earnings.Code;
                                AssMatrix.Validate(Code);
                                if not AssMatrix.Get(AssMatrix."Employee No", AssMatrix.Type, AssMatrix.Code, AssMatrix."Payroll Period") then
                                    AssMatrix.Insert;
                            until Earnings.Next = 0;
                        end;
                    end;

                    AssMatrix.Reset;
                    AssMatrix.SetRange("Employee No", "No.");
                    AssMatrix.SetRange(Type, AssMatrix.Type::Payment);
                    AssMatrix.SetRange(Closed, false);
                    Page.Run(69098, AssMatrix);
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

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    Rec.TestField("ID Number");
                    UserSetup.Get(UserId);
                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    PayPeriod.SetRange("Responsibility Center", UserSetup."Responsibility Center");
                    if PayPeriod.FindFirst then begin
                        // Deducton
                        Ded.Reset;
                        Ded.SetRange("Applies to All", true);
                        if Ded.Find('-') then begin
                            repeat
                                AssMatrix.Init;
                                AssMatrix."Employee No" := "No.";
                                AssMatrix.Type := AssMatrix.Type::Deduction;
                                AssMatrix."Payroll Period" := PayPeriod."Starting Date";
                                AssMatrix."Department Code" := "Global Dimension 1 Code";
                                AssMatrix."Responsibility Center" := UserSetup."Responsibility Center";
                                AssMatrix."Posting Group Filter" := Rec."Posting Group";
                                AssMatrix.Code := Ded.Code;
                                AssMatrix.Validate(Code);
                                if not AssMatrix.Get(AssMatrix."Employee No", AssMatrix.Type, AssMatrix.Code, AssMatrix."Payroll Period") then
                                    AssMatrix.Insert;
                            until Ded.Next = 0;
                        end;
                        //MESSAGE('Defauts assigned to %1 period',PayPeriod."Starting Date");
                    end;
                    AssMatrix.Reset;
                    AssMatrix.SetRange("Employee No", "No.");
                    AssMatrix.SetRange(Type, AssMatrix.Type::Deduction);
                    AssMatrix.SetRange(Closed, false);
                    Page.Run(69098, AssMatrix);
                end;
            }
            action("&Generate Payslip")
            {
                ApplicationArea = Basic;
                Caption = '&Generate Payslip';
                Ellipsis = true;
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    //IM.GenerateAcquisitionJournal(Rec);

                    PayPeriod.Reset;
                    PayPeriod.SetRange(Closed, false);
                    PayPeriod.SetRange("Responsibility Center", UserSetup."Responsibility Center");
                    if PayPeriod.Find('-') then
                        CurrentMonth := PayPeriod."Starting Date";
                    EmployeeRec.SetRange(EmployeeRec."No.", "No.");
                    EmployeeRec.SetRange(EmployeeRec."Pay Period Filter", CurrentMonth);
                    Report.Run(69401, true, false, EmployeeRec);
                end;
            }
            action("&Employee Statement")
            {
                ApplicationArea = Basic;
                Caption = '&Employee Statement';
                Ellipsis = true;
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    EmployeeRec.SetRange(EmployeeRec."No.", "No.");
                    Report.Run(69407, true, false, EmployeeRec);
                end;
            }
            separator(Action1000000046)
            {
            }
            action("&Run Emp Payroll")
            {
                ApplicationArea = Basic;
                Caption = '&Run Emp Payroll';
                Ellipsis = true;
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    //IM.GenerateRedemptionJournal(Rec);

                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    PayPeriod.SetRange("Responsibility Center", UserSetup."Responsibility Center");
                    if PayPeriod.Find('-') then
                        CurrentMonth := PayPeriod."Starting Date";
                    EmployeeRec.SetRange("No.", "No.");
                    EmployeeRec.SetRange("Pay Period Filter", CurrentMonth);
                    Report.Run(69400, true, false, EmployeeRec);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.SetRange("Responsibility Center", UserSetup."Responsibility Center");

        SetRange("No.");

        /*
         IF "Terminal Dues Paid?"=TRUE THEN
         CurrPage."Terminal Dues Paid?".Enabled(FALSE)
         ELSE
          CurrPage."Terminal Dues Paid?".ENABLED(TRUE);
        */

    end;

    trigger OnInit()
    begin
        MapPointVisible := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        "Responsibility Center" := UserSetup."Responsibility Center";
        "Global Dimension 1 Code" := UserSetup."Responsibility Center";
        "Global Dimension 1 Code" := UserSetup."Responsibility Center";
    end;

    trigger OnModifyRecord(): Boolean
    begin

        "Responsibility Center" := UserSetup."Responsibility Center";
        "Global Dimension 1 Code" := UserSetup."Responsibility Center";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Pays tax?" := true;

        "Responsibility Center" := UserSetup."Responsibility Center";
        "Global Dimension 1 Code" := UserSetup."Responsibility Center";
        "Global Dimension 1 Code" := UserSetup."Responsibility Center";
    end;

    trigger OnOpenPage()
    var
        MapMgt: Codeunit "Online Map Management";
    begin
        if not MapMgt.TestSetup then
            MapPointVisible := false;

        UserSetup.Get(UserId);

        if UserSetup."Payroll View" = false then
            Error('You do not have sufficient rights to view payroll!Please contact system administrator.');
    end;

    var
        [InDataSet]
        MapPointVisible: Boolean;
        PayPeriod: Record "Payroll PeriodXT";
        CurrentMonth: Date;
        UserSetup: Record "User Setup";
        AssMatrix2: Record "Assignment Matrix-X Temp-E";
        AssMatrix3: Record "Assignment Matrix-X Temp-E";
        Mail: Codeunit Mail;
        EmployeeRec: Record "Temporary Employee";
        GetGroup: Codeunit Payroll1;
        GroupCode: Code[20];
        CUser: Code[20];
        Earnings: Record "EarningsX Temp-E";
        Ded: Record "DeductionsX Temp-E";
        AssMatrix: Record "Assignment Matrix-X Temp-E";
        SalaryPointer: Record "Salary Pointers";
        assm: Record "Assignment Matrix-X Temp-E";
        i: Integer;
        OT: Decimal;
        LE: Decimal;
        BA: Decimal;
        overtimehrs: Integer;
        leavedays: Integer;
        OT2: Decimal;
        overtimehrs2: Integer;
        payperiod2: Date;
        sals: Record "Assignment Matrix-X Temp-E";
        empp: Record "Temporary Employee";
        someform: Page "Temporary Employee Card";
        text: Text[250];
        lostdays2: Integer;
        LD: Decimal;
        "insurance Relief2": Decimal;
        "insurance Reliefcalc": Decimal;
        PayrollRun: Report "Payroll Run Temp";
        Text000: label 'Are you sure you want to assign default earnings & deductions?';
        EmpTrans: Record "Employee Transfers";
        Emp: Record "Temporary Employee";
        PayDateP: Date;
}

