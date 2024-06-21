
Page 72690 "Material Test Cert Submissions"
{
    ApplicationArea = Basic;
    CardPageID = "Material Test Cert. Submission";
    PageType = List;
    SourceTable = "Material Test Record";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Material Delivery Date"; Rec."Material Delivery Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No."; Rec."Contractor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Caption = 'Submitted';
                }
                field("Manufacturer Name"; Rec."Manufacturer Name")
                {
                    ApplicationArea = Basic;
                }
            }
        }
          area(FactBoxes)
        {
            part(Control1906354007; "Document Attachment Factbox")
            {

                SubPageLink = "Table ID" = const(72250),
                              "No." = field("Code");

            }
        }
    }

    actions
    {
    }
}



