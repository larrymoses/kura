#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56201 "Customer Feedback Card"
{
    Caption = 'Customer Feedback';
    PageType = Card;
    SourceTable = "Customer FeedbackS";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Feedback Date";"Feedback Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Date created";"Date created")
                {
                    ApplicationArea = Basic;
                }
                field("Time created";"Time created")
                {
                    ApplicationArea = Basic;
                }
                field(Gender;Gender)
                {
                    ApplicationArea = Basic;
                }
                field(Age;Age)
                {
                    ApplicationArea = Basic;
                }
                field(Organization;Organization)
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No";"Phone No")
                {
                    ApplicationArea = Basic;
                }
                field(Reception;Reception)
                {
                    ApplicationArea = Basic;
                }
                field("Prompt Services";"Prompt Services")
                {
                    ApplicationArea = Basic;
                }
                field("Reception Facilities";"Reception Facilities")
                {
                    ApplicationArea = Basic;
                }
                field(Professionalism;Professionalism)
                {
                    ApplicationArea = Basic;
                }
                field("General Presentation";"General Presentation")
                {
                    ApplicationArea = Basic;
                }
                field(Efficiency;Efficiency)
                {
                    ApplicationArea = Basic;
                }
                field(Quality;Quality)
                {
                    ApplicationArea = Basic;
                }
                field(Knowledge;Knowledge)
                {
                    ApplicationArea = Basic;
                }
                field("Recommendation Likelihood";"Recommendation Likelihood")
                {
                    ApplicationArea = Basic;
                }
                field("Services Sought";"Services Sought")
                {
                    ApplicationArea = Basic;
                }
                field("Any Problems";"Any Problems")
                {
                    ApplicationArea = Basic;
                }
                field("Overall satisfaction";"Overall satisfaction")
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(Improvement;Improvement)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12;Notes)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("&Print")
            {
                ApplicationArea = Basic;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    //DocPrint.PrintPurchHeader(Rec);


                    SetRange(No,No);
                    Report.Run(56200,true,true,Rec)
                end;
            }
        }
    }
}

