/// <summary>
/// Report Welfare Contribution (ID 50038).
/// </summary>
report 50038 "Welfare Contribution"
{
    Caption = 'Welfare Contribution';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Welfare Contribution.rdlc';

    dataset
    {
        dataitem(HrWelfareHeader; "Hr Welfare Header")
        {
            DataItemTableView = WHERE("Welfare Type"=CONST(Contribution));
            RequestFilterFields = "Welfare No.";

            column(Logo;CI.Picture)
            {
            }
            column(WelfareNo_HrWelfareHeader;"Welfare No.")
            {
            }
            column(WelfareType_HrWelfareHeader;"Welfare Type")
            {
            }
            column(EmployeeNo_HrWelfareHeader;"Raised By")
            {
            }
            column(EmployeeName_HrWelfareHeader;"Raisee Name")
            {
            }
            column(Description_HrWelfareHeader;Description)
            {
            }
            column(WelfareCategory_HrWelfareHeader;"Welfare Category")
            {
            }
            column(CreatedBy_HrWelfareHeader;"Created By")
            {
            }
            column(CreatedOn_HrWelfareHeader;"Created On")
            {
            }
            column(Status_HrWelfareHeader;Status)
            {
            }
            column(GlobalDimension1Code_HrWelfareHeader;"Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_HrWelfareHeader;"Global Dimension 2 Code")
            {
            }
            column(GlobalDimension1_HrWelfareHeader;"Global Dimension 1")
            {
            }
            column(GlobalDimension2_HrWelfareHeader;"Global Dimension 2")
            {
            }
            column(NoSeries_HrWelfareHeader;"No Series")
            {
            }
            column(TotalAmount_HrWelfareHeader;"Total Amount")
            {
            }
            column(BenefitAllocation_HrWelfareHeader;"Benefit Allocation")
            {
            }
            column(WelfareCode_HrWelfareHeader;"Welfare Code")
            {
            }
            column(WelfareDescription_HrWelfareHeader;Description)
            {
            }
            dataitem(DataItem1;"Welfare Lines")
            {
                DataItemLink = "Welfare Header No."=FIELD("Welfare No.");
                column(WelfareHeaderNo_WelfareLines;"Welfare Header No.")
                {
                }
                column(LineNo_WelfareLines;LineNo)
                {
                }
                column(EmployeeNo_WelfareLines;"Employee No.")
                {
                }
                column(EmployeeName_WelfareLines;"Employee Name")
                {
                }
                column(Month_WelfareLines;Month)
                {
                }
                column(Date_WelfareLines;Date)
                {
                }
                column(Amount_WelfareLines;Amount)
                {
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    trigger OnPreReport()
    begin
        CI.GET;
        CI.CALCFIELDS(Picture);
    end;

    var
        CI: Record 79;
}
