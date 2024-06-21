#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72076 "Service Level Selection Card"
{
    PageType = Card;
    SourceTable = "Service Level Selection";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Service No";"Service No")
                {
                    ApplicationArea = Basic;
                }
                field("Road Authority";"Road Authority")
                {
                    ApplicationArea = Basic;
                }
                field(Contractor;Contractor)
                {
                    ApplicationArea = Basic;
                }
                field(Project;Project)
                {
                    ApplicationArea = Basic;
                }
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Name/Chainage";"Road Name/Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Road Class";"Road Class")
                {
                    ApplicationArea = Basic;
                }
                field("Inspected By";"Inspected By")
                {
                    ApplicationArea = Basic;
                }
                field("Standard Service Level";"Standard Service Level")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control11;"Service Level Selection Line")
            {
                SubPageLink = Project=field(Project),
                              "Header No"=field("Service No");
            }
        }
    }

    actions
    {
    }
}

