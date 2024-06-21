#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72108 "Monthly Statement Line"
{
    PageType = ListPart;
    SourceTable = "Monthly Statement Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Contract No";"Contract No")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Name";"Contract Name")
                {
                    ApplicationArea = Basic;
                }
                field("Description Of Works";"Description Of Works")
                {
                    ApplicationArea = Basic;
                }
                field("Prevoius Certificate";"Prevoius Certificate")
                {
                    ApplicationArea = Basic;
                }
                field("This Certificate";"This Certificate")
                {
                    ApplicationArea = Basic;
                }
                field(Total;Total)
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

