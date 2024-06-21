#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75012 "Procurement Plan Entry"
{
    PageType = List;
    //return
    // DeleteAllowed = false;
    // Editable = false;
    SourceTable = "Procurement Plan Entry";
    //SourceTableView = where("Procurement Type" = filter('Works'));



    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Plan ID"; Rec."Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = ProcurementPlanNoVisible;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Category"; Rec."Planning Category")
                {
                    ApplicationArea = Basic;
                }
                field(Items; Rec.Items)
                {
                    ApplicationArea = all;
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = all;
                }
                field("Budget Control Job No"; Rec."Budget Control Job No")
                {
                    ApplicationArea = Basic;
                }
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
                    visible = true;
                }
                field("Planned Days"; Rec."Planned Days")
                {
                    ApplicationArea = Basic;
                    visible = true;
                }
                field("Actual Days"; Rec."Actual Days")
                {
                    ApplicationArea = Basic;
                    visible = true;
                }

                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    trigger OnAssistEdit()
                    begin
                        Pplan.Reset();
                        Pplan.SetRange(Code, Rec."Procurement Plan ID");
                        if Pplan.FindFirst() then begin
                            Clear(ChangeExchangeRate);
                            if Pplan."Document Date" <> 0D then
                                ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", Pplan."Document Date")
                            else
                                ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", WorkDate);
                            if ChangeExchangeRate.RunModal = ACTION::OK then begin
                                Rec.Validate("Currency Factor", ChangeExchangeRate.GetParameter);
                            end;
                            Clear(ChangeExchangeRate);
                        end;
                    end;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Estimated Cost of Project"; Rec."Estimated Cost of Project")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field("Line Budget Cost"; Rec."Line Budget Cost")
                {
                    ApplicationArea = Basic;
                    Caption = 'Line Budget';
                    Editable = false;
                }
                field("Line Budget Cost (LCY)"; Rec."Line Budget Cost (LCY)")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    // TableRelation = "General Ledger Setup"."Shortcut Dimension 3 Code";

                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                }
                field("Road No."; Rec."Road No.")
                {
                    ApplicationArea = Basic;
                }
                field("Road Name"; Rec."Road Name")
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
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
                field("Total PRN Commitments"; Rec."Total PRN Commitments")
                {
                    ApplicationArea = Basic;
                }
                field("Total PO Commitments"; Rec."Total PO Commitments")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
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
                }
                field("Work Plan Project ID"; Rec."Work Plan Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Workplan Task No."; Rec."Workplan Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Invite Tender"; Rec."Invite Tender")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field("Open Tender"; Rec."Open Tender")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Evaluation"; Rec."Bid Evaluation")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Committee Action"; Rec."Tender Committee Action")
                {
                    ApplicationArea = Basic;
                }
                field("Notification of Award"; Rec."Notification of Award")
                {
                    ApplicationArea = Basic;
                }
                field("Signing of Contract"; Rec."Signing of Contract")
                {
                    ApplicationArea = Basic;
                }
                field("Work Commencement"; Rec."Work Commencement")
                {
                    ApplicationArea = Basic;
                }
                field("Completion of works"; Rec."Completion of works")
                {
                    ApplicationArea = Basic;
                }
                field("Revision  No"; Rec."Revision  No")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Project Code"; Rec."Project Code")
                {
                    ApplicationArea = Basic;
                }
                field("KeRRA Budget Code"; Rec."KeRRA Budget Code")
                {
                    ApplicationArea = Basic;
                    Caption = ' KURA Budget Code';
                }
                field("Project Type"; Rec."Project Type")
                {
                    ApplicationArea = Basic;
                }
                field("Works Type"; Rec."Works Type")
                {
                    ApplicationArea = Basic;
                }
                field("Original Budget"; Rec."Original Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Type 1"; Rec."Budget Type 1")
                {
                    ApplicationArea = Basic;
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
            group(Suggest)
            {
                Image = Suggest;
                action("Suggest From G/L Budget")
                {
                    ApplicationArea = Basic;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Select Procurement Line1";
                    // RunPageLink = "Works Type"=filter("Road Construction"|"Axle Load "|Maintenance|"Survey/Study"|"Structure Construction"),
                    //             Works=filter(Yes);
                    Visible = false;
                }
                action(SelectBudgetEntries)
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Select Budget Entries';
                    Ellipsis = true;
                    Image = "Filter";
                    visible = true;
                    // ToolTip = 'Limit the entries according to the dimension filters that you specify. NOTE: If you use a high number of dimension combinations, this function may not work and can result in a message that the SQL server only supports a maximum of 2100 parameters.';

                    trigger OnAction()
                    var
                        ProcurementPlan: Record 70098;
                        CashManagementSetup: record 57004;
                        CurrentBudget: text;
                        Glline: Record 96;
                        ProcurementPlanEntry: record 70101;



                    begin
                        // SetFilter("Dimension Set ID", DimensionSetIDFilter.LookupFilter);
                        CashManagementSetup.GET;
                        CurrentBudget := CashManagementSetup."Current Budget";

                        //ProcurementPlan.RESET;
                        //ProcurementPlan.SETRANGE(ProcurementPlan.Code, "Procurement Plan ID");
                        IF ProcurementPlan.FINDSET THEN
                            //  Responsibility := ProcurementPlan."Planning Responsibility Center";
                            //MESSAGE('%1',Responsibility);



                            GlLine.RESET;
                        GlLine.SETRANGE(GlLine."Budget Name", CurrentBudget);
                        //GlLine.SETRANGE(GlLine."Shortcut Dimension 4 Code",ProcurementPlan."Planning Responsibility Center");
                        // GlLine.SETRANGE(GlLine.Works, TRUE);
                        //GlLine.SETRANGE(GlLine."Directorate Code", Responsibility);

                        IF GlLine.FINDSET THEN BEGIN
                            REPEAT
                                ProcurementPlanEntry.SETCURRENTKEY("Procurement Plan ID", "Planning Category");
                                ProcurementPlanEntry.SETRANGE(ProcurementPlanEntry."Procurement Plan ID", rec."Procurement Plan ID");
                                // ProcurementPlanEntry.SETRANGE(ProcurementPlanEntry."Planning Category", "Planning Category");
                                IF ProcurementPlanEntry.FINDSET THEN BEGIN
                                    REPEAT
                                        ProcurementPlanEntry.INIT;
                                        ProcurementPlanEntry."Entry No." := ProcurementPlanEntry."Entry No." + 1;
                                        ProcurementPlanEntry."Document Type" := ProcurementPlanEntry."Document Type"::"Procurement Plan";
                                        ProcurementPlanEntry."KeRRA Budget Code" := GlLine."KeRRA Budget Code";
                                        // ProcurementPlanEntry."Budget Entry No" := GlLine."Entry No.";
                                        ProcurementPlanEntry.Description := GlLine.Description;
                                        ProcurementPlanEntry."Global Dimension 1 Code" := GlLine."Global Dimension 1 Code";
                                        ProcurementPlanEntry."Global Dimension 2 Code" := GlLine."Global Dimension 2 Code";
                                        ProcurementPlanEntry."Unit Cost" := GlLine.Amount;
                                        ProcurementPlanEntry.Quantity := 1;
                                        // VALIDATE(Quantity);
                                        ProcurementPlanEntry."Project Type" := GlLine."Project Type";
                                        ProcurementPlanEntry."Works Type" := GlLine."Works Type";
                                        ProcurementPlanEntry."Procurement Type" := 'WORKS';
                                        ProcurementPlanEntry."Unit of Measure" := 'PROJECT';
                                        ProcurementPlanEntry."Requisition Product Group" := ProcurementPlanEntry."Requisition Product Group"::Works;
                                        ProcurementPlanEntry.Region := GlLine."Global Dimension 1 Code";
                                        // ProcurementPlanEntry.Directorate := GlLine."Directorate Code";
                                        ProcurementPlanEntry."Budget Control Job No" := GlLine."Project Code";
                                        ProcurementPlanEntry."Budget Type 1" := GlLine."Budget Type 1";
                                        ProcurementPlanEntry."Funding Source ID" := GlLine."Global Dimension 2 Code";
                                        ProcurementPlanEntry."Procurement Use" := ProcurementPlanEntry."Procurement Use"::"Project-Specific Use";
                                        ProcurementPlanEntry."Original Budget" := GlLine."Original Budget";
                                        ProcurementPlanEntry.INSERT(TRUE);


                                    UNTIL GlLine.NEXT = 0
                                END;
                            UNTIL ProcurementPlanEntry.NEXT = 0;
                        END;

                        // ProcurementPlan.RESET;
                        // ProcurementPlan.SETRANGE(ProcurementPlan.Code,"Procurement Plan ID");
                        // IF ProjectStaffVoucher.FINDSET THEN 
                        //  REPEAT
                        //    ProjectStaffVoucher."From Document No.":="Document No.";
                        //    ProjectStaffVoucher."Document Type":="Document Type";
                        //    ProjectStaffVoucher.MODIFY(TRUE);
                        //    UNTIL ProjectStaffVoucher.NEXT=0;
                        // 
                        // ProjectStaffAppointmentLine.RESET;
                        // ProjectStaffAppointmentLine.SETRANGE(ProjectStaffAppointmentLine."Document No.","Staff Appointment Voucher No.");
                        // IF ProjectStaffAppointmentLine.FINDSET THEN 
                        //  BEGIN
                        //     ProjectStaffAppointList.SETTABLEVIEW(ProjectStaffAppointmentLine);
                        //     ProjectStaffAppointList.GetDocNumber("Document No.","Staff Appointment Voucher No.");
                        //     ProjectStaffAppointList.RUN;
                        //    END;

                    end;
                }


                action("Suggest Budget Entries")
                {
                    ApplicationArea = Basic;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    visible = false;

                    trigger OnAction()
                    begin
                        CashManagementSetup.Get;
                        CurrentBudget := CashManagementSetup."Current Budget";

                        ProcurementPlan.Reset;
                        ProcurementPlan.SetRange(ProcurementPlan.Code, Rec."Procurement Plan ID");
                        if ProcurementPlan.FindSet then
                            Responsibility := ProcurementPlan."Planning Responsibility Center";
                        //MESSAGE('%1',Responsibility);



                        GlLine.Reset;
                        GlLine.SetRange(GlLine."Budget Name", CurrentBudget);
                        GlLine.SETRANGE(GlLine."Shortcut Dimension 4 Code", ProcurementPlan."Planning Responsibility Center");
                        //// // GlLine.SetRange(GlLine.Works, true);
                        ///GlLine.SetRange(GlLine."Project Type", GlLine."Project Type"::"Multi-Year Programs");
                        //GlLine.SetRange(GlLine."Directorate Code", Responsibility);

                        if GlLine.FindSet then begin
                            repeat
                                ProcurementPlanEntry.SetCurrentkey("Procurement Plan ID", "Planning Category");
                                ProcurementPlanEntry.SetRange(ProcurementPlanEntry."Procurement Plan ID", Rec."Procurement Plan ID");
                                ProcurementPlanEntry.SetRange(ProcurementPlanEntry."Planning Category", Rec."Planning Category");
                                if ProcurementPlanEntry.FindSet then begin
                                    repeat
                                        ProcurementPlanEntry.Init;
                                        ProcurementPlanEntry."Entry No." := ProcurementPlanEntry."Entry No." + 1;
                                        ProcurementPlanEntry."Document Type" := ProcurementPlanEntry."document type"::"Procurement Plan";
                                        ProcurementPlanEntry."KeRRA Budget Code" := GlLine."KeRRA Budget Code";
                                        // ProcurementPlanEntry."Budget Entry No" := GlLine."Entry No.";
                                        ProcurementPlanEntry.Description := GlLine.Description;
                                        ProcurementPlanEntry."Global Dimension 1 Code" := GlLine."Global Dimension 1 Code";
                                        ProcurementPlanEntry."Global Dimension 2 Code" := GlLine."Global Dimension 2 Code";
                                        ProcurementPlanEntry."Unit Cost" := GlLine.Amount;
                                        ProcurementPlanEntry.Quantity := 1;
                                        Rec.Validate(Rec.Quantity);
                                        ProcurementPlanEntry."Project Type" := GlLine."Project Type";
                                        ProcurementPlanEntry."Works Type" := GlLine."Works Type";
                                        ProcurementPlanEntry."Procurement Type" := 'WORKS';
                                        ProcurementPlanEntry."Unit of Measure" := 'PROJECT';
                                        ProcurementPlanEntry."Requisition Product Group" := ProcurementPlanEntry."requisition product group"::Works;
                                        ProcurementPlanEntry.Region := GlLine."Global Dimension 1 Code";
                                        //// ProcurementPlanEntry.Directorate := GlLine."Directorate Code";
                                        ProcurementPlanEntry."Budget Control Job No" := GlLine."Project Code";
                                        ProcurementPlanEntry."Budget Type 1" := GlLine."Budget Type 1";
                                        ProcurementPlanEntry."Funding Source ID" := GlLine."Global Dimension 2 Code";
                                        ProcurementPlanEntry."Procurement Use" := ProcurementPlanEntry."procurement use"::"Project-Specific Use";
                                        ProcurementPlanEntry."Original Budget" := GlLine."Original Budget";
                                        ProcurementPlanEntry.Insert(true);


                                    until GlLine.Next = 0
                                end;
                            until ProcurementPlanEntry.Next = 0;
                        end;

                        // ProcurementPlan.RESET;
                        // ProcurementPlan.SETRANGE(ProcurementPlan.Code,"Procurement Plan ID");
                        // IF ProjectStaffVoucher.FINDSET THEN
                        //  REPEAT
                        //    ProjectStaffVoucher."From Document No.":="Document No.";
                        //    ProjectStaffVoucher."Document Type":="Document Type";
                        //    ProjectStaffVoucher.MODIFY(TRUE);
                        //    UNTIL ProjectStaffVoucher.NEXT=0;
                        //
                        // ProjectStaffAppointmentLine.RESET;
                        // ProjectStaffAppointmentLine.SETRANGE(ProjectStaffAppointmentLine."Document No.","Staff Appointment Voucher No.");
                        // IF ProjectStaffAppointmentLine.FINDSET THEN
                        //  BEGIN
                        //     ProjectStaffAppointList.SETTABLEVIEW(ProjectStaffAppointmentLine);
                        //     ProjectStaffAppointList.GetDocNumber("Document No.","Staff Appointment Voucher No.");
                        //     ProjectStaffAppointList.RUN;
                        //    END;
                    end;
                }
            }
        }
    }


    trigger OnOpenPage()
    begin
        GlLine.Reset;
        // GlLine.SetRange(Select, true);
        if GlLine.FindSet then begin
            if Today = Today then
                repeat


                    ProcurementPlanEntry.Reset;
                    ProcurementPlanEntry.SetRange("Procurement Plan ID", ProcurementPlanEntry."Procurement Plan ID");
                    ProcurementPlanEntry.SetRange("Planning Category", ProcurementPlanEntry."Planning Category");
                    if ProcurementPlanEntry.FindSet then begin
                        repeat
                            Rec."KeRRA Budget Code" := GlLine."KeRRA Budget Code";
                            Rec.Description := GlLine.Description;
                            Rec."Works Type" := GlLine."Works Type";


                            GlLine.Modify(true);
                        until ProcurementPlanEntry.Next = 0;
                    end;
                until GlLine.Next = 0;
        end;
    end;

    var
        ChangeExchangeRate: Page "Change Exchange Rate";
        ProcurementPlanNo: Code[20];
        [InDataSet]
        ProcurementPlanNoVisible: Boolean;
        [InDataSet]
        ProcurementPlanLineNoVisible: Boolean;
        gl: Record "G/L Budget Entry";
        GLSelect: Page "Select Procurement Line1";
        GlLine: Record "G/L Budget Entry";
        ProcurementPlanEntry: Record "Procurement Plan Entry";
        ProcurementPlan: Record "Procurement Plan";
        ProcurementPlanLines: Record "Procurement Plan Lines";
        CashManagementSetup: Record "Cash Management Setup";
        CurrentBudget: Code[50];
        Responsibility: Text;
        Pplan: Record "Procurement Plan";


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
