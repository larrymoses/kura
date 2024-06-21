#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 52026 "Axle Permit Application Card"
{
    PageType = Card;
    SourceTable = "Axle Load Permit Application";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field("Applicant Name";"Applicant Name")
                {
                    ApplicationArea = Basic;
                }
                field("Applicant Address";"Applicant Address")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle/Trailer Reg No";"Vehicle/Trailer Reg No")
                {
                    ApplicationArea = Basic;
                }
                field("Tare Weight (KG)";"Tare Weight (KG)")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Model/Make";"Vehicle Model/Make")
                {
                    ApplicationArea = Basic;
                }
                field("Total No of Axle";"Total No of Axle")
                {
                    ApplicationArea = Basic;
                }
                field("Total No of Wheels Per Axle";"Total No of Wheels Per Axle")
                {
                    ApplicationArea = Basic;
                }
                field("Journey Start Date";"Journey Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Journey End Date";"Journey End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Route to be folowed";"Route to be folowed")
                {
                    ApplicationArea = Basic;
                }
                field("Width(M)";"Width(M)")
                {
                    ApplicationArea = Basic;
                }
                field("Height(M)";"Height(M)")
                {
                    ApplicationArea = Basic;
                }
                field("Length(M)";"Length(M)")
                {
                    ApplicationArea = Basic;
                }
                field("Weight of the Cargo(KG)";"Weight of the Cargo(KG)")
                {
                    ApplicationArea = Basic;
                }
                field("Gross Vehicle Weight(KG)";"Gross Vehicle Weight(KG)")
                {
                    ApplicationArea = Basic;
                }
                field("Description of Load";"Description of Load")
                {
                    ApplicationArea = Basic;
                }
                field("Escort Details";"Escort Details")
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
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;
            }
        }
    }
}

