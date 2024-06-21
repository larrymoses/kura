#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69094 "Temporary Employees List"
{
    ApplicationArea = Basic;
    Caption = 'Temporary Employees List';
    CardPageID = "Temporary Employee Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Temporary Employee";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(FullName; Rec.FullName)
                {
                    ApplicationArea = Basic;
                    Caption = 'Full Name';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Termination Date"; Rec."Termination Date")
                {
                    ApplicationArea = Basic;
                }
                field("Reason for termination Code"; Rec."Reason for termination Code")
                {
                    ApplicationArea = Basic;
                }
                field(Rank; Rec.Rank)
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Branch; Rec.Branch)
                {
                    ApplicationArea = Basic;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Branch Name"; Rec."Bank Branch Name")
                {
                    ApplicationArea = Basic;
                }
                field("Staffing Group"; Rec."Staffing Group")
                {
                    ApplicationArea = Basic;
                }
                field(Paypoint; Rec.Paypoint)
                {
                    ApplicationArea = Basic;
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Employee's Bank"; Rec."Employee's Bank")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Branch"; Rec."Bank Branch")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Account Number"; Rec."Bank Account Number")
                {
                    ApplicationArea = Basic;
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                }
                field("NSSF No."; Rec."NSSF No.")
                {
                    ApplicationArea = Basic;
                }
                field("N.H.I.F No"; Rec."N.H.I.F No")
                {
                    ApplicationArea = Basic;
                }
                field("P.I.N"; Rec."P.I.N")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
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
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    action("Dimensions-Single")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-Single';
                        Image = Dimensions;
                        // RunObject = Page "Default Dimensions";
                        // RunPageLink = "Table ID" = const(5200),
                        //               "No." = field("No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action("Dimensions-&Multiple")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;

                        trigger OnAction()
                        var
                            Employee: Record "Temporary Employee";
#pragma warning disable AL0275
                        //    DefaultDimMultiple: Page "Default Dimensions-Multiple";
#pragma warning restore AL0275
                        begin
                            CurrPage.SetSelectionFilter(Employee);
                            //DefaultDimMultiple.SetMultiEmployee(Employee);
                            // DefaultDimMultiple.RunModal;
                        end;
                    }
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
                action("Co&nfidential Information")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&nfidential Information';
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
                separator(Action51)
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
                action("Con&fidential Info. Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Con&fidential Info. Overview';
                    Image = ConfidentialOverview;
                    RunObject = Page "Confidential Info. Overview";
                }
                action("Employee Salary Aging Report")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedOnly = true;
                    //RunObject = Report "Std. Monthly E\D Comparison";
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

                    trigger OnAction()
                    var
                        StdGenJnl: Record "Standard General Journal";
                    begin
                        UserSetup.Get(UserId);
                        PayPeriod.Reset;
                        PayPeriod.SetRange(PayPeriod.Closed, false);
                        PayPeriod.SetRange("Responsibility Center", UserSetup."Responsibility Center");
                        if PayPeriod.Find('-') then begin
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
                                    AssMatrix."Responsibility Center" := PayPeriod."Responsibility Center";
                                    AssMatrix.Code := Earnings.Code;
                                    AssMatrix.Validate(Code);
                                    if not AssMatrix.Get(AssMatrix."Employee No", AssMatrix.Type, AssMatrix.Code, AssMatrix."Payroll Period") then
                                        AssMatrix.Insert;
                                until Earnings.Next = 0;
                            end;







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
                                    AssMatrix."Responsibility Center" := PayPeriod."Responsibility Center";
                                    AssMatrix.Code := Ded.Code;
                                    AssMatrix.Validate(Code);
                                    if not AssMatrix.Get(AssMatrix."Employee No", AssMatrix.Type, AssMatrix.Code, AssMatrix."Payroll Period") then
                                        AssMatrix.Insert;
                                until Ded.Next = 0;
                            end;

                        end;
                    end;
                    // if Confirm(Text000,false) then;
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
                        UserSetup.Get(UserId);
                        PayPeriod.Reset;
                        PayPeriod.SetRange(PayPeriod.Closed, false);
                        PayPeriod.SetRange("Responsibility Center", UserSetup."Responsibility Center");
                        if PayPeriod.Find('-') then
                            CurrentMonth := PayPeriod."Starting Date";
                        EmployeeRec.SetRange("No.", "No.");
                        EmployeeRec.SetRange("Pay Period Filter", CurrentMonth);
                        EmployeeRec.SetRange("Responsibility Center", UserSetup."Responsibility Center");
                        Report.Run(69400, true, false, EmployeeRec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.SetRange("Responsibility Center", UserSetup."Responsibility Center");
    end;

    trigger OnInit()
    begin
        //UserSetup.GET(USERID);
        // Rec.SETRANGE("Responsibility Center",UserSetup."Responsibility Center");
    end;

    trigger OnOpenPage()
    begin
        UserSetup.Get(UserId);
        Rec.SetRange("Responsibility Center", UserSetup."Responsibility Center");
        //IF UserSetup."Interbank Amt Approval Limit"=FALSE THEN

        //ERROR('You do not have sufficient rights to view payroll!Please contact system administrator.');
    end;

    var
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
        EmpTrans: Record "Employee Transfers";
        Emp: Record "Temporary Employee";
        Text000: label 'Are you sure you want to assign default earnings & deductions?';
}

