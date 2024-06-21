#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56211 "Training & Development Needs"
{
    PageType = ListPart;
    SourceTable = "Staff Training Appraisal";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Appraisal No";"Appraisal No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Training & Development Need";"Training & Development Need")
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

