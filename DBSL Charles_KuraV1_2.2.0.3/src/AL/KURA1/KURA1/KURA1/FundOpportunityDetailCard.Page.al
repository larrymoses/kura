#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59056 "Fund Opportunity Detail Card"
{
    Editable = false;
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
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Date Awarded";"Date Awarded")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount Applied";"Total Amount Applied")
                {
                    ApplicationArea = Basic;
                }
                field(Closed;Closed)
                {
                    ApplicationArea = Basic;
                }
                field(Open;Open)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Donor Name";"Donor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Eligibility Criteria";"Eligibility Criteria")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control15;"Grant Applicants subform")
            {
                SubPageLink = "Fund Opportunity"=field(No);
            }
        }
    }

    actions
    {
    }
}

