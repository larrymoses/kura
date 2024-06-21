#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70024 "Tender Specifications"
{
    PageType = List;
    SourceTable = "Tender Specifications";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requisition No";"Requisition No")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Specification;Specification)
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

