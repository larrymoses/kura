#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72441 "Daily Work Record Equipments"
{
    CardPageID = "Daily Work Record Equipment";
    PageType = List;
    SourceTable = "Daily Work Record Equipment";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Equipment No.";"Equipment No.")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Equipment Type Code";"Equipment Type Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Serial/Registration No.";"Serial/Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field("Photo No.";"Photo No.")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Utilization";"Equipment Utilization")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Usage Hours";"Equipment Usage Hours")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Idle Hours";"Equipment Idle Hours")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
                field("Work Execution Programme ID";"Work Execution Programme ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job No.";"Job No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
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

