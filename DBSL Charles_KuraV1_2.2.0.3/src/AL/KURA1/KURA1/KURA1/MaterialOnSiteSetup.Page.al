#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72727 "Material On Site Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Material On Site Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Material Code";"Material Code")
                {
                    ApplicationArea = Basic;
                }
                field("Material Description";"Material Description")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Of Measure Code";"Unit Of Measure Code")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
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

