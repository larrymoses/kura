#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69174 "Overtime Lines"
{
    PageType = ListPart;
    SourceTable = "Overtime lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Day;Day)
                {
                    ApplicationArea = Basic;
                }
                field("Overtime Type";"Overtime Type")
                {
                    ApplicationArea = Basic;
                }
                field("Overtime Rate";"Overtime Rate")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Start Time";"Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("End Time";"End Time")
                {
                    ApplicationArea = Basic;
                }
                field(Hours;Hours)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Basic Pay";"Employee Basic Pay")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Overtime Amount";"Overtime Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Work Done";"Work Done")
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
        OvertimD: Record "Overtime lines";
        Overtim: Record "Overtime Header";
}

