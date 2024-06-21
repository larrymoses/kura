#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75060 "Procurement Plan Schedule"
{
    ApplicationArea = Basic;
    Editable = false;
    PageType = List;
    SourceTable = "PP Purchase Activity Schedule";
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("PP Entry";"PP Entry")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Category";"Planning Category")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method";"Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Activity Code";"Activity Code")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Days";"Planned Days")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Days";"Actual Days")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Dates";"Planned Dates")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Dates";"Actual Dates")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        PurchaseActivityPlanNo: Code[20];
        [InDataSet]
        PurchaseActivityPlanNoVisible: Boolean;
        [InDataSet]
        PurchaseActivityPlanLineNoVisible: Boolean;


    procedure SetPurchaseActivityNo(No: Code[20])
    begin
        PurchaseActivityPlanNo := No;
    end;


    procedure SetPurchaseActivityNoVisible(NewJobNoVisible: Boolean)
    begin
        PurchaseActivityPlanNoVisible := NewJobNoVisible;
    end;


    procedure SetPurchaseActivityLineNoVisible(NewJobTaskNoVisible: Boolean)
    begin
        PurchaseActivityPlanLineNoVisible := NewJobTaskNoVisible;
    end;
}

