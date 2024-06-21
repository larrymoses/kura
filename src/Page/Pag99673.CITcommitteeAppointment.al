/// <summary>
/// Page CIT committee Appointments (ID 99671).
/// </summary>
page 99673 "CIT committee Appointments"
{
    ApplicationArea = All;
    Caption = 'CIT committee Appointment';
    PageType = List;
    CardPageId ="CIT Committee Appointment";
    UsageCategory = ReportsAndAnalysis;
    SourceTable = "IFS Tender Committee";
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Committee Type"; Rec."Committee Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Appointment Effective Date"; Rec."Appointment Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Appointing Authority"; Rec."Appointing Authority")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
    trigger OnOpenPage()
    begin
        IF UserSetup.GET(USERID) THEN
            Rec.SetFilter(Rec."Responsibility Center", '=%1', UserSetup."Responsibility Center");
    end;

    var
        UserSetup: Record "User Setup";
}



