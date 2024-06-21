#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 99663 "PP Revision Voucher Entry"
{
    Caption = 'Procurement Plan Revision Entries';
    PageType = List;
    SourceTable = "Procurement Plan Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                // field(Modified;rec.Modified)
                // {
                //     ApplicationArea = Basic;
                // }
                field("Procurement Plan ID"; Rec."Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = ProcurementPlanNoVisible;
                }
                field("Revised Plan No"; Rec."Revised Plan No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Vote Item"; Rec."Vote Item")
                {
                    ApplicationArea = Basic;
                }
                // field("Plan Item Type";"Plan Item Type")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Plan Item No";"Plan Item No")
                // {
                //     ApplicationArea = Basic;
                // }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Solicitation Type"; Rec."Solicitation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Group"; Rec."Vendor Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reservation Code';
                }
                field("Preference/Reservation Code"; Rec."Preference/Reservation Code")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Product Group"; Rec."Requisition Product Group")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Use"; Rec."Procurement Use")
                {
                    ApplicationArea = Basic;
                }
                field("Invitation Notice Type"; Rec."Invitation Notice Type")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Date"; Rec."Planning Date")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Line Budget Cost"; Rec."Line Budget Cost")
                {
                    ApplicationArea = Basic;
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Q1 Quantity"; Rec."Q1 Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Q1 Amount"; Rec."Q1 Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Q2 Quantity"; Rec."Q2 Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Q2 Amount"; Rec."Q2 Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Q3 Quantity"; Rec."Q3 Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Q3 Amount"; Rec."Q3 Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Q4 Quantity"; Rec."Q4 Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Q4 Amount"; Rec."Q4 Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Control Job No"; Rec."Budget Control Job No")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Control Job Task No."; Rec."Budget Control Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Section Length(Km)"; Rec."Section Length(Km)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Work Plan Project ID"; Rec."Work Plan Project ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Workplan Task No."; Rec."Workplan Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control37; Outlook)
            {
            }
            systempart(Control38; Notes)
            {
            }
            systempart(Control39; MyNotes)
            {
            }
            systempart(Control40; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Update Prices")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                // trigger OnAction()
                // begin
                //      if Confirm('Are you sure you sure you want to update the price for this item ?',true) then begin
                //      rec.Items.Reset;
                //         Rec.Items.SetRange(rec."No.",rec."Plan Item No");
                //       if Rec.Items.FindSet then
                //         if Rec.Items."Unit Cost"<>0 then begin
                //       Rec."Unit Cost":= Rec.Items."Unit Cost";
                //           end else begin
                //      Rec."Unit Cost":=rec.Items."Last Direct Cost";
                //             end;
                //       Rec.Validate(Rec."Unit Cost");
                //       Message('Price Update Successfully');
                //       end;
                // end;
            }
        }
    }

    trigger OnInit()
    begin
        //ProcurementPlanNoVisible:=TRUE;
    end;

    var
        ProcurementPlanNo: Code[20];
        [InDataSet]
        ProcurementPlanNoVisible: Boolean;
        [InDataSet]
        ProcurementPlanLineNoVisible: Boolean;
        Items: Record Item;


    procedure SetProcurementNo(No: Code[20])
    begin
        ProcurementPlanNo := No;
    end;


    procedure SetProcurementNoVisible(NewJobNoVisible: Boolean)
    begin
        ProcurementPlanNoVisible := NewJobNoVisible;
    end;


    procedure SetProcuremntLineNoVisible(NewJobTaskNoVisible: Boolean)
    begin
        ProcurementPlanLineNoVisible := NewJobTaskNoVisible;
    end;
}

#pragma implicitwith restore
