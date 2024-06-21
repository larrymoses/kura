/// <summary>
/// Report Employees TNA Report (ID 50039).
/// </summary>
report 50039 "Employees TNA Report"
{
    Caption = 'Employees TNA Report';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/EmployeesTNAReport.rdl';

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = sorting("No.") where(Status = filter(Active));

            column(No; "No.")
            {
            }
            column(FullNames;FullNames)
            {
            }
            column(Job_ID;"Job ID")
            {
            }
            column(Job_Title;"Job Title")
            {
            }
            column(DirectorateCode; "Directorate Code")
            {
            }
            column(DepartmentCode; "Department Code")
            {
            }
            column(Global_Dimension_1_Code;"Global Dimension 1 Code")
            {
            }
            column(Division;Division)
            {
            }
            column(DirName;DirName)
            {
            }
            column(DeptName;DeptName)
            {
            }
            column(FYCode;FYCode)
            {
            }
            column(CompanyPicture; CompanyInformation.Picture)
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
            column(CompanyMotto; CompanyInformation.Motto)
            {
            }
            dataitem("Training Needs Header";"Training Needs Header")
            {
                DataItemLink = "Employee No" = field("No.");
                DataItemTableView = sorting(Code);
                
                column(Employee_No;"Employee No")
                {
                }
                column(Code;Code)
                {
                }
                dataitem("Training Needs Requests";"Training Needs Requests")
                {
                    DataItemLink = "Training Header No." = field(Code);
                    DataItemTableView = sorting("Entry No.", "Training Header No.");

                    column(Entry_No_;"Entry No.")
                    {
                    }
                    column(Training_Header_No_;"Training Header No.")
                    {
                    }
                    column(Description;Description)
                    {
                    }
                }
                trigger OnPreDataItem()
                var
                    Text001: Label 'Financial Year is required';
                begin
                    // if FYCode = '' then 
                    //     error(Text001);
                    
                    "Training Needs Header".SetRange("FY Code", FYCode);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CompanyInformation.get();
                CompanyInformation.CalcFields(Picture);
                FormatAddr.GetCompanyAddr('', ResponsibilityCenter, CompanyInformation, CompanyAddr);
                ;

                ResponsibilityCenter.Reset();
                ResponsibilityCenter.SetRange(Code, "Directorate Code");
                if ResponsibilityCenter.Find('-') then
                    DirName := ResponsibilityCenter.Name;

                ResponsibilityCenter.Reset();
                ResponsibilityCenter.SetRange(Code, "Department Code");
                if ResponsibilityCenter.Find('-') then
                    DeptName := ResponsibilityCenter.Name;

                FullNames := Employee.FullName();
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group("Period Filter")
                {
                    field(FYCode;FYCode)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Financial Year';
                        TableRelation = "Financial Year Code";
                        ShowMandatory = true;
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    var
        CompanyInformation: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        CompanyAddr: array[8] of Text[100];
        ResponsibilityCenter: Record "Responsibility Center";
        DirName: Text;
        DeptName: Text;
        FullNames: Text;
        FYCode: Code[10];
}
