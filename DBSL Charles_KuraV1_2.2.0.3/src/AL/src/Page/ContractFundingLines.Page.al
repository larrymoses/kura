#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65080 "Contract Funding Lines"
{
    PageType = ListPart;
    SourceTable = "Contract Funding Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project Contract No.";"Project Contract No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Year Code";"Year Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Budget Start Date";"Budget Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Budget End Date";"Budget End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Customer";"Funding Customer")
                {
                    ApplicationArea = Basic;
                }
                field("Grant ID";"Grant ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Funding Currency";"Funding Currency")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Funding Limit";"Approved Funding Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Job No";"Job No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Status";"Job Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

