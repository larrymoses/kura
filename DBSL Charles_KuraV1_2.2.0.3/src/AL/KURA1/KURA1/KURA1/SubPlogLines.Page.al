#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80360 "Sub Plog Lines"
{
    PageType = List;
    SourceTable = "Sub Plog Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sub Activity No.";"Sub Activity No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Planned Date";"Planned Date")
                {
                    ApplicationArea = Basic;
                }
                field("Achieved Date";"Achieved Date")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate";"Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department";"Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Target Qty";"Target Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Achieved Target";"Achieved Target")
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
                {
                    ApplicationArea = Basic;
                }
                field("Activity Type";"Activity Type")
                {
                    ApplicationArea = Basic;
                }
                field("Remaining Targets";"Remaining Targets")
                {
                    ApplicationArea = Basic;
                }
                field("Weight %";"Weight %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Due Date";"Due Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        PlogLines: Record "Plog Lines";
}

