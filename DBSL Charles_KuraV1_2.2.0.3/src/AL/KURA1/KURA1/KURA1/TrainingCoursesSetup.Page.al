#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69307 "Training Courses Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Training Courses Setup";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Descritpion;Descritpion)
                {
                    ApplicationArea = Basic;
                }
                field(Domain;Domain)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Staff Trained";"No. of Staff Trained")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Spent";"Budget Spent")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Needs To be Addressed")
            {
                ApplicationArea = Basic;
                Image = AllocatedCapacity;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Training Courses Needs";
                RunPageLink = "Course Code"=field(Code);
            }
        }
    }
}

