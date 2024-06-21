#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69635 "Vacancy Requirements"
{
    PageType = ListPart;
    SourceTable = "Recruitment Req Requirement";
    SourceTableView = where("Document Type"=filter("Job Vacancy"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Qualification Category";"Qualification Category")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Code";"Qualification Code")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type";"Requirement Type")
                {
                    ApplicationArea = Basic;
                    OptionCaption = 'Mandatory,Added Advantage,Affirmative Action,PWD';
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Substitute Qualification Exist";"Substitute Qualification Exist")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type":="document type"::"Job Vacancy";
    end;
}

