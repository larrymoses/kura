#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72352 "Registered Road Structure"
{
    PageType = Card;
    SourceTable = "Road Facility Item";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Facility  No.";"Facility  No.")
                {
                    ApplicationArea = Basic;
                }
                field("Road Facility Type";"Road Facility Type")
                {
                    ApplicationArea = Basic;
                }
                field("Road Facility Category";"Road Facility Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Road Facility SubType";"Road Facility SubType")
                {
                    ApplicationArea = Basic;
                    Caption = 'Road Facility Details';
                }
                field("Material Type";"Material Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Name';
                }
                field("Facility Label";"Facility Label")
                {
                    ApplicationArea = Basic;
                    Caption = 'Facility Local Name';
                }
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Road Section No.";"Road Section No.")
                {
                    ApplicationArea = Basic;
                }
                field(River;River)
                {
                    ApplicationArea = Basic;
                }
                field("River Name";"River Name")
                {
                    ApplicationArea = Basic;
                }
                field("Facility Location";"Facility Location")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage";"Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage";"End Chainage")
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
            }
            group("GPS Details")
            {
                Caption = 'GPS Details';
                field("Start Point Longitude";"Start Point Longitude")
                {
                    ApplicationArea = Basic;
                }
                field("Start Point Latitude";"Start Point Latitude")
                {
                    ApplicationArea = Basic;
                }
                field("End Point Longitude";"End Point Longitude")
                {
                    ApplicationArea = Basic;
                }
                field("End Point Latitude";"End Point Latitude")
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
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Documentations & Photos';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;

                trigger OnAction()
                begin
                    //DMSManagement.UploadDocument(DMSDocuments."Document Type"::"Road Link","Road Code",'Road Link',RECORDID);
                    DMSManagement.UploadRoadLinkDocuments("Facility  No.",'Road Structure',RecordId,"Region ID");
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Road Facility Category":="road facility category"::Structure;
    end;

    var
        DMSManagement: Codeunit "DMS Management";
}

