#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72213 "Project Works Staff Temp Card"
{
    PageType = Card;
    SourceTable = "Project Key Staff Template";

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
                field("Road Project Category";"Road Project Category")
                {
                    ApplicationArea = Basic;
                }
                field("Works Category";"Works Category")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Start Date";"Effective Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Effective End Date";"Effective End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Sum";"Contract Sum")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("No. Series";"No. Series")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date";"Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time";"Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control17;"Project Staffing Template Line")
            {
                Caption = 'Internal Project Team';
                SubPageLink = "Key Staff Template ID"=field(Code),
                              "Team Type"=filter("Internal Project Team");
            }
            part(Control8;"Contrac Staffing Template Line")
            {
                Caption = 'Contractor Staffing';
                SubPageLink = "Key Staff Template ID"=field(Code),
                              "Team Type"=filter(Contractor);
            }
        }
        area(factboxes)
        {
            systempart(Control13;Outlook)
            {
            }
            systempart(Control14;Notes)
            {
            }
            systempart(Control15;MyNotes)
            {
            }
            systempart(Control16;Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup19)
            {
                action("Purchase requisitions")
                {
                    ApplicationArea = Basic;
                    Image = ReviewWorksheet;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "IFS Purchase Requisitions";
                    RunPageLink = "Document Type"=const("Purchase Requisition"),
                                  "Project Staffing Template ID"=field(Code);
                    RunPageMode = View;
                }
                action("Project Staff Appointments")
                {
                    ApplicationArea = Basic;
                    Image = PersonInCharge;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "PostedProj. Staff Appoint list";
                    RunPageLink = "Project Staff Template ID"=field(Code);
                    RunPageMode = View;
                }
            }
        }
    }
}

