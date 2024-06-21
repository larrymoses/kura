#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69191 "HR Salary Increament Card"
{
    PageType = Card;
    SourceTable = "HR Salary Increament Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = editability;
                field("Batch No"; "Batch No")
                {
                    ApplicationArea = Basic;
                }
                field(Descriptions; Descriptions)
                {
                    ApplicationArea = Basic;
                }
                field("Effective Start  Date"; "Effective Start  Date")
                {
                    ApplicationArea = Basic;
                }
                field("Effective End Date"; "Effective End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                }
                field("Run By"; "Run By")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control10; "Hr Salary Increament Lines")
            {
                Editable = editability;
                Enabled = editability;
                SubPageLink = "Batch No" = field("Batch No");
                UpdatePropagation = SubPart;
            }
        }
        area(factboxes)
        {
            systempart(Control8; Links)
            {
            }
            systempart(Control9; Notes)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Populate Salary Scale Details")
            {
                ApplicationArea = Basic;
                Image = Forecast;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Employee.Reset;
                    Employee.SetFilter("Salary Scale", '<>%1', '');
                    Employee.SetFilter(Present, '<>%1', '');
                    if Employee.Find('-') then begin
                        repeat
                            ScaleBenefits.Reset;
                            ScaleBenefits.SetRange("Salary Scale", Employee."Salary Scale");
                            ScaleBenefits.SetRange("Salary Pointer", Employee.Present);
                            if ScaleBenefits.Find('-') then begin
                                Lines.Init;
                                Lines."Batch No" := Rec."Batch No";
                                Lines."Employee No" := Employee."No.";
                                Lines.Validate("Employee No");
                                Lines."Current Salary Scale" := Employee."Salary Scale";
                                Lines."Current Present" := Employee.Present;
                                Lines."New Salary Scale" := Employee."Salary Scale";
                                SalaryPointers.Reset;
                                SalaryPointers.SetRange(SalaryPointers."Salary Scale", ScaleBenefits."Salary Scale");
                                SalaryPointers.SetRange(SalaryPointers."Salary Pointer", ScaleBenefits."Salary Pointer");
                                if SalaryPointers.FindFirst then begin
                                    NextInt := SalaryPointers."Pointer Int" + 1;
                                    SalaryPointers1.Reset;
                                    SalaryPointers1.SetRange(SalaryPointers1."Pointer Int", NextInt);
                                    SalaryPointers1.SetRange(SalaryPointers1."Salary Scale", SalaryPointers."Salary Scale");
                                    if SalaryPointers1.FindSet then begin
                                        Lines."New Present" := SalaryPointers1."Salary Pointer";
                                    end else
                                        Lines."New Present" := SalaryPointers."Salary Pointer";
                                end;
                                if not Lines.Insert then
                                    Lines.Modify;
                            end;
                        until Employee.Next = 0;
                    end;
                end;
            }
            action("Effect Salary Increament")
            {
                ApplicationArea = Basic;
                Enabled = editability;
                Image = PayrollStatistics;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    if "Effective Start  Date" = 0D then
                        Error('Please select effective date');
                    TestField(Status, Status::Open);
                    Lines.Reset;
                    Lines.SetRange("Batch No", "Batch No");
                    Lines.SetRange("Effective Start Date", "Effective Start  Date");
                    if Lines.Find('-') then begin
                        repeat
                            Lines.Validate("New Present");
                            Lines.Validate("New Salary Scale");
                            Employee.Reset;
                            Employee.SetRange("No.", Lines."Employee No");
                            if Employee.FindSet then begin
                                Employee."Salary Scale" := Lines."New Salary Scale";
                                Employee.Present := Lines."New Present";
                                Employee.Validate(Employee.Present);
                                Employee.Previous := Lines."Current Present";
                                Employee.Modify;
                            end;
                        until Lines.Next = 0;
                        Message('Salary Increament Completed..');
                        if Dialog.Confirm('You can now close this batch,\Do you want to close the batch?', true) then
                            Status := Status::"Pending Approval";
                    end;
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Enabled = not OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    //MESSAGE('%1',ApprovalsMgmt.CheckTSalaryApprovalsWorkflowEnabled(Rec));
                    //   if ApprovalsMgmt.CheckIncSalaryApprovalsWorkflowEnabled(Rec) then
                    //  ApprovalsMgmt.OnSendIncSalaryForApproval(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = true;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    // ApprovalsMgmt.OnCancelIncSalaryApprovalRequest(Rec);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = false;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin
                    //  ApprovalEntries.Setfilters(DATABASE::"Payroll HeaderT",19,"No.");
                    //  ApprovalEntries.RUN;

                    //ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        editability := true;
        if Status = Status::"Pending Approval" then
            editability := false;
    end;

    var
        Employee: Record Employee;
        Header: Record "HR Salary Increament Header";
        Lines: Record "HR Salary Increament Lines";
        editability: Boolean;
        ScaleBenefits: Record "Scale Benefits";
        SalaryPointers: Record "Salary Pointers";
        NextInt: Integer;
        SalaryPointers1: Record "Salary Pointers";
        [InDataSet]
        OpenApprovalEntriesExist: Boolean;
    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}

