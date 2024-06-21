#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72095 "Defect Detection&Rectificati C"
{
    PageType = Card;
    SourceTable = "Defect Detection & Rectificati";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Road Authority";"Road Authority")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No";"Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Code";"Project Code")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name";"Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Road Authority Code";"Road Authority Code")
                {
                    ApplicationArea = Basic;
                }
                field("Service Level";"Service Level")
                {
                    ApplicationArea = Basic;
                }
                field("Service Level Category";"Service Level Category")
                {
                    ApplicationArea = Basic;
                }
                field("Service Scope";"Service Scope")
                {
                    ApplicationArea = Basic;
                }
                field("Service Creteria";"Service Creteria")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Link Name";"Road Link Name")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control15;"Detection & Rectification Line")
            {
                SubPageLink = "Project No"=field("Project Code");
            }
        }
    }

    actions
    {
    }
}

