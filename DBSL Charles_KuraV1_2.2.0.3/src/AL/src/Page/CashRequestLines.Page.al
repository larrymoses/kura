#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57213 "Cash Request Lines"
{
    PageType = ListPart;
    SourceTable = "Cash Request Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("IFMIS CODE";"IFMIS CODE")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor ID";"Contractor ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name";"Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Code";"Project Code")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Reference No. (Cert No.)";"Reference No. (Cert No.)")
                {
                    ApplicationArea = Basic;
                }
                field("Cert Amount";"Cert Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Outstanding";"Amount Outstanding")
                {
                    ApplicationArea = Basic;
                }
                field(Budget;Budget)
                {
                    ApplicationArea = Basic;
                }
                field("Previous Budget";"Previous Budget")
                {
                    ApplicationArea = Basic;
                }
                field("This Request";"This Request")
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

