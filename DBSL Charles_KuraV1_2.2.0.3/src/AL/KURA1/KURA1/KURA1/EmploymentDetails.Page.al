#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72128 "Employment Details"
{
    PageType = ListPart;
    SourceTable = "Employment Detailss";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Header No";"Header No")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Contract No";"Contract No")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Name";"Contract Name")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No";"Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name";"Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Revision Status";"Revision Status")
                {
                    ApplicationArea = Basic;
                }
                field("Engineers Estimate";"Engineers Estimate")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
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

