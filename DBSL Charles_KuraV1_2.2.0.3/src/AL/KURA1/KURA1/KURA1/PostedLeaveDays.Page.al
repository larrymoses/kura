#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69170 "Posted Leave Days"
{
    // //

    Editable = false;
    PageType = List;
    SourceTable = "Employee Leaves";
    SourceTableView = sorting("Employee No","Leave Code","Posting  Date")
                      order(ascending)
                      where(Posted=const(true));

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
                field("First Name";"First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name";"Last Name")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Code";"Leave Code")
                {
                    ApplicationArea = Basic;
                }
                field("Posting  Date";"Posting  Date")
                {
                    ApplicationArea = Basic;
                }
                field("Adjustment Type";"Adjustment Type")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Days";"No. Of Days")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("From Date";"From Date")
                {
                    ApplicationArea = Basic;
                }
                field("To Date";"To Date")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015;Notes)
            {
            }
            systempart(Control1000000016;MyNotes)
            {
            }
            systempart(Control1000000017;Links)
            {
            }
        }
    }

    actions
    {
    }
}

