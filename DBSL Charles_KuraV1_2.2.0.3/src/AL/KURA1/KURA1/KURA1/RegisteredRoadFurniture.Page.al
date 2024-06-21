#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72354 "Registered Road Furniture"
{
    PageType = Card;
    SourceTable = "Road Facility Item";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Facility  No."; Rec."Facility  No.")
                {
                    ApplicationArea = Basic;
                }
                field("Road Facility Type"; Rec."Road Facility Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Name';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Section No."; Rec."Road Section No.")
                {
                    ApplicationArea = Basic;
                }
                field("Road Facility Category"; Rec."Road Facility Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Road Facility SubType"; Rec."Road Facility SubType")
                {
                    ApplicationArea = Basic;
                }
                field("Facility Label"; Rec."Facility Label")
                {
                    ApplicationArea = Basic;
                }
                field("Facility Location"; Rec."Facility Location")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage"; Rec."Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage"; Rec."End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Material Type"; Rec."Material Type")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                    Visible = FALSE;
                }
                field("Town ID"; Rec."Town ID")
                {
                    ApplicationArea = basic;
                }
                field("County ID"; Rec."County ID")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Last Road Condition Survey ID"; Rec."Last Road Condition Survey ID")
                {
                    ApplicationArea = Basic;
                }
                field("Last Road Cond. Survey Date"; Rec."Last Road Cond. Survey Date")
                {
                    ApplicationArea = Basic;
                }
                field("General Facility Condition"; Rec."General Facility Condition")
                {
                    ApplicationArea = Basic;
                }
                field("Construction Project ID"; Rec."Construction Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Construction Date"; Rec."Construction Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project RICS ID"; Rec."Project RICS ID")
                {
                    ApplicationArea = Basic;
                }
                field("Last Maintenance Date"; Rec."Last Maintenance Date")
                {
                    ApplicationArea = Basic;
                }
                field("Road Side"; Rec."Road Side")
                {
                    ApplicationArea = Basic;
                }
            }
            group("GPS Details")
            {
                Caption = 'GPS Details';
                field("Start Point Longitude"; Rec."Start Point Longitude")
                {
                    ApplicationArea = Basic;
                }
                field("Start Point Latitude"; Rec."Start Point Latitude")
                {
                    ApplicationArea = Basic;
                }
                field("End Point Longitude"; Rec."End Point Longitude")
                {
                    ApplicationArea = Basic;
                }
                field("End Point Latitude"; Rec."End Point Latitude")
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
                    DMSManagement.UploadRoadLinkDocuments(Rec."Facility  No.", 'Road Furniture', Rec.RecordId, Rec."Region ID");
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Road Facility Category" := Rec."road facility category"::Furniture;
    end;

    var
        DMSManagement: Codeunit "DMS Management";
}

#pragma implicitwith restore

