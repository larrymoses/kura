/// <summary>
/// Report TNA Analysis (ID 50025).
/// </summary>
report 50025 "TNA Analysis"
{
    Caption = 'TNA - Analysis Report';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/TNA-Analysis.rdl';

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = sorting("No.") where(Status = filter(Active));

            column(No; "No.")
            {
            }
            column(DirectorateCode; "Directorate Code")
            {
            }
            column(DepartmentCode; "Department Code")
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

                trigger OnAfterGetRecord()
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
        FYCode: Code[10];
}
