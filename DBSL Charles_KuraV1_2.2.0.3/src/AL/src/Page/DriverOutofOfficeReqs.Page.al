#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59079 "Driver Out of Office Reqs"
{
    ApplicationArea = Basic;
    CardPageID = "Driver Out of Office Req";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Driver Out of Office Req";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Driver No";"Driver No")
                {
                    ApplicationArea = Basic;
                }
                field("Driver Name";"Driver Name")
                {
                    ApplicationArea = Basic;
                }
                field("Trip No";"Trip No")
                {
                    ApplicationArea = Basic;
                }
                field("Trip Descrption";"Trip Descrption")
                {
                    ApplicationArea = Basic;
                }
                field("Trip Starting Date";"Trip Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Trip Duration";"Trip Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Trip End Date";"Trip End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Reg No";"Vehicle Reg No")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Description";"Vehicle Description")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
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

