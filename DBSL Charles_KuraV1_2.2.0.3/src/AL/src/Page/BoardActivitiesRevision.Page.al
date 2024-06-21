#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80376 "Board Activities Revision"
{
    PageType = List;
    SourceTable = "Board Activities Revision";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Activity Code";"Activity Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Activity Description";"Activity Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("WT(%)";"WT(%)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Target;Target)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Strategy Framework";"Strategy Framework")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Framework Perspective";"Framework Perspective")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("New Activity Code";"New Activity Code")
                {
                    ApplicationArea = Basic;
                }
                field("New Activity Description";"New Activity Description")
                {
                    ApplicationArea = Basic;
                }
                field("New Unit of Measure";"New Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("New WT(%)";"New WT(%)")
                {
                    ApplicationArea = Basic;
                }
                field("New Target";"New Target")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Board Sub-Activities")
            {
                ApplicationArea = Basic;
                Image = AllLines;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Board SUb Activities";
                RunPageLink = "Workplan No."=field("AWP No"),
                              "Initiative No."=field("Board Activity Code"),
                              "Activity Id"=field("Activity Code");
            }
        }
    }
}

