#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72107 "Monthly Statement Header"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Statment For Payment Account";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Contract No";"Contract No")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Name";"Contract Name")
                {
                    ApplicationArea = Basic;
                }
                field(No;No)
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
                field("Certificate No";"Certificate No")
                {
                    ApplicationArea = Basic;
                }
                field("Valuation As At";"Valuation As At")
                {
                    ApplicationArea = Basic;
                }
                field("Region Code";"Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Region Name";"Region Name")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year";"Financial Year")
                {
                    ApplicationArea = Basic;
                }
                field("Administrative Boundary";"Administrative Boundary")
                {
                    ApplicationArea = Basic;
                }
                field(Month;Month)
                {
                    ApplicationArea = Basic;
                }
                field("Submitted By";"Submitted By")
                {
                    ApplicationArea = Basic;
                }
                field("Checked By";"Checked By")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control17;"Monthly Statement Line")
            {
                SubPageLink = "Contract No"=field("Contract No");
            }
        }
    }

    actions
    {
    }
}

