#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59051 "Fund Opportunity Card"
{
    PageType = Card;
    SourceTable = "Funding Oportunity";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("Donor Type";"Donor Type")
                {
                    ApplicationArea = Basic;
                }
                field("Donor No";"Donor No")
                {
                    ApplicationArea = Basic;
                }
                field("Donor Name";"Donor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Eligibility Criteria";"Eligibility Criteria")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Date Awarded";"Date Awarded")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Total Amount Applied";"Total Amount Applied")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Open;Open)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Closed;Closed)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status;Status)
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

