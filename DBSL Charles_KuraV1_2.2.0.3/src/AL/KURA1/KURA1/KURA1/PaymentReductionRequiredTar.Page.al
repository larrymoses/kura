#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72106 "Payment Reduction Required Tar"
{
    PageType = ListPart;
    SourceTable = "Payment Reduction Required Tar";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry no";"Entry no")
                {
                    ApplicationArea = Basic;
                }
                field("Project No";"Project No")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Elapse Of Month";"Elapse Of Month")
                {
                    ApplicationArea = Basic;
                }
                field("Road Usability";"Road Usability")
                {
                    ApplicationArea = Basic;
                }
                field("Road User Comfort";"Road User Comfort")
                {
                    ApplicationArea = Basic;
                }
                field("Road Durability";"Road Durability")
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

