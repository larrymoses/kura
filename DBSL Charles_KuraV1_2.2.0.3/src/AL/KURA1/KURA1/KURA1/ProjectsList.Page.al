#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65077 "Projects List"
{
    ApplicationArea = Basic;
    Caption = 'Project  Funding Contracts';
    CardPageID = "Project Contract Card";
    Editable = false;
    PageType = List;
    SourceTable = "Project Contract Header";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project Contract No";"Project Contract No")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Application ID";"Grant Application ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contract Customer No";"Primary Contract Customer No")
                {
                    ApplicationArea = Basic;
                }
                field("Contact No.";"Contact No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(Address;Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2";"Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code";"Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(City;City)
                {
                    ApplicationArea = Basic;
                }
                field(Contact;Contact)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No.";"Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Principal Investigator";"Principal Investigator")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Administrator";"Grant Administrator")
                {
                    ApplicationArea = Basic;
                }
                field("Award Type";"Award Type")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Funding Sponsor ID";"Primary Funding Sponsor ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Sponsor Name";"Primary Sponsor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Start Date";"Contract Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract End Date";"Contract End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Status";"Contract Status")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status";"Approval Status")
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

