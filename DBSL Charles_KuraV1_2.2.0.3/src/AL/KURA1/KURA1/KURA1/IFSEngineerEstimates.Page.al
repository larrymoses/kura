#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75422 "IFS Engineer Estimates"
{
    Editable = false;
    PageType = List;
    SourceTable = "Job Planning Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job No.";"Job No.")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("Bill Item No";"Bill Item No")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No.";"Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Direct Unit Cost (LCY)";"Direct Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost (LCY)";"Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Total Cost (LCY)";"Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                }
                field("Location Code";"Location Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control14;Outlook)
            {
            }
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

