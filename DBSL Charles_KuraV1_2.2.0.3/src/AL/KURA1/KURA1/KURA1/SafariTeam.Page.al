#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57034 "Safari Team"
{
    PageType = ListPart;
    SourceTable = "Project Members";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        ProjectMembers.Reset;
                        ProjectMembers.SetRange(ProjectMembers."No.", Rec."No.");
                        ProjectMembers.SetFilter(ProjectMembers."Return Date", '<=%1', Rec."Return Date");
                        if ProjectMembers.FindFirst then begin
                            if ProjectMembers."Return Date" <> 0D then begin
                                repeat
                                    Error('This employee %1 is tied in another imprest memo %2', ProjectMembers."No.", ProjectMembers."Imprest Memo No.");
                                until ProjectMembers.Next = 0;
                            end;
                        end;
                    end;
                }
                field("Advance Type"; Rec."Advance Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advance Type';
                }
                field("Work Type"; Rec."Work Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'SRC Perdiem';
                }
                field("Type of Expense"; Rec."Type of Expense")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vote Item';
                    Editable = false;
                }
                field("Time Period"; Rec."Time Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Days';
                    Enabled = true;

                    trigger OnValidate()
                    begin
                        //TESTFIELD("Task No.");
                        Rec.TestField("No.");
                        Rec.Validate("No.");
                    end;
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(From; Rec.From)
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field(Entitlement; Rec.Entitlement)
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Daily Subsistence Allowance';
                }
                field("Imprest Created"; Rec."Imprest Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                }
                field("Job  Task"; Rec."Job  Task")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = all;

                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Budget"; Rec."Job Task Budget")
                {
                    ApplicationArea = Basic;
                    Visible=false;
                }
                field("Job Task Remaining Amount"; Rec."Job Task Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Visible=false;
                }
                
                field("Budgeted Amount";Rec."Budgeted Amount")
                {
                     ApplicationArea = Basic;
                }
                field("Account Actual Spent";Rec."Account Actual Spent")
                {
                     ApplicationArea = Basic;
                }
                field("Committed Amount";Rec."Committed Amount")
                {
                     ApplicationArea = Basic;
                }
                field("Available Amount";Rec."Available Amount")
                {
                     ApplicationArea = Basic;
                }
                field("Transport Costs"; Rec."Transport Costs")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                }
                field("Total Entitlement"; Rec."Total Entitlement")
                {
                    ApplicationArea = Basic;
                }
                field("Entitlement (LCY)";Rec."Entitlement (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                }
                field("Outstanding Amount"; Rec."Outstanding Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Tasks to Carry Out"; Rec."Tasks to Carry Out")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Expected Output"; Rec."Expected Output")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Delivery; Rec.Delivery)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Project Lead"; Rec."Project Lead")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency Code"; Rec."Constituency Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                

            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        if Rec.Type = Rec.Type::Machine then
            Show := true;

        editTransport := false;
        EditDays := true;


        if ImprestMemo.Get(Rec."Imprest Memo No.") then begin




            ApprovalEntry.Reset;
            ApprovalEntry.SetRange("Table ID", 57008);
            //ApprovalEntry.SETRANGE("Document Type","Document Type"::im","Document Type"::"Imprest memo");
            ApprovalEntry.SetRange("Document No.", ImprestMemo."No.");
            ApprovalEntry.SetRange("Sequence No.", 1);
            ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);
            ApprovalEntry.SetFilter("Approver ID", '<>%1', ApprovalEntry."Sender ID");

            if ApprovalEntry.FindFirst then begin
                editTransport := true;
                EditDays := false;
                Rec.Modify;

                //MESSAGE(ImprestMemo."No.");

            end;

        end;
    end;

    var
        [InDataSet]
        Show: Boolean;
        editTransport: Boolean;
        ApprovalEntry: Record "Approval Entry";
        ImprestMemo: Record "Imprest Memo";
        EditDays: Boolean;
        County: Record County1;
        Constituencies: Page Constituencies;
        ProjectMembers: Record "Project Members";
}

#pragma implicitwith restore

