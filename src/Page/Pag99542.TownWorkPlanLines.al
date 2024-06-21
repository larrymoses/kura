page 99542 "Town WorkPlan Lines"
{
    Caption = 'RAM Workplan Lines';
    PageType = ListPart;
    SourceTable = "RAM Workplan Line";
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Workplan Type"; Rec."Workplan Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Town; Rec.Town)
                {
                    ApplicationArea = Basic;
                    Editable=false;
                }
                field(Package; Rec.Package)
                {
                    ApplicationArea = Basic;
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Link Name"; Rec."Link Name")
                {
                    ApplicationArea = Basic;
                }
                field(RICS; Rec.RICS)
                {
                    ApplicationArea = Basic;
                }
                field(Revised; Rec.Revised)
                {
                    Editable = false;
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Funding Source Code';
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Funding Source Type"; Rec."Funding Source Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Works Type"; Rec."Works Type")
                {
                    ApplicationArea = Basic;
                }
                field("Works Type Description"; Rec."Works Type Description")
                {
                    ApplicationArea = Basic;
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                }

                field("BoQ Template"; Rec."BoQ Template")
                {
                    ApplicationArea = Basic;
                }
                field("Estimated Project Cost"; Rec."Estimated Project Cost")
                {
                    Caption = 'Estimated Project Cost Excl VAT';
                }
                field("Contingency Rate (%)"; Rec."Contingency Rate (%)")
                {
                    ApplicationArea = Basic;
                }
                field("Contingency Amount (KES)"; Rec."Contingency Amount (KES)")
                {
                    ApplicationArea = Basic;
                }
                field("VoP Rate(%)"; Rec."VoP Rate(%)")
                {
                    ApplicationArea = Basic;
                }
                field("VoP Amount (KES)"; Rec."VoP Amount (KES)")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Prod Posting Group"; Rec."VAT Prod Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("VAT Rate"; Rec."VAT Rate")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Total Incl VAT"; Rec."Total Incl VAT")
                {
                    Caption = 'Estimated Project Cost Incl VAT';
                    ApplicationArea = Basic;
                }

                field("Workplanned Length(KM)"; Rec."Workplanned Length(KM)")
                {
                    ApplicationArea = Basic;
                }

                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = Basic;
                    Editable=false;
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = Basic;
                    Editable=false;
                }


            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Project Details")
            {
                Caption = 'Project Details';
                action(RoadPackages)
                {
                    Caption = 'Road Packages';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Road Packages";
                    RunPageLink = "Global Dimension 1 Code" = field("Region Code"), "Global Dimension 2 Code" = field("Global Dimension 2 Code");//,"Shortcut Dimension 5 Code"=field(Town);
                }
                action("Road Links")
                {
                    Caption = 'Project Road Links';
                    Image = CreateJobSalesInvoice;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;
                    PromotedOnly = true;
                    RunObject = Page "Workplan Project Road Links";
                    RunPageLink = "Workplan Type" = FIELD("Workplan Type"),
                                  "Workplan No" = FIELD("Document No"),
                                  "Line No" = FIELD("Line No");
                }
                action(Tasks)
                {
                    Caption = 'Summary of Bills';
                    Ellipsis = true;
                    Image = TaskList;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    // RunObject = Page "Workplan Summary of Bills";
                    // RunPageLink = "Workplan Type" = FIELD("Workplan Type"),
                    //               "Workplan No" = FIELD("Document No"),
                    //               "Line No" = FIELD("Line No"),
                    //               "Funding Source Code" = FIELD("Global Dimension 2 Code");
                    trigger OnAction()
                    var
                        Workplanline: Record "Work Plan Bill Item";
                        Workplanlines: Page "Work Plan Bill Items";
                    begin
                        Rec.TestField("Document No");
                        Rec.TestField(Town);
                        Rec.TestField("Road Code");
                        Rec.TestField(Package);
                        Workplanline.FilterGroup(2);
                        Workplanline.SetRange("Workplan No", Rec."Document No");
                        Workplanline.SetRange("Workplan Type", Rec."Workplan Type");
                        Workplanline.SetRange("Line No",Rec."Line No");
                        Workplanline.SetRange("Region Code",Rec."Region Code");
                        Workplanline.SetRange("Town Code",Rec.Town);
                        Workplanline.SetRange("Road Code",Rec."Road Code");
                        Workplanline.FilterGroup(0);
                        Workplanlines.SetTableView(Workplanline);
                        Workplanlines.Editable := true;
                        Workplanlines.Run();
                    end;
                }
                action("Consultancy Projects Required")
                {
                    Visible = false;
                    Image = Receipt;
                    RunObject = Page "Workplan Consultancy Projects";
                    RunPageLink = "Workplan No" = FIELD("Document No"),
                                  "Workplan Type" = FIELD("Workplan Type"),
                                  "Line No" = FIELD("Line No");
                }
            }
        }
    }
}

