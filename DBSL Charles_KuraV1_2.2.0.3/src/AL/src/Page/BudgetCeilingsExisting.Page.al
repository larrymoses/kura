#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72313 "Budget Ceilings (Existing)"
{
    Caption = 'Budget Ceilings (Existing Works)';
    PageType = ListPart;
    SourceTable = "Existing Road WP Package";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job No.";"Job No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Road Section No.";"Road Section No.")
                {
                    ApplicationArea = Basic;
                }
                field("Road Works Category";"Road Works Category")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Works Category".Code where ("Road Project Category"=const("Maintenance Works"));
                }
                field("Funding Source ID";"Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("Section Name";"Section Name")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency ID";"Constituency ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Region ID";"Region ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("County ID";"County ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("BoQ Template Code";"BoQ Template Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Project Category";"Road Project Category")
                {
                    ApplicationArea = Basic;
                }
                field("Pavement Surface Type";"Pavement Surface Type")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage";"Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage";"End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Workplanned Length (Km)";"Workplanned Length (Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Budget (Cost) Excl. VAT";"Budget (Cost) Excl. VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Budget (VAT Amount)";"Budget (VAT Amount)")
                {
                    ApplicationArea = Basic;
                }
                field("Budget (Cost) Incl. VAT";"Budget (Cost) Incl. VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Agency ID";"Funding Agency ID")
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

