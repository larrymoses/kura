#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69192 "Hr Salary Increament Lines"
{
    PageType = ListPart;
    SourceTable = "HR Salary Increament Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No";"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name";"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title";"Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("Current Present";"Current Present")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Salary Scale';
                }
                field("Current Salary Scale";"Current Salary Scale")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Salary Scale Pointer';
                }
                field("New Salary Scale";"New Salary Scale")
                {
                    ApplicationArea = Basic;
                }
                field("New Present";"New Present")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Salary Scale Pointer';
                }
                field("Effective Start Date";"Effective Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Effective End Date";"Effective End Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

