#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95247 "Audit Procedure Lines"
{
    PageType = ListPart;
    SourceTable = "Audit Execution Procedure";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Engagement ID";"Engagement ID")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Procedure ID";"Audit Procedure ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Audit Objective ID";"Audit Objective ID")
                {
                    ApplicationArea = Basic;
                }
                field("No. fo Audit Checklists";"No. fo Audit Checklists")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Reccomm Audit Test Meth";"No. Of Reccomm Audit Test Meth")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Business Risks";"No. of Business Risks")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Controls";"No. of Controls")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action(Findings)
                {
                    ApplicationArea = Basic;
                    Image = AddContacts;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Findings";
                    RunPageLink = "Document Type"=filter("Audit Fieldwork Voucher"),
                                  "Document No."=field("Engagement ID");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Dimension Set Entries";
                }
            }
        }
    }
}

