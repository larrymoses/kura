#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57216 "Bill Discounting Lines"
{
    PageType = ListPart;
    SourceTable = "Bill Discounting Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Project Code";"Project Code")
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
                field("Contractor Name";"Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Pending Certificates";"Pending Certificates")
                {
                    ApplicationArea = Basic;
                }
                field("Certificate value deductions";"Certificate value deductions")
                {
                    ApplicationArea = Basic;
                }
                field("Certificate Amount";"Certificate Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Discounted Amount";"Discounted Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
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

