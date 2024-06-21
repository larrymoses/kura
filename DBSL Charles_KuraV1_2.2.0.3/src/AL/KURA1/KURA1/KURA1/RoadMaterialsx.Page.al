#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72118 "Road Materialsx"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Road Material";
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
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Base Unit Of Measure";"Base Unit Of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Default Material Test Template";"Default Material Test Template")
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

