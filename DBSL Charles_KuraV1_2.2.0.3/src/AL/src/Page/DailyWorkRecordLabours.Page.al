#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72460 "Daily Work Record Labours"
{
    PageType = List;
    SourceTable = "Daily Work Record Labor";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field(Gender;Gender)
                {
                    ApplicationArea = Basic;
                    Caption = 'Gender';
                }
                field("Labour Type";"Labour Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Total No. of Staff";"Total No. of Staff")
                {
                    ApplicationArea = Basic;
                }
                field("Average ManHours Worked";"Average ManHours Worked")
                {
                    ApplicationArea = Basic;
                }
                field("Estimate Total Wages Paid";"Estimate Total Wages Paid")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
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

