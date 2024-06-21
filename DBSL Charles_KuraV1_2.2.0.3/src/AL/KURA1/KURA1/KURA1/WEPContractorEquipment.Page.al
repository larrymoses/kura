#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72269 "WEP Contractor Equipment"
{
    PageType = ListPart;
    SourceTable = "WEP Contractor Equipment";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No.";"Contractor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment No.";"Equipment No.")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Type Code";"Equipment Type Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Ownership Type";"Ownership Type")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Serial No.";"Equipment Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Usability Code";"Equipment Usability Code")
                {
                    ApplicationArea = Basic;
                }
                field("Years of Previous Use";"Years of Previous Use")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Condition Code";"Equipment Condition Code")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Availability";"Equipment Availability")
                {
                    ApplicationArea = Basic;
                }
                field("Project Phase";"Project Phase")
                {
                    ApplicationArea = Basic;
                }
                field("Scheduled Date of Delivery";"Scheduled Date of Delivery")
                {
                    ApplicationArea = Basic;
                    Caption = 'Scheduled Date of Delivery to Site';
                }
                field("No of Planned Maintenance";"No of Planned Maintenance")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "WEP Equipment Repair Plan";
                }
            }
        }
    }

    actions
    {
    }

    var
        ProjectMobilizationHeader: Record "Project Mobilization Header";
        VendorProfessionalStaff: Record "Vendor Professional Staff";
        PurchaseHeader: Record "Purchase Header";
        WEPContractorTeam: Record "WEP Contractor Team";
        BidKeyStaff: Record "Bid Key Staff";
        WEPContractorEquipment: Record "WEP Contractor Equipment";
        BidEquipmentSpecification: Record "Bid Equipment Specification";
}

