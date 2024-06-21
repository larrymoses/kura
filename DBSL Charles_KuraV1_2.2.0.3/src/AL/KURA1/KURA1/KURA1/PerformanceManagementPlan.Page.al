#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80041 "Performance Management Plan"
{
    PageType = Card;
    SourceTable = "Performance Management Plan";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Plan ID";"Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Annual Reporting Code";"Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date";"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date";"End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Type";"Evaluation Type")
                {
                    ApplicationArea = Basic;
                }
                field("HR Performance Template";"HR Performance Template")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Contract  Template";"Performance Contract  Template")
                {
                    ApplicationArea = Basic;
                }
                field("Executive Summary";"Executive Summary")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control13;"Performance Plan Tasks")
            {
                SubPageLink = "Performance Mgt Plan ID"=field(No);
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Performance Appraisals")
            {
                ApplicationArea = Basic;
                Image = "Action";
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Standard Perfomance Appraisal";
                RunPageLink = "Performance Mgt Plan ID"=field(No),
                              "Document Type"=const("Performance Appraisal");
            }
            action("Performance Appeals")
            {
                ApplicationArea = Basic;
                Image = AddContacts;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Standard Perfomance Appraisal";
                RunPageLink = "Performance Mgt Plan ID"=field(No),
                              "Document Type"=const("Performance Appeal");
            }
            action(PIPs)
            {
                ApplicationArea = Basic;
                Image = Addresses;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Performance Improvement Plans";
            }
            action("Performance Mgmt Policies")
            {
                ApplicationArea = Basic;
                Image = AddAction;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Performance Plan Guidelines";
                RunPageLink = "Performance Mgt Plan ID"=field(No);
            }
            action("Review Periods")
            {
                ApplicationArea = Basic;
                Image = Replan;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Review Periods";
            }
        }
    }
}

