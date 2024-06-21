/// <summary>
/// Report Staff appointment lett (ID 72101).
/// </summary>
report 72101 "Staff appointment lett"
{
    Caption = 'Project Implementation Team';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/StaffAppointmentletter.rdl';


    dataset
    {
        dataitem("Project Staff Appointment Line"; "Project Staff Appointment Line")
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
            column(DocumentNo_ProjectStaffAppointmentLine; "Project Staff Appointment Line"."Document No.")
            {
            }
            column(ResourceNo_ProjectStaffAppointmentLine; "Project Staff Appointment Line"."Resource No.")
            {
            }
            column(RoleCode_ProjectStaffAppointmentLine; "Project Staff Appointment Line"."Role Code")
            {
            }
            column(Name_ProjectStaffAppointmentLine; "Project Staff Appointment Line".Name)
            {
            }
            column(Email_ProjectStaffAppointmentLine; "Project Staff Appointment Line".Email)
            {
            }
            column(Designation_ProjectStaffAppointmentLine; "Project Staff Appointment Line".Designation)
            {
            }
            column(StaffCategory_ProjectStaffAppointmentLine; "Project Staff Appointment Line"."Staff Category")
            {
            }
            column(EffectiveDate_ProjectStaffAppointmentLine; FORMAT("Project Staff Appointment Line"."Effective Date"))
            {
            }
            column(ExpiryDate_ProjectStaffAppointmentLine; FORMAT("Project Staff Appointment Line"."Expiry Date"))
            {
            }
            column(NotifiedonEmail_ProjectStaffAppointmentLine; "Project Staff Appointment Line"."Notified on Email")
            {
            }
            column(DateTimeNotified_ProjectStaffAppointmentLine; "Project Staff Appointment Line"."Date/Time Notified")
            {
            }
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
            column(Address1; corec."Address")
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
            dataitem(Employees; Employee)
            {
                DataItemLink = "No." = field("Resource No.");
                DataItemLinkReference = "Project Staff Appointment Line";
                column(Department_Code; "Department Code")
                {

                }
                column(Global_Dimension_1_Code; "Global Dimension 1 Code")
                {

                }

            }
            dataitem("Project Staff Voucher"; "Project Staff Voucher")
            {
                DataItemLink = "Document No." = FIELD("Document No.");
                DataItemTableView = WHERE("Document Type" = FILTER(Appointment));
                RequestFilterFields = "Document No.", "Document Type";
                column(Contractor_Name; "Contractor Name")
                {
                    
                }
                column(Contractor_No_; "Contractor No.")
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
                column(AppointingAuthority_ProjectStaffVoucSher; AppointingAuthority)
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
                    CompanyPositions.Reset();
                    CompanyPositions.SetRange("Position ID","Appointing Authority");
                    if CompanyPositions.FindFirst() then
                    "Appointing Authority" :=CompanyPositions."Job Title";
                    Employee.RESET;
                    Employee.SETRANGE(Employee."No.", corec."Current Head");
                    IF Employee.FINDSET THEN BEGIN
                        CurrentHeadName := Employee."Search Name";
                    END;
                    IF ResponsibilityCenter.GET("Project Staff Voucher"."Directorate ID") THEN BEGIN
                        JobTitle := ResponsibilityCenter.Name
                    END;

                    Employee.RESET;
                    Employee.SETRANGE("Directorate Head", TRUE);
                    Employee.SETRANGE("Directorate Code", "Project Staff Voucher"."Directorate ID");
                    IF Employee.FINDSET THEN BEGIN
                        DirectorName := Employee.FullName;
                        DirectorUserName := Employee."User ID";
                    END;

                    if UserSetup.GET(DirectorUserName) then
                        UserSetup.CALCFIELDS(Picture);

                end;
            }
            dataitem("Staff Appointment Function"; "Staff Appointment Function")
            {
                DataItemLinkReference = "Project Staff Appointment Line";
                DataItemLink = "Staff Role Code" = FIELD("Role Code");
                column(SerialNo; SerialNo)
                {
                }
                column(StaffRoleCode_StaffAppointmentFunction; "Staff Appointment Function"."Staff Role Code")
                {
                }
                column(EntryNo_StaffAppointmentFunction; "Staff Appointment Function"."Entry No")
                {
                }
                column(Description_StaffAppointmentFunction; "Staff Appointment Function".Description)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    // ScoreEntry.RESET;
                    // ScoreEntry.SETRANGE(ScoreEntry."IFS Code",DETAILED."IFS Code");
                    // IF ScoreEntry.FINDSET THEN BEGIN
                    //  SNumber:=SNumber;
                    //  END;
                    //  SNumber:=SNumber+1;
                    StaffAppointmentFunction.RESET;
                    StaffAppointmentFunction.SETRANGE(StaffAppointmentFunction."Entry No", "Staff Appointment Function"."Entry No");
                    IF StaffAppointmentFunction.FINDSET THEN BEGIN
                        SerialNo := SerialNo;
                    END;
                    SerialNo := SerialNo + 1;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                ProjectStaffVoucher.RESET;
                ProjectStaffVoucher.SETRANGE(ProjectStaffVoucher."Document No.", "Project Staff Appointment Line"."Document No.");
                IF ProjectStaffVoucher.FINDSET THEN BEGIN
                    ProjectNo := ProjectStaffVoucher."Project ID";
                    ProjectName := ProjectStaffVoucher."Project Name";
                    CompanyInfo.Get();
                CompanyInfo.CalcFields(Picture);
                    FormatAddr.GetCompanyAddr(ProjectStaffVoucher."Region ID", RespCenter, CompanyInfo, CompanyAddr);
                END;
                SerialNo := 0;

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
        Positions: Record "Positions";
        JobTitle: Text[250];
        DirectorName: Text[100];
        DirectorUserName: Code[100];
        ProjectNo: Text[50];
        ProjectName: Text[500];
        ProjectStaffVoucher: Record "Project Staff Voucher";
        StaffAppointmentFunction: Record "Staff Appointment Function";
        CompanyPositions: RECORD "Company Positions";
        AppointingAuthority: Text;
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        RespCenter: Record "Responsibility Center";
}

