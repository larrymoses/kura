#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75059 "Posted Procurement Plan Entrie"
{
    ApplicationArea = Basic;
    Editable = false;
    PageType = List;
    SourceTable = "Procurement Plan Entry";
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Plan ID";"Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No.";"Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Category";"Planning Category")
                {
                    ApplicationArea = Basic;
                }
                field("Work Plan Project ID";"Work Plan Project ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type";"Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Solicitation Type";"Solicitation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method";"Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Preference/Reservation Code";"Preference/Reservation Code")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source ID";"Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Date";"Planning Date")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost";"Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Line Budget Cost";"Line Budget Cost")
                {
                    ApplicationArea = Basic;
                }
                field(Region;Region)
                {
                    ApplicationArea = Basic;
                }
                field(Directorate;Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department;Department)
                {
                    ApplicationArea = Basic;
                }
                field(Constituency;Constituency)
                {
                    ApplicationArea = Basic;
                }
                field("Road No.";"Road No.")
                {
                    ApplicationArea = Basic;
                }
                field("Road Name";"Road Name")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Start Date";"Procurement Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement End Date";"Procurement End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Duration (Days)";"Procurement Duration (Days)")
                {
                    ApplicationArea = Basic;
                }
                field("Business Unit Code";"Business Unit Code")
                {
                    ApplicationArea = Basic;
                }
                field("User ID";"User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Last Date Modified";"Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
                field("Workplan Task No.";"Workplan Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project_Combined Proc Budget";"Project_Combined Proc Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Product Group";"Requisition Product Group")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Use";"Procurement Use")
                {
                    ApplicationArea = Basic;
                }
                field("Total PRN Commitments";"Total PRN Commitments")
                {
                    ApplicationArea = Basic;
                }
                field("Total Contract Commitments";"Total Contract Commitments")
                {
                    ApplicationArea = Basic;
                }
                field("Total PO Commitments";"Total PO Commitments")
                {
                    ApplicationArea = Basic;
                }
                field("Total Purchase Commitments";"Total Purchase Commitments")
                {
                    ApplicationArea = Basic;
                }
                field("Total Purchase Invoices";"Total Purchase Invoices")
                {
                    ApplicationArea = Basic;
                }
                field("Total Purchase Credit Memos";"Total Purchase Credit Memos")
                {
                    ApplicationArea = Basic;
                }
                field("Total Actual Costs";"Total Actual Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Available Procurement Budget";"Available Procurement Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Invitation Notice Type";"Invitation Notice Type")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID";"Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Control Job No";"Budget Control Job No")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Control Job Task No.";"Budget Control Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Transferred from Item Budget";"Transferred from Item Budget")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage(Km)";"Start Chainage(Km)")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage(Km)";"End Chainage(Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Section Length(Km)";"Section Length(Km)")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
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
            systempart(Control37;Outlook)
            {
            }
            systempart(Control38;Notes)
            {
            }
            systempart(Control39;MyNotes)
            {
            }
            systempart(Control40;Links)
            {
            }
        }
    }

    actions
    {
    }

    var
        ProcurementPlanNo: Code[20];
        [InDataSet]
        ProcurementPlanNoVisible: Boolean;
        [InDataSet]
        ProcurementPlanLineNoVisible: Boolean;


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

