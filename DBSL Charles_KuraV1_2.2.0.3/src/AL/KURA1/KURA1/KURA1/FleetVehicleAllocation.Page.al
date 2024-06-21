#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59127 "Fleet Vehicle Allocation"
{
    PageType = ListPart;
    SourceTable = "Fleet Vehicle Allocation";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vehicle Type";"Vehicle Type")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Req. No";"Vehicle Req. No")
                {
                    ApplicationArea = Basic;
                }
                field(Make;Make)
                {
                    ApplicationArea = Basic;
                }
                field(Model;Model)
                {
                    ApplicationArea = Basic;
                }
                field(Capacity;Capacity)
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

