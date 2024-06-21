
page 60000 "Company Stakeholders"
{
    PageType = List;
    SourceTable = "Company Stakeholders";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea= BasicHR;
                }
                field(Name; Rec.Name)
                {
                  ApplicationArea= BasicHR;  
                }
                field(Descriptions; Rec.Descriptions)
                {
                    ApplicationArea= BasicHR;
                }
            }
        }
        area(factboxes)
        {
            systempart(Notes;Notes)
            {
            }
           
            systempart(Links;Links)
            {
            }
        }
    }

    actions
    {
    }
}



