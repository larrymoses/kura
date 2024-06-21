#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72164 "Road Authorities"
{
    ApplicationArea = Basic;
    CardPageID = "Road Authority";
    Editable = false;
    PageType = List;
    SourceTable = "Road Authority";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Road Authority Code";"Road Authority Code")
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
                field(City;City)
                {
                    ApplicationArea = Basic;
                }
                field("Post Code";"Post Code")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No.";"Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                }
                field("Home Page";"Home Page")
                {
                    ApplicationArea = Basic;
                }
                field("Contact No.";"Contact No.")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Road Links";"No. of Road Links")
                {
                    ApplicationArea = Basic;
                }
                field("Current Road Agency";"Current Road Agency")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Default Road Classes")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Default;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Road Authority Class Mandate";
                RunPageLink = "Road Authority Code"=field("Road Authority Code");
                RunPageMode = View;
            }
        }
    }
}

