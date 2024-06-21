#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75014 "Procurement Document Type"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Procurement Document Type";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Document Class";"Document Class")
                {
                    ApplicationArea = Basic;
                }
                field("Document Category";"Document Category")
                {
                    ApplicationArea = Basic;
                }
                field("Track Certificate Expiry";"Track Certificate Expiry")
                {
                    ApplicationArea = Basic;
                }
                field("Issuing Agency Code";"Issuing Agency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Local Verification URL";"Local Verification URL")
                {
                    ApplicationArea = Basic;
                }
                field("Special Group Requirement";"Special Group Requirement")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Filed RFI-Response";"No. of Filed RFI-Response")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Filed Bid Response";"No. of Filed Bid Response")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12;Outlook)
            {
            }
            systempart(Control13;Notes)
            {
            }
            systempart(Control14;MyNotes)
            {
            }
            systempart(Control15;Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Vendor Registration Document")
            {
                ApplicationArea = Basic;
                Image = RegisteredDocs;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Vendor Registration Document";
                RunPageLink = Code=field(Code);
                Visible = false;
            }
        }
    }
}

