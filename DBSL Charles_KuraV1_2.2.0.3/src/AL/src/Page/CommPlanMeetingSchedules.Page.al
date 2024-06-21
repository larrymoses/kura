#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95008 "Comm Plan Meeting Schedules"
{
    Caption = 'Target Stakeholders';
    CardPageID = "Comm Plan Meeting Schedule";
    PageType = List;
    SourceTable = "Comm Plan Meeting Schedule";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Category;Category)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Meeting ID";"Meeting ID")
                {
                    ApplicationArea = Basic;
                }
                field("Communication Type";"Communication Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Frequency;Frequency)
                {
                    ApplicationArea = Basic;
                }
                field("Meeting Medium";"Meeting Medium")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Owner";"Primary Owner")
                {
                    ApplicationArea = Basic;
                    Caption = 'Convener';
                }
                field("Planned Meeting Date";"Planned Meeting Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control15;Notes)
            {
            }
            systempart(Control16;MyNotes)
            {
            }
            systempart(Control17;Links)
            {
            }
        }
    }

    actions
    {
    }
}

