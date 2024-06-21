#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69330 "Academic History"
{
    PageType = List;
    SourceTable = "Applicant Competency";
    SourceTableView = where("Qualification Type"=const(Academic));

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
                field("Domain Area";"Domain Area")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Name";"Qualification Name")
                {
                    ApplicationArea = Basic;
                }
                field("Start Year";"Start Year")
                {
                    ApplicationArea = Basic;
                }
                field("End Year";"End Year")
                {
                    ApplicationArea = Basic;
                }
                field(Grade;Grade)
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
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
        "Qualification Type":="qualification type"::Academic;
    end;

    trigger OnOpenPage()
    begin
        "Qualification Type":="qualification type"::Academic;
    end;
}

