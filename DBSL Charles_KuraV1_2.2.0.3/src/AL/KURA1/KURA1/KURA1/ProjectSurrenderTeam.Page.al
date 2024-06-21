#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57085 "Project Surrender Team"
{
    PageType = ListPart;
    SourceTable = "Project Members";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type;Type)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if Type=Type::Machine then
                          Show:=true;
                    end;
                }
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field("Task No.";"Task No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Work Type";"Work Type")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Time Period";"Actual Time Period")
                {
                    ApplicationArea = Basic;
                }
                field("Time Period";"Time Period")
                {
                    ApplicationArea = Basic;
                }
                field("Direct Unit Cost";"Direct Unit Cost")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field("Daily Rate";Entitlement)
                {
                    ApplicationArea = Basic;
                }
                field("Actual Spent";"Actual Spent")
                {
                    ApplicationArea = Basic;
                }
                field("Outstanding Amount";"Outstanding Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Tasks to Carry Out";"Tasks to Carry Out")
                {
                    ApplicationArea = Basic;
                }
                field("Expected Output";"Expected Output")
                {
                    ApplicationArea = Basic;
                }
                field(Delivery;Delivery)
                {
                    ApplicationArea = Basic;
                }
                field("Last Maintenance Cost";"Last Maintenance Cost")
                {
                    ApplicationArea = Basic;
                    Editable = show;
                }
                field("Expected Maintenance Cost";"Expected Maintenance Cost")
                {
                    ApplicationArea = Basic;
                    Editable = Show;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        if Type=Type::Machine then
          Show:=true;
    end;

    var
        [InDataSet]
        Show: Boolean;
}

