#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72077 "Service Level Selection Line"
{
    PageType = ListPart;
    SourceTable = "Service Level Selection Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field(Category;Category)
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
                field("Items To Apply";"Items To Apply")
                {
                    ApplicationArea = Basic;
                }
                field(Remark;Remark)
                {
                    ApplicationArea = Basic;
                }
                field(Project;Project)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

