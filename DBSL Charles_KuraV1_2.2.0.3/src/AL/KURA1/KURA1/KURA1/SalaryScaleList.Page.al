#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69022 "Salary Scale List"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Salary Scales";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Scale; Scale)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Pointer"; "Minimum Pointer")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Pointer"; "Maximum Pointer")
                {
                    ApplicationArea = Basic;
                }
                field("Temporary Scale";"Temporary Scale")
                {
                    ApplicationArea = Basic;
                }
                // group(Control1)
                // {
                //     field("In Patient Limit";"In Patient Limit")
                //     {
                //         ApplicationArea = Basic;
                //         Visible = false;
                //     }
                //     field("Out Patient Limit";"Out Patient Limit")
                //     {
                //         ApplicationArea = Basic;
                //         Visible = false;
                //     }
                //     field("Maximum Cover";"Maximum Cover")
                //     {
                //         ApplicationArea = Basic;
                //         Visible = false;
                //     }
            }
        }
    }
    // area(factboxes)
    // {
    //     systempart(Control1000000010;Outlook)
    //     {
    //     }
    //     systempart(Control1000000011;Notes)
    //     {
    //     }
    //     systempart(Control1000000012;MyNotes)
    //     {
    //     }
    //     systempart(Control1000000013;Links)
    //     {
    //     }
    // }
}

// actions
// {
// }


