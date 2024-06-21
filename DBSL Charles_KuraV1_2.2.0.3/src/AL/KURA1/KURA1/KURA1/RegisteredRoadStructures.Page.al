#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72351 "Registered Road Structures"
{
    ApplicationArea = Basic;
    CardPageID = "Registered Road Structure";
    Editable = false;
    PageType = List;
    SourceTable = "Road Facility Item";
    SourceTableView = where("Road Facility Category"=filter(Structure));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Facility  No.";"Facility  No.")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Section No.";"Road Section No.")
                {
                    ApplicationArea = Basic;
                }
                field("Road Facility Category";"Road Facility Category")
                {
                    ApplicationArea = Basic;
                }
                field("Road Facility Type";"Road Facility Type")
                {
                    ApplicationArea = Basic;
                }
                field("Road Facility SubType";"Road Facility SubType")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Facility Label";"Facility Label")
                {
                    ApplicationArea = Basic;
                }
                field("Facility Location";"Facility Location")
                {
                    ApplicationArea = Basic;
                }
                field("Material Type";"Material Type")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency ID";"Constituency ID")
                {
                    ApplicationArea = Basic;
                }
                field("County ID";"County ID")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID";"Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Last Road Condition Survey ID";"Last Road Condition Survey ID")
                {
                    ApplicationArea = Basic;
                }
                field("Last Road Cond. Survey Date";"Last Road Cond. Survey Date")
                {
                    ApplicationArea = Basic;
                }
                field("General Facility Condition";"General Facility Condition")
                {
                    ApplicationArea = Basic;
                }
                field("Construction Project ID";"Construction Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Construction Date";"Construction Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project RICS ID";"Project RICS ID")
                {
                    ApplicationArea = Basic;
                }
                field("Last Maintenance Date";"Last Maintenance Date")
                {
                    ApplicationArea = Basic;
                }
                field("Road Side";"Road Side")
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

