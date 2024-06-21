#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69710 "Application Proffessionas"
{
    PageType = List;
    SourceTable = "Application Qualification";
    SourceTableView = where("Qualification Category"=filter(Professional));

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
                field("Specialized Domain Area";"Specialized Domain Area")
                {
                    ApplicationArea = Basic;
                }
                field("From Date";"From Date")
                {
                    ApplicationArea = Basic;
                }
                field("To Date";"To Date")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
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
                field("Course Grade";"Course Grade")
                {
                    ApplicationArea = Basic;
                }
                field(Comment;Comment)
                {
                    ApplicationArea = Basic;
                }
                field("Expiration Date";"Expiration Date")
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
        "Qualification Category":="qualification category"::Professional;
    end;
}

