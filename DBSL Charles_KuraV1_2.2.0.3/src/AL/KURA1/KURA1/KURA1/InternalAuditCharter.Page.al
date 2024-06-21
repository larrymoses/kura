#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95109 "Internal Audit Charter"
{
    PageType = Card;
    SourceTable = "Internal Audit Charter";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("External Document No.";"External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date";"Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field(Overview;Overview)
                {
                    ApplicationArea = Basic;
                }
                field("CAE ID";"CAE ID")
                {
                    ApplicationArea = Basic;
                }
                field("CAE Job Title";"CAE Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("CAE Directly Reports-To";"CAE Directly Reports-To")
                {
                    ApplicationArea = Basic;
                }
                field("CAE Indirectly Reports-To";"CAE Indirectly Reports-To")
                {
                    ApplicationArea = Basic;
                }
                field("Approved By";"Approved By")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control13;"Internal Charter Component Lin")
            {
                Caption = 'Internal Audit Roles & Responsibilities';
                SubPageLink = "Component Type"=filter(Responsibility);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Mission)
            {
                ApplicationArea = Basic;
                Image = AccountingPeriods;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Charter Components";
                RunPageView = where("Component Type"=filter(Mission));
            }
            action(Purpose)
            {
                ApplicationArea = Basic;
                Image = Accounts;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Charter Components";
                RunPageView = where("Component Type"=filter(Purpose));
            }
            action("Standards & Code Of Ethics")
            {
                ApplicationArea = Basic;
                Image = Allocate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Charter Components";
                RunPageView = where("Component Type"=filter(Standards));
            }
            action(Authority)
            {
                ApplicationArea = Basic;
                Image = AdjustItemCost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Charter Components";
                RunPageView = where("Component Type"=filter(Authority));
            }
            action("Independence & Objectivity")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Charter Components";
                RunPageView = where("Component Type"=filter(Independence));
            }
            action(Scope)
            {
                ApplicationArea = Basic;
                Image = Alerts;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Charter Components";
                RunPageView = where("Component Type"=filter(Scope));
            }
            action("QA & Improvement Program")
            {
                ApplicationArea = Basic;
                Caption = 'Quality Assurance & Improvement Program';
                Image = AutofillQtyToHandle;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Charter Components";
                RunPageView = where("Component Type"=filter("Quality Assurance"));
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Reset;
                    SetRange(Code,Code);
                    Report.Run(95013,true,true);
                end;
            }
        }
    }
}

