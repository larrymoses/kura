#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69344 "Vacancyx"
{
    PageType = Card;
    SourceTable = Vacancyx;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Requisition No."; Rec."Requisition No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vacancy No.';
                    Editable = false;
                }
                field("Type of Contract"; Rec."Type of Contract")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requisition Type"; Rec."Requisition Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Id"; Rec."Job Id")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Salary; Rec.Salary)
                {
                    ApplicationArea = Basic;
                }
                field("Job Function"; Rec."Job Function")
                {
                    ApplicationArea = Basic;
                }
                field("Seniority Level"; Rec."Seniority Level")
                {
                    ApplicationArea = Basic;
                }
                field("Job Location"; Rec."Job Location")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Qty"; Rec."Planned Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requested Qty"; Rec."Requested Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                group("Application Details")
                {
                    field("Planned Start Date"; Rec."Planned Start Date")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field("Planned End Date"; Rec."Planned End Date")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field("Actual Start Date"; Rec."Actual Start Date")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field("Actual End Date"; Rec."Actual End Date")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field("Applications End Time"; Rec."Applications End Time")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Applications End Date"; Rec."Applications End Date")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Applications Start Date"; Rec."Applications Start Date")
                    {
                        ApplicationArea = Basic;
                    }
                    field(Advertise; Rec.Advertise)
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field("Advertised By"; Rec."Advertised By")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field("Advertised Date"; Rec."Advertised Date")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                }
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
            action(Responsibilities)
            {
                ApplicationArea = Basic;
                Image = ReservationLedger;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Position Responsibilitiesx";
                RunPageLink = "Job ID" = field("Job Id");
            }
            action(Requirements)
            {
                ApplicationArea = Basic;
                Image = RefreshVoucher;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Position Requirements";
                RunPageLink = "Job Id" = field("Job Id");
            }
            action("Vacancy Report")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange("Requisition No.", Rec."Requisition No.");
                    Report.Run(69200, true, false, Rec);
                end;
            }
            action(Action34)
            {
                ApplicationArea = Basic;
                Image = OrderTracking;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Vacancy Media Advertisements";
                RunPageLink = "Vacancy No." = field("Requisition No.");
            }
        }
    }
}

#pragma implicitwith restore

