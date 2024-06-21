#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72725 "Equipment Repair Lines"
{
    PageType = ListPart;
    SourceTable = "Equipment Repair Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Contractor No.";"Contractor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment No.";"Equipment No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Serial No.";"Equipment Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("Maintenance Start Date";"Maintenance Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Expected Return Date";"Expected Return Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Scheduled Date of Delivery to Site';
                }
                field("Additional Remarks";"Additional Remarks")
                {
                    ApplicationArea = Basic;
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

