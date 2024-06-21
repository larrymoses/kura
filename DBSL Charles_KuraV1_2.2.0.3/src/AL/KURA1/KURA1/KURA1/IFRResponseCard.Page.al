#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75364 "IFR Response Card"
{
    PageType = Card;
    SourceTable = "RFI Response";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; "Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Name"; "Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("RFI Document No."; "RFI Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Registration Period"; "Registration Period")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Representative Name"; "Vendor Representative Name")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Repr Designation"; "Vendor Repr Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Address"; "Vendor Address")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Address 2"; "Vendor Address 2")
                {
                    ApplicationArea = Basic;
                }
                field(City; City)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Country/Region Code"; "Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; "Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(County; County)
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center ID"; "Responsibility Center ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Code';
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Region';
                }
                field("Constituency Code"; "Constituency Code")
                {
                    ApplicationArea = Basic;
                }
                field(Constituency; Constituency)
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; "E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; "Document Status")
                {
                    ApplicationArea = Basic;
                }
                field("Date Submitted"; "Date Submitted")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; "Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; "Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control31; "RFI Response Line")
            {
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No.");
            }
        }
        area(factboxes)
        {
            systempart(Control27; Outlook)
            {
            }
            systempart(Control28; Notes)
            {
            }
            systempart(Control29; MyNotes)
            {
            }
            systempart(Control30; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(IFP)
            {
                Caption = 'IFP';
                Image = "Order";
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    // trigger OnAction()
                    // var
                    //     DocumentAttachmentDetails: Page "Document Attachment Details";
                    //     RecRef: RecordRef;
                    // begin
                    //     RecRef.GetTable(Rec);
                    //     DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    //     DocumentAttachmentDetails.RunModal;
                    // end;
                }
                action("Filed Documents")
                {
                    ApplicationArea = Basic;
                    Image = Filed;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "RFI Response Filed Document";
                    RunPageLink = "Document No" = field("Document No."),
                                  "Document Type" = const("IFP Response"),
                                  "Vendor No" = field("Vendor No.");
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = Print;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        Reset;
                        SetRange("Document No.", "Document No.");
                        Report.Run(70107, true, true, Rec);
                    end;
                }
            }
            group("Vendor Details")
            {
                Caption = 'Vendor Details';
                Image = "Order";
                action("Vendor Special Group Entry")
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category9;
                    RunObject = Page "Vendor Special Group Entry";
                    RunPageLink = "Vendor No" = field("Vendor No.");
                }
                action("Vendor Bank Account List")
                {
                    ApplicationArea = Basic;
                    Image = BankAccount;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category9;
                    // RunObject = Page "Vendor Bank Account List";
                    // RunPageLink = "Vendor No."=field("Vendor No.");
                }
                action("Vendor Business Owner")
                {
                    ApplicationArea = Basic;
                    Image = Relatives;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Business Owner";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                }
                action("Vendor Litigation History")
                {
                    ApplicationArea = Basic;
                    Image = History;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Litigation History";
                    //RunPageLink = "Vendor No." = field("Vendor No.");
                }
                action("Vendor Past Experience")
                {
                    ApplicationArea = Basic;
                    Image = Category;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Professional Staff";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                }
                action("Vendor Professional Staff")
                {
                    ApplicationArea = Basic;
                    Image = Employee;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Past Experience";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                }
                action("Vendor Audited Income Statemen")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor Audited Income Statement';
                    Image = StatisticsDocument;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Audited Income Statemen";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                }
                action("Vendor Audited Balance Sheet")
                {
                    ApplicationArea = Basic;
                    Image = Balance;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Page "Vendor Audited Balance Sheet";
                    RunPageLink = "Vendor No." = field("Vendor No.");
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"IFR Response";
    end;
}

