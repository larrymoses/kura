#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80164 "PC Job Description"
{
    PageType = ListPart;
    SourceTable = "PC Job Description";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line Number";"Line Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Start Date";"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Due Date";"Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate";"Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department";"Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field("Outcome Perfomance Indicator";"Outcome Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    Caption = 'KPI';
                }
                field("Key Performance Indicator";"Key Performance Indicator")
                {
                    ApplicationArea = Basic;
                    Caption = 'Outcome Perfromance Indicator';
                    Editable = false;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Desired Perfomance Direction";"Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                }
                field("Imported Annual Target Qty";"Imported Annual Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Agreed Targets';
                }
                field("Assigned Weight (%)";"Assigned Weight (%)")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Line Functions")
            {
                action("Sub JD Objectives")
                {
                    ApplicationArea = Basic;
                    Image = Agreement;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Sub JD Objectives";
                    RunPageLink = "Workplan No."=field("Workplan No."),
                                  "Line Number"=field("Line Number");
                }
            }
        }
    }
}

