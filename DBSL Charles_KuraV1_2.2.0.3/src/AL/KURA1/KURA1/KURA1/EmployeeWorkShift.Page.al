#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69639 "Employee Work Shift"
{
    ApplicationArea = Basic;
    CardPageID = "Work Shift Card";
    PageType = List;
    SourceTable = "Employee Work Shift";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Minimum No of Hrs/Wk";"Minimum No of Hrs/Wk")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control8;Outlook)
            {
            }
            systempart(Control9;Notes)
            {
            }
            systempart(Control10;MyNotes)
            {
            }
            systempart(Control11;Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Work Shift Time")
            {
                ApplicationArea = Basic;
                RunObject = Page "Work Shift Time";
                RunPageLink = "Workshift Code"=field(Code);
                Visible = false;
            }
        }
    }
}

