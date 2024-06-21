#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69111 "Manpower Planning Lines"
{
    PageType = List;
    SourceTable = "ManPower Planning Lines";

    layout
    {
        area(content)
        {
            repeater(Control17)
            {
                field("Task No";"Task No")
                {
                    ApplicationArea = Basic;
                }
                field("Job Id";"Job Id")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title";"Job Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Responsibility Center Code";"Responsibility Center Code")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center Name";"Responsibility Center Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Quarter 1 Target";"Quarter 1 Target")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 2 Target";"Quarter 2 Target")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 3 Target";"Quarter 3 Target")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 4 Target";"Quarter 4 Target")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 1 Actual";"Quarter 1 Actual")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Quarter 2 Actual";"Quarter 2 Actual")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Quarter 3 Actual";"Quarter 3 Actual")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Quarter 4 Actual";"Quarter 4 Actual")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

