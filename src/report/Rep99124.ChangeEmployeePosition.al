report 99124 "Change Employee Position"
{
    ApplicationArea = All;
    Caption = 'Change Employee Position';
    UsageCategory = Tasks;
    ProcessingOnly =true;
    dataset
    {
        dataitem(Employee; Employee)
        {
            trigger OnAfterGetRecord()
            var
                EmployeeHistory: Record "Employment History";
                EmployeeHistory1: Record "Employment History";
                CompanyInfo: Record "Company Information";
            begin
                CompanyInfo.get();
                EmployeeHistory.Init();
                EmployeeHistory."Employee No." := "No.";
                EmployeeHistory."Current Organization" := true;
                EmployeeHistory."Employment Terms" := EmploymentTerms;
                EmployeeHistory.Institution := CompanyInfo.Name;
                EmployeeHistory."Start Date" := EffectiveDate;
                EmployeeHistory."Job Position" := NewPosition;
                EmployeeHistory."Global Dimension 1 Code" := Dimension1;
                EmployeeHistory1.Reset();
                EmployeeHistory1.SetRange("Employee No.", "No.");
                EmployeeHistory1.SetRange("End Date", 0D);
                EmployeeHistory1.SetRange("Current Organization", true);
                if EmployeeHistory1.FindLast() then begin
                    EmployeeHistory1."End Date" := EffectiveDate;
                    EmployeeHistory1.Modify();
                end;
                if EmployeeHistory.Insert(true) then begin
                    Employee.Validate(Position, NewPosition);
                    Employee.Validate("Current Position ID", NewPosition);
                    Employee.Validate("Employement Terms", EmploymentTerms);
                    Employee.Validate("Global Dimension 1 Code",Dimension1);
                    Employee.Modify();
                end;
            end;
        }
    }
    requestpage
    {
        ShowFilter = false;
        layout
        {
            area(content)
            {
                group(Control2)
                {
                    ShowCaption = false;
                    field("New Employment Terms"; EmploymentTerms)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Employment Terms';
                        NotBlank = true;
                    }
                    field("New Position Code"; NewPosition)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'New Position Code';
                        NotBlank = true;
                        TableRelation = "Company Positions"."Position ID";
                        trigger OnValidate()

                        begin
                            NewPosition := DelChr(NewPosition, '<>');
                        END;

                    }
                    field(Dimension1; Dimension1)
                    {
                        NotBlank = true;
                        CaptionClass = '1,1,1';
                        Caption = 'Global Dimension 1 Code';
                        TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));
                    }
                    field("Effective Date"; EffectiveDate)
                    {
                        NotBlank = true;
                        ApplicationArea = Basic, Suite;
                    }

                    group(CopyWarning)
                    {
                        Caption = 'IMPORTANT';

                        field("Confirm Copy Warning"; ConfirmToChange)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Confirm To Change';
                            ShowCaption = true;

                        }
                    }
                }
            }
        }

        trigger OnQueryClosePage(CloseAction: Action): Boolean
        begin
            
            if (CloseAction = Action::OK) and (not ConfirmToChange) then begin
                Message(ConfirmToChangeMsg);
                exit(false);
            end;

            exit(true);
        end;
    }
    var
        NewPosition: Code[20];
        EmploymentTerms: Enum "Employment Terms";
        ProgressMsg: Label 'Changing Employee %1 position to %2.';
        CopySuccessMsg: Label 'Employee %1 position has been changed successfully.';
        ConfirmToChange: Boolean;
        ConfirmToChangeMsg: Label 'Before you can continue, you must acknowledge that you want to change employee %1 position.';
        EffectiveDate: Date;
        Dimension1: Code[20];
}
