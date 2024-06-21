page 99547 "Interns List"
{
    ApplicationArea = All;
    Caption = 'Interns List';
    CardPageID = "Interns Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = Employee;
    SourceTableView = where("Employee Category" = filter(Intern));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(FullName; FullName)
                {
                    ApplicationArea = Basic;
                    Caption = 'Full Name';
                }
                field("First Name"; "First Name")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Middle Name"; "Middle Name")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Last Name"; "Last Name")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Salary Scale"; "Salary Scale")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title"; "Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("Job ID"; "Job ID")
                {
                    ApplicationArea = Basic;
                }
                field("Incremental Month"; "Incremental Month")
                {
                    ApplicationArea = Basic;
                }
                field(Present; Present)
                {
                    ApplicationArea = Basic;
                }
                field(Previous; Previous)
                {
                    ApplicationArea = Basic;
                }
                field(Halt; Halt)
                {
                    ApplicationArea = Basic;
                }
                field("Last Modified Date Time"; "Last Modified Date Time")
                {
                    ApplicationArea = Basic;
                }
                field(Region; Region)
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Termination Date"; "Termination Date")
                {
                    ApplicationArea = Basic;
                }

                field(Rank; Rank)
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Branch; Branch)
                {
                    ApplicationArea = Basic;
                }
                field("Bank Name"; "Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Branch Name"; "Bank Branch Name")
                {
                    ApplicationArea = Basic;
                }
                field("Staffing Group"; "Staffing Group")
                {
                    ApplicationArea = Basic;
                }
                field(Paypoint; Paypoint)
                {
                    ApplicationArea = Basic;
                }
                field("Posting Group"; "Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Employee's Bank"; "Employee's Bank")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Branch"; "Bank Branch")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Account Number"; "Bank Account Number")
                {
                    ApplicationArea = Basic;
                }
                field("ID Number"; "ID Number")
                {
                    ApplicationArea = Basic;
                }
                field("NSSF No."; "NSSF No.")
                {
                    ApplicationArea = Basic;
                }
                field("N.H.I.F No"; "N.H.I.F No")
                {
                    ApplicationArea = Basic;
                }
                field("P.I.N"; "P.I.N")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Address; Address)
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; "Post Code")
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
                        // Image = Dimensions;
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

                        // trigger OnAction()
                        // var
                        //     Employee: Record Employee;
                        //     DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        // begin
                        //     CurrPage.SetSelectionFilter(Employee);
                        //     DefaultDimMultiple.SetMultiEmployee(Employee);
                        //     DefaultDimMultiple.RunModal;
                        // end;
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
                    // RunObject = Report "Std. Monthly E\D Comparison";
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        UserSetup.Get(UserId);

        //IF UserSetup."Interbank Amt Approval Limit"=FALSE THEN

        //ERROR('You do not have sufficient rights to view payroll!Please contact system administrator.');
    end;

    var
        UserSetup: Record "User Setup";
}

