#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80015 "Directorate Card"
{
    Caption = 'Directorate Card';
    PageType = Card;
    SourceTable = "Responsibility Center";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Code)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the responsibility center code.';
                }
                field(Name; Name)
                {
                    ApplicationArea = Location;
                    MultiLine = true;
                    ToolTip = 'Specifies the name.';
                }
                field(Address; Address)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the address associated with the responsibility center.';
                }
                field("Address 2"; "Address 2")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies additional address information.';
                }
                field("Post Code"; "Post Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the postal code.';
                }
                field(City; City)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the city where the responsibility center is located.';
                }
                field("Country/Region Code"; "Country/Region Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the country/region of the address.';
                }
                field(Contact; Contact)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the name of the person you regularly contact. ';
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the location of the responsibility center.';
                }
                field("Operating Unit Type"; "Operating Unit Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Direct Reports To"; "Direct Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Indirect Reports To"; "Indirect Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Hierarchical  Level ID"; "Hierarchical  Level ID")
                {
                    ApplicationArea = Basic;
                }
                field(Vision; Vision)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(Mission; Mission)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(Motto; Motto)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Headed By (Title)"; "Headed By (Title)")
                {
                    ApplicationArea = Basic;
                }
                field(Region; Region)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Current Head"; "Current Head")
                {
                    ApplicationArea = Basic;
                    Caption = 'Personal Number';
                }
                field("Current Head Name"; "Current Head Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the responsibility center''s phone number.';
                }
                field("Fax No."; "Fax No.")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the fax number of the responsibility center.';
                }
                field("E-Mail"; "E-Mail")
                {
                    ApplicationArea = Location;
                    ExtendedDatatype = EMail;
                    ToolTip = 'Specifies the email address of the responsibility center.';
                }
                field("Home Page"; "Home Page")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the responsibility center''s web site.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Resp. Ctr.")
            {
                Caption = '&Resp. Ctr.';
                Image = Dimensions;
                action(Dimensions)
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    // Image = Dimensions;
                    // RunObject = Page "Default Dimensions";
                    // RunPageLink = "Table ID"=const(5714),
                    //               "No."=field(Code);
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                }
            }
            action("Core Values")
            {
                ApplicationArea = Basic;
                Image = ValueLedger;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Core Values";
            }
            separator(Action23)
            {
            }
            action("Core Mandate")
            {
                ApplicationArea = Basic;
                Image = Hierarchy;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Core Mandates";
            }
            separator(Action21)
            {
            }
            action("Responsibility Centers")
            {
                ApplicationArea = Advanced;
                Caption = 'Responsibility Centers';
                Image = Position;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Responsibility Center List";
                ToolTip = 'Set up responsibility centers to administer business operations that cover multiple locations, such as a sales offices or a purchasing departments.';
            }
            separator(Action17)
            {
            }
            action("Annual Reporting Codes")
            {
                ApplicationArea = Basic;
                Image = AccountingPeriods;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Annual Reporting Codes";
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Operating Unit Type" := "operating unit type"::Directorate;
    end;
}

