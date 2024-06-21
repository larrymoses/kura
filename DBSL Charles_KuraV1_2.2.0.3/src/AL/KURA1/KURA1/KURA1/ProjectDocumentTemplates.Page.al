#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72244 "Project Document Templates"
{
    ApplicationArea = Basic;
    CardPageID = "Project Document Template";
    PageType = List;
    SourceTable = "Project Document Template";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Template ID";"Template ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date";"Effective Date")
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
        area(navigation)
        {
            action(Mobilization)
            {
                ApplicationArea = Basic;
                Image = MachineCenterLoad;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Mobilization Documents";
                RunPageLink = "Template ID"=field("Template ID"),
                              "Document Class"=filter(Mobilization);
                RunPageMode = View;
            }
            action("Execution & Monitoring")
            {
                ApplicationArea = Basic;
                Image = ExecuteBatch;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Execution & Monitori Documents";
                RunPageLink = "Template ID"=field("Template ID"),
                              "Document Class"=filter("Execution & Monitoring");
            }
            action("Warranty/DLP")
            {
                ApplicationArea = Basic;
                Image = WarrantyLedger;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Warrany_Defects Liability Peri";
                RunPageLink = "Template ID"=field("Template ID"),
                              "Document Class"=filter("Project Closure");
            }
            action("Project Close Out")
            {
                ApplicationArea = Basic;
                Image = CloseYear;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Close Out";
                RunPageLink = "Template ID"=field("Template ID"),
                              "Document Class"=filter("Subcontracting/Assignee");
            }
            action("General Administration")
            {
                ApplicationArea = Basic;
                Image = Allocate;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "General Administration";
                RunPageLink = "Template ID"=field("Template ID"),
                              "Document Class"=filter("Defects Liability");
            }
        }
    }
}

