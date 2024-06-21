#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69081 "HR Setup List"
{
    CardPageID = "Human Resources Setup";
    PageType = List;
    SourceTable = "Human Resources Setup";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Primary Key";"Primary Key")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Nos.";"Employee Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Base Unit of Measure";"Base Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Shift overtime rate";"Shift overtime rate")
                {
                    ApplicationArea = Basic;
                }
                field("Holiday overtime rate";"Holiday overtime rate")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000088;Notes)
            {
            }
            systempart(Control1000000089;MyNotes)
            {
            }
            systempart(Control1000000090;Links)
            {
            }
        }
    }

    actions
    {
    }
}

