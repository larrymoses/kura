page 99685 "Contract Milestone Deliverable"
{
    Caption = 'Contract Milestone Deliverable';
    PageType = List;
    SourceTable = "Contract Milestone Deliverable";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Contract Status";Rec."Contract Status")
                {
                    ApplicationArea =Basic;
                }
                field("Milestone";Rec."Milestone Description")
                {
                    ApplicationArea =Basic;
                }
                field(Deliverable;Rec.Deliverable)
                {
                    ApplicationArea =Basic;
                    Editable =FieldsEditable;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea =Basic;
                    Editable =FieldsEditable;
                }
                field("Delivered/Achieved";Rec."Delivered/Achieved")
                {
                    ApplicationArea =Basic;
                }
                field("Date Delivered/Achieved";Rec."Date Delivered/Achieved")
                {
                    ApplicationArea =Basic;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        FieldsEditable:= false;
        Rec.CalcFields("Contract Status");
       if Rec."Contract Status" = Rec."Contract Status"::" " then
       FieldsEditable:= true;
    end;
    var
    FieldsEditable: Boolean;
}
