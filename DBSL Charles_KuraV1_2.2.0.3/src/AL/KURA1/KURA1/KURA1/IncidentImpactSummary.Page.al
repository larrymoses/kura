#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95106 "Incident Impact Summary"
{
    PageType = ListPart;
    SourceTable = "Risk Incident Log Impact R";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Impact Type";"Impact Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Unit Of Measure";"Unit Of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Category of Party Affected";"Category of Party Affected")
                {
                    ApplicationArea = Basic;
                }
                field("Internal Employee No.";"Internal Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("Contact Details";"Contact Details")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Comments";"Additional Comments")
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

