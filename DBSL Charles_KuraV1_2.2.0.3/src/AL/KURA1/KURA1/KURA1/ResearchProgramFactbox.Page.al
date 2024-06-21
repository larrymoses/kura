#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65069 "Research Program Factbox"
{
    PageType = CardPart;
    SourceTable = "Research Program";

    layout
    {
        area(content)
        {
            field("Code";Code)
            {
                ApplicationArea = Basic;
            }
            field(Name;Name)
            {
                ApplicationArea = Basic;
            }
            field("No. of Project Areas";"No. of Project Areas")
            {
                ApplicationArea = Basic;
            }
            field("No. of Awarded GFO";"No. of Awarded GFO")
            {
                ApplicationArea = Basic;
                Caption = 'No. of Awarded Grants';
                Style = AttentionAccent;
                StyleExpr = true;
            }
            field("No. of Lost Grant GFO";"No. of Lost Grant GFO")
            {
                ApplicationArea = Basic;
                Caption = 'No. of Lost Grant Grants';
            }
            field("No. of Ongoing RProjects";"No. of Ongoing RProjects")
            {
                ApplicationArea = Basic;
                Caption = 'No. of Ongoing Projects';
            }
            field("No. of Completed RProjects";"No. of Completed RProjects")
            {
                ApplicationArea = Basic;
                Caption = 'No. of Completed Projects';
            }
            field("Total Amount Awarded(LCY)";"Total Amount Awarded(LCY)")
            {
                ApplicationArea = Basic;
                Style = AttentionAccent;
                StyleExpr = true;
            }
        }
    }

    actions
    {
    }
}

