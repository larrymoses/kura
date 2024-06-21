#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69711 "Application Skills"
{
    PageType = List;
    SourceTable = "Application Qualification";
    SourceTableView = where("Qualification Category"=filter("Skills & Competencies"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Qualification Code";"Qualification Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Institution/Company";"Institution/Company")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control19;Outlook)
            {
            }
            systempart(Control20;Notes)
            {
            }
            systempart(Control21;MyNotes)
            {
            }
            systempart(Control22;Links)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Qualification Category":="qualification category"::"Skills & Competencies";
    end;
}
