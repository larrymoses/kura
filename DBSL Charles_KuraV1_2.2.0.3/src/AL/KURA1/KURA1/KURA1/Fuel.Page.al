#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57052 "Fuel"
{
    PageType = ListPart;
    SourceTable = "Project Members";
    SourceTableView = where(Type=const(Machine));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        if Type=Type::Person then
                         begin
                          Show:=true;
                          Error(Text000);
                         end;
                    end;
                }
                field("Work Type";"Work Type")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("Expense Type";"Expense Type")
                {
                    ApplicationArea = Basic;
                }
                field("Task No.";"Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Tasks to Carry Out";"Tasks to Carry Out")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Consumption Rate";"Consumption Rate")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Enabled = true;
                }
                field(Mileage;"Time Period")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Outstanding Amount";"Outstanding Amount")
                {
                    ApplicationArea = Basic;
                    Visible = Show;
                }
                field(Total;Entitlement)
                {
                    ApplicationArea = Basic;
                    Visible = Show;
                }
                field("Expected Output";"Expected Output")
                {
                    ApplicationArea = Basic;
                    Visible = Show;
                }
                field(Delivery;Delivery)
                {
                    ApplicationArea = Basic;
                    Visible = Show;
                }
                field("Last Maintenance Cost";"Last Maintenance Cost")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Expected  Cost";"Expected Maintenance Cost")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Direct Unit Cost";"Direct Unit Cost")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        //CALCFIELDS(Project);
        if Type=Type::Person then
          Show:=true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //CALCFIELDS(Project);
        Type:=Type::Machine;
    end;

    trigger OnOpenPage()
    begin
        //CALCFIELDS(Project);
    end;

    var
        [InDataSet]
        Show: Boolean;
        Text000: label 'You cannot enter Person under Fuel';
}

