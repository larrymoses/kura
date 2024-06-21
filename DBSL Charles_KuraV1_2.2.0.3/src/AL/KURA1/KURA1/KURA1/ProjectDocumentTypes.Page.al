#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings

Page 72243 "Project Document Types"
{
    ApplicationArea = Basic;
    CardPageID = "Project Document Type";
    PageType = List;
    SourceTable = "Project Document Type";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Program of Works"; Rec."Program of Works")
                {
                    ApplicationArea=Basic;
                }
                field("Mobilization Document";Rec."Mobilization Document")
                {
                    ApplicationArea=Basic;
                }
                field(Blocked; Rec.Blocked)
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



