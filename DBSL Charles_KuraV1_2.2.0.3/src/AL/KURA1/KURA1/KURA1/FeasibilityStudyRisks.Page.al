#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72054 "Feasibility Study Risks"
{
    PageType = List;
    SourceTable = "Feasibility Study Risk";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Feasibility Study No";"Feasibility Study No")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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

