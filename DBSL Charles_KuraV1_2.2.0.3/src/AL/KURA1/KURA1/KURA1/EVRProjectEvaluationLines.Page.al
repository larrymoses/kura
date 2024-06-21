#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72764 "EVR Project Evaluation Lines"
{
    PageType = ListPart;
    SourceTable = "Project Evaluation Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job No.";"Job No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job Task No.";"Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID";"Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Remarks";"Evaluation Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("Original Quantity";"Original Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost (LCY)";"Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Original Total Cost (LCY)";"Original Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                }
                field("New Quantity";"New Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Quantity";"Approved Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("New Total Cost (LCY)";"New Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Total Cost(LCY)";"Approved Total Cost(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Net Change (Quantity)";"Net Change (Quantity)")
                {
                    ApplicationArea = Basic;
                }
                field("Net Change (Total Cost LCY)";"Net Change (Total Cost LCY)")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        RecommVisible:=false;
        CalcFields(Status);
        if Status=Status::Released then
          RecommVisible:=true;
    end;

    trigger OnAfterGetRecord()
    begin
        RecommVisible:=false;
        CalcFields(Status);
        if Status=Status::Released then
          RecommVisible:=true;
    end;

    trigger OnOpenPage()
    begin
        RecommVisible:=false;
        CalcFields(Status);
        if Status=Status::Released then
          RecommVisible:=true;
    end;

    var
        RecommVisible: Boolean;
}

