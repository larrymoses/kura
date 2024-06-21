#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72061 "Project Funding Voucher Line"
{
    PageType = ListPart;
    SourceTable = "Project Funding Voucher Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Region;Region)
                {
                    ApplicationArea = Basic;
                }
                field(Directorate;Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department;Department)
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source";"Funding Source")
                {
                    ApplicationArea = Basic;
                }
                field("Year Code";"Year Code")
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
                field("Constituency Code";"Constituency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Project No";"Project No")
                {
                    ApplicationArea = Basic;
                }
                field("Section Code";"Section Code")
                {
                    ApplicationArea = Basic;
                }
                field("Section Name";"Section Name")
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
                field("Currency Code";"Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Total Estimated Cost";"Total Estimated Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Total Estimated Cost(LCY)";"Total Estimated Cost(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Revision Status";"Revision Status")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage(Km)";"Start Chainage(Km)")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage(Km)";"End Chainage(Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Surface Type";"Surface Type")
                {
                    ApplicationArea = Basic;
                }
                field("Work Category";"Work Category")
                {
                    ApplicationArea = Basic;
                }
                field("Fund Type";"Fund Type")
                {
                    ApplicationArea = Basic;
                }
                field("Execution Method";"Execution Method")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action("Details Of Road Activities")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Add;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Details Of Road Activities";
                    RunPageLink = "WorkPlan No"=field("Document No"),
                                  "Road Code"=field("Road Code"),
                                  "Section Code"=field("Section Code");
                }
                action("Work Schedule(%)")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = Suggest;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Work Schedule";
                    RunPageLink = "Workplan No"=field("Document No");
                }
            }
        }
    }
}

