#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72041 "Road Structure Inventory"
{
    Caption = 'Road Structure Inventory';
    PageType = List;
    SourceTable = "Road Facility Inventory";
    SourceTableView = where("Road Facility Catgegory"=const(Structure));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Facility ID";"Facility ID")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Facility Catgegory";"Road Facility Catgegory")
                {
                    ApplicationArea = Basic;
                }
                field("Road Facility Type";"Road Facility Type")
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
                field("Facility Material Type";"Facility Material Type")
                {
                    ApplicationArea = Basic;
                }
                field("Construction Vendor No.";"Construction Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Construction Vendor Name";"Construction Vendor Name")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Road Facility Catgegory":="road facility catgegory"::Structure;
    end;
}

