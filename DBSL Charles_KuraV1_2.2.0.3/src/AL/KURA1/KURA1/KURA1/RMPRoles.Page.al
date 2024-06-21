#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95049 "RMP Roles"
{
    CardPageID = "RMP Role";
    PageType = List;
    SourceTable = "RMP Role";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Risk & Compliance Roles';
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Executive Summary";"Executive Summary")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Responsible Team")
            {
                ApplicationArea = Basic;
                Caption = 'Project Team';
                Image = ResourcePlanning;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "RMP Project Risk Mgt Teams";
            }
            action("Default Responsibilities")
            {
                ApplicationArea = Basic;
                Image = Default;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Risk Mgt. Responsibilities";
            }
        }
    }
}

