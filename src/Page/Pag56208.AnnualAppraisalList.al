#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56208 "Annual Appraisal List"
{
    ApplicationArea = Basic;
    CardPageID = "Annual Appraisal";
    Editable = false;
    PageType = List;
    SourceTable = "Annual Appraisal";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field("Date created";"Date created")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No";"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name";"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Quarter;Quarter)
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year";"Financial Year")
                {
                    ApplicationArea = Basic;
                }
                field("Overall Quartely score";"Overall Quartely score")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Name";"Supervisor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Designation";"Supervisor Designation")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control20;Notes)
            {
            }
        }
    }

    actions
    {
    }
}

