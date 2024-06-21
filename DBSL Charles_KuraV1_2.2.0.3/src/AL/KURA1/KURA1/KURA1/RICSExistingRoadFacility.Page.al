#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72174 "RICS Existing Road Facility"
{
    PageType = List;
    SourceTable = "RICS Existing Road Facility";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("RICS No.";"RICS No.")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Entry Type";"Entry Type")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        "Entry Type":="entry type"::Existing;
                    end;
                }
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
                field("Last Maintenance Date";"Last Maintenance Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
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

