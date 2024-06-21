
Page 72693 "Open RE Site Instructions"
{
    ApplicationArea = Basic;
    CardPageID = "Open RE Site Instruction";
    PageType = List;
    SourceTable = "Site Instructions Header";
    SourceTableView = where(Status = filter(Open | "Pending Approval"));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Site Instruction Type"; Rec."Site Instruction Type")
                {
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Contract No"; Rec."Contract No")
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
                field("Start Chainage"; Rec."Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage"; Rec."End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Chainage Description"; Rec."Chainage Description")
                {
                    ApplicationArea = Basic;
                }
                field("Works Instructions(Descriptio)"; Rec."Works Instructions(Descriptio)")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Name"; Rec."Directorate Name")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Site Agent No."; Rec."Site Agent No.")
                {
                    ApplicationArea = Basic;
                }
                field("Site Agent Name"; Rec."Site Agent Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Portal Status"; Rec."Portal Status")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount Exclusive VAT"; Rec."Total Amount Exclusive VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount Inclusive VAT"; Rec."Total Amount Inclusive VAT")
                {
                    ApplicationArea = Basic;
                }
             
                
            }
        }
        area(Factboxes)
        {
            part(Control1906354007; "Document Attachment Factbox")
            {

                SubPageLink = "Table ID" = const(72342),
                              "No." = field("Document No.");
                //   Visible = false;
            }
        }
    }

    actions
    {
    }

    var
        DMSManagement: Codeunit "DMS Management";
}



