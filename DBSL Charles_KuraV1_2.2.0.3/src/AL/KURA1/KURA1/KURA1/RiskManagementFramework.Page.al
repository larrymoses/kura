#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95013 "Risk Management Framework"
{
    PageType = Card;
    SourceTable = "Risk Management Framework";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("External Document No";"External Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Organization Name";"Organization Name")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Purpose";"Primary Purpose")
                {
                    ApplicationArea = Basic;
                }
                field("Overall Responsibility";"Overall Responsibility")
                {
                    ApplicationArea = Basic;
                }
                field("Last Revision Date";"Last Revision Date")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Risk Qualification/Measurements")
            {
                Caption = 'Risk Qualification/Measurements';
                field("Default Risk LR Scale ID";"Default Risk LR Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field("Default Risk Impact R. Scale";"Default Risk Impact R. Scale")
                {
                    ApplicationArea = Basic;
                }
                field("Default Overall RR Scale ID";"Default Overall RR Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field("Default Risk AR Scale ID";"Default Risk AR Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field("Default UoM (Financial Loss)";"Default UoM (Financial Loss)")
                {
                    ApplicationArea = Basic;
                }
                field("Default UoM (Persons Injured)";"Default UoM (Persons Injured)")
                {
                    ApplicationArea = Basic;
                }
                field("Default UoM (Fatalities)";"Default UoM (Fatalities)")
                {
                    ApplicationArea = Basic;
                }
                field("Default UoM Duration of Delays";"Default UoM Duration of Delays")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Number Series")
            {
                Caption = 'Number Series';
                field("Corporate Risk Mgt Plan Nos.";"Corporate Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Functional Risk Mgt Plan Nos.";"Functional Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Project Risk Mgt Plan Nos.";"Project Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Risk Mgt Plan Nos.";"Directorate Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Departmenta Risk Mgt Plan Nos.";"Departmenta Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Regional Risk Mgt Plan Nos.";"Regional Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Incident Nos.";"Risk Incident Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("New Risk Voucher Nos";"New Risk Voucher Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Status Report Nos";"Status Report Nos")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control34;"Risk Mgt Framework FactBox")
            {
                Caption = 'Risk Measurement & Control Statistics';
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Overview)
            {
                ApplicationArea = Basic;
                Image = AddToHome;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Mgt Framework Detail";
                RunPageView = where("RMF Section"=filter("RMF Overview"));
            }
            action("Purpose(Goals & Objectives)")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Mgt Framework Detail";
                RunPageView = where("RMF Section"=filter("Benefits/Importance"));
            }
            action("Guiding Principles")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Mgt Framework Detail";
                RunPageView = where("RMF Section"=filter("RMF Guiding Principle"));
            }
            action("Stakeholder Register")
            {
                ApplicationArea = Basic;
                Image = Stop;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page StakeHolders;
            }
            action("Risk Taxonomy")
            {
                ApplicationArea = Basic;
                Image = SuggestCapacity;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Categories";
            }
            action("Risk Response Strategies")
            {
                ApplicationArea = Basic;
                Image = ServiceAgreement;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Response Strategies";
            }
            action("Roles & Responsibilities")
            {
                ApplicationArea = Basic;
                Image = Restore;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Management Roles";
            }
            action("Risk Identification Methods")
            {
                ApplicationArea = Basic;
                Image = Indent;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Identification Methods";
            }
            action("Risk Likelihood Rating Scales")
            {
                ApplicationArea = Basic;
                Image = Production;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Likelihood Rating Scales";
                RunPageView = where("Risk Rating Scale Type"=filter("Likelihood Rating"));
            }
            action("Risk Impact Rating Scales")
            {
                ApplicationArea = Basic;
                Image = AdjustItemCost;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Impact Rating Scales";
                RunPageView = where("Risk Rating Scale Type"=filter("Impact Rating"));
            }
            action("Risk Overal Rating Scales")
            {
                ApplicationArea = Basic;
                Image = OrderList;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Overall Rating Scales";
                RunPageView = where("Risk Rating Scale Type"=filter("Overall Risk Rating"));
            }
            action("Risk Appetite Rating Scales")
            {
                ApplicationArea = Basic;
                Image = Add;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Appetite Rating Scales";
                RunPageView = where("Risk Rating Scale Type"=filter("Risk Appetite Rating"));
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Reset;
                    SetRange("Primary Key","Primary Key");
                    Report.Run(95000,true,true,Rec);
                end;
            }
        }
    }
}

