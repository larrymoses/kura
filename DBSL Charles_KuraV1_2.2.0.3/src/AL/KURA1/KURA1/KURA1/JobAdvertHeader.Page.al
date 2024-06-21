#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69140 "Job Advert Header"
{
    PageType = Card;
    SourceTable = "Advertisement Channels";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field(Mode; Mode)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                // field(Stat us;Status)
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Document Dat e";"Document Date")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Created B y";"Created By")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Publish ed;Published)
                // {
                //     ApplicationArea = Basic;
                // }
            }
            part(Control10; "Vacancy Media Advertisements")
            {
                SubPageLink = "Vacancy No." = field(Code);
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Job Advert")
            {
                ApplicationArea = Basic;
                Image = Document;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
               // RunObject = Report "Job advert Template";
            }
        }
    }
}

