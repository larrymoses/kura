#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80375 "Workplan Revision Lines"
{
    PageType = ListPart;
    SourceTable = "Workplan Lines Revision";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Strategy Plan ID";"Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Revision Workplan";"Revision Workplan")
                {
                    ApplicationArea = Basic;
                }
                field("Activity ID";"Activity ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Perfomance Indicator";"Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Framework Perspective";"Framework Perspective")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Strategy Framework";"Strategy Framework")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    TableRelation = "Unit of Measure";
                }
                field("Desired Perfomance Direction";"Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Imported Annual Target Qty";"Imported Annual Target Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Imported Annual Budget Est.";"Imported Annual Budget Est.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Source Of Fund";"Source Of Fund")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Primary Directorate";"Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department";"Primary Department")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                }
                field("New Description";"New Description")
                {
                    ApplicationArea = Basic;
                }
                field("New Target Qty";"New Target Qty")
                {
                    ApplicationArea = Basic;
                }
                field("New Budget Est.";"New Budget Est.")
                {
                    ApplicationArea = Basic;
                }
                field("New Primary Directorate";"New Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("New Primary Department";"New Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field("New Perfomance Indicator";"New Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                }
                field("New Source Of Fund";"New Source Of Fund")
                {
                    ApplicationArea = Basic;
                }
                field("New Unit of Measure";"New Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("New Perfomance Direction";"New Perfomance Direction")
                {
                    ApplicationArea = Basic;
                }
                field("New Framework Perspective";"New Framework Perspective")
                {
                    ApplicationArea = Basic;
                }
                field("New Strategy Framework";"New Strategy Framework")
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

