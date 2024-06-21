#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72662 "Project Staff Appoint. List"
{
    PageType = List;
    SourceTable = "Project Staff Appointment Line";
    Caption ='Project Implementation Team';
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Select; Select)
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Resource No."; "Resource No.")
                {
                    ApplicationArea = Basic;
                }
                field("Role Code"; "Role Code")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field(Email; Email)
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Designation)
                {
                    ApplicationArea = Basic;
                }
                field("Staff Category"; "Staff Category")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; "Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Expiry Date"; "Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field("Notified on Email"; "Notified on Email")
                {
                    ApplicationArea = Basic;
                }
                field("Date/Time Notified"; "Date/Time Notified")
                {
                    ApplicationArea = Basic;
                }
                field("Project Manager"; "Project Manager")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; "User ID")
                {
                    ApplicationArea = Basic;
                }
                field(Telephone; Telephone)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Effect Selection")
            {
                ApplicationArea = Basic;
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Confirm(Text0001, true) then begin
                        TransferFrom.Reset;
                        TransferFrom.SetRange(TransferFrom."Document No.", "Document No.");
                        //TransferFrom.SETRANGE(TransferFrom.Suggested,FALSE);
                        if TransferFrom.FindSet then begin
                            ProjectStaffAppointmentLine.Reset;
                            ProjectStaffAppointmentLine.SetRange(ProjectStaffAppointmentLine.Select, true);
                            ProjectStaffAppointmentLine.SetRange(ProjectStaffAppointmentLine."Document No.", TransferFrom."Document No.");
                            if ProjectStaffAppointmentLine.FindSet then begin
                                repeat
                                    ProjectStaffTerminationLine.Init;
                                    ProjectStaffTerminationLine."Document No." := InitialDocNo;
                                    ProjectStaffTerminationLine."Line No" := ProjectStaffTerminationLine.Count + 1;
                                    ProjectStaffTerminationLine."Resource No." := ProjectStaffAppointmentLine."Resource No.";
                                    ProjectStaffTerminationLine.Name := ProjectStaffAppointmentLine.Name;
                                    ProjectStaffTerminationLine.Email := ProjectStaffAppointmentLine.Email;
                                    ProjectStaffTerminationLine."Role Code" := ProjectStaffTerminationLine."Role Code";
                                    ProjectStaffTerminationLine."Staff Category" := ProjectStaffAppointmentLine."Staff Category";
                                    ProjectStaffTerminationLine.Designation := ProjectStaffAppointmentLine.Designation;
                                    ProjectStaffTerminationLine."Staff Category" := ProjectStaffAppointmentLine."Staff Category";
                                    ProjectStaffTerminationLine."Termination  Date" := Today;
                                    ProjectStaffTerminationLine."Termination Category" := ProjectStaffTerminationLine."termination category"::"Contract Expiry";
                                    if not ProjectStaffTerminationLine.Insert(true) then
                                        ProjectStaffTerminationLine.Modify(true);
                                until ProjectStaffAppointmentLine.Next = 0;
                            end;
                            TransferFrom.Suggested := true;
                            TransferFrom.Modify;
                            Message('Suggestions from %1 Inserted', TransferFrom."Staff Appointment Voucher No.");
                        end;

                    end;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        //MESSAGE('%1 %2',InitialDocNo,StaffVouchNo);
    end;

    var
        ProjectStaffAppointmentLine: Record "Project Staff Appointment Line";
        ProjectStaffTerminationLine: Record "Project Staff Termination Line";
        UserSetup: Record "User Setup";
        TransferTo: Record "Project Staff Termination Line";
        TransferFrom: Record "Project Staff Voucher";
        SelectedRecords: Integer;
        TransFromLines: Record "Project Staff Appointment Line";
        ObjInterBTLine: Record "Project Staff Termination Line";
        LineNo: Integer;
        Text0001: label 'Are you sure you want to transfer the selected lines to Termination?';
        Text0002: label 'No Record Selected';
        CopyFrom: Record "Project Staff Appointment Line";
        CopyTo: Record "Project Staff Termination Line";
        InitialDocNo: Code[20];
        StaffVouchNo: Code[20];


    procedure GetDocNumber(DocNo: Code[20]; StafApNo: Code[20])
    begin
        InitialDocNo := DocNo;
        StaffVouchNo := StafApNo;
    end;
}

