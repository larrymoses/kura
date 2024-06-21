page 99992 "Status Report Type Line"
{
    Caption = 'Status Report Type Line';
    PageType = List;
    SourceTable = "Status Report Type";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Default Reporting Period"; Rec."Default Reporting Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Default Reporting Period field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No of Project Reports"; Rec."No of Project Reports")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of Project Reports field.';
                }
                field("Submission Period"; Rec."Submission Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Submission Period field.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                }
                field(SystemId; Rec.SystemId)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemId field.';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                }
            }
        }
    }
}
