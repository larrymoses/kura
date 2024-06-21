#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69057 "Employee Transfers History"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Employee Transfers";
    UsageCategory = History;

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
                field("Original Station";"Original Station")
                {
                    ApplicationArea = Basic;
                }
                field("New Station";"New Station")
                {
                    ApplicationArea = Basic;
                }
                field("Transfer Date";"Transfer Date")
                {
                    ApplicationArea = Basic;
                }
                field("Transfered By";"Transfered By")
                {
                    ApplicationArea = Basic;
                }
                field("To Hardship Area?";"To Hardship Area?")
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

