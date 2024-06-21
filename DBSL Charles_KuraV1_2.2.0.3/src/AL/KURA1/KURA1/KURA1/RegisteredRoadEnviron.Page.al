#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72356 "Registered Road Environ"
{
    PageType = Card;
    SourceTable = "Road Environ Entry";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Environ ID";"Environ ID")
                {
                    ApplicationArea = Basic;
                }
                field("Road Environ Category";"Road Environ Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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
                field("Road Side";"Road Side")
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
                field("Connected to Road Link";"Connected to Road Link")
                {
                    ApplicationArea = Basic;
                }
                field("Connection Road Length (Km)";"Connection Road Length (Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Location Details";"Location Details")
                {
                    ApplicationArea = Basic;
                }
                field("Road Class ID";"Road Class ID")
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
                    DMSManagement.UploadRoadLinkDocuments("Environ ID",'Road Environ',RecordId,"Region ID");
                end;
            }
        }
    }

    var
        DMSManagement: Codeunit "DMS Management";
}

