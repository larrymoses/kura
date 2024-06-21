#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72720 "Pavement Chart Entries"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Pavement Chart Entry";
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Enrty No.";"Enrty No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor ID";"Contractor ID")
                {
                    ApplicationArea = Basic;
                }
                field("Test Date";"Test Date")
                {
                    ApplicationArea = Basic;
                }
                field("Survey Date";"Survey Date")
                {
                    ApplicationArea = Basic;
                }
                field("Layer Code";"Layer Code")
                {
                    ApplicationArea = Basic;
                }
                field("Layer Description";"Layer Description")
                {
                    ApplicationArea = Basic;
                }
                field("Layer Test Code";"Layer Test Code")
                {
                    ApplicationArea = Basic;
                }
                field("Test Description";"Test Description")
                {
                    ApplicationArea = Basic;
                }
                field(Result;Result)
                {
                    ApplicationArea = Basic;
                }
                field("Deviation(mm)";"Deviation(mm)")
                {
                    ApplicationArea = Basic;
                }
                field("Layer Tolerance";"Layer Tolerance")
                {
                    ApplicationArea = Basic;
                }
                field(Chainage;Chainage)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

