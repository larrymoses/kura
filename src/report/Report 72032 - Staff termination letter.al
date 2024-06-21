report 72032 "Staff termination letter"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Staff termination letter.rdlc';

    dataset
    {
        dataitem("Project Staff Termination Line"; "Project Staff Termination Line")
        {
            column(CompanyPicture; CompanyInfo.Picture)
            {

            }
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyAddress7; CompanyAddr[7])
            {
            }
            column(CompanyAddress8; CompanyAddr[8])
            {
            }
            column(DocumentNo_ProjectStaffTerminationLine; "Project Staff Termination Line"."Document No.")
            {
            }
            column(LineNo_ProjectStaffTerminationLine; "Project Staff Termination Line"."Line No")
            {
            }
            column(ResourceNo_ProjectStaffTerminationLine; "Project Staff Termination Line"."Resource No.")
            {
            }
            column(Name_ProjectStaffTerminationLine; "Project Staff Termination Line".Name)
            {
            }
            column(TerminationEffectiveDate_ProjectStaffTerminationLine; "Project Staff Termination Line"."Termination Effective  Date")
            {
            }
            column(TerminationCategory_ProjectStaffTerminationLine; "Project Staff Termination Line"."Termination Category")
            {
            }
            column(TerminationDetails_ProjectStaffTerminationLine; "Project Staff Termination Line"."Termination Details")
            {
            }
            column(Email_ProjectStaffTerminationLine; "Project Staff Termination Line".Email)
            {
            }
            column(AppointmentDocumentNo_ProjectStaffTerminationLine; "Project Staff Termination Line"."Appointment Document No.")
            {
            }
            column(ProjectStartDate_ProjectStaffTerminationLine; "Project Staff Termination Line"."Project Start Date")
            {
            }
            column(ProjectEndDate_ProjectStaffTerminationLine; "Project Staff Termination Line"."Project End Date")
            {
            }
            column(RoleCode_ProjectStaffTerminationLine; "Project Staff Termination Line"."Role Code")
            {
            }
            column(Designation_ProjectStaffTerminationLine; UPPERCASE("Project Staff Termination Line".Designation))
            {
            }
            column(StaffCategory_ProjectStaffTerminationLine; "Project Staff Termination Line"."Staff Category")
            {
            }
            column(ProjectID_ProjectStaffTerminationLine; "Project Staff Termination Line"."Project ID")
            {
            }
            column(NoticePeriodDays_ProjectStaffTerminationLine; "Project Staff Termination Line"."Notice Period (Days)")
            {
            }
            // column(DocumentDate_ProjectStaffTerminationLine;"Project Staff Termination Line"."Document Date")
            // {
            // }
            column(PhoneNo; corec."Phone No.")
            {
            }
            column(Email; corec."E-Mail")
            {
            }
            column(Website; corec."Home Page")
            {
            }
            column(logo; corec.Picture)
            {
            }
            column(Name; corec.Name)
            {
            }
            column(Address2; corec."Address 2")
            {
            }
            column(City; corec.City)
            {
            }
            column(HeadedBy; corec."Headed By")
            {
            }
            column(Motto; corec.Motto)
            {
            }
            column(CurrentHeadName; CurrentHeadName)
            {
            }
            column(JobTitle; JobTitle)
            {
            }
            column(DirectorName; DirectorName)
            {
            }
            column(Director_Signature; UserSetup.Picture)
            {
            }
            column(ProjectNo; ProjectNo)
            {
            }
            column(ProjectName; ProjectName)
            {
            }
            dataitem("Project Staff Voucher"; "Project Staff Voucher")
            {
                DataItemLink = "Document No." = FIELD("Document No.");
                DataItemTableView = WHERE("Document Type" = FILTER(Termination));
                RequestFilterFields = "Document No.", "Document Type";

                column(Contractor_Name; "Contractor Name")
                {
                }
                column(Contractor_No; "Contractor No.")
                {
                    
                }
                column(DocumentNo_ProjectStaffVoucher; "Project Staff Voucher"."Document No.")
                {
                }
                column(DocumentType_ProjectStaffVoucher; "Project Staff Voucher"."Document Type")
                {
                }
                column(DocumentDate_ProjectStaffVoucher; FORMAT("Project Staff Voucher"."Document Date"))
                {
                }
                column(ProjectStaffTemplateID_ProjectStaffVoucher; "Project Staff Voucher"."Project Staff Template ID")
                {
                }
                column(ProjectID_ProjectStaffVoucher; "Project Staff Voucher"."Project ID")
                {
                }
                column(Description_ProjectStaffVoucher; "Project Staff Voucher".Description)
                {
                }
                column(AppointingAuthority_ProjectStaffVoucSher; "Project Staff Voucher"."Appointing Authority")
                {
                }
                column(ProjectName_ProjectStaffVoucher; "Project Staff Voucher"."Project Name")
                {
                }
                column(RoadCode_ProjectStaffVoucher; "Project Staff Voucher"."Road Code")
                {
                }
                column(RoadName_ProjectStaffVoucher; "Project Staff Voucher"."Road Name")
                {
                }
                column(RoadSectionNo_ProjectStaffVoucher; "Project Staff Voucher"."Road Section No.")
                {
                }
                column(SectionName_ProjectStaffVoucher; "Project Staff Voucher"."Section Name")
                {
                }
                column(ProjectStartDate_ProjectStaffVoucher; FORMAT("Project Staff Voucher"."Project Start Date"))
                {
                }
                column(ProjectEndDate_ProjectStaffVoucher; FORMAT("Project Staff Voucher"."Project End Date"))
                {
                }
                column(RegionID_ProjectStaffVoucher; "Project Staff Voucher"."Region ID")
                {
                }
                column(DirectorateID_ProjectStaffVoucher; "Project Staff Voucher"."Directorate ID")
                {
                }
                column(DepartmentID_ProjectStaffVoucher; "Project Staff Voucher"."Department ID")
                {
                }
                column(CreatedBy_ProjectStaffVoucher; "Project Staff Voucher"."Created By")
                {
                }
                column(CreatedDateTime_ProjectStaffVoucher; "Project Staff Voucher"."Created DateTime")
                {
                }
                column(Status_ProjectStaffVoucher; "Project Staff Voucher".Status)
                {
                }
                column(Posted_ProjectStaffVoucher; "Project Staff Voucher".Posted)
                {
                }
                column(NoSeries_ProjectStaffVoucher; "Project Staff Voucher"."No. Series")
                {
                }
                column(PreparedBy; UserSetup."Employee Name")
                {
                }
                column(DatePrepared; FORMAT(ApproverDate[1]))
                {
                }
                column(ExaminedBy; UserSetup1."Employee Name")
                {
                }
                column(DateApproved; FORMAT(ApproverDate[2]))
                {
                }
                column(ExaminedBy_Signature; UserSetup1.Picture)
                {
                }
                column(VBC; UserSetup2."Employee Name")
                {
                }
                column(VBCDate; ApproverDate[3])
                {
                }
                column(VBC_Signature; UserSetup2.Picture)
                {
                }
                column(Authorizer; UserSetup3."Employee Name")
                {
                }
                column(DateAuthorized; ApproverDate[4])
                {
                }
                column(Authorizer_Signature; UserSetup3.Picture)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    ResponsibilityCenter.GET("Project Staff Voucher"."Directorate ID");
                    JobTitle := ResponsibilityCenter.Name;

                    Employee.RESET;
                    Employee.SETRANGE("Directorate Head", TRUE);
                    Employee.SETRANGE("Directorate Code", "Project Staff Voucher"."Directorate ID");
                    IF Employee.FINDSET THEN BEGIN
                        DirectorName := Employee.FullName;
                        DirectorUserName := Employee."User ID";
                    END;

                    UserSetup.GET(DirectorUserName);
                    UserSetup.CALCFIELDS(Picture);

                    // Positions.RESET;
                    // Positions.SETRANGE(Positions."Position ID",corec."Headed By");
                    // IF Positions.FINDSET THEN BEGIN
                    //   JobTitle:=UPPERCASE(Positions."Job Title");
                    //  END;
                    //  END;
                    // ApprovalEntries.RESET;
                    // ApprovalEntries.SETRANGE("Table ID",72148);
                    // ApprovalEntries.SETRANGE("Document No.","Project Staff Voucher"."Document No.");
                    // ApprovalEntries.SETRANGE(Status,ApprovalEntries.Status::Approved);
                    // IF ApprovalEntries.FIND('-') THEN BEGIN
                    //   i:=0;
                    // REPEAT
                    // i:=i+1;
                    // IF i=1 THEN BEGIN
                    // Approver[1]:=ApprovalEntries."Sender ID";
                    //
                    // ApproverDate[1]:=ApprovalEntries."Date-Time Sent for Approval";
                    // IF UserSetup.GET(Approver[1]) THEN
                    //    UserSetup.CALCFIELDS(Picture);
                    //
                    // Approver[2]:=ApprovalEntries."Approver ID";
                    // ApproverDate[2]:=ApprovalEntries."Last Date-Time Modified";
                    // IF UserSetup1.GET(Approver[2]) THEN
                    //    UserSetup1.CALCFIELDS(Picture);
                    // END;
                    // IF i=2 THEN
                    // BEGIN
                    // Approver[3]:=ApprovalEntries."Approver ID";
                    // ApproverDate[3]:=ApprovalEntries."Last Date-Time Modified";
                    // IF UserSetup2.GET(Approver[3]) THEN
                    //    UserSetup2.CALCFIELDS(Picture);
                    // END;
                    // IF i=3 THEN
                    // BEGIN
                    // Approver[4]:=ApprovalEntries."Approver ID";
                    // ApproverDate[4]:=ApprovalEntries."Last Date-Time Modified";
                    // IF UserSetup3.GET(Approver[4]) THEN
                    //    UserSetup3.CALCFIELDS(Picture);
                    // END;
                    // UNTIL
                    // ApprovalEntries.NEXT=0;
                    //
                    // END;

                    //DIrectorNAME
                end;
            }

            trigger OnAfterGetRecord()
            begin
                ProjectStaffVoucher.RESET;
                ProjectStaffVoucher.SETRANGE(ProjectStaffVoucher."Document No.", "Project Staff Termination Line"."Document No.");
                IF ProjectStaffVoucher.FINDSET THEN BEGIN
                    ProjectNo := ProjectStaffVoucher."Project ID";
                    ProjectName := ProjectStaffVoucher."Project Name";
                END;
                SerialNo := 0;
                CompanyInfo.Get();
                CompanyInfo.CalcFields(Picture);
                FormatAddr.GetCompanyAddr("Project Staff Voucher"."Region ID", RespCenter, CompanyInfo, CompanyAddr);
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        corec.GET;
        corec.CALCFIELDS(corec.Picture);
    end;

    trigger OnPreReport()
    begin
        corec.GET;
        corec.CALCFIELDS(corec.Picture);
    end;

    var
        corec: Record "Company Information";
        SerialNo: Integer;
        ResponsibilityCenter: Record "Responsibility Center";
        RespCenter: Record "Responsibility Center";
        RegionName: Text[250];
        DepartmentName: Text[250];
        DirectorateName: Text[250];
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
        Employee: Record Employee;
        CurrentHeadName: Text[250];
        Positions: Record "Company Positions";
        JobTitle: Text[250];
        DirectorName: Text[100];
        DirectorUserName: Code[100];
        ProjectNo: Text[50];
        ProjectName: Text[500];
        ProjectStaffVoucher: Record "Project Staff Voucher";
        StaffAppointmentFunction: Record "Staff Appointment Function";
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
}

