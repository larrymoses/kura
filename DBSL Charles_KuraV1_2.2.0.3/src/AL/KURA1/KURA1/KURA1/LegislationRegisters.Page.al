#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72138 "Legislation Registers"
{
    CardPageID = "Legislation Register";
    PageType = List;
    SourceTable = "Legislation Register";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Legislation ID";"Legislation ID")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date";"Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field(Category;Category)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Overview;Overview)
                {
                    ApplicationArea = Basic;
                }
                field("Functional Classification";"Functional Classification")
                {
                    ApplicationArea = Basic;
                }
                field("Gazette Supplement No.";"Gazette Supplement No.")
                {
                    ApplicationArea = Basic;
                }
                field("National Assembly Bill No.";"National Assembly Bill No.")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Amendments";"No. of Amendments")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Clauses/Sections";"No. of Clauses/Sections")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Subsections";"No. of Subsections")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Schedules";"No. of Schedules")
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

